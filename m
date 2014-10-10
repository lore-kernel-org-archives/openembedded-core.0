Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 304E871861;
	Fri, 10 Oct 2014 11:06:32 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id ij19so2442609vcb.4
	for <multiple recipients>; Fri, 10 Oct 2014 04:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mFx6D4faqzbEhs36nBhroq5SdXye2l5Azbi6Sck4NSY=;
	b=WBTDHczHr+wYlQi2C+UtxP8vSblpZoXQp0QGQzQlOqsezta4f/r0i5MmHtyCBX1DyP
	RPCbufWA8YKRGuQbjRA77HFyZt55oPuxLPRrxJarrIO1fHKqFoDPGKjUfjUKeQRb0Par
	1zHriyz4hnCVNph7kVUolpOEm4+8IXOskb4jnAe2ku2mrtWbssdz4ame132sYRHoANpm
	7bmfcP6DsrImzAIvfylT1JYJQ+hhc0ZfRXcWp0+j1DsDFwtadamB/yzOT+r1DbmTflNt
	s8pHJ5mP5pbB8odH4X8g1Bu2BveakX9sP9yPCitFrJGCp44lU0z84oZOe7BNTMYK1rc5
	rHQQ==
MIME-Version: 1.0
X-Received: by 10.221.21.134 with SMTP id qs6mr28446vcb.72.1412939193017; Fri,
	10 Oct 2014 04:06:33 -0700 (PDT)
Received: by 10.52.171.233 with HTTP; Fri, 10 Oct 2014 04:06:32 -0700 (PDT)
In-Reply-To: <20141010103438.GI12322@jama>
References: <20141010103438.GI12322@jama>
Date: Fri, 10 Oct 2014 13:06:32 +0200
Message-ID: <CALbNGRTymU+trfTQGPiOi27cauA6T1nrKT+Npbhn4HTyVZj2NQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2014-10-10, QA issues
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
X-List-Received-Date: Fri, 10 Oct 2014 11:06:33 -0000
Content-Type: multipart/alternative; boundary=001a1133ac4cb069b905050f8a85

--001a1133ac4cb069b905050f8a85
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 10, 2014 at 12:34 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> lxdm-0.5.0+gitAUTOINC+07fb151a99: lxdm requires /bin/bash, but no
> providers in its RDEPENDS [file-rdeps]
>

This is a false positive: I added bash to RDEPENDS in the last patch. Needs
further investigation...

Andreas

--001a1133ac4cb069b905050f8a85
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Oct 10, 2014 at 12:34 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
lxdm-0.5.0+gitAUTOINC+07fb151a99: lxdm requires /bin/bash, but no providers=
 in its RDEPENDS [file-rdeps]<br></blockquote><div><br>This is a false posi=
tive: I added bash to RDEPENDS in the last patch. Needs further investigati=
on...<br><br></div><div>Andreas<br></div><br></div><br></div></div>

--001a1133ac4cb069b905050f8a85--
