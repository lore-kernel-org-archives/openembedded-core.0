Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id E1AF4606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 15:09:42 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id n8so20310214qaq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 07:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vxPmy+wBqYdlIybYHnu4WTfFD6M9HAOvNvnjcYy13EQ=;
	b=X1bBxodF5t7CF9M6KW8Ss8Yt95CyAttmGzavOaav2wOl6oyafft5UHlz8YYgIn0b2M
	OqStjDJlAi8/vAraRz00Zj1IE/JUngHARvn8BUyAgOLGiqk2xevM6vbmMHuW3MgHXOQ4
	qj5oybNR/lFcMkAetE7LB9i3OONeoDm9Cl4g1zK/36a1chwgxrhK7XApJOUdnYH00Shk
	37JLNR+PZr+XWuAIEh2pKVrcehe9Oi3L8oSW0RGddUshnjnK7GBut9/H1/nec7vhfsSK
	fwd/lqselchmz/0H77WX9Ts6gbfDslJXiTiTxcc6Gt38O10lPZtO/VvRsP6HFOKswWKW
	pVzA==
X-Gm-Message-State: ALoCoQk1JAgNa1ctbEtKrrdPssIpkDr+6sTgH8ucn4qottJ7gP6xE2Yn+jxDFi4MR3VtAJpqUnkd
X-Received: by 10.229.48.132 with SMTP id r4mr13175500qcf.5.1422630583500;
	Fri, 30 Jan 2015 07:09:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 30 Jan 2015 07:09:23 -0800 (PST)
In-Reply-To: <345DD4F0215D4B4CB8356943BA192C9913E976EE@kihagwinex02.int.kistler.com>
References: <345DD4F0215D4B4CB8356943BA192C9913E976EE@kihagwinex02.int.kistler.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 30 Jan 2015 15:09:23 +0000
Message-ID: <CAJTo0LYD0B91NSZ=NC=ZKemczYkkKKQvjnvsmfKqT0tz4C28zQ@mail.gmail.com>
To: Markus Boos <Markus.Boos@kistler.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: run ptest for specific packages or layers
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
X-List-Received-Date: Fri, 30 Jan 2015 15:09:43 -0000
Content-Type: multipart/alternative; boundary=001a1134050c93b7e6050ddffeac

--001a1134050c93b7e6050ddffeac
Content-Type: text/plain; charset=UTF-8

On 30 January 2015 at 13:39, Markus Boos <Markus.Boos@kistler.com> wrote:

> We faced the problem that our image (built with ptest feature) doesn't fit
> into our flash [1].
> I'd like to run the ptest on real hardware cause some packages need the
> mounted FPGA functionality.
>

Don't use ptest-pkgs to pull the tests into the image, but add the ones you
want directly.  Such as:

CORE_IMAGE_EXTRA_INSTALL_append = " ptest-runner myapp-ptest"

Ross

--001a1134050c93b7e6050ddffeac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 January 2015 at 13:39, Markus Boos <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:Markus.Boos@kistler.com" target=3D"_blank">Markus.Boos@kistler.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2go" clas=
s=3D"a3s" style=3D"overflow:hidden">We faced the problem that our image (bu=
ilt with ptest feature) doesn&#39;t fit into our flash [1].<br>
I&#39;d like to run the ptest on real hardware cause some packages need the=
 mounted FPGA functionality.</div></blockquote><div><br></div><div>Don&#39;=
t use ptest-pkgs to pull the tests into the image, but add the ones you wan=
t directly.=C2=A0 Such as:</div><div><br></div><div>CORE_IMAGE_EXTRA_INSTAL=
L_append =3D &quot; ptest-runner myapp-ptest&quot;</div><div><br></div><div=
>Ross=C2=A0<br></div></div></div></div>

--001a1134050c93b7e6050ddffeac--
