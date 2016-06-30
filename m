Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0B866607F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 16:57:08 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id g127so152661591ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3xMSTwGxvW5cibDs/BMcMv8NAhCRYqLQSqSQX/H0pzM=;
	b=t+BJmqoBuwNIuDk6PbgbaDIrK8k3A6aWskUwZAbSjmQ7w1RRIWs291T38fW5rYujss
	NlKuAhAfDhJtIbYMxLcAtz4csLmsL9/rua8s5LH7YYhpYk9OolwY2nD4vlXSRqKyqlXz
	HReO0KUpce5LrPDsHHLJu+vIqz8Fs2VhVUkCtEo5ddSldjciBMdMewL2xJyiuovztduI
	52wh8L5G04UYXWsaBnAtIm57uyFG6ayXzxAAlh4faPd1PV/AfDnxwnKq4GWuumIKhoIK
	cenp73LZv+OAUXHIvfiMNP0QHkIT/O6MDqVvMI4LgzjNWURLYxrutSt5AOk4RIOeah/R
	4oOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3xMSTwGxvW5cibDs/BMcMv8NAhCRYqLQSqSQX/H0pzM=;
	b=Do0Ehh8uJ5cH8zZ/SOI6upRJpxESKQ0KiaFY1OBQkgU9TeLKXbH4e/CUoy4T/toQ8W
	+5LGYNrmgpl6oZoOWX+mNiiAysl3TD9QcGjEclVNFLPCgr7pOue1gmOvfZmSpd1lnyol
	OTDWG1JzH5itWGebldH0vcff+tGLCb82WUWQfTh/uon0sInAHggK8kHOzQwhTCi50lNf
	hKedsj/JH1myb8FfvMOiS/9GJVd+KvgBWaqAOGmejJ0pk+BKTr8vzxJKsj+xyeDpU20i
	oJRuxjFzjoytxnrXKyOSDl/dyKPePG+ZftYRzN7KOAjSMs9H4hX9Mk6BM951zOUmwsYP
	UCfA==
X-Gm-Message-State: ALyK8tJSz/5I5E2SJkNSKinXcDR2YID8G0A3kLwVMZKc5nftIgx5iwkIBjb56C5gNNliNNDktqKE7pgLE4ai61VC
X-Received: by 10.36.217.68 with SMTP id p65mr16646895itg.38.1467305829252;
	Thu, 30 Jun 2016 09:57:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Thu, 30 Jun 2016 09:56:49 -0700 (PDT)
In-Reply-To: <D94025A2-518C-4CC8-AE9C-93DB39CDD687@die-kriestens.de>
References: <1586B03B-3244-4FB3-82F7-803CFD983532@die-kriestens.de>
	<CAJTo0LbuTrNE4kemiZK_yEqUFo4CN9TJJLZzqwTjzVK=xuK1MA@mail.gmail.com>
	<D94025A2-518C-4CC8-AE9C-93DB39CDD687@die-kriestens.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jun 2016 17:56:49 +0100
Message-ID: <CAJTo0La_VCQ5P1ELePTyLQLU_Zy3rC6z+qh24ZtMcGJ7_FKg3Q@mail.gmail.com>
To: Daniel Kriesten <embedded@die-kriestens.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Building Perl-5.22.1-r0 on Arch Linux fails with QA Issue
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
X-List-Received-Date: Thu, 30 Jun 2016 16:57:09 -0000
Content-Type: multipart/alternative; boundary=001a114631b6bad68f053681c27d

--001a114631b6bad68f053681c27d
Content-Type: text/plain; charset=UTF-8

On 30 June 2016 at 07:03, Daniel Kriesten <embedded@die-kriestens.de> wrote:

> ERROR: perl-5.22.1-r0 do_package: objcopy failed with exit code 256 (cmd
> was 'arm-poky-linux-gnueabi-objcopy' --only-keep-debug
> '/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/generate_uudmap'
> '/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/.debug/generate_uudmap'):
> arm-poky-linux-gnueabi-objcopy:/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/generate_uudmap:
> File format not recognized
>

Can you run file on the binary that objdump is complaining about?
(/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/generate_uudmap)

Ross

--001a114631b6bad68f053681c27d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 June 2016 at 07:03, Daniel Kriesten <span dir=3D"ltr">&lt;<a href=3D"=
mailto:embedded@die-kriestens.de" target=3D"_blank">embedded@die-kriestens.=
de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex"><div id=3D":bnq" class=3D"">ER=
ROR: perl-5.22.1-r0 do_package: objcopy failed with exit code 256 (cmd was =
&#39;arm-poky-linux-gnueabi-objcopy&#39; --only-keep-debug &#39;/home/krid/=
Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/work/cortexa9hf-neon-po=
ky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/ptest/generate_uudmap&=
#39; &#39;/home/krid/Develop/Yocto/fsl-community-bsp/build-imx6q-elo/tmp/wo=
rk/cortexa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/package/usr/lib/perl/p=
test/.debug/generate_uudmap&#39;):<br>
arm-poky-linux-gnueabi-objcopy:/home/krid/Develop/Yocto/fsl-community-bsp/b=
uild-imx6q-elo/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/perl/5.22.1-r0/p=
ackage/usr/lib/perl/ptest/generate_uudmap: File format not recognized</div>=
</blockquote></div><br>Can you run file on the binary that objdump is compl=
aining about?</div><div class=3D"gmail_extra">(/home/krid/Develop/Yocto/fsl=
-community-bsp/build-imx6q-elo/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/=
perl/5.22.1-r0/package/usr/lib/perl/ptest/generate_uudmap)</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114631b6bad68f053681c27d--
