Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 954376E89A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 12:16:37 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id rr13so858533pbb.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 05:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=rz0Wn34SPB+gi1grob3U+Ne8+aoBvGM1BSXGI7cRFkc=;
	b=SGc7d66kudFUjlkbET0ym89LIJCw975HHBRZqqv12rwKABY0JT2u8EbFdhWSDXObUI
	BL5ftGpqNPQUIUv+qVFvwhdLqb66DrASIoobHXqsVO18BmxI86smGnN+mmNLuwaXfTAs
	hV5ngAWO9bc16OoBTmPC3ertPd7cxeTbQvUczoJyAI/IkVDzZqjKhBz7BCEEFcvAlRmy
	K1pMvHRXpNuGVVyGWtOp5NbwUgSMZYLXi71AgctIs53CJU7vFp6W0R2p3VsocWDwcxC9
	KxNiZyKMWmqX0gKeLKlh6Vqy7tqaSw1GZoPtKz9/QN/0f9GjDxk35Vo2bhengtesr3WL
	olBg==
X-Gm-Message-State: ALoCoQkqf584Tl4s2cCCRuaQ00aIELT83zG3kZdz0LsNR48Yq/1pMbGjlu6LMMQ8Yi3vm+PSjpDZ
MIME-Version: 1.0
X-Received: by 10.66.49.74 with SMTP id s10mr47075307pan.0.1395317797820; Thu,
	20 Mar 2014 05:16:37 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.11.164 with HTTP; Thu, 20 Mar 2014 05:16:37 -0700 (PDT)
In-Reply-To: <CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
	<0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
	<CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
Date: Thu, 20 Mar 2014 12:16:37 +0000
X-Google-Sender-Auth: YUFNUn-Tio3qwX3TGQNsHtJwrWs
Message-ID: <CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Thu, 20 Mar 2014 12:16:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 20, 2014 at 11:59 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Thu, Mar 20, 2014 at 8:34 AM, Laszlo Papp <lpapp@kde.org> wrote:
>> On Thu, Mar 20, 2014 at 11:22 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>
>>> Op 20 mrt. 2014, om 11:45 heeft Burton, Ross <ross.burton@intel.com> het volgende geschreven:
>>>
>>>> On 20 March 2014 03:26, Laszlo Papp <lpapp@kde.org> wrote:
>>>>> +PEER=127.0.0.1
>>>>
>>>> That doesn't seem like a very useful default.  We also can't use the
>>>> NTP pool by default, so this should copy the behaviour of the ntpd
>>>> package in meta-networking and default to no peers, and not start if
>>>> none are specified.
>>>
>>> And the initscript is missing LSB headers.
>>
>> Just like the other similar scripts.
>
> This does not mean we ought to make the problem worse so add it for
> new ones. If you are in good mood, send a fix for the others too ;)

I do not think this is a problem. Could you please point out what
functionality it breaks? Send patches for the others, and I will make
this cosmetic change for this one, too. Consistency is more important
than a mess of different styles, especially when it comes to cosmetic
changes like this.

That said, Ross had a good point - although that is not critical
either, and since everyone is overriding the default, it could work
without that - , so I will update that one.

