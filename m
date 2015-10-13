Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id C663A65C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 12:48:46 +0000 (UTC)
Received: by qgez77 with SMTP id z77so12723401qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 05:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=056rmFG7UnYKycO3+9kLrBIKKZEAipb53Ui8fZmKCgU=;
	b=fTBwSihoNUG6glBdahviquUoQWpvjUFuOaZBY3+4/LyWcaC4/95vbfXZMYnQYMQchO
	njSH+bMxtTr/sTUGjv4GoQ3yz3mpTKCtzqKf593k035NA/C6txceo8yqiYJqkaOZBGv2
	4Fpnd5jmAbx3OTXhPE86Galq9AdgDni/OJtC31UuOR6wpOsDPk4nU3oraLlrcpTbz3pl
	EhocA0J/JYJZRaPHkIiMV32ltdxRd1zqtNaCIWFudnV+FOZm6vqDHtvWu0mkNhzjfFif
	k7/x8gaxKC/70YywqqtAEx6ITo/GiqqFEenblBDglWLztemkI7fH5keeA5Zd+43O4Ce1
	KApQ==
X-Gm-Message-State: ALoCoQkOt8zIWYRqZxrEh9Hz1/yhflCjQ3BnudTB3UkNV4u9ZPXXmzsD6rDvKCmZ3DHe9FsyODGO
X-Received: by 10.140.235.147 with SMTP id g141mr39040257qhc.22.1444740526886; 
	Tue, 13 Oct 2015 05:48:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Tue, 13 Oct 2015 05:48:27 -0700 (PDT)
In-Reply-To: <561C66C6.4090408@windriver.com>
References: <1444642535-196919-1-git-send-email-wenzong.fan@windriver.com>
	<1444654455.3844.3.camel@linuxfoundation.org>
	<561C66C6.4090408@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Oct 2015 13:48:27 +0100
Message-ID: <CAJTo0LaXbStAc_CYc2qLrxSbMK6wNfrQuMrUB0JS02Hn16fjxg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bzip2: fix bunzip2 -qt returns 0 for corrupt archives
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
X-List-Received-Date: Tue, 13 Oct 2015 12:48:50 -0000
Content-Type: multipart/alternative; boundary=001a11376e6ee5e6aa0521fbddeb

--001a11376e6ee5e6aa0521fbddeb
Content-Type: text/plain; charset=UTF-8

On 13 October 2015 at 03:04, Robert Yang <liezhi.yang@windriver.com> wrote:

> I wrongly thought that it was right, and we did have several "Backport
> [Debian]"
> in oe-core/meta, should it be a Pending or Pending [Debian], please ?
>

If the Debian bug/patch doesn't refer to an upstream bug, I'd suggest
Pending with a link to the debian bug# if there is one.

Ross

--001a11376e6ee5e6aa0521fbddeb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 October 2015 at 03:04, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":67c" =
class=3D"a3s" style=3D"overflow:hidden">I wrongly thought that it was right=
, and we did have several &quot;Backport [Debian]&quot;<br>
in oe-core/meta, should it be a Pending or Pending [Debian], please ?<br></=
div></blockquote><div><br></div><div>If the Debian bug/patch doesn&#39;t re=
fer to an upstream bug, I&#39;d suggest Pending with a link to the debian b=
ug# if there is one.</div><div><br></div><div>Ross</div></div><br></div></d=
iv>

--001a11376e6ee5e6aa0521fbddeb--
