Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0799B787F8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 21:35:08 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a88so2074813pfe.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 13:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1fs14NuC7gPWZJhYTatjWuBGQxiEBRu/JKF1pkhap4Q=;
	b=nkhElQaCzCo+U7p6tCMs5hOCcKUE48UTAP2FE8adcSLwazt1RVZQBQZdAtf1J3XZKe
	flMg/aoIvYI0vT/YMT4girZDAvy5Nnanq4+/Oglcwa32CNbEibRY2B/rRXl9TMVvOtC6
	8gMq+nZZFj5M3Dj0CnDwQsOz3/7EVdy2Rh1Nb8tD82Bus/TqPE0GPmcFEYPWTkY6JvOW
	8OkFxSSbs53h3OIPvGH5O2fxYWvHbDXTi4h8y/PWm5cTr8v6RWTtxCNMLFhdEliMQ/fD
	6ZaAwXWYTRkLVHCZ8xwhpHfsiGPZH9G0eAdRAJQlg8IXowyYo6IJ4D60zlXEgPXZhgxy
	DNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1fs14NuC7gPWZJhYTatjWuBGQxiEBRu/JKF1pkhap4Q=;
	b=rzAkDkt8DfBsds8Ud55Ux+a8Wz7u/T2V24HQeF25U9j4Fdmb6iVEER3PDSbM1exnd+
	KR9bBgmejBqOp9JjksFFqDBEftmPhNb8SNc2/HZXsP904Uk01rAVW/6ejhjKAywdg0wn
	pkFvv79uqXoVPxGGedYVHA+v9ehS5ENIokOJu5SCHV9zKBgkh1rWpC+Cb+6HVf3rFcya
	OquVG404XrP2DZvHcyKC55UYbBB5WjU79Aor7HD37nniOaQq/XSafHgZtdSJ3wUhlu7Z
	ulUjv8b7pNQopbXfb2YS2O0prFgQPiO3XhR2Z03hftidQ014knFQpaM4z+l/5lhzEPh9
	phIA==
X-Gm-Message-State: AKwxyteqAJona9LYojs1b43T2LCFSHobcA31eHr4pwR+1HYxKcOhMjPP
	gYgm7fNlerVWvvnMp5898sHBDEeW1nqR1jvzqCk=
X-Google-Smtp-Source: AH8x227T9YkULJ1pGkf3m7XmCo3SwKSFVSSEG9UWBuYdVj1nsmDobQZWyHcJWJFQZ5K8+PBsMRD73tdMXzBXtr3NtnA=
X-Received: by 10.99.181.13 with SMTP id y13mr13837741pge.196.1517088910019;
	Sat, 27 Jan 2018 13:35:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Sat, 27 Jan 2018 13:34:39 -0800 (PST)
In-Reply-To: <BY2PR02MB347BCA749C4415BE91A11E3B9E70@BY2PR02MB347.namprd02.prod.outlook.com>
References: <1516102686.29722.267.camel@linuxfoundation.org>
	<1517070952.756.40.camel@linuxfoundation.org>
	<BY2PR02MB347BCA749C4415BE91A11E3B9E70@BY2PR02MB347.namprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 27 Jan 2018 13:34:39 -0800
Message-ID: <CAMKF1srGc7hTUi6ypJZ2zJguoUt1T9Nv5dvUDS=EhZ9xMFD1iw@mail.gmail.com>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project, Spectre and Meltdown
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
X-List-Received-Date: Sat, 27 Jan 2018 21:35:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 27, 2018 at 8:59 AM, Manjukumar Harthikote Matha
<MANJUKUM@xilinx.com> wrote:
> Hi RP,
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Richard Purdie
>> Sent: Saturday, January 27, 2018 8:36 AM
>> To: openembedded-core <openembedded-core@lists.openembedded.org>
>> Subject: Re: [OE-core] Yocto Project, Spectre and Meltdown
>>
>> On Tue, 2018-01-16 at 11:38 +0000, Richard Purdie wrote:
>> > I just wanted to give people an update on where the project stands
>> > with these issues.
>>
>> Master now contains gcc and kernel fixes (in linux-yocto). meta-yocto- bsp updates
>> are still pending.
>>
>> rocko-next also has those fixes and is undergoing testing which if it passes, will get
>> pushed to rocko.
>>
>
> I see that rocko-next branch is upgrading the GCC version to 7.3 from 7.2 , is there a reason to do so?
> I was under the impression that we would backport the security fixes to 7.2 version.
>

point releases are bugfix releases of gcc, I think you can look at it
as cumulative bugfixes backport.

If you are concerned about some of the fixes in this

https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=7.3

please let us know.

-Khem

