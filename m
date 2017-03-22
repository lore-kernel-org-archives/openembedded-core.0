Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 54F6A71CB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 20:20:14 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id n21so160901764qta.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9NjyqYXs1sDPzqNQt6NEFDF5+xCCoGSBfcOm24T0u4Q=;
	b=rRWx/C6DApg8USdopmiCIJn1+Unv/39i7ag0dEnhNC0IT3uGpZzLjfosP1UdQKmNBP
	wjg/ppJDzYG7vr70lpmJDA4pFZGN64jseBVKel6gvQbzS4gbleBPmpjir2WzwF69BMib
	9D79E2s+kY/eF9hd4tkRZH1VEcKAjbxORMKfgjp79Qc+K6x6iR5S7SDNGXETV394OU+d
	p/84ylWCFOoZKV4bXJCTSOXbYQBgDNL2ME7H66tytdeNuAH98havSSSkpKlD3GebClSu
	VnQD/Z1ZzBPlQfBv72APlB+MbiSGaQ4QR+fRJPjCprkONF7h7dNwpeubFwEJRZTdScgO
	20gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9NjyqYXs1sDPzqNQt6NEFDF5+xCCoGSBfcOm24T0u4Q=;
	b=lyIrvIHZQHcJbJaxzV2Ca8eBIwHRXE49roJqAgLFxwPXBTiX4IVBNet76cFa+D6klH
	2njeVPbw0fOueO9NvczAFCDKJ5+9nRepljYrRKK/bLA1jNHksNyE9Bmx1dh1q8XWkyHr
	v2BOBQE4qeVmS4zdk0c7nTbO+7fvsnf4RhZzz4MHyh4uJewQu+AUPWBsBlnUjGOSkAV7
	GwFSTFXOZANbZ7P/blwN3jdcHCk48yRJuyMP/tqOM3i4ijY5V1mVKtMdI7++GMJj/LIr
	UXcKcVmJuyCNJJHEprLQGFQgk+mjND6UtZK9wrE3ZS9AVg3jyCLi6BINNH3kjVw3YDSe
	1SWw==
X-Gm-Message-State: AFeK/H1TrCs7NRno8zsKrBfbzNsdGX6xHLxabsRmsDMBvbCpw+n22C2e9bzaj7yvBFU2sD4FNvV0Xyv1uK1rMoNo
X-Received: by 10.237.42.164 with SMTP id t33mr42989104qtd.105.1490214016206; 
	Wed, 22 Mar 2017 13:20:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 22 Mar 2017 13:19:55 -0700 (PDT)
In-Reply-To: <1490213829.15509.26.camel@intel.com>
References: <1490056286-13515-1-git-send-email-vedang.patel@intel.com>
	<CAHiDW_FBnKy7Nx_G70zgXvTbJCXMy+uY0d1QUJk-ja3Z-gmw4A@mail.gmail.com>
	<1490213829.15509.26.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Mar 2017 20:19:55 +0000
Message-ID: <CAJTo0LZd1JgF+Zz_-yS5p-HeA1jxrmbxg-G9oP1maVO3rfzfVA@mail.gmail.com>
To: "Patel, Vedang" <vedang.patel@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxslt: Add PACKAGECONFIG support
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
X-List-Received-Date: Wed, 22 Mar 2017 20:20:15 -0000
Content-Type: multipart/alternative; boundary=94eb2c0cfe2213673d054b577d37

--94eb2c0cfe2213673d054b577d37
Content-Type: text/plain; charset=UTF-8

On 22 March 2017 at 20:17, Patel, Vedang <vedang.patel@intel.com> wrote:

> Can you elabore on your concern? I am not exactly following it.
>
> the configs won't be enabled unless the corresponding features are
> explicitly enabled in the image. I am using libxslt- prefix to make sure
> someone does not inadvertently enables the features by using the generic
> flags (python, debug, ... ).
>

No, you're changing the default to enable all the things that were
previously disabled.

Also you don't need to prefix the names as they're recipe-specific already.

I suggest that you re-read the PACKAGECONFIG section in the manual and
resubmit the patch.

Ross

--94eb2c0cfe2213673d054b577d37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2017 at 20:17, Patel, Vedang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:vedang.patel@intel.com" target=3D"_blank">vedang.patel@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><div>Can you elabore on your concern?=
 I am not exactly following it.</div>
<div><br>
</div>
<div>the configs won&#39;t be enabled unless the corresponding features are=
 explicitly enabled in the image. I am using libxslt- prefix to make sure s=
omeone does not inadvertently enables the features by using the generic fla=
gs (python, debug, ... ).=C2=A0</div></blockquote></div><br>No, you&#39;re =
changing the default to enable all the things that were previously disabled=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also=
 you don&#39;t need to prefix the names as they&#39;re recipe-specific alre=
ady.<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">I suggest that you re-read the PACKAGECONFIG section in the manual and r=
esubmit the patch.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--94eb2c0cfe2213673d054b577d37--
