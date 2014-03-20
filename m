Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id CC19C6F8CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 16:42:44 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id rp18so1124481iec.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 09:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bt0OUtH6f8PC/njnyWuBFqwFNKzBEQjS/APkCNLfhCc=;
	b=U6zCNXkj7KDA2Iq9ze+ccTXZfKrLwg4LWLExHIQhr3NPqdjQNPeQAjYCIZzIX+kjT3
	unJyHHFsGF4HUmnUNCYdYQ9fQy4ONVM1ZHcMW/hBkvKlXpT74z/jBp/OZ+0RJXqtl5oS
	h9uF/PQjV6FF+aW4TR/jpi6corASXViuJRkIL79UBp69zqlaZQrpIpZIvJDol+Nrj40f
	pMD+jiusn6qefgIkX3mF/nN0zoPkF/AIVY99yIuhwKEz6gqLug6VYVFEvlZrWhRQ05o3
	1tFhWQomhO7CUN3QYdZ+H0NNR4fkO9pK+sldjjPIzT7xxK+TP7v41pwVRaN5phFgfbM/
	pqZw==
X-Received: by 10.42.20.193 with SMTP id h1mr2500010icb.70.1395333765152; Thu,
	20 Mar 2014 09:42:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Thu, 20 Mar 2014 09:42:14 -0700 (PDT)
In-Reply-To: <CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
	<0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
	<CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
	<CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Mar 2014 09:42:14 -0700
Message-ID: <CAMKF1sqsn9A4et3yGJ5Q7FpAf1TUOvjoc2bBp4evMVXiwN6_qA@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>,
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
X-List-Received-Date: Thu, 20 Mar 2014 16:42:45 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 20, 2014 at 5:16 AM, Laszlo Papp <lpapp@kde.org> wrote:
>>>> And the initscript is missing LSB headers.
>>>
>>> Just like the other similar scripts.
>>
>> This does not mean we ought to make the problem worse so add it for
>> new ones. If you are in good mood, send a fix for the others too ;)
>
> I do not think this is a problem. Could you please point out what
> functionality it breaks?

it would be not groked by systemd e.g. folks use sysvinit, systemd,
upstart with OE
moreover we do have aspirations to come closer to lsb
there are lsb images that some distros produce. There might be
existing scripts which
dont have lsb headers however those are wrong examples to adhere to
when generating brand
new scripts.

 Send patches for the others, and I will make
> this cosmetic change for this one, too.

having said above why is that a condition for you to make your patch better ?

Consistency is more important
> than a mess of different styles, especially when it comes to cosmetic
> changes like this.

lets say we are moving towards consistency one after another its not
going to happen overnight
but each contribution in right direction helps.

