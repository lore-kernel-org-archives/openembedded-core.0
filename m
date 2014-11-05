Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id A3CDB70F3B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 15:10:10 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id j7so603704qaq.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Nov 2014 07:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LfQzqPgBKAnf006LRtDA/L8HTUESe9/QtOOnGnPO2po=;
	b=S4IOugLPwrYTLlJe46MgOUMQU7R5IarZulRtnBit0gsi4DO1vpuuQ9F88DJtiiXufC
	fSG4fZXwtB+qKuULr6bkOMieTTzAIzxK3HdARG1CazbZPawu/uUDV17QvBXSOch2pLC8
	iV2JBqTGKQRfIFBVjxTev8fWpbqXRxrdpG5Rp4TfGa2pDczrON76FwCWFvB+BMUyUZdy
	kpXFuIVw8wo8Vi4fq5sQRYdj4PJyZRmzqLSeSnozK3aa5HcmXmLI3XRfxMCSXBjTnbFs
	I0erMipFYqDIkg4jVkWMlY+g0VWTaaoZ/rvqiuiGEmXyraV8UV+QdoSHtuQV/Rkp2lZA
	ZU8A==
X-Gm-Message-State: ALoCoQkXhlKoPLrFTqKz+xaKRAlIEv+Y7K2I30SPqg889ZBI+MR96bVLiNvYI4ra0Gbg/ibNcgK2
X-Received: by 10.224.28.193 with SMTP id n1mr58831940qac.93.1415200211384;
	Wed, 05 Nov 2014 07:10:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Wed, 5 Nov 2014 07:09:51 -0800 (PST)
In-Reply-To: <CAJTo0Law3iWz=+A1vA7QsikNozeVP7U49=+T9fkT7YgLzJ_hcA@mail.gmail.com>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0Law3iWz=+A1vA7QsikNozeVP7U49=+T9fkT7YgLzJ_hcA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Nov 2014 15:09:51 +0000
Message-ID: <CAJTo0LZf2oHEnMj2j5mf=wENbuxcN+ya8oS3WZLSt3O=w_O07w@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to version 2014.07
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
X-List-Received-Date: Wed, 05 Nov 2014 15:10:13 -0000
Content-Type: multipart/alternative; boundary=001a11c2ca30e2ed3405071df9d1

--001a11c2ca30e2ed3405071df9d1
Content-Type: text/plain; charset=UTF-8

On 5 November 2014 14:56, Burton, Ross <ross.burton@intel.com> wrote:

> | scripts/basic/fixdep: 1: scripts/basic/fixdep: Syntax error: word
> unexpected (expecting ")")
>

The autobuilder failed with a more obvious error (and also has more logs
available if required):

| /bin/sh: scripts/basic/fixdep:
/opt/poky/1.7/sysroots/i686-pokysdk-linux/lib/ld-linux.so.2: bad ELF
interpreter: No such file or directory

https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/87/steps/BuildImages_3/logs/stdio

Ross

--001a11c2ca30e2ed3405071df9d1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 November 2014 14:56, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><div><div>| scripts/basic/fixdep: 1: scri=
pts/basic/fixdep: Syntax error: word unexpected (expecting &quot;)&quot;)</=
div></div><div></div></blockquote></div><br>The autobuilder failed with a m=
ore obvious error (and also has more logs available if required):</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"g=
mail_extra">| /bin/sh: scripts/basic/fixdep: /opt/poky/1.7/sysroots/i686-po=
kysdk-linux/lib/ld-linux.so.2: bad ELF interpreter: No such file or directo=
ry</div><div><br></div><div><a href=3D"https://autobuilder.yoctoproject.org=
/main/builders/nightly-multilib/builds/87/steps/BuildImages_3/logs/stdio">h=
ttps://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/8=
7/steps/BuildImages_3/logs/stdio</a><br></div><div><br></div><div>Ross</div=
></div></div>

--001a11c2ca30e2ed3405071df9d1--
