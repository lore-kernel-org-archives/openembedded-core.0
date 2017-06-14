Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 42FF07837F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 16:37:41 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id c10so6262992qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 09:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pHlzuZ6C/0VIY+DLZdRvncY8tla4gredjDLpv5sONO0=;
	b=DWBND63+rUUUztc3lv5gpemT3FZhuPFWlvBDWABcgAfjhBaDbWeA3NRmOCee6X7rnt
	LkV6NkPtZ7DinH5gQ2EQhuK+D+iKwI546yZ77H3gr0B7Vy+FHLeeGGszA4fCATH0vPAt
	JH0Twhl0t5PSMz5HBnEbcOXeK+TfxklbsNXQE5AltNFOwqB1q950su2In9RhPogC/FzS
	ekCrmOD6oGftaozGPDBtxhqwLUMCyD3ulsuSyR5ijWPxMx9bsOlcYI2cfZ4g2OR2Y2wT
	Pi1XkHV8Yo5F1BG8jM41vyZ1U2EWVLCbnO++58lSVhQn4iSbBQkOOHEItKcVpD32GS4n
	fdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pHlzuZ6C/0VIY+DLZdRvncY8tla4gredjDLpv5sONO0=;
	b=EwB+mrQLIw+YHl//KUi/mr1+T3vqfCcJA8VDX7QGUaVvRxsVWtLZGKLqqAyf5B1Esp
	7zodMGSFXwJ8fRnG30icFtfa6x8h9Wky2i8hpvkaFiWCGITJjDSfsNkaXplXDo1LP1Qe
	w/G9Pz8iEg+4JaQhSl17uT3qZXkQ54ohch5iSTrBk/atpe3YJxbBJ9mo8R0+wWxtseCr
	BiEd1NPa1CfhxpcXPmgYvFDo9PCVraYH8fci2OBPHQrPdeYl4kAjo6EmrhMMn+XuFEqF
	6g/xoE4pfzChoutcvcpbneaMFsxt4OaoNIBvgst3e0e0MEax3tU7cECtRQXghxiAHjQE
	acLA==
X-Gm-Message-State: AKS2vOxPQS6OPIohIFxiCfz9IDed3XDKdnWL2tsKazCNtboab872rmmS
	/IBxGvsgGpv+2ikuo0iWXxgFvX2/MUZ6
X-Received: by 10.200.43.105 with SMTP id 38mr1257914qtv.6.1497458262757; Wed,
	14 Jun 2017 09:37:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Wed, 14 Jun 2017 09:37:22 -0700 (PDT)
In-Reply-To: <1497454006-13902-2-git-send-email-andrej.valek@siemens.com>
References: <1497454006-13902-1-git-send-email-andrej.valek@siemens.com>
	<1497454006-13902-2-git-send-email-andrej.valek@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Jun 2017 17:37:22 +0100
Message-ID: <CAJTo0La7MwgAzsGK-vMWLpS4SP-US0CY3XvvmEgnKEi1hfPNvQ@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] libxml2-2.9.4: Disable LeakSanitizer when running API testsFix CVE-2016-4658
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
X-List-Received-Date: Wed, 14 Jun 2017 16:37:42 -0000
Content-Type: multipart/alternative; boundary="001a113d00a6d169560551ee2b58"

--001a113d00a6d169560551ee2b58
Content-Type: text/plain; charset="UTF-8"

On 14 June 2017 at 16:26, Andrej Valek <andrej.valek@siemens.com> wrote:

> CVE: -
>

If there's no CVE, please don't set the tag.

Also:

Applying: libxml2-2.9.4: Disable LeakSanitizer when running API testsFix
CVE-2016-4658
error: cannot convert from y to UTF-8
fatal: could not parse patch

When it asked you what encoding to use, you pressed 'y' (I've lost count
the number of times I've done this).  Can you resend the series with UTF-8?

Ross

--001a113d00a6d169560551ee2b58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 June 2017 at 16:26, Andrej Valek <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:andrej.valek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-c=
olor:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:1kd" class=3D"gma=
il-a3s gmail-aXjCH gmail-m15ca737bbd8c47ce">CVE: -<br></div></blockquote></=
div><br>If there&#39;s no CVE, please don&#39;t set the tag.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also:</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_=
extra">Applying: libxml2-2.9.4: Disable LeakSanitizer when running API test=
sFix CVE-2016-4658</div><div class=3D"gmail_extra">error: cannot convert fr=
om y to UTF-8</div><div class=3D"gmail_extra">fatal: could not parse patch<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">When i=
t asked you what encoding to use, you pressed &#39;y&#39; (I&#39;ve lost co=
unt the number of times I&#39;ve done this).=C2=A0 Can you resend the serie=
s with UTF-8?</div><div class=3D"gmail_extra"><br></div></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a113d00a6d169560551ee2b58--
