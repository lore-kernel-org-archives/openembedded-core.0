Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id BF372606BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 08:15:55 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id c13so99229itb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 01:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lE2hJSCRy2e32DkURlmOoHcvt2zBMhi8/DjEonLDJ98=;
	b=qLBe5/tDXUKXA8U9NZ+8/oA8Go1jPSJ/AKvjGQ0gaKSjMyHKHugJepg6z2CE9oAWSl
	FFF37nm4x9SOb1SSPFlt4noZKePXliaxTfuwIPlrwhIwW63Ts3W58jAxCiTCHuhTQgjG
	V6hsIgxh3W+sN/zivFOKYxQ4ME+YDMzbx86UTqL+6PyBrGDFycM1jPDhi25/K0lt83l4
	907rto3NFOV8J230ZAJw9cUX2ZngDNuAIUnzQagYs8W8keZGRoIHmEmt7M2xWZdmabwD
	z74L+sIAMImsquZNbRTKApseY0829NWDKyhCcv398zeXoBli0rWepne2vZpLojiaAIyS
	2ReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lE2hJSCRy2e32DkURlmOoHcvt2zBMhi8/DjEonLDJ98=;
	b=g2Au/HAnupAnXb9LI0iFhsvy2U84ni9OHl0xadXphmLCZYNNoXpOKYD+EvPFFFLhZz
	zDSIwrZ5/qni9huss/EehhExCZQPEoFZ7d2LYlW7N7ed/eTOp93vi8nXqkw0gC9fCFKe
	8ZgSuhGbYEn2yFTGogCegvA4l0gWpHaqvW6bEsiNeCspxL/ihbA+7l299rL8GDeNBSIk
	7i/7xbivysYvYflJc96c/s89n2LlLyC5hAsL6m3O2nw+GfUbKRZ+S2UhAPAT2aNGRH/I
	3K9zoS1oAioboiPl9r9i81WLe0KNb47N30GJMUgckE0nejL72yho0OcbNvQIKVDkswWI
	pSxg==
X-Gm-Message-State: AHPjjUinfACl21u2TOipUyGdf/uFTswkX0MuAAffj7uAUfU5Rtjozt+T
	tDIEgzDQohDJ5/bqJMuJ93BNCXpJ+oW/
X-Google-Smtp-Source: ADKCNb4Pc8MVPFA+1vlMFogD1GA72OfxcmnTgQC1/uMjCTlkI44yZjNojQxhOZTjCCXQ7dvoggkjCnK4Znv1XOpEivI=
X-Received: by 10.36.196.10 with SMTP id v10mr6518122itf.64.1504512956940;
	Mon, 04 Sep 2017 01:15:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.215 with HTTP; Mon, 4 Sep 2017 01:15:26 -0700 (PDT)
In-Reply-To: <CAC+thW1+RRE8E6KguaGXhs=Hi+P6mp3X++nNYAs-U4S13TL7yQ@mail.gmail.com>
References: <cover.1503923683.git.jussi.kukkonen@intel.com>
	<38789a200c02167a293e7b7d51e0f2ac0ce0da21.1503923683.git.jussi.kukkonen@intel.com>
	<CAC+thW1+RRE8E6KguaGXhs=Hi+P6mp3X++nNYAs-U4S13TL7yQ@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 4 Sep 2017 11:15:26 +0300
Message-ID: <CAHiDW_FXX2od__qC-mN=Z_yb2HGy_XCQrnBEqQv-pq7P-aHdwg@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] mesa: Support building without opengl
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
X-List-Received-Date: Mon, 04 Sep 2017 08:15:56 -0000
Content-Type: multipart/alternative; boundary="94eb2c057ea25bdc1c055858b803"

--94eb2c057ea25bdc1c055858b803
Content-Type: text/plain; charset="UTF-8"

On 4 September 2017 at 10:49, Andrea Galbusera <gizero@gmail.com> wrote:

> | configure: error: GLX cannot be built without OpenGL
> | NOTE: The following config.log files may provide further information.
> | NOTE: /home/gizero/work/smartliving/distro/repo-master/build-poky/
> tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-
> gl/2_17.1.7-r0/build/config.log
> | ERROR: configure failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> /home/gizero/work/smartliving/distro/repo-master/build-poky/
> tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/mesa-
> gl/2_17.1.7-r0/temp/log.do_configu
> re.1391)
> ERROR: Task (/home/gizero/work/smartliving/distro/repo-
> master/build-poky/conf/../../layers/poky/meta/recipes-
> graphics/mesa/mesa-gl_17.1.7.bb:do_configure) failed with exit code '1'
>
> This doesn't seem to be related to the bbappend for mesa-gl that is
> present in meta-raspberrypi, which merely appends "gbm" to PACKAGECONFIG
> for rpi machines (bitbake still complains with this removed). Instead,
> reverting this commit takes the build back to green light.
>

Sorry, I must have not tested mesa-gl with the version of the patch that I
sent. Sending a fix after a quick test (mesa-gl seems to be missing
"opengl" from PACKAGECONFIG).

Jussi

--94eb2c057ea25bdc1c055858b803
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 4=
 September 2017 at 10:49, Andrea Galbusera <span dir=3D"ltr">&lt;<a href=3D=
"mailto:gizero@gmail.com" target=3D"_blank">gizero@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div class=
=3D"gmail_extra">| configure: error: GLX cannot be built without OpenGL<br>=
| NOTE: The following config.log files may provide further information.<br>=
| NOTE: /home/gizero/work/smartliving/<wbr>distro/repo-master/build-poky/<w=
br>tmp/work/cortexa7hf-neon-<wbr>vfpv4-poky-linux-gnueabi/mesa-<wbr>gl/2_17=
.1.7-r0/build/config.<wbr>log<br>| ERROR: configure failed<br>| WARNING: ex=
it code 1 from a shell command.<br>| ERROR: Function failed: do_configure (=
log file is located at /home/gizero/work/smartliving/<wbr>distro/repo-maste=
r/build-poky/<wbr>tmp/work/cortexa7hf-neon-<wbr>vfpv4-poky-linux-gnueabi/me=
sa-<wbr>gl/2_17.1.7-r0/temp/log.do_<wbr>configu<br>re.1391)<br>ERROR: Task =
(/home/gizero/work/<wbr>smartliving/distro/repo-<wbr>master/build-poky/conf=
/../../<wbr>layers/poky/meta/recipes-<wbr>graphics/mesa/mesa-gl_17.1.7.<wbr=
>bb:do_configure) failed with exit code &#39;1&#39;<br></div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">This doesn&#39;t seem to =
be related to the bbappend for mesa-gl that is present in meta-raspberrypi,=
 which merely appends &quot;gbm&quot; to PACKAGECONFIG for rpi machines (bi=
tbake still complains with this removed). Instead, reverting this commit ta=
kes the build back to green light.</div></div></div></blockquote><div>=C2=
=A0</div></div></div><div class=3D"gmail_extra">Sorry, I must have not test=
ed mesa-gl with the version of the patch that I sent. Sending a fix after a=
 quick test (mesa-gl seems to be missing &quot;opengl&quot; from PACKAGECON=
FIG).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Jussi</div></div>

--94eb2c057ea25bdc1c055858b803--
