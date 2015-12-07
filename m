Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id D684A60124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 16:28:27 +0000 (UTC)
Received: by igcmv3 with SMTP id mv3so82121014igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 08:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=wM9PdEung9Yxo8S2hcxAd5CVARPRAL9yyFW/0K6i1W4=;
	b=UmbcUzC6ocM2Z3sakEAlpW552ncXB2nMOiYcJbHSBS5NY43V5167eVJyrbfR1Ai7NV
	edO6ksbP3LfaBihpvGFNZA3bmXQHtNzvUoIAj0N9KNMIfjG2AAoobCR3/a9eQn24ZyBM
	YGTD4k/1NC1X5PaPx3/2Wc2UvAafJsRC82zInxxPjgtbZ12sPQeJrOzB3Cg0iH9bp6hq
	BuUlPlEZYkXXIJMymwbRP2Vf6gtROfu5bPs5H2+L+5LKdeBESHa1TM17ViH+qKy08ErO
	UcBkvgP2N2n5s5sefVhuPQhUNNnZpmt2MZI7qlxlmRRB6JF3/cTsjV3FesaDrmvB03GQ
	yiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wM9PdEung9Yxo8S2hcxAd5CVARPRAL9yyFW/0K6i1W4=;
	b=eOb0zAaHWr6bfd/RjP8GEdstOF+3AxtrtIIJCMO+wX58L+ok1S7yVAmlmbFOtHEQio
	EJr7oVldHg3InWxJ7sN13qdgA58uzU3+3pRVaXm66APMIU1IiRZLtJ4BQGbxZ6Te2AND
	0+bftalOHMwWZ6fvw83BjYxnnXF25e0A4AkjdMkM3+9yM/q/WTEvRUhPLxPNhzrcd/Fb
	jrk0l7hOnQzP4rzY31mm/fD8SE9pD7vsGiwGOQHxmKsHlcdkrjeZFasKHUOZKIbY+IiQ
	LSsGlT3bYJv3y4PgO6h2qafa+Dj2ipkYy/jN+zKTTXiAaNwG/o876N/Ise1cb+U6hE0M
	aU6g==
X-Gm-Message-State: ALoCoQl0N6I7oARfmTZph+XHfIa1PdaJ0hAryKqPqv/Dq9+e3i/nTYGRL2m612DKREinef0P4PNgUb1wD6b3PBNFL/MLymaDUHpxmsp7clKSpGine3+O1Tw=
X-Received: by 10.50.60.2 with SMTP id d2mr16364631igr.52.1449505708025; Mon,
	07 Dec 2015 08:28:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 7 Dec 2015 08:28:08 -0800 (PST)
In-Reply-To: <1447948114-30329-1-git-send-email-otavio@ossystems.com.br>
References: <1447948114-30329-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Dec 2015 16:28:08 +0000
Message-ID: <CAJTo0LZYWxzDwnizQ2vrWL7n0Q4uPnccU-K-umgwYxaRTb7GBg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 1/4] lttng-modules: Upgrade to 2.7 release
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
X-List-Received-Date: Mon, 07 Dec 2015 16:28:28 -0000
Content-Type: multipart/alternative; boundary=047d7b15b117d3d55705265158a9

--047d7b15b117d3d55705265158a9
Content-Type: text/plain; charset=UTF-8

On 19 November 2015 at 15:48, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>

Sorry but this just failed on the AB:

/home/pokybuild/yocto-autobuilder/yocto-worker/ptest-x86/build/build/tmp/work-shared/genericx86/kernel-source/arch/x86/include/asm/unistd.h:15:29:
fatal error: asm/unistd_32.h: No such file or directory
compilation terminated.

(http://errors.yoctoproject.org/Errors/Details/22212/)

Hopefully not an annoying build race!

Ross

--047d7b15b117d3d55705265158a9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 November 2015 at 15:48, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.=
br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex"><div id=3D":2z9" class=3D"" st=
yle=3D"overflow:hidden">Signed-off-by: Otavio Salvador &lt;<a href=3D"mailt=
o:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt;<br>
---<br>
<br>
Changes in v4: None<br>
Changes in v3: None<br>
Changes in v2: None</div></blockquote><div>=C2=A0</div></div></div>Sorry bu=
t this just failed on the AB:<br><br>/home/pokybuild/yocto-autobuilder/yoct=
o-worker/ptest-x86/build/build/tmp/work-shared/genericx86/kernel-source/arc=
h/x86/include/asm/unistd.h:15:29: fatal error: asm/unistd_32.h: No such fil=
e or directory<br>compilation terminated.<br><br>(<a href=3D"http://errors.=
yoctoproject.org/Errors/Details/22212/">http://errors.yoctoproject.org/Erro=
rs/Details/22212/</a>)<div><br></div><div>Hopefully not an annoying build r=
ace!</div><div><br></div><div>Ross</div></div>

--047d7b15b117d3d55705265158a9--
