Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7A35C60962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 20:38:23 +0000 (UTC)
Received: by qgy5 with SMTP id 5so16081178qgy.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 13:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4HObr1k3bQjZtI5sOtDi5QmGuoBR0j2GTXFCzjI4Vb4=;
	b=j7IxxV8Q+/YFyEUQArmUuzU60/MKv41i/eFLHYGRtbqpEfgVEW4xqJgjqLdAwHwakH
	RBUfD6IxH7BXGCztAaixWwVIexbv+eaVS59VLZ/+BB9KyUYnD5Id/dpoN66Hq410pjFC
	vHJxCziwoI2BYN9FnjhfBIxTfpLqEJsogfLj1FCK8Ryw1DU9lADcs/ZNx6OvtuMZD9S6
	smqGNGZd8InNcv0jsMjnSptNhbgklCKpNnfwi45OV/LnzGuI3HCtCo/QG75UtNr1R1aD
	U+V8oQvt3MbjgyE048VxMgVHdBGqepd6+8GPueG1fVmTij5eDanrMYdpc81dmDj67k/R
	Ux9Q==
X-Gm-Message-State: ALoCoQmeKR/ei+jLa1g34rKfILexIDKgaqZUBxYkwKlr0Cb2sUhuej3JiNQWtNKB0WrznGwyAuGG
X-Received: by 10.55.53.193 with SMTP id c184mr22415936qka.62.1437770302934;
	Fri, 24 Jul 2015 13:38:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Fri, 24 Jul 2015 13:38:03 -0700 (PDT)
In-Reply-To: <86afb680d9e913990f23af7091b64efb92195c9a.1437728803.git.Qi.Chen@windriver.com>
References: <cover.1437728803.git.Qi.Chen@windriver.com>
	<86afb680d9e913990f23af7091b64efb92195c9a.1437728803.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Jul 2015 21:38:03 +0100
Message-ID: <CAJTo0LZwyszc0+A1KNMMPNpWzKKi4SUyMmThXEVj8x=m0Xvy0w@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 3/3] sudo: upgrade to 1.8.14p2
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
X-List-Received-Date: Fri, 24 Jul 2015 20:38:28 -0000
Content-Type: multipart/alternative; boundary=001a11476f142ce5aa051ba4fc99

--001a11476f142ce5aa051ba4fc99
Content-Type: text/plain; charset=UTF-8

On 24 July 2015 at 10:08, Chen Qi <Qi.Chen@windriver.com> wrote:

> The licence checksum is modified according to the change of doc/LICENCE.
> In specific, file://lib/util/reallocarray.c is added to LIC_FILES_CHECKSUM.
>

This fails to build in systemd builds and in fixing it I discovered that
there's a p3 released now, which I submitted to the list earlier.

Ross

--001a11476f142ce5aa051ba4fc99
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 July 2015 at 10:08, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:Q=
i.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":315" class=3D"a3s" s=
tyle=3D"overflow:hidden">The licence checksum is modified according to the =
change of doc/LICENCE.<br>
In specific, file://lib/util/reallocarray.c is added to LIC_FILES_CHECKSUM.=
</div></blockquote><div><br></div><div>This fails to build in systemd build=
s and in fixing it I discovered that there&#39;s a p3 released now, which I=
 submitted to the list earlier.</div><div><br></div><div>Ross=C2=A0</div></=
div></div></div>

--001a11476f142ce5aa051ba4fc99--
