Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4D479661
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 14:24:23 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id h138-v6so7415863qke.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 07:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=afH7KuruKHPb6ihpC7DZ1bxLFrmv+UCJye3N9CovAYM=;
	b=STyh10F4E8zxS9AK3m7tn4ECt5Jsha1EZ+qo+WmlrluF3vOxtfQO+eWxdaQtNcicVR
	z9b2aeQUxkkGxHIq9JZNJYReAnFVn8cYS+Rsy4jzCztekW4FZHlZgtovLT6NSaRVy/Vn
	lJPfu7zVlXmEK/+CTdc+/CP34gSQyzXOeiep95PS3z9qzA5qVWFuq0GyK8G8UjpEF1E9
	jZx6o4yZIIN7mtGn1IbCXY3FMtaFrnF5zR3zndxe1F8evBbNas0HOOzu7hsC8P3pYW+S
	hjlhwyeWsMzLglMl8+e3z45zWXyI+brHv4/YznBbrM70XV1SJd0A5c4+WyL3ptYfo9Q7
	8Zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=afH7KuruKHPb6ihpC7DZ1bxLFrmv+UCJye3N9CovAYM=;
	b=YWmtEo7ompK0MOjh29ACCFi5/z51USnxQMg6P5hh4bKI8x9L7qXTpXuvFx7gfVoJSh
	P/eAw2tbgbhEGbcH8JrwMvFuyoJFPQPkQZGKydSNTdCKxFnRdQ7Exk1VSUY+j23RNLrn
	R96wZQiuCvhTGo0m7V7OAsSeU/OO1qsS7L3aFCopTyjOwrMWHiMc5/pztCiNnyONQzjQ
	Rd3AZW72Go0OrYemrSV1ra922juypmEtKYK3uyXUUfsvA9wMn7Q1kHO7UKACf5Ti5eVD
	Z24NM1yDirTquhIwSfNoR3MlCnEU0GR2sXOI25T2EYvY6ZJfpochtZZXus+IzCgDkiro
	aLOg==
X-Gm-Message-State: APzg51CeqPM0/FBPNgpgpuiQkKk8cpuBUTwchOtcVbbfXWYUccPLyiBl
	wNAnqz3V1zCS8HqrtvLhFUdBxzz9AXQ8vltuzUA=
X-Google-Smtp-Source: ANB0Vdbi++zPWZ5i6UOiEJ5j+u9KVruDMha+l6/XTkO1dwlo1A2s0O10sFvmfZ79QMD/8YYKfUyzVmUeSSjuKwJ41x4=
X-Received: by 2002:a37:c04f:: with SMTP id
	o76-v6mr2205809qki.315.1536243864821; 
	Thu, 06 Sep 2018 07:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1536212473.git.raj.khem@gmail.com>
	<3ad79c14cede673c5e42a24ee5d50866f3cee092.1536212473.git.raj.khem@gmail.com>
	<CAJTo0LaQWkmo_X7L-BG36BukRC+mOk56dYdBk82Y69BBt_RU2w@mail.gmail.com>
In-Reply-To: <CAJTo0LaQWkmo_X7L-BG36BukRC+mOk56dYdBk82Y69BBt_RU2w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Sep 2018 07:23:58 -0700
Message-ID: <CAMKF1srXqekv+14rSmq3t6u=0Z4sVO=8p2pRCBjLcdFCXzsKzA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gdb: Update to 8.2
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
X-List-Received-Date: Thu, 06 Sep 2018 14:24:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 6, 2018 at 6:08 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On 6 September 2018 at 06:42, Khem Raj <raj.khem@gmail.com> wrote:
> > --- a/meta/recipes-devtools/gdb/gdb-8.1.1.inc
> > +++ b/meta/recipes-devtools/gdb/gdb-8.2.inc
> > @@ -15,9 +15,6 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
> >             file://0008-Use-exorted-definitions-of-SIGRTMIN.patch \
> >             file://0009-Change-order-of-CFLAGS.patch \
> >             file://0010-resolve-restrict-keyword-conflict.patch \
> > -           file://package_devel_gdb_patches_120-sigprocmask-invalid-call.patch \
> > -           file://gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch \
> > +           file://0011-Fix-invalid-sigprocmask-call.patch \
> >  "
> > -SRC_URI[md5sum] = "372fa63a53adeee1bfbfd581d8da9e34"
> > -SRC_URI[sha256sum] = "97dcc3169bd430270fc29adb65145846a58c1b55cdbb73382a4a89307bdad03c"
>
> The checksums disappeared.

yes a rebase did it. I have updated pull branch please retry

>
> Ross

