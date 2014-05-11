Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (unknown [209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9CE65FE3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 May 2014 22:47:09 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id h3so3126312igd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 May 2014 15:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ozvG7RWa5RdHnNF/d5K40dhUBf4iDaae4ajF/DljQ4o=;
	b=oE5UtIIoqv1B/cQIro3qjritc+RKIUVK21vfIpOJX+WmdAs9WmJV9rWvJEqZfBuuVK
	dQ04n9X9I1fmYt7AngWAd+es9GkyCmL8F/fZoND0lZbME+3QUXFhbq2MHUQNad3hbu6L
	SW69YlG4+1eE9i+1OK2Fc8COI50PKrq3EAfMPH9ZUwY77ii5PORlhHXk6eXJgda59ywk
	ahdkas81Tev3HcBdVXXLmVdsIbZrh383X7mxsogdb03rPrXeHWv+RY2PmAfA6HAQvmKp
	kzYi2ji3XYJKPMYxU+KhMt1a9PrwlWBYvYkL9B+CC51owWIB2/WfrHMrDmgsJ+wOtK+l
	APqQ==
X-Received: by 10.50.20.8 with SMTP id j8mr20354202ige.17.1399848430889; Sun,
	11 May 2014 15:47:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Sun, 11 May 2014 15:46:40 -0700 (PDT)
In-Reply-To: <874B01E8-8A61-442E-981C-3FCE0763854E@icloud.com>
References: <874B01E8-8A61-442E-981C-3FCE0763854E@icloud.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 May 2014 15:46:40 -0700
Message-ID: <CAMKF1so70jmiMNdfT_sBvnfHRd5zQNS-6LL3JufMs5H__+765A@mail.gmail.com>
To: Andrew Blackburn <andyblac@icloud.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: talloc build error
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
X-List-Received-Date: Sun, 11 May 2014 22:47:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2014 at 9:29 AM, Andrew Blackburn <andyblac@icloud.com> wro=
te:
> hi all,
>
> i recently merged =E2=80=98meta-openembedded=E2=80=99 master into my bran=
ch, but i am now getting a build error with tallow, below is the erro i am =
getting, can anyone help on how to fix.

It could be that S !=3D B change might be impacting this recipe. Can you
change the recipe to inherit autotools-brokensep instead of autotools
class.

>
>
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: do_configure (log file is located at /home/vix/oe=
-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/talloc-2.0.1-r2/=
temp/log.do_configure.9168)
> ERROR: Logfile of failure stored in: /home/vix/oe-alliance/builds/openvix=
/tmp/work/mips32el-oe-linux/talloc/talloc-2.0.1-r2/temp/log.do_configure.91=
68
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-little', 'bit-32', 'mips-common', 'common-li=
nux', 'common-glibc', 'mipsel-linux', 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_copy_aclocals
> | DEBUG: Python function autotools_copy_aclocals finished
> | DEBUG: Executing shell function do_configure
> | gnu-configize: 'configure.ac' or 'configure.in' is required
> | WARNING: /home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linu=
x/talloc/talloc-2.0.1-r2/temp/run.do_configure.9168:1 exit 1 from
> |   gnu-configize
> | ERROR: Function failed: do_configure (log file is located at /home/vix/=
oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/talloc-2.0.1-r=
2/temp/log.do_configure.9168)
> ERROR: Task 4967 (/home/vix/oe-alliance/meta-openembedded/meta-oe/recipes=
-support/talloc/talloc_2.0.1.bb, do_configure) failed with exit code =E2=80=
=981'
>
>
>
> hope someone can help
>
>
> cheers
> Andy.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

