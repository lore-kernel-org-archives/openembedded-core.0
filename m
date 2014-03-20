Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id C185B6F900
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 11:34:41 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id ld10so807992pab.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 04:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=F32wP4kq2+WOyL0E7XrlFQ4hhUNb5BOInX8ntlrzWNA=;
	b=d34PHKeffbvnia2F/bmUnAjDQJ1HfKt/8rIJOkbM9A/tKLazEcL0N998TJ7E3fk+oh
	DyzO+dI6u2ssU+qwVodEnKGhECSQiRNZWdzmsMOldOQC25Hjgiv1Dy6x30m6X+Gt4Icz
	XgYDOXsuN2dnz//DbZmDBkfHXk3typbh1LNwM/RoRJZ2255Vb+1tqOCwS/JV9VI4qfdM
	REZXbCUBtinqFevIfFmraUuuLsKytTqX30+Q9MUpuFF/746j5PImzgxTFw3B6tguCT8L
	CBS2tq19ma0kLp9G5mojglzFp6cYl1t9z20n3vKQBWAFp287no15XLuOXzbkafXq13L5
	Iz8A==
X-Gm-Message-State: ALoCoQlX3P0pHcSW+6PpC/GoOK1KZTXJxiKq2f5QCQHXsfwSGuDpHrrN7h7FV1S7KGqUVqpsk1Bg
MIME-Version: 1.0
X-Received: by 10.66.5.135 with SMTP id s7mr6171619pas.154.1395315282602; Thu,
	20 Mar 2014 04:34:42 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.11.164 with HTTP; Thu, 20 Mar 2014 04:34:42 -0700 (PDT)
In-Reply-To: <0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
	<0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
Date: Thu, 20 Mar 2014 11:34:42 +0000
X-Google-Sender-Auth: 5G1pL6nD511473s3DCzLXxXIGHg
Message-ID: <CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 20 Mar 2014 11:34:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 20, 2014 at 11:22 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 20 mrt. 2014, om 11:45 heeft Burton, Ross <ross.burton@intel.com> het volgende geschreven:
>
>> On 20 March 2014 03:26, Laszlo Papp <lpapp@kde.org> wrote:
>>> +PEER=127.0.0.1
>>
>> That doesn't seem like a very useful default.  We also can't use the
>> NTP pool by default, so this should copy the behaviour of the ntpd
>> package in meta-networking and default to no peers, and not start if
>> none are specified.
>
> And the initscript is missing LSB headers.

Just like the other similar scripts.

