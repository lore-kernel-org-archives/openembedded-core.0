Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 243A87F2B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 00:57:54 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id y23so18353693lje.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 17:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GaxwWsCjpjjWRqZ0dcy6fpFYNBP7zzFo2GoOYYt+1fM=;
	b=lrI+mNqkcIrkroPM4Ky71fmPpcFHAvMDB7/DF5oxCtZqMouQY6TcGa0xteab3jRcqT
	u1b8BphxbEpoaW5n2AqtuM9psWCZfyhr2T/KQEftPebdGwR4isxAcjnbQFqRYLvZaudB
	Vlug4Vt+fECcQhfSzOh6e9xlx0EGEPVqGI2YEkSZ++5MatpRwzANMGH5XxHEJhP6amRN
	tsMGfuRdTY6XyQPdlQ3PaxOJO1CQQyt9euqvF679OsbrkH6palpAGGPwAlm3RDQjWVAX
	f7sB/M3lwu6xXh9Qn9V5bo71r/N9mN95SvNce3p3haiNgUZKW+e6vmuiP9Jhy1cK2Cq6
	RkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GaxwWsCjpjjWRqZ0dcy6fpFYNBP7zzFo2GoOYYt+1fM=;
	b=oF9wqJiKmCcJgsZDtEbvksVgd4UpUvbFdW7QccrDE+SiUtCElRaDfiBhpy+BCE+45R
	rGw6q2rlwKOMyFj5UBDpGA6S+XotVMjI1jjwDfR+chRgaqHxzZNnHKv65FcDwXEnZY92
	or3l4vf8diCt/hkj4XGaAZO+Jjquq0RCcnZ1/di1P2nG5yhMsSvcuUsB9bDWpKDU5N/2
	FE0OJUsiJeAfsAMUEvIeqWq8t8Ef72WVKNRCnBxEJf1A0qeKUBlfaVl6EZHvx9DmEwdb
	Eia1Fh2ZebQktXag+UKZ1sHaGao7QWyWgtLcUV8IukECzqMYBdfQOziXJqMxtQmzk99S
	EQXA==
X-Gm-Message-State: APjAAAVQYODSn0YfYrF/Kk/LUMKpmak72cTaY83y8rLdEEugG0YLKsnT
	Nuv8XOpXc8FRciQmMvADyo72cTKp1HynQJkoaaY=
X-Google-Smtp-Source: APXvYqwXoDCnawqCI2BSEksyxe3DoqZ77yX34f4PFT0xKk8Lxc83tWwg4tOJPNhwdDHJ3CDL8XfSvzpmkecGnJ0sYnc=
X-Received: by 2002:a2e:420a:: with SMTP id p10mr9802818lja.16.1571101075589; 
	Mon, 14 Oct 2019 17:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191008214551.32751-1-alistair.francis@wdc.com>
	<af47b666080c2808a32834efe1b14a88938b134c.camel@linuxfoundation.org>
In-Reply-To: <af47b666080c2808a32834efe1b14a88938b134c.camel@linuxfoundation.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 14 Oct 2019 17:52:50 -0700
Message-ID: <CAKmqyKMoxAm6Ksq6dHTsS--c-Q0szkV_0BgKBKkJ_7MabsQVcg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] u-boot: Bump from 2019.07 to 2019.10
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
X-List-Received-Date: Tue, 15 Oct 2019 00:57:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 13, 2019 at 2:06 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-10-08 at 14:45 -0700, Alistair Francis wrote:
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  .../u-boot/files/0001-CVE-2019-13103.patch    | 69 ---------------
> > ----
> >  .../u-boot/files/0002-CVE-2019-13104.patch    | 49 -------------
> >  .../u-boot/files/0003-CVE-2019-13105.patch    | 37 ----------
> >  .../u-boot/files/0004-CVE-2019-13106.patch    | 56 ---------------
> >  .../0005-CVE-2019-14192-14193-14199.patch     | 43 ------------
> >  ...-14197-14200-14201-14202-14203-14204.patch | 44 ------------
> >  .../files/0007-CVE-2019-14194-14198.patch     | 42 -----------
> >  .../u-boot/files/0008-CVE-2019-14195.patch    | 42 -----------
> >  .../u-boot/files/0009-CVE-2019-14196.patch    | 48 -------------
> >  meta/recipes-bsp/u-boot/u-boot-common.inc     | 13 +---
> >  ..._2019.07.bb => u-boot-fw-utils_2019.10.bb} |  0
> >  ...ols_2019.07.bb => u-boot-tools_2019.10.bb} |  0
> >  .../{u-boot_2019.07.bb => u-boot_2019.10.bb}  |  0
>
> I suspect this breaks on musl:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1135
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1137

Fixed in v2.

Alistair

>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

