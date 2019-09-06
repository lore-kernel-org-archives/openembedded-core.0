Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
	[209.85.217.46])
	by mail.openembedded.org (Postfix) with ESMTP id CF7127F420
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 20:33:33 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id s3so4901020vsi.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 13:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WxNS5Ayc0L/3R+y5Gl8V8Lw3nQviiM1oEHILASZtWWA=;
	b=hM0EaWMD8B+s1sRRdGTGfKKrBzakQuxLjwgWLkkPkr5ick+TYZ/pkEy+ACgjTz4T5q
	e6XfB4bCp4IBC9RVXHnQo5zkE16Hm+njsoSmEgqkmowO+y57XqcN2SJAq1tBdS7h2b7P
	LEuyXfdpPA43W5PQLagnJluRAF1UeOg5MafmG5zOf3py4zgDYw/rVvk+kaRosJmOmaEo
	9Ui7nxXNfoe7th6++SCA7rb6wIoXjTGvv3LUHyWuAeQd+0pHCET1+p/R4O1M75HpK6gY
	1itovLGBRVE+FxAV6zTwQphQ15EOCY6rsBVOo+rf4kCtcoG6ABb2R+QjPL0eudS+8cPD
	I2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WxNS5Ayc0L/3R+y5Gl8V8Lw3nQviiM1oEHILASZtWWA=;
	b=CbiniHApLCD3shhT7DluxDFbObmSK8iIOftwePx5Ugu2REwiWwYo6VQlHH4s7nlEEK
	mhjpamyLLTCCGUQ/3GASYcpR81O4kVMrafnCjb97Ol9w3y0bIRDnE0qCxtdTIaV2PHKV
	X7IAY+9ZTmzlk9Wlnv8FcsMSPhDpnwuP8V7SXB81LeYmsMjyskEaOhAFAFLnrVEj8/uK
	abt/LuXGqLOOkY0mEEG9/8znQnHbF+IpKiPV4AQ4A3Zz8ZzjZL3djcreulteJgoeO1+m
	iVPjNsEzGG/DCqBykp9xKfrZgxaAlTtc/ywqKhfwqAuR0l472grcKTxeTj+NrGw4FRq+
	J3CQ==
X-Gm-Message-State: APjAAAUL9z6BoyAPYanlLQOtZ4OjFlWD1kCOPDBikqiTB+2N5nMW7p4l
	1MnjQQhmPc1DyG9EyK1pG7qtYuHdERtxLOsFKD0zqNFX
X-Google-Smtp-Source: APXvYqx1AtAqvIXR+Ym4ZgnsDqqG6tHOouk6pFerEOb7c7DascpM/tDtrd3IWVb4QWddABFV1OEDF67T+++1pKhb8ZU=
X-Received: by 2002:a67:1c87:: with SMTP id c129mr6674610vsc.23.1567802014629; 
	Fri, 06 Sep 2019 13:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184727.552-1-fabio.berton@ossystems.com.br>
	<CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
	<CAP9ODKp8Bmss=NcsPYMgCqKAoKDpPSrCKzA7Tm8FoNOM8tSejA@mail.gmail.com>
In-Reply-To: <CAP9ODKp8Bmss=NcsPYMgCqKAoKDpPSrCKzA7Tm8FoNOM8tSejA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Sep 2019 22:33:22 +0200
Message-ID: <CANNYZj-N7zt57Gcbfj=0E-dunRwDQSLUfyQ3cpt=8AFHHjVS-A@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.1 -> 19.1.6
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
X-List-Received-Date: Fri, 06 Sep 2019 20:33:34 -0000
Content-Type: multipart/alternative; boundary="0000000000002906700591e85afa"

--0000000000002906700591e85afa
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Sep 2019 at 22:12, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> > As I had previously suggested... can you try adding 'python3' to DEPENDS
> of mesa, and see if that helps please? I think that would allow avoiding
> this patch altogether.
>
> Why a new build dependency if this works just fine?
>

1. Less patches is always better than more patches, especially if they are
non-upstreamable.

2. The patch reverts to something that meson has deprecated and will likely
remove in the future.
https://github.com/mesonbuild/meson/blob/master/docs/markdown/Python-3-module.md

3. Meson's currently supported way of detecting python does in fact rely on
python's target configuration being available, as it picks up settings from
it. I had fixed a similar issue elsewhere recently.

Alex

--0000000000002906700591e85afa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 6 Sep 2019 at 22:12, Otavio Salva=
dor &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br">otavio.salvador=
@ossystems.com.br</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">&gt; As I had previously sugges=
ted... can you try adding &#39;python3&#39; to DEPENDS of mesa, and see if =
that helps please? I think that would allow avoiding this patch altogether.=
<br>
<br>
Why a new build dependency if this works just fine?<br></blockquote><div><b=
r></div><div>1. Less patches is always better than more patches, especially=
 if they are non-upstreamable. <br></div><div><br></div><div>2. The patch r=
everts to something that meson has deprecated and will likely remove in the=
 future.</div><div><a href=3D"https://github.com/mesonbuild/meson/blob/mast=
er/docs/markdown/Python-3-module.md">https://github.com/mesonbuild/meson/bl=
ob/master/docs/markdown/Python-3-module.md</a></div><div><br></div><div>3. =
Meson&#39;s currently supported way of detecting python does in fact rely o=
n python&#39;s target configuration being available, as it picks up setting=
s from it. I had fixed a similar issue elsewhere recently.<br></div><br><di=
v>Alex<br></div><div><br></div></div></div>

--0000000000002906700591e85afa--
