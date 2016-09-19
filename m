Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3631960761;
	Mon, 19 Sep 2016 19:20:34 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id g9so6376364vkg.2;
	Mon, 19 Sep 2016 12:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=e+ctOBrBnz1ZIEixqUL2e/mlJAncKehXGenSQ4CXQGI=;
	b=UfhoYFmaVgSQsGggXhxGp2xbimlYS77AOTqdwUkPWY5uJ9WeaWgFj41srul8KK9vXb
	RqWuEIbL4QWDXCY0s7cyI5gR03B0nU5nLfBQpnV3o6P5ApoGsNwLvbuC9CY4ZBBx671i
	cB9/wIPB0gcee4bp64VFe3K0kW29Sk0h75WtCL/mxYicSM779rfktOAQ/6/ravLPics7
	Ll2klG0tyUZ2/tyWskbxSy7ankaadcz2xMA6xB4O7ik47Wvig4wSdxH4NZDbt0GGkES8
	iMtByGnG3wWRuwwL/GKdKSgXuz1C37CwVbj8ejpUD5PFBxPoalEwRS9he0JgjDo6vXJF
	Lzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=e+ctOBrBnz1ZIEixqUL2e/mlJAncKehXGenSQ4CXQGI=;
	b=ecN1tHUtcP23RROK9IIfZvWSg1vwOSmgWYKYoYR0TUb/MTYJVskArn8PP+RxfjXsdE
	P4i+omPZlJoBKnDngf1/BI/Iea44klCzmIq7+m0sWz0cVZyp6phn4ySMN0eoT1kJ2CMW
	qOMjRr2gKgjY8zRm+aVqxLqbgYLDnVo2BVn2uGy+S7NdOktwixACwYNCpbTFFOl2mjhE
	R3O0dsFLkVbiiwGMRYm75CRF5iXfh9G/8my0a81exPO6n+igW+74Ib4gkFRVBNsCLdZG
	t2Izn43hhRfZK2WH7+ROcdewdgtYG1O2e6LfxCV4Nd8Yh7oe3sR06F6BLeMGggQF0aFz
	1B4A==
X-Gm-Message-State: AE9vXwPtd4uxvLl1u4hbCZfs5CrNw7T/beIgCM0hb8uAw/a+xcgSghS/Lx1XzsO74hEi9LclicEeAznSs/3ung==
X-Received: by 10.31.223.129 with SMTP id w123mr576514vkg.67.1474312834201;
	Mon, 19 Sep 2016 12:20:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Mon, 19 Sep 2016 12:20:33 -0700 (PDT)
In-Reply-To: <20160919144922.GA13530@jama>
References: <20160919144922.GA13530@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 19 Sep 2016 21:20:33 +0200
Message-ID: <CALbNGRTSct_8Eq=y1998mG+11_HYGqekUUXsi2jRC1Vpd0fFKA@mail.gmail.com>
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
X-List-Received-Date: Mon, 19 Sep 2016 19:20:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2016 at 4:49 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date               !!colspan=3D'3'|Failed tasks                     !!c=
olspan=3D'6'|Failed depencencies                    !!|Signatures          =
  !!colspan=3D'12'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64    ||qemuarm=
||max||min     ||qemux86||max||min     ||all   ||already-stripped      ||li=
bdir        ||textrel       ||build-deps    ||file-rdeps    ||version-going=
-backwards       ||host-user-contaminated        ||installed-vs-shipped  ||=
unknown-configure-option      ||symlink-to-sysroot    ||invalid-pkgconfig  =
   ||pkgname       ||
> |-
> ||2016-09-15    ||3     ||6     ||5     ||8     ||3     ||3     ||13    |=
|6     ||6     ||0     ||0             ||0             ||3             ||13=
            ||11            ||18            ||1             ||0            =
 ||0             ||0             ||0             ||0             ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> =3D=3D Failed tasks 2016-09-15 =3D=3D
>
> INFO: jenkins-job.sh-1.8.10 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/log.report.20160917_194919.log
>
> =3D=3D=3D common (3) =3D=3D=3D
>     * meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_=
4.7.0.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb:do_=
populate_lic
>     * openembedded-core/meta/recipes-support/libunwind/libunwind_git.bb:d=
o_compile
>
> =3D=3D=3D common-x86 (2) =3D=3D=3D
>     * meta-openembedded/meta-networking/recipes-connectivity/samba/samba_=
4.4.5.bb:do_compile
Again samba.. I checked the log: It seems that at least x86 for same
issue as arm (was reported not to  fail for x86) will send correction
- using bfd for all archs. Will put it ontop master-next

Andreas

