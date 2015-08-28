Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 47BFC71633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 20:39:37 +0000 (UTC)
Received: by qgj62 with SMTP id 62so36465560qgj.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 13:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SFg4ycoHzbWwe99UndU65e7QIK+FEzrNDCpiSNJZVQ4=;
	b=cBSEosYZu7U3vMDXhlFuQX3KtU+QkoOmaZaXqLsbzElCdhnS0huMG24YO/ssZ7d783
	GFyBGNw9OVgRyUoNq7+F7nmqJ7jFdP5rkhKcOeceoPYu58/mbcG6YIN59/bxskPcd7rY
	CyOT1SjeUCi26pN7IxfUr0qKi+COw13gaeEOwkMP8CYswDqlgn4gt5ZX/aK/WxteraN+
	MHNPlrTuL/2VO68KfB3RLt3NFHLGqutYvPhMLhDHKTQnUC3geNayNgh9kT4nqg3VLZVC
	so/XzkmabiNDOUZP7t3YdrW59PthnpA9nncle/uIzr5PdAzr0UF1zNb0wEIZMY72bK5X
	i2Fw==
X-Gm-Message-State: ALoCoQmiFV8Q7yVLWSU1GhaZhVj0DdaQms16PcPXDz9lr0Zqs826/r0ts3biGreSptsA5B1aboE/
X-Received: by 10.140.148.8 with SMTP id 8mr20174845qhu.66.1440794377967; Fri,
	28 Aug 2015 13:39:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Fri, 28 Aug 2015 13:39:18 -0700 (PDT)
In-Reply-To: <1440604110-4306-2-git-send-email-nicolas.dechesne@linaro.org>
References: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
	<1440604110-4306-2-git-send-email-nicolas.dechesne@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Aug 2015 21:39:18 +0100
Message-ID: <CAJTo0LYdwRnzLUr9egN1JSj+G8iWKmeaTyghh4amBXcBs0-Uhg@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/2] android-tools: import android-tools from meta-smartphone into oe-core
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
X-List-Received-Date: Fri, 28 Aug 2015 20:39:42 -0000
Content-Type: multipart/alternative; boundary=001a1135535017f245051e65155c

--001a1135535017f245051e65155c
Content-Type: text/plain; charset=UTF-8

On 26 August 2015 at 16:48, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> The main idea is to keep only what is strictly needed for make_ext4fs tool.
>

Assuming that make_ext4fs is a tool to create an ext4 file system, what's
the difference between that and our mke2fs which is used to create ext4
file systems?

Ross

--001a1135535017f245051e65155c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 August 2015 at 16:48, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=
=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@=
linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":5hg" class=3D"a3s" style=3D"overflow:hidden">The main idea is to keep =
only what is strictly needed for make_ext4fs tool.<br></div></blockquote></=
div><br>Assuming that make_ext4fs is a tool to create an ext4 file system, =
what&#39;s the difference between that and our mke2fs which is used to crea=
te ext4 file systems?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a1135535017f245051e65155c--
