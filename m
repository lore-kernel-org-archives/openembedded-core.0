Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7518673F87
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 15:02:35 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so187779572qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 08:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Qytweppa++6vAu5nxyZ6gUpSmJar6h3NIt4WQhevj3Q=;
	b=E2csYERgLl7hJh6w6L1LSCk8iIAYW+JGVDVkPa7xcCF8b/z0HkYbZWA/pG/5pfXNOy
	2koWsCnCFNrMi8eFfYQI1t+4Clo2SNTJGXGbK95iIEk3sgYw1jdOSVuYj4YleMn2bWnE
	wktyTCwiEnBTrMCcuHqE6gj8CEWL168chfNwIem8M7Bzrz4avMrUx+sdh+zhIm77upSJ
	Wxn4fxsI4KItxLLenFs9f7tUgnqaAxGDwqPpLHbKNCi2j6/QN97mgthXryPls3UalvCr
	Vs2kjNXP8b7wOXTF6pn+M71ANfIxBkn/49L0vIEVqDiIVk3EV/pQ/Hok6hXryy9oK7l3
	KA4g==
X-Gm-Message-State: ALoCoQmNXoR33PLb+8jDkZBWaoCCv20y+cI3AVpI83YSp/x4r0FK1WusYDhfE7Q69B9X0S0/HF0a
X-Received: by 10.55.15.129 with SMTP id 1mr25043416qkp.29.1436454154051; Thu,
	09 Jul 2015 08:02:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 9 Jul 2015 08:02:14 -0700 (PDT)
In-Reply-To: <559E8BC3.2060300@gmail.com>
References: <2219152.1ss8pFxefq@peggleto-mobl.ger.corp.intel.com>
	<559E8BC3.2060300@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jul 2015 16:02:14 +0100
Message-ID: <CAJTo0Lbgx2chtAA+AuHgsTBvrV50wRgdqsJCZxG7tW=6ZBMPyQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: libav vs. ffmpeg, redux
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
X-List-Received-Date: Thu, 09 Jul 2015 15:02:38 -0000
Content-Type: multipart/alternative; boundary=001a1146f10096b652051a728bf6

--001a1146f10096b652051a728bf6
Content-Type: text/plain; charset=UTF-8

On 9 July 2015 at 15:57, akuster808 <akuster808@gmail.com> wrote:

> That make sense to me. Also libav has LICENSE_FLAGS = "commercial" so the
> change which will simplify things too.
>

Why isn't that the case for ffmpeg too?

Ross

--001a1146f10096b652051a728bf6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 July 2015 at 15:57, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailto=
:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":3bi" class=3D"a3s" s=
tyle=3D"overflow:hidden">That make sense to me. Also libav has LICENSE_FLAG=
S =3D &quot;commercial&quot; so the change which will simplify things too.<=
br></div></blockquote></div><br>Why isn&#39;t that the case for ffmpeg too?=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a1146f10096b652051a728bf6--
