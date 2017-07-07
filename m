Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id CB15565C5B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 10:13:11 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id 32so23173768qtv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jul 2017 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uWqOuIC7ErLdlEdpafApkaGHUN4uuu78XFYJSbLz2lQ=;
	b=uWfzXRUGfvMyNR/xoKHqhs4QACYILW0km+u9EA60gmSqx3tTMNJodRJfqGNrfFBx6V
	0L9lwYQjp0pf54biQoczoxE9M5wbpgICDwV3jG37+HEtMn0oTGSDatzcnmgaUJLktFMo
	MH45cVNKYaUMGYchzPOvffcNsDfuMJ9+ua4w+YFtCFXMUYQzufg/XR9pM1MxmYOpYSPl
	IA1y3haf9Y2xOpMPCzJvMnufZdoEuliMXuWF2NT45EM4jUCr9+3VTv2n0tl5eGSApZI2
	+L4denVQGHL9mhXOhzm6lhkJ7K8QVo8YEwiv8cKQYraafFr1J04cW9sxe3VLTwR5Chfn
	2aFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uWqOuIC7ErLdlEdpafApkaGHUN4uuu78XFYJSbLz2lQ=;
	b=GVHXH3yyOqNCt1aDtQZF7xVUIe5/A3KrV5QSdVkj0OLgkcODqzZ5KBj8ylPMFG80uT
	oboJdwYzzTa45DAFKFKOg9ElpnkQMevEkjr0tiaJzZpC+3bNhr8xiXCRi5lUn0BGIrJn
	p5AtrijvL5XlCBlrWuSARhEA6H7ejaQ1BbmSvnfATCNF+d526jNxzDGC4L2KKtoL4A3o
	Pl8Y+69DCj06CC40d+GRwJeBR0noqOu2ToNrB2Lf5nKkHS8YWbSsIKGJ6/u1OHKgHXNr
	OJgbLa5dbpb+okFSffIuJJXcwSuxImhL4mZWGhQga77SREDSYwCaYf699dAHwKpojRDn
	Lgmg==
X-Gm-Message-State: AKS2vOzs12L85HSOAWkbBSTQmxIYYIy8dIYuvsR6EESdwomDevmihNCk
	5v92O5RKaoQBY7xfKrq1gsERVOPDCzLR
X-Received: by 10.237.49.41 with SMTP id 38mr64573481qtg.161.1499422392820;
	Fri, 07 Jul 2017 03:13:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Fri, 7 Jul 2017 03:12:52 -0700 (PDT)
In-Reply-To: <20170706182313.18992-1-msm-oss@mcclintock.net>
References: <20170706182313.18992-1-msm-oss@mcclintock.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Jul 2017 11:12:52 +0100
Message-ID: <CAJTo0LbZBbqVuD1OfFkPmWkMVc-gGWPYTSXKR3fJPTGBr8e-8g@mail.gmail.com>
To: Matthew McClintock <msm-oss@mcclintock.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: add workaround patch for missing python dev
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
X-List-Received-Date: Fri, 07 Jul 2017 10:13:12 -0000
Content-Type: multipart/alternative; boundary="94eb2c0c955c17bdea0553b77b65"

--94eb2c0c955c17bdea0553b77b65
Content-Type: text/plain; charset="UTF-8"

On 6 July 2017 at 19:23, Matthew McClintock <msm-oss@mcclintock.net> wrote:

> +Upstream-Status: Pending
>

Inappropriate, surely?

Ross

--94eb2c0c955c17bdea0553b77b65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 July 2017 at 19:23, Matthew McClintock <span dir=3D"ltr">&lt;<a href=
=3D"mailto:msm-oss@mcclintock.net" target=3D"_blank">msm-oss@mcclintock.net=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":39j" c=
lass=3D"a3s aXjCH m15d1924a23e0954e">+Upstream-Status: Pending<div class=3D=
"yj6qo ajU"><div id=3D":3yt" class=3D"ajR" tabindex=3D"0"></div></div></div=
></blockquote></div><br>Inappropriate, surely?</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0c955c17bdea0553b77b65--
