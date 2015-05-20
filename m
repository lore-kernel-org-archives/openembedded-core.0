Return-Path: <lpapp@archlinux.us>
Received: from mail-vn0-f43.google.com (mail-vn0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4B5606AC15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 14:42:15 +0000 (UTC)
Received: by vnbg62 with SMTP id g62so3688445vnb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 07:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=63+UPy/8sBb0wx8tSiwTZJo36AO0729K9X0zISYSKf0=;
	b=XPZX60g32upXHQLaT8vAY8ds4eVpxQ9MaxSda5Tl6Jg6zb8OTNVvQ4vHniQEAyBmD+
	V9h10Pxb4faA26BHMPjMK/RbxQGuENFOSpgpY/XDtgyh6/Z4g/nqy6wzWpNj0y+tmfUC
	9wMSIUJfkxF0AELBEnqSvmNnTO26cHoZE36+X4/8xqeoqn8cNJWz3eso4fXrVwhjkfeD
	I6zNH54cwbvmbfqQYnqZ+XfUFPQGngP3ZI8LTe4hm33ZjP7wupw+6NSe+93xReiEgTLi
	oT1T7PHtdtlYB4mF/7vDXvLsS6kJoH0ID6XQj0hzSFh528IPmmeMk1c64ZfLzttBNOv4
	wtOA==
X-Gm-Message-State: ALoCoQmwvmu28KUDdH1fJMk0z4rp1I+r8jpDndNQdxAYQEK2EH94jfOHNvg//5e325uPqyyOAnty
MIME-Version: 1.0
X-Received: by 10.52.100.103 with SMTP id ex7mr33890503vdb.71.1432132936406;
	Wed, 20 May 2015 07:42:16 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.53.6.12 with HTTP; Wed, 20 May 2015 07:42:16 -0700 (PDT)
In-Reply-To: <CAC1BbcTOPBRO_3GjhSQdzQ35Y=BGAh1ntYdqK2tk8E09Hvni7g@mail.gmail.com>
References: <CAOMwXhNUPtaJfKHDuHPWoioyD2Sp8Abb_++Tdp3NAYN7-TGUcg@mail.gmail.com>
	<CAC1BbcQ0L1ujZA_NvXx1hmUBq1gt9gC7tMHRwNLkNvmPGYZWaA@mail.gmail.com>
	<CAC1BbcTOPBRO_3GjhSQdzQ35Y=BGAh1ntYdqK2tk8E09Hvni7g@mail.gmail.com>
Date: Wed, 20 May 2015 15:42:16 +0100
X-Google-Sender-Auth: INol85yvVcY24ShSX_UN2e7OuZw
Message-ID: <CAOMwXhNB-5w2ywAe6anARY0Kp+osPRmu6KnoiOpfTJ6G0WCCnQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: busybox: passwd: applet not found
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 May 2015 14:42:16 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 20, 2015 at 3:05 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On 20 May 2015 at 15:48, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> wrote:
>> On 20 May 2015 at 13:55, Laszlo Papp <lpapp@kde.org> wrote:
>>> Hi,
>>>
>>> I am a bit confused why busybox passwd does not work with daisy. It
>>> used to work with dylan. When I try to use "busybox passwd", I am
>>> getting the following output:
>>>
>>>     passwd: applet not found
>>
>> is the password applet built?
>> Check your busybox .config.
>> Is passwd listed when you invoke plain busybox and have the help-text
>> printing turned on?
>>
>> Sometimes code around bsearch is miscompiled but this should not be
>> the case for your setup, i suppose.
>
> ah, the great suid / nosuid split ?
> try /bin/busybox.suid passwd instead, the default /bin/busybox
> supposedly points to the .nosuid binary.

Now that just breaks all the code that our software is using. Why did
this binary incompatible change sneak in, and especially: why without
any note in the migration guide? Furthermore, is there a way to
reverse this? I really would like to avoid rewriting my code just
because some other people think it is a cool change. Or is this change
absolutely necessary?

