Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB077D68F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 10:44:57 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id a190so9747088ite.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 03:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KwyGpXFB4oZzSVj7KJb5Oax/qZNBB/06sdGHZTODDGk=;
	b=O8mLM1tGhZRme25BRLM8N67couKK+H7TSzBMfxJPx+IgAtZhAyIXyorIlQNdBbu6B9
	t4A4ms5R1hUB3y1m6smIyqePpJyh3ZkdfmKU4mCxlKsw7dT6bdbCc7ZlBFmzRANIlm2o
	Vb58JjDZZ89eJk7SSnFPKFspJGJBcvYpb+DzWHl8vioV/kepydujZifntUID//E3Mkrv
	mNYksmrXrk1R6AHpEyEX3gae7mDg/SRe12eu9sOVQQl1rFqYLoB0j+LyPcw3R8SgpOe/
	E4GnS167UoB4WRWsa5c9xyaWYycWgsA+Xy5S5T8eSuZ7jTx5zL3CE8PrDnRzu8qtf7ly
	zC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KwyGpXFB4oZzSVj7KJb5Oax/qZNBB/06sdGHZTODDGk=;
	b=C0iV0zLmgX23XRORERqcfD7SlIgnmh0Lai9QRuHFXiGp41QfD9QaG5OczTdVA6+qen
	AzxyR4ldiqsqV4U3OWbENg5/RHxQhrZrnKBx/lQU8mmBo/7Qb2S469zhkMJAh+mFiXiv
	LNaRSuDW4zWzaVMRWHuInABTu9XXWlQetM+TvoMYWCs0CjeSErDv751Sx1Fi7fiMQ2xA
	LxSQTyMf3U2h64qH+EQbqoEw0zmR0Fs6HgVcmr0W93zG12NW4d0vQ5K3+stAjEkieWEh
	L8IF8wpEWMJoCmcTSZ3hGWrtyzuCrqgMJdOFNGzOOt8eiFaZZs78DH3Ku6givMA2E6j/
	ysRA==
X-Gm-Message-State: APjAAAUhqWyEE73os92JudTTsDeT4RcWFblMgMh0BB2ODYHOzOZXnnus
	B4oNMwGsqxC5OmiD2dciM5cMv+7X4GEmvLf1AT0=
X-Google-Smtp-Source: APXvYqys4Qdvlj6+Bv5b/O+80zgyWPku0Svzy+6ej5E9qvM5Qbt1eJPfWB4ssaDFqk7tYyGb/3eYTXiOpKfzxFxGxpw=
X-Received: by 2002:a24:78c8:: with SMTP id p191mr12031231itc.58.1556361898148;
	Sat, 27 Apr 2019 03:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190424091318.18154-1-schnitzeltony@gmail.com>
	<e290569afc4a08a1489cf033195e32d58ba78e19.camel@linuxfoundation.org>
	<CALbNGRTMzeWHgAO6MdLs1HmiCrMWfmpd3=OLUrJdSDBbbT44Gg@mail.gmail.com>
	<CALbNGRSjZ1mDoDNT7SXyKfFad4r7Yn8pLdL8ddMhKE-nctFBtw@mail.gmail.com>
	<BC6A3A88-2393-4AD1-8153-1301759A9646@gmail.com>
In-Reply-To: <BC6A3A88-2393-4AD1-8153-1301759A9646@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 27 Apr 2019 12:44:46 +0200
Message-ID: <CALbNGRQUmLRMzXmMeLx21x5ZCuj+00EOL5Oo8S2JoVeeYqGfiA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte: upgrade 0.52.2 -> 0.56.1
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
X-List-Received-Date: Sat, 27 Apr 2019 10:44:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 27, 2019 at 12:02 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> The build log makes it rather clear?
>
>  configure: error: *** A compiler with support for C++17 language features is required.
>
>
It is not that I cannot read how about a link?

Followed Richard's link

and find nothing which helps:
ERROR: vte-native-0.56.1-r0 do_configure: configure failed
ERROR: vte-native-0.56.1-r0 do_configure: Function failed:
do_configure (log file is located at
/home/pokybuild/yocto-worker/oe-selftest/build/build-st-50315/tmp/work/x86_64-linux/vte-native/0.56.1-r0/temp/log.do_configure.9196)
ERROR: Logfile of failure stored in:
/home/pokybuild/yocto-worker/oe-selftest/build/build-st-50315/tmp/work/x86_64-linux/vte-native/0.56.1-r0/temp/log.do_configure.9196
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/oe-selftest/build/meta/recipes-support/vte/vte_0.56.1.bb:do_configure)
failed with exit code '1'
ERROR: vte-native-0.56.1-r0 do_configure: configure failed
ERROR: vte-native-0.56.1-r0 do_configure: Function failed:
do_configure (log file is located at
/home/pokybuild/yocto-worker/oe-selftest/build/build-st-50315/tmp/work/x86_64-linux/vte-native/0.56.1-r0/temp/log.do_configure.9196)
ERROR: Logfile of failure stored in:
/home/pokybuild/yocto-worker/oe-selftest/build/build-st-50315/tmp/work/x86_64-linux/vte-native/0.56.1-r0/temp/log.do_configure.9196
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/oe-selftest/build/meta/recipes-support/vte/vte_0.56.1.bb:do_configure)
failed with exit code '1'
ERROR: Command . ./oe-init-build-env; ${SCRIPTSDIR}/checkvnc;
DISPLAY=:1 oe-selftest --skip-tests
distrodata.Distrodata.test_checkpkg
buildoptions.SourceMirroring.test_yocto_source_mirror -j 15 failed
with exit code 1, see errors above. (1556308938.9: 9403.3)

Andreas

