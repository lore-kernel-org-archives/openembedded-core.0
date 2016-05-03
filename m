Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id B29276FFED
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 19:34:17 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id u185so3664818iod.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 12:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=rYoUw0wWBJXFt81Ze+54HqpF+bSd5m08gaBCMpskFMA=;
	b=iTEvoE60Xz9fJt7iBd7ZVYUkECyFCGlb+Y+M03H57SMj53gvl+l3brM308qZ7DWigk
	Od/UZRoDLWHDHHKwQ4m261f0rbfn9VebZvDWqtxBZSRQPXfXgFLb9x3pOG370tuoRmJK
	ut5sigye4bdtWc1qs5sb3Z8hS6ES2wA7n8zkdaUz7pKhc9uDE8zHSJg77OAxcLuLEY72
	1voOKou+ais0VGVJlFiWgL4XohNPV5bfnODeYc8qPWqAM+sntRWqY/EjSCDT1e7hWURz
	ioAbEdxyegpGTimG5Y11/cx56ewUxtr2lUsUizMrORm7bAIwsxA2T4zmOfTdIrMXcuzm
	Bs0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=rYoUw0wWBJXFt81Ze+54HqpF+bSd5m08gaBCMpskFMA=;
	b=qT52KoVwKW9LfKANHRVGAXHlt0+yfcNQ9+VAnk5vUmk0nh35UJUZMUxUKh8YCc/l2R
	DVNQrAi14wXHWg66CrhuvlpsaQ9pKM+u7LpL7WFRPXvo4Dh0PyOusn2phnl77lhiFNzB
	3re/1X0KOrKJWW53GPVZa60MbrzXQgjqenor8qNSWj53J1TTpH5m8yR4++zktkc0GgYd
	bhUKeR1P800AeUz3mNFgJagYW0EDqIn/geCUdQ24TgzqP2BecOf8TwktOUmRj/+oV4DN
	7nd/36xsrF2MxtAk4Csc7njTO+BOrGqhiMR9q6uOLcPTFYANZKrX4v5psvriHsiVOrTE
	+Y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=rYoUw0wWBJXFt81Ze+54HqpF+bSd5m08gaBCMpskFMA=;
	b=UGe1OCfirt4b4BdhWQ3m3PUOcXku0D3UlVi1ifK0m/xMxiqm6XRGOWDMaYNEoxgwY1
	n0a3Tuc/N/12ZXHwoJlr8K6+lZ3alUcIXiq8hhxmr4o51zcxYCY3D4CKAQzN7Rf8eMdu
	6jgO/AzCyRyULrRwankqwR9g6h9FcQt/WChQQn9ztsdfTxOExrtQwspqIrFWmVyWFy+x
	uiFbooVYrJaVd5KWNvF9Gfbru61frgx0I6T8H5n60Khi+iEhzPMzhClF3D/ucBoXJvSJ
	Fmu62frfUjSawBuYO++IihV+g6rfIcLec2g4WalkCVqxWJlRwi81L+KTAIRh+D1rIyjx
	KHNQ==
X-Gm-Message-State: AOPr4FVDBH728c7OOx61UQZiKMI0Ibh9yw853TMngE/CE9GqMIemU8eylB6qBNugSwfDv0kWftkAWeXZMP7Ekw==
X-Received: by 10.107.2.70 with SMTP id 67mr5791720ioc.70.1462304058245; Tue,
	03 May 2016 12:34:18 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Tue, 3 May 2016 12:33:58 -0700 (PDT)
In-Reply-To: <CABcZANkwedfVVu2cxREq2Qp2UECdtAfrcgZ5V9LfVPtkR5sjaA@mail.gmail.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
	<9d32811fe04ce49bdc20891453d37819447d7f88.1462191317.git.ed.bartosh@linux.intel.com>
	<CABcZANkwedfVVu2cxREq2Qp2UECdtAfrcgZ5V9LfVPtkR5sjaA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 3 May 2016 19:33:58 +0000
X-Google-Sender-Auth: LHlpBwvm5_WW1CN4mZBwnQvYoLA
Message-ID: <CABcZANnwMhYwjVZwGGqrGERPbZoTrEaJ3P1WhGriG_RT9kUbtg@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 4/6] bmap-tools: generate standalone script
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
X-List-Received-Date: Tue, 03 May 2016 19:34:18 -0000
Content-Type: multipart/alternative; boundary=001a11396814f20ab30531f53106

--001a11396814f20ab30531f53106
Content-Type: text/plain; charset=UTF-8

On Tue, May 3, 2016 at 7:31 PM, Christopher Larson <clarson@kergoth.com>
wrote:

>
>
> On Mon, May 2, 2016 at 12:22 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
> wrote:
>
>> Generated standalone bmaptool script that is more convenient
>> to use than native script. It can be run straight from
>> its location ./tmp/deploy/tools/bmaptool. The script doesn't
>> depend on anything except Python.
>>
>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>>
>
> You're right that this is very handy, but we hit a problem when building
> from shared state. This uses do_deploy to deploy bmaptool into
> DEPLOY_DIR_IMAGE, but IMAGE_DEPENDS only depends on do_populate_sysroot,
> not do_deploy, so an image build from sstate won't write this script out.
>
> I don't know the right way to fix this, but it's a problem. I just ran
> into it :)
>

Also, the convention is to add do_deploy before do_build, not before
do_package, otherwise do_deploy's checksum is included int he checksums of
do_package and subsequent tasks, even though its output isn't used by any
subsequent tasks.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11396814f20ab30531f53106
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 3, 2016 at 7:31 PM, Christopher Larson <span dir=3D"ltr">&l=
t;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=
=3D"">On Mon, May 2, 2016 at 12:22 PM, Ed Bartosh <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@lin=
ux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Genera=
ted standalone bmaptool script that is more convenient<br>
to use than native script. It can be run straight from<br>
its location ./tmp/deploy/tools/bmaptool. The script doesn&#39;t<br>
depend on anything except Python.<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
 target=3D"_blank">ed.bartosh@linux.intel.com</a>&gt;<br></blockquote><div>=
<br></div></span><div>You&#39;re right that this is very handy, but we hit =
a problem when building from shared state. This uses do_deploy to deploy bm=
aptool into DEPLOY_DIR_IMAGE, but IMAGE_DEPENDS only depends on do_populate=
_sysroot, not do_deploy, so an image build from sstate won&#39;t write this=
 script out.</div><div><br></div><div>I don&#39;t know the right way to fix=
 this, but it&#39;s a problem. I just ran into it :)</div></div></div></div=
></blockquote><div><br></div><div>Also, the convention is to add do_deploy =
before do_build, not before do_package, otherwise do_deploy&#39;s checksum =
is included int he checksums of do_package and subsequent tasks, even thoug=
h its output isn&#39;t used by any subsequent tasks.=C2=A0</div></div>-- <b=
r><div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth d=
ot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib=
<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11396814f20ab30531f53106--
