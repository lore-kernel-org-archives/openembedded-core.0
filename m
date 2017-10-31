Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id A6EF96AC00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 23:17:05 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 134so2474442ioo.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 16:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BTFu87PdWjyRzJZC+/aTg40i5DIToW56/FkmK5q8TqM=;
	b=k/wUYvKpOZDPez4MmcQ0DyG2e2vZVYIjF7vN8Bbgbi2TJ3M7EwCHq2HzCnFI/mxr4X
	QhxGhufS4MhHcv1PVCcg7X/RVHRaJBanhMt9Z00l2o9y5AsJBeVFhhErtMtqEPb1NP8X
	512269jkIxJy7ULW8IxG6mOw/5kgcDqBvlu/UqgcpQFGl8u0zQncPZMdVKYFWDjH93Zw
	9CTVoRgNAdxeSJY5tM7+g6yqROVIhJnxrYX2AIzt0KIW2V7CwuwSalAwXj2r+d6TkYfP
	jfvRNCvdLxZcu2JE2I2I33r/TKBGO0cDTtOdQ+sjF/F5XjLdsEQR8sXTPFnjKIpyuPvM
	d43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BTFu87PdWjyRzJZC+/aTg40i5DIToW56/FkmK5q8TqM=;
	b=ZqFFgx+sbSWe85xpCY2tcZwNza4tAjxRKBUxXtR123jbdWGMChAJfbKqxecmAW0Cx3
	i0yh2be4RNRycbl5ATp4SbgF5IZNM8ipZQXRDtURbJUA4xBBmmZ8JT9q4m1O3QxazIXo
	LhtWemKPP8kSQaE0QkTTvKebmuZnXLytTt7iXkOTL4tM+HPY8SSUcp/WSrvVBfVT8Pg2
	uD2N7WfCXmsAPn1WMc/jrC1quTst0HmKATMe6Bu7mtxDP6zYFxBicKDTws1LuWMHudoh
	vN2p5S5uPe9P1Dha4A8HPzwxuZEXvKyqeA9sAYkdyafIrHmYJT0td5oFAKYjQs+cnKI2
	k4lg==
X-Gm-Message-State: AMCzsaWLJpSoOB8Gp0xeyk4+UL8slS7NzxT+33tWnduf4NxabJbEWskJ
	M5YxyzcAr+YD4ZNvEvh2dJIabw2A+99nltGC3SL0Sw==
X-Google-Smtp-Source: ABhQp+Qtcf59IyLtb9/QvpbWvx/YAeXW/6397CxszQhSv9voK9jMhsxHj4JrvIC0xOnXLz3yNR3G93fEPaHn0ft953E=
X-Received: by 10.107.18.67 with SMTP id a64mr4850560ioj.165.1509491826809;
	Tue, 31 Oct 2017 16:17:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Tue, 31 Oct 2017 16:16:46 -0700 (PDT)
In-Reply-To: <1508587571-4733-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1508587571-4733-1-git-send-email-richard.purdie@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Oct 2017 23:16:46 +0000
Message-ID: <CAJTo0LYFFZ-DOhZAepuJnXUgOTZDLcqxnWgj9F8-BLne_+wFvw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-buildenv-internal: Fix finding build directory
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
X-List-Received-Date: Tue, 31 Oct 2017 23:17:05 -0000
Content-Type: multipart/alternative; boundary="001a113ee9b22106d1055cdff495"

--001a113ee9b22106d1055cdff495
Content-Type: text/plain; charset="UTF-8"

On 21 October 2017 at 13:06, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The intent of the env setup scripts is to set BBPATH to point at the
> build directory if not already set. This means if the user changes
> directory, bitbake can still find the original build directory. The
> default bblayers.conf files reset BBPATH to the correct components so
> this is safe and restores the behaviour the script was intended to have.
>
> [YOCTO #12163]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  scripts/oe-buildenv-internal | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index e6cd141..abc5aff 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -105,6 +105,11 @@ fi
>
>  BITBAKEDIR=$(readlink -f "$BITBAKEDIR")
>  BUILDDIR=$(readlink -f "$BUILDDIR")
> +if [ -z "$BBPATH" ]; then
> +    BBPATH=$BUILDDIR
> +fi
> +
> +export BBPATH
>

This breaks the use-case of the user switching between build directories as
re-executing oe-init-build-env doesn't change BBPATH.

Ross

--001a113ee9b22106d1055cdff495
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 21 October 2017 at 13:06, Richard Purdie <span dir=3D"l=
tr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_bl=
ank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
The intent of the env setup scripts is to set BBPATH to point at the<br>
build directory if not already set. This means if the user changes<br>
directory, bitbake can still find the original build directory. The<br>
default bblayers.conf files reset BBPATH to the correct components so<br>
this is safe and restores the behaviour the script was intended to have.<br=
>
<br>
[YOCTO #12163]<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0scripts/oe-buildenv-internal | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal<br=
>
index e6cd141..abc5aff 100755<br>
--- a/scripts/oe-buildenv-internal<br>
+++ b/scripts/oe-buildenv-internal<br>
@@ -105,6 +105,11 @@ fi<br>
<br>
=C2=A0BITBAKEDIR=3D$(readlink -f &quot;$BITBAKEDIR&quot;)<br>
=C2=A0BUILDDIR=3D$(readlink -f &quot;$BUILDDIR&quot;)<br>
+if [ -z &quot;$BBPATH&quot; ]; then<br>
+=C2=A0 =C2=A0 BBPATH=3D$BUILDDIR<br>
+fi<br>
+<br>
+export BBPATH<br></blockquote><div><br></div><div>This breaks the use-case=
 of the user switching between build directories as re-executing oe-init-bu=
ild-env doesn&#39;t change BBPATH.</div><div><br></div><div>Ross=C2=A0</div=
></div></div></div>

--001a113ee9b22106d1055cdff495--
