Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7FFB765CF5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 17:20:48 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id f51so9924216qge.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jan 2015 09:20:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hsibykZ3l2chbntOJfC7CAJkHx1afmKPt1uWTmY5fUE=;
	b=cSH600ADJwMv7hXNUZKmFoS6Vtp/PR3EVKOdsqov4VNsBhFwof9KG+DiBRzVIHbKgn
	QWqNmR3ztU/RN5Yd2dhqJF7TvNeuXAwT7lnNVomIpihQ/j8j0icXKNi2fx680gIgOhex
	xnOUpbUuJKV/PEYbg6oK7RYSY7hMtsiuBuDAy6wJScclT29Cfz9IaOKFQanqSV+ds5+V
	fa1UPKeKt03HYFzE6BSp8P/aBPdBAD4qVDbEWoj5bs3vmd8/VkbnWLXYtiRNZOESHO/1
	8g7L4wT9vk0V853mmVJzamzv2eWYaXnh4L+vpFvBn3VHA6/QzjBy1gxj0gLVWt+FALSV
	PUkg==
X-Gm-Message-State: ALoCoQkbaCrlIQa59Le2YGLtp5Qn0jx6Z2GTnQMzKuIGdQypf35s+N8wuzLkSL8Mbp/GDB+8RJ1U
X-Received: by 10.224.92.205 with SMTP id s13mr28785874qam.52.1420824049176;
	Fri, 09 Jan 2015 09:20:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 9 Jan 2015 09:20:28 -0800 (PST)
In-Reply-To: <65b1798d9384b162e2aba3dc77cfc7e98ce1519d.1420781433.git.liezhi.yang@windriver.com>
References: <cover.1420781433.git.liezhi.yang@windriver.com>
	<65b1798d9384b162e2aba3dc77cfc7e98ce1519d.1420781433.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Jan 2015 17:20:28 +0000
Message-ID: <CAJTo0LbxRcAj-LEsaYGefk8AyF_MpwzNFznzvx3x07E7A9wyVA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gnu-efi: upgrade to 3.0.1
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
X-List-Received-Date: Fri, 09 Jan 2015 17:20:52 -0000
Content-Type: multipart/alternative; boundary=089e015375e4bd6923050c3b60c3

--089e015375e4bd6923050c3b60c3
Content-Type: text/plain; charset=UTF-8

Hi Robert,

On 9 January 2015 at 05:33, Robert Yang <liezhi.yang@windriver.com> wrote:

> diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
> b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb
> similarity index 100%
> rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
> rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb
>

You failed to update the SRC_URI and checksums.  :)

Ross

--089e015375e4bd6923050c3b60c3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Robert,</div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On 9 January 2015 at 05:33, Robe=
rt Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" =
target=3D"_blank">liezhi.yang@windriver.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div id=3D":bm2" class=3D"a3s" style=3D"overflow:h=
idden">diff --git a/meta/recipes-bsp/gnu-efi/<a href=3D"http://gnu-efi_3.0u=
.bb" target=3D"_blank">gnu-efi_3.0u.bb</a> b/meta/recipes-bsp/gnu-efi/<a hr=
ef=3D"http://gnu-efi_3.0.1.bb" target=3D"_blank">gnu-efi_3.0.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/gnu-efi/<a href=3D"http://gnu-efi_3.0u.bb" tar=
get=3D"_blank">gnu-efi_3.0u.bb</a><br>
rename to meta/recipes-bsp/gnu-efi/<a href=3D"http://gnu-efi_3.0.1.bb" targ=
et=3D"_blank">gnu-efi_3.0.1.bb</a></div></blockquote><div><br></div><div>Yo=
u failed to update the SRC_URI and checksums. =C2=A0:)</div><div><br></div>=
<div>Ross=C2=A0</div></div></div></div>

--089e015375e4bd6923050c3b60c3--
