Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 92CD37D678
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 21:54:31 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id w30so9168457qta.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 14:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EeDVQbUJ5Y+0dzFrWL4y101u79r2ikEbWiXyPNPMCnI=;
	b=XA8Lv0H4W3zSoHFHezeSGO5vmoe/9feJgeVWIsLSTS9Eb25rjbrDwmKnyBFFqPgkfh
	V9XJLwbTSMbaUNHvJl3S3t4TjWUR/g9Gfj5u/ICNcuo3apoqSLQ8jk9HkEJ+1Qf0QQmb
	5P25YAUhpJgpTvM9QHozyGywncqDtDpdeE47fkODGawdQ24uu6pnVuwTk4orZ2ZwKLbg
	Inu42IcxsNcM+T+o0arF38SNbcL2yKFDTyEa4AzOjkgtpG8LvP5KLmpcY+VvXpDUSqxp
	XvGzxzQOlVP8acA69zVEtrOlm9DhcsvOPmd3zxEiBp7GNfT2+QZVQGxzSncK8o4niXNO
	fPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EeDVQbUJ5Y+0dzFrWL4y101u79r2ikEbWiXyPNPMCnI=;
	b=dQBfsRh27chYQIlGR4HvC4A2wjnJYjxmi4iS61CkhiRnGKGSCQdgPEAk0YH/dNZL8y
	2+oxFdU8ZZ6d89T3C27Fhx5EEP6oofxWWgqNdI+EvgBS+fZJvsxM/YJsw6cziUiLqZMN
	cJqQnTPVBT0Fpf15iiN1MJUGM594R7iAHPjsV+B1NtpeoAR/psUZhuo9anPWVp6VnLqn
	d2B1ppm/odgqdWilZjVm02uDIjml3OdK+1Zlto5REGVUnix4NK4MraBJCEkHHd6T+v08
	io91vewkxVh5q4jLqIOYJKD13oiYq5V9p3oXRB5HS/Mr+TyBKaTSfukUkB810Lnpvdr/
	y2bg==
X-Gm-Message-State: APjAAAUc0kcs0Oroq3c8yGs1MLTdQ6pmhPP9A8WUhOpzUMuOKZuJcroG
	brygttx86hnry0M57/qoci+SIASOByFE9JSmS2I=
X-Google-Smtp-Source: APXvYqzHcknPV9zwgT8gL/Z9QF7u0MR0Z/QIvAN7BTv11ZPclnezBeRIwsjxvsMwH28dVqNuHhJkKpH/DUbL3NLDza0=
X-Received: by 2002:a0c:d1a7:: with SMTP id e36mr12626819qvh.127.1554501272443;
	Fri, 05 Apr 2019 14:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <cfd56541-43c4-5128-3d41-cddc356a3cb8@gmail.com>
In-Reply-To: <cfd56541-43c4-5128-3d41-cddc356a3cb8@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Apr 2019 14:54:06 -0700
Message-ID: <CAMKF1sqftJeFBGrCyxdQQfNjGA3P16Uu2t+=W-gz-VJK4zUB5w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Worries kernels supported
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
X-List-Received-Date: Fri, 05 Apr 2019 21:54:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 4, 2019 at 2:29 PM akuster808 <akuster808@gmail.com> wrote:
>
> Hello,
>
> I noticed there are 3 kernels in Warrior. 4.18, 4.19 an 5.0. Do we
> really need 4.18?
> I see its the default version for poky-tiny. 4.18 is EOL but maintained
> by Windriver.

I would prefer it to be 4.19 since thats at least LTS

>
> regards,
> Armin
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

