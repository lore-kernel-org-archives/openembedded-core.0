Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 80A61601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 14:05:21 +0000 (UTC)
Received: by labbd9 with SMTP id bd9so76048577lab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 07:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BiTm/YehfYSlAw+cdH/emEtAcGpfULc/Lx2Q13iGhhs=;
	b=WmmeY9/IlNEtZo19fIu2u/Wxzy/xxNZdnpGby0rcKzX761rWPha1rTEBKWs+H7Pcp7
	+bovE4usok0i8SpZy5/WREvMAc1Uzs3nrQspk8FFhhAHfaacca13qpvTavajfWndNbIC
	qDUxpd0WErwClZec/Rhywf0mhpsTap74prqbmQb206gY+NAhWhuDTf6GTLstfsPHJFXb
	lJP9u5qMLeHavFFyEIxF035rVZjPgfA3JdXdw002GHzH0P9xhmcX8X0f7Ck7/SdRXGar
	XIPwFWQXbJ3EwcIvr7zLHf5xTcd9Ya28pMLkVsILS/zOaSB1ApG4TPMMaJu/3STJpulC
	jmXw==
MIME-Version: 1.0
X-Received: by 10.112.163.35 with SMTP id yf3mr3361033lbb.107.1432130721426;
	Wed, 20 May 2015 07:05:21 -0700 (PDT)
Received: by 10.152.90.230 with HTTP; Wed, 20 May 2015 07:05:21 -0700 (PDT)
In-Reply-To: <CAC1BbcQ0L1ujZA_NvXx1hmUBq1gt9gC7tMHRwNLkNvmPGYZWaA@mail.gmail.com>
References: <CAOMwXhNUPtaJfKHDuHPWoioyD2Sp8Abb_++Tdp3NAYN7-TGUcg@mail.gmail.com>
	<CAC1BbcQ0L1ujZA_NvXx1hmUBq1gt9gC7tMHRwNLkNvmPGYZWaA@mail.gmail.com>
Date: Wed, 20 May 2015 16:05:21 +0200
Message-ID: <CAC1BbcTOPBRO_3GjhSQdzQ35Y=BGAh1ntYdqK2tk8E09Hvni7g@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Laszlo Papp <lpapp@kde.org>
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
X-List-Received-Date: Wed, 20 May 2015 14:05:23 -0000
Content-Type: text/plain; charset=UTF-8

On 20 May 2015 at 15:48, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> wrote:
> On 20 May 2015 at 13:55, Laszlo Papp <lpapp@kde.org> wrote:
>> Hi,
>>
>> I am a bit confused why busybox passwd does not work with daisy. It
>> used to work with dylan. When I try to use "busybox passwd", I am
>> getting the following output:
>>
>>     passwd: applet not found
>
> is the password applet built?
> Check your busybox .config.
> Is passwd listed when you invoke plain busybox and have the help-text
> printing turned on?
>
> Sometimes code around bsearch is miscompiled but this should not be
> the case for your setup, i suppose.

ah, the great suid / nosuid split ?
try /bin/busybox.suid passwd instead, the default /bin/busybox
supposedly points to the .nosuid binary.

