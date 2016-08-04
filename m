Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9460F76809
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 14:39:48 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id b62so272658441iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2016 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AyNuaZdGRWrA+Iwp2iqX0HhFccUIl4sOWNfeF6cORVw=;
	b=ijAhSgFzYtuk9LZXnViSLbCIZIFUiaL36KZVietOXRt+UcPwdfnp1GSEbxZB/ajVAQ
	3CAxS2X91NKi0iWOwN8eR2OR+UQgMFM5/2V7Wj3ErNI1Hc/kYHHR3he4b9J8b80Qd6op
	BHY/lKI3A0CcxhJOizhxXPs/pc8sCnKbjNneQRApJaBWSuCyK+k3yrKvdsBjpbvxKwYl
	luAm3ky3vH7RmSuFCozXznjSVHmYKb24fGZWnJtibTRqKrlcAu1ZSRXe3nsprbIe/RTW
	0ZmS3Ln1PIc2tkLWyrsk299B5rf22FhReTlk+T0lUx/eCICo2szh+HkqguTPU4+P8lWf
	wVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AyNuaZdGRWrA+Iwp2iqX0HhFccUIl4sOWNfeF6cORVw=;
	b=UwR0EPsYxxa2sgL9QXQu+vBr+YBXy+JmpfpVoKwxjWTlDGYYprVRHKZ/9+oYEcZbLa
	FdBiGf8jX3z0TWtf6AuCIbtpydUC9LRkheF833qfAziYkK/eRssgRWSCm7FffYJeiV2T
	PRB0Sb4Z79OvSWbUcTPox8f6Og2mGD3oTKA7a+vEiEGSMGYgjg+c6aGuKbAylL483PTh
	drtrs5znUbHWg9uawlPq++ugT8Us9mvzdYhojo6KaBPlztxEjv1fj3ilqVTCsBDy3vPd
	2MHDeaMQ3AhXyiCx3nnFsVR4S8+MkkTfsFNDBbxHAZyq8ObivmMiYmsPcdN9Mx7lDzxi
	SWpQ==
X-Gm-Message-State: AEkoouuO6Ryi1R0Ne04ECCNBPEAkzdxvCrdyZ2daE2FHhLOvJAUBAO8VeKX5r4SHVuOqx8PSjIcoYPzCW+ewzCnV
X-Received: by 10.107.138.212 with SMTP id c81mr71236378ioj.148.1470321588859; 
	Thu, 04 Aug 2016 07:39:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 4 Aug 2016 07:39:28 -0700 (PDT)
In-Reply-To: <20160804143423.a6fyiopqmt6abcq7@jama>
References: <20160801104924.10815.18743@opal.openembedded.org>
	<20160801104927.C930350170@opal.openembedded.org>
	<20160804143423.a6fyiopqmt6abcq7@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Aug 2016 15:39:28 +0100
Message-ID: <CAJTo0LbC0CObxR+5WVOAHqZf0Hd4jztBUcdNZP_tOjX9zctpHQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 11/43: libtasn1: upgrade to 4.9
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
X-List-Received-Date: Thu, 04 Aug 2016 14:39:48 -0000
Content-Type: multipart/alternative; boundary=001a113ed932028c4405393fecc4

--001a113ed932028c4405393fecc4
Content-Type: text/plain; charset=UTF-8

On 4 August 2016 at 15:34, Martin Jansa <martin.jansa@gmail.com> wrote:

> | In file included from ../../libtasn1-4.9/lib/structure.c:32:0:
> | ../../libtasn1-4.9/lib/parser_aux.h:97:1: error: inlining failed in
> call to '_asn1_set_down': call is unlikely and code size would grow
> [-Werror=inline]
> |  _asn1_set_down (asn1_node node, asn1_node down)
> |  ^~~~~~~~~~~~~~
>

Works for me and the AB.  What sort of compiler flags do you have?

Ross

--001a113ed932028c4405393fecc4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 August 2016 at 15:34, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ex" class=
=3D"a3s aXjCH m15655fb24c52c762">| In file included from ../../libtasn1-4.9=
/lib/structure.c:32:0:<br>
| ../../libtasn1-4.9/lib/parser_aux.h:97:1: error: inlining failed in<br>
call to &#39;_asn1_set_down&#39;: call is unlikely and code size would grow=
<br>
[-Werror=3Dinline]<br>
|=C2=A0 _asn1_set_down (asn1_node node, asn1_node down)<br>
|=C2=A0 ^~~~~~~~~~~~~~</div></blockquote></div><br>Works for me and the AB.=
=C2=A0 What sort of compiler flags do you have?</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ed932028c4405393fecc4--
