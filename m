Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9E1EB731DA;
	Mon, 19 Sep 2016 19:22:36 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id u196so6297694vkd.0;
	Mon, 19 Sep 2016 12:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ztJi7gtEEiVySPQPIwYiX44Q8ib0bWC443EHy5HC3mY=;
	b=oKBEmaU+hcu9fBgCr9fkr5ESRPfK7QWvv08CXsZhCJCgbvwaC2JQjtgC8u1+dPRS8d
	ogX43tN27fRIYvSpP3k+Ii0FkEqcO8KstPoq9WJwstykK00tEh/TUmLphj8DPZlfTlB1
	RJI2Qgewh4eKbnFqH0/h4lpXbhinRL6cDbKQClPUJqpraEvuolfi4E6a6jCMagoo9Obm
	QM7ajTH6KFiQUrSC6igE3j9alvS4XA9W/LjHyIt8tGY66Cvqjk3Wtuq9IzhIfDuwh6Bx
	XfEBb+iZqwVCgKUuAQ2Q/ozXbW7OnhI/8aNBG8i4FcfFekHdCQuNsuQscEZviEdqI3+U
	Xpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ztJi7gtEEiVySPQPIwYiX44Q8ib0bWC443EHy5HC3mY=;
	b=hMtNf+Hey5B7w751j2LoH7e1tmoOW/RU082S/a5TTsoXGhbPfBbUFQ4KQ9ZqQBT9Tc
	2Ysm7/5Id5C913HoWxDEhjT61uA7/ebHepkn/BlitlQCIgCddRJ84EJJiPm/PeHGfOFi
	Pmx5XN1ovMKWpI5LpHBWTXf6mnfSn5IWA3Hf6VWZmq4MY37NNNb/Cio2JDlu/ciZMRsX
	Oj+wHssoxn1Xk8VOy4zICY9xtrHUpiBgySoUx5eqw6K3H+z8vAi9hrcv/2Nr5Rcc2Q2A
	oH6g4d6o2Bv5gBw5LmirKrWmXnAGqgcOuKJoH0a7Fgxh2+6oawP93+RQk4AqE4YFzjE+
	Y3rg==
X-Gm-Message-State: AE9vXwOqIAqF2x645hGHaw2SSw7VZHWQ/oY6aaEqJa1zCHeJsyD+R2EBP4wYJZeBCu4dMPMNXVR6+J+5Vojmmw==
X-Received: by 10.31.94.74 with SMTP id s71mr617738vkb.127.1474312955245; Mon,
	19 Sep 2016 12:22:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Mon, 19 Sep 2016 12:22:34 -0700 (PDT)
In-Reply-To: <CALbNGRTSct_8Eq=y1998mG+11_HYGqekUUXsi2jRC1Vpd0fFKA@mail.gmail.com>
References: <20160919144922.GA13530@jama>
	<CALbNGRTSct_8Eq=y1998mG+11_HYGqekUUXsi2jRC1Vpd0fFKA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 19 Sep 2016 21:22:34 +0200
Message-ID: <CALbNGRTZf9+-ZawJFrt69+Hk9d7z=VqiBf9RKTkGb3+WFAoNNw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world 2016-09-15
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
X-List-Received-Date: Mon, 19 Sep 2016 19:22:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2016 at 9:20 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Sep 19, 2016 at 4:49 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> =3D=3D Number of issues - stats =3D=3D
>> {| class=3D'wikitable'
>> !|Date               !!colspan=3D'3'|Failed tasks                     !!=
colspan=3D'6'|Failed depencencies                    !!|Signatures         =
   !!colspan=3D'12'|QA !!Comment
>> |-
>> ||              ||qemuarm       ||qemux86       ||qemux86_64    ||qemuar=
m||max||min     ||qemux86||max||min     ||all   ||already-stripped      ||l=
ibdir        ||textrel       ||build-deps    ||file-rdeps    ||version-goin=
g-backwards       ||host-user-contaminated        ||installed-vs-shipped  |=
|unknown-configure-option      ||symlink-to-sysroot    ||invalid-pkgconfig =
    ||pkgname       ||
>> |-
>> ||2016-09-15    ||3     ||6     ||5     ||8     ||3     ||3     ||13    =
||6     ||6     ||0     ||0             ||0             ||3             ||1=
3            ||11            ||18            ||1             ||0           =
  ||0             ||0             ||0             ||0             ||
>> |}
>>
>> http://www.openembedded.org/wiki/Bitbake_World_Status
>>
>> =3D=3D Failed tasks 2016-09-15 =3D=3D
>>
>> INFO: jenkins-job.sh-1.8.10 Complete log available at http://logs.nslu2-=
linux.org/buildlogs/oe/world/log.report.20160917_194919.log
>>
>> =3D=3D=3D common (3) =3D=3D=3D
>>     * meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs=
_4.7.0.bb:do_compile
>>     * meta-openembedded/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb:do=
_populate_lic
>>     * openembedded-core/meta/recipes-support/libunwind/libunwind_git.bb:=
do_compile
>>
>> =3D=3D=3D common-x86 (2) =3D=3D=3D
>>     * meta-openembedded/meta-networking/recipes-connectivity/samba/samba=
_4.4.5.bb:do_compile
> Again samba.. I checked the log: It seems that at least x86 for same
> issue as arm (was reported not to  fail for x86) will send correction
> - using bfd for all archs. Will put it ontop master-next
>
> Andreas
Oops - just noticed that my last patch was replaced - so no need for
further acrton - Thanks Martin

Andreas

