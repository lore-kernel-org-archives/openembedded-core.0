Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3A17577AB3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 13:14:22 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id n4so9510159qte.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 May 2017 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M5OsTESnTyTCzmKtV5PURsAfrzh9gN0oDdJ+O5LsllM=;
	b=meSKSrWT3d0VrxMI9ebGFDt5v6nXUUNBLijxeNUHmrQwjsshP51VPua4IypbybduhB
	lORezvJYYuICXoU4gG5WwjNFykHtMMGE3TwVzHCRRfzipCyU66fT9Vx6qWThzt6V2B8C
	wOB6QFj8C3WpY5pWF97cN7xeDCn+IFiXQSKCKiYCic8TjT3urjjJh6s9CKVPZvc5XZC6
	BNQSbkjTz16dfO+GLqAJMPtoC42rfJe1o2NGSJTxNmk8gAzhwDF01tis7zWsUcbxiswt
	ibMnLv1gDgcYTwMRJXcM375ykmaDU1eLmJVSsPgPHaIWLwcXCDDt+aR4gYZuqj4/zvNX
	+cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M5OsTESnTyTCzmKtV5PURsAfrzh9gN0oDdJ+O5LsllM=;
	b=K0q4fpawtiWfmLbu15jwNHiVlvftLL8LUZe5m/bqMIno3ms0QLFmgijO2WQjwmyeal
	CkY4FSuWTceZ1SB6YFmacAg3TNHuRh20nAJmpKGD5i/RUjyXYiP/aC5rie70ifPBc0IA
	jgVk8spcc+IPqx8+gBYlqBPxPucu40/zsxC878ZYvcWS7+uFh8sL8x0mOPgejOOTJjW5
	TUvRIZK8Gc5iuvY3NKEYJOKHtXRcCESGI/9hmEnWhXLnVADso1oD4Rhv4CZY0oNszb/0
	9rB3cHzdt0kRcvJtB2AtIIitHraP5A9VfOSZEC2QDOABfzsR/6eqAipPlYEdWrffzu5I
	auuw==
X-Gm-Message-State: AN3rC/754WQKhf2WTja2Ua82l9uhg2yLx/aC+7u0GfSH3eQfox+l5ODi
	xpflwSY9Hqfm63brF+MOYUdmIOSg4QcEawk=
X-Received: by 10.200.41.108 with SMTP id z41mr35177246qtz.68.1493903663861;
	Thu, 04 May 2017 06:14:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Thu, 4 May 2017 06:14:03 -0700 (PDT)
In-Reply-To: <1491077204-30363-1-git-send-email-akuster808@gmail.com>
References: <1491077204-30363-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 May 2017 14:14:03 +0100
Message-ID: <CAJTo0LZRaHO=t746fXgF5=PpNhxuUqyWTybW8GgtvCyrAG3djA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lz4: update to lastest 1.7.4
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
X-List-Received-Date: Thu, 04 May 2017 13:14:23 -0000
Content-Type: multipart/alternative; boundary=001a11405e8a36ae22054eb28dcb

--001a11405e8a36ae22054eb28dcb
Content-Type: text/plain; charset=UTF-8

On 1 April 2017 at 21:06, Armin Kuster <akuster808@gmail.com> wrote:

> +RDEPENDS_${PN}-ptest += "make python3"
>

Annoying this causes:

packages/corei7-64-poky-linux/lz4/lz4-dev: RRECOMMENDS: added "python3-dev
make-dev"

I wonder if theres a way to filter those out...

Ross

--001a11405e8a36ae22054eb28dcb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 April 2017 at 21:06, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb=
(204,204,204);padding-left:1ex"><div id=3D"gmail-:3qz" class=3D"gmail-a3s g=
mail-aXjCH gmail-m15b2b2152ac4f75e">+RDEPENDS_${PN}-ptest +=3D &quot;make p=
ython3&quot;<br></div></blockquote></div><br></div><div class=3D"gmail_extr=
a">Annoying this causes:</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">packages/corei7-64-poky-linux/lz4/lz4-dev: RRECOMMENDS: =
added &quot;python3-dev make-dev&quot;<br></div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">I wonder if theres a way to filter tho=
se out...</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a11405e8a36ae22054eb28dcb--
