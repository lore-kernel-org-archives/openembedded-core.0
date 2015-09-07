Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id A390C7422C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 14:18:29 +0000 (UTC)
Received: by qgev79 with SMTP id v79so62880751qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Sep 2015 07:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2jW2690mj7ttapdS8aIZ19SoFcpH46IlnQjS2SnWzFc=;
	b=mdW5YSP46ftPkazrlqOloHf8V0FMNB6x3lNZGV4VWBCLnz/fYH21E6TG/91lNe0f7R
	WCG7F8B0OCdAi/rkq4NMhyS3TvUV7T6Z239sQnd4UKES9aKY8nMnU736aZ5XrQVGhk2O
	XIX8wjKFmqRHlPSzSXEAiPPagRVeoJP7Dq7V1ecdZjZLt6x60owxDmfp/u5LFmiDRaRV
	5aDTRnIaEYTo6BackxNNRD+91PzAPBe6StI2wM1JmlI3DUEXqR9jKugM35GSM+yB1yIO
	KV6iIa5xK39hjaEP0+UzTNJ2W/pUpSQ9LJwhTZxD3YTih9Pmpc8uMnO2+hVUyRbzVt6L
	3Xxw==
X-Gm-Message-State: ALoCoQkbgY0SEWp5GZ2SXEOqVso3q5AP8Bhv4SQH1Rq6m8Cv1iCkmMrZx3S/Ui7prdKJ2ywOk0eV
X-Received: by 10.140.30.138 with SMTP id d10mr26979878qgd.80.1441635509185;
	Mon, 07 Sep 2015 07:18:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 7 Sep 2015 07:18:09 -0700 (PDT)
In-Reply-To: <1441635313.22688.40.camel@pbcl.net>
References: <1441592391-108731-1-git-send-email-wenzong.fan@windriver.com>
	<CAJTo0LYt6Qd0OGqZgGKAtxpKuq9Cr2SUr42=vNa67+zPsUebYg@mail.gmail.com>
	<1441635313.22688.40.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Sep 2015 15:18:09 +0100
Message-ID: <CAJTo0LZE0uwtmS3+k5PXHrDrAHOWERNnJt_v9T4+WvAT=vMx_Q@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnu-efi: Make setjmp.S portable to ARM
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
X-List-Received-Date: Mon, 07 Sep 2015 14:18:30 -0000
Content-Type: multipart/alternative; boundary=001a113a9e7c6be214051f28ec49

--001a113a9e7c6be214051f28ec49
Content-Type: text/plain; charset=UTF-8

On 7 September 2015 at 15:15, Phil Blundell <pb@pbcl.net> wrote:

> Surely the ARM assembly code would never have worked on x86 anyway.  It's
> a bit of a mystery how the original code ever worked for anyone on ARM,
> given that binutils has behaved this way for nearly 20 years, but this
> patch does seem like an improvement.
>

Ah I failed to read the patch correctly and thought this was in some magic
arch-agnostic assembler file.  Yeah god knows how this ever worked :)

Ross

--001a113a9e7c6be214051f28ec49
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 September 2015 at 15:15, Phil Blundell <span dir=3D"ltr">&lt;<a href=
=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div>Surely the ARM assembly code would =
never have worked on x86 anyway.=C2=A0 It&#39;s a bit of a mystery how the =
original code ever worked for anyone on ARM, given that binutils has behave=
d this way for nearly 20 years, but this patch does seem like an improvemen=
t.<br></div></blockquote></div><br>Ah I failed to read the patch correctly =
and thought this was in some magic arch-agnostic assembler file.=C2=A0 Yeah=
 god knows how this ever worked :)</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a113a9e7c6be214051f28ec49--
