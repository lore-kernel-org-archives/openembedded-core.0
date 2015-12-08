Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4285760110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 23:05:33 +0000 (UTC)
Received: by igcph11 with SMTP id ph11so106341436igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 15:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=CqW+GL/Ce2lEeza8RAZkJjFWy41SEEhvPa0DTMvU+Lg=;
	b=FUELhfK56dogpxyaa9ZqlajNgStchMMDiiU31CGUyy06HHe5a797RsxB4zI6Nw0zia
	U5s8TyljbMB0v7xf41pkvArrqj1fmdjv705rHMA7Hlh89cygqUialLO7hxAVXiUBu7fy
	SxJKsvGdhqwkZcN9n3rTWL/uitqK0f4jSmCL99Gmg6R2jhW96TEPFMIA9QjzS+JcOwQ2
	HYoAE4YxmIzVDEsSQE+DovIzWXS3wtXg3TAZbWK0P71TP0/NE9ToTyxcAMVLREABJIfq
	sSHDdKplwbvNSR8USbkoE7ywceZosTnORKWHDZX1dwYpxTpe7aG07aEuJbz5B+d6YEPY
	GMQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=CqW+GL/Ce2lEeza8RAZkJjFWy41SEEhvPa0DTMvU+Lg=;
	b=giSipXdTQhEoV9rsXVQuhale9lQreocHwl8hN3F0kZ0aMKPa8gjRKN+faG8n2W1RhU
	mdv2AhsoMxqVr/lkpIN3cqisJ3qZbCZImrcSEdBcnFa8GVZQ7UV+2OzDBbvHmT8QRG6M
	YPVJXu2ldsNzf52M33or4zfG+WusHNvtM3L6JCnPPXUQ40nZMvcXMH3fwAwYK8XB9Pg+
	wjMOxkrZNGdDDNr73JyXm375Fkiui+RToQyLiayL9uaC3rTYxXp04Et1gfK53Mab+JGW
	AZotO/vdSFOe/xdQzLRQPiWEpHW7iY6C2QQ8KtpIgkwLWmRtoCiUOAWKfNxtws7KTxJz
	GRvA==
X-Received: by 10.50.13.72 with SMTP id f8mr24837810igc.38.1449615934221; Tue,
	08 Dec 2015 15:05:34 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.69.129 with HTTP; Tue, 8 Dec 2015 15:05:14 -0800 (PST)
In-Reply-To: <1449595321-4397-1-git-send-email-humberto.ibarra.lopez@intel.com>
References: <1449595321-4397-1-git-send-email-humberto.ibarra.lopez@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 8 Dec 2015 16:05:14 -0700
X-Google-Sender-Auth: JkvnzXCRT2VabEsaakNQjcODACc
Message-ID: <CABcZANm2KSQuJitxoRYrWhsjz1DVTCOKHfM-zzdCrdVdxrAueg@mail.gmail.com>
To: humberto.ibarra.lopez@intel.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] scripts/yocto-layer Change to the yocto-layer script. The fix avoids the duplication of the "meta-" prefix on the layer directory when creating a new layer with the prefix already there. Made the script inside the create subcommand method since it's a change specific to the creation of layers and parsing it in the main method was not the way to go.
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
X-List-Received-Date: Tue, 08 Dec 2015 23:05:35 -0000
Content-Type: multipart/alternative; boundary=089e013c65ded1f3cf05266b021a

--089e013c65ded1f3cf05266b021a
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 8, 2015 at 10:22 AM, <humberto.ibarra.lopez@intel.com> wrote:

> From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
>
> Before the change:
>
> $ yocto-layer create meta-layer2
> ...
> New layer created in meta-meta-layer2.
>
> ---------
>
> After the change:
>
> $ yocto-layer create meta-layer2
> ...
> New layer created in meta-layer2.
>
> Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
>

The commit message violates our conventions, specifically the subject line
isn't prefixed correctly, and is ridiculously long.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013c65ded1f3cf05266b021a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Dec 8, 2015 at 10:22 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:h=
umberto.ibarra.lopez@intel.com" target=3D"_blank">humberto.ibarra.lopez@int=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
2kd" class=3D"a3s" style=3D"overflow:hidden">From: Humberto Ibarra &lt;<a h=
ref=3D"mailto:humberto.ibarra.lopez@intel.com">humberto.ibarra.lopez@intel.=
com</a>&gt;<br>
<br>
Before the change:<br>
<br>
$ yocto-layer create meta-layer2<br>
...<br>
New layer created in meta-meta-layer2.<br>
<br>
---------<br>
<br>
After the change:<br>
<br>
$ yocto-layer create meta-layer2<br>
...<br>
New layer created in meta-layer2.<br>
<br>
Signed-off-by: Humberto Ibarra &lt;<a href=3D"mailto:humberto.ibarra.lopez@=
intel.com">humberto.ibarra.lopez@intel.com</a>&gt;</div></blockquote></div>=
<br>The commit message violates our conventions, specifically the subject l=
ine isn&#39;t prefixed correctly, and is ridiculously long.<br>-- <br><div =
class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<=
br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Sen=
ior Software Engineer, Mentor Graphics</div>
</div></div>

--089e013c65ded1f3cf05266b021a--
