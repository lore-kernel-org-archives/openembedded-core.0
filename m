Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9121.1794569993191995116
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 03:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bsCeOggv;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91ec2d42231so18728696d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 03:39:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794569992; cv=none;
        d=google.com; s=arc-20260327;
        b=diyR6OEL2dZkhzXDftBoUpSux90h3AFhFsqD6h0/AFn/Sy7RlR7IJtkVgqLq+aVDuR
         Oyj+eiQ8HCejJNDwy1mDUD2wE3/jLex5ORIB/hzdFc/r/MDUfyK26hNmFWHgFruX0J6N
         B/J3wu2Ap2p7aseEu/XhM+GxtdwYjWo6QnmIosY8SeBBKfvwoh/JWRxmJojjOozx63OI
         G07B6ZfatQo/UOv9/Ef84PZ4fDX9+163oBmAq01dwerBt++fPTWkHf0MN+WpdJ6Dp4rC
         uqmeUriuGDyWSVnGk2qy7eytMRdy70oq8dWg/Q3OaY3AAIdfutr9aCSuLSBnfzNHhez+
         k7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XF0kVJZFTAo5+YD26O6r6Il5nNJ8cSMpLcud0pbO89c=;
        fh=wJLD6zetCfjYthwLiAEels19uL6o2/FT2mHHrVoI57Y=;
        b=Tru0XKdw6PpPmp7sA6XfpzqV8a6GvndQajLGHyoXAW5ffpWQlf9vtZKmitEoDUr8sV
         tSAjM/xNPw6BLNljI4bDwb/ooLWRb44a/KEkPVi7eBThguJwO63C+4ckXs06HHYMV4l1
         WrKUpV/gVPXdkK2ZjkjRD8kJYlQh0ZrF7jCM0fum6GCLjctD4ZuJRuFCQGH2LWrsXs3e
         95OFynbqPrJUW1JSkBrdbj30upTuNiHVvESRNe5eIQ+GCvFJQMapTcMDezcKstx8xPfy
         ttkmyJIOqLMcdy+lXivxgpuuZ/ZPJ/iDZoJrWKxmnl2An+6k05QLJOZ6RUWvpQoDy92D
         rLTg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794569992; x=1795174792; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XF0kVJZFTAo5+YD26O6r6Il5nNJ8cSMpLcud0pbO89c=;
        b=bsCeOggvimmA4Qyn3FD0t9Os2emnuiOCTmfkaqjgxdEj7x6wc5lLwHQPOcqc22ePHo
         kHqJnK9vJYLblM2KVLOwvMeTTyvi/imtqmsRE39i8QT878WUdb+y0AYeVozknRu2Mpbb
         waGVtgiDwOJkGqa7VcVxHND8lfYzSNRioEUyC7Rz5NkMZvXeznFcYbIzQ9JZ05FuaFDb
         UTgAa3GLT4KlmURzJwSRtdR+u8Yl6IBJ71vaaPj5jQY8W5NbXmM23rmQ208LgU1LLtoY
         0ZsVmdFShFP90dVsh1r7y5GGvPNFggyzkgBMv8e2m7iuOp+20NX73cfuRZ91hWt9E6Vi
         bNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569992; x=1795174792;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XF0kVJZFTAo5+YD26O6r6Il5nNJ8cSMpLcud0pbO89c=;
        b=Cke5/YwO/SkWcC1fh/YdoSbhTfYHcTTT4ceX842R/pGpInPnjXAg5LDGJp83fIvOk0
         fH/P0f8JJtkGCQM3M10OHyL/XJjXA4YxG5lG8lnNPWK6BrU9a+fw7iFifDxegJW3DvhW
         sbpZN21DWH0xhcH3rlSdJ8uaIsGBcOW6qBhUICM0nDjtOeLJtMIW0wJMMEyNiSTiyjEQ
         MeYjBDwY31MfjgT++sZbgjFwYXaGwG7w5Z85qXajp1yFBdKsc55E0mTrFAHj+Lq/BUa/
         FR7zBknIEZgOscvPPIihvrWJ33ae5id9yGLo7cNOTdSrK8rdZEV1UZ+qdPmd8b86zYKu
         YtpQ==
X-Gm-Message-State: APuU4Z/WKWwJoS1UYzL49GNXGe3WiC7HVwwtnIsiiDw4TNaWpQvvc+M/
	jchphhgRhye6R/qLGJQASMbgYLiFJ40beU+z60KSsDK5yelKCxwIrAaTluo/ZXrJ6Rae0nftiry
	U3FzJisFF+sc3PiUmU80YIAhvro6CG+bDLA==
X-Gm-Gg: AYBFou2ok+Hn7UdIvPQ8931aGr1pCqTjfmoEWlgA6HdXfZCP8oQbnlAL64FMmkioqzF
	gOP/rWrcKjiD0qrS9U7CtOqkLkdjUvs/k/q4QG1Z3JoLd1TDPDKZf48fijuxrhNcb2fx5fWKOkE
	KrhJlWwVsg0Bxbx5qoJYBAgQvdCVRC16h/JbG2/BrPwzq4nVTkeXlPaLL283C2MxQSgFQRWuji0
	2hxHeSFVx+DGYu/T2s8kRZlNfuQOlFXWwCIkisg6k9AzBDY6Vb+e2d8ZDsUuhvn7SVEJZZoejNP
	EJ1+E99GJglBIH9/V4u78M/NwjquKVWtRTarM0g7iB2w1kdQYweQNd7Zkk94ePAlDTWCkqPkOxX
	YqRfO+pmF9f9+b3iymMhKT1d2/7ye3zy9tBtN/h/IoWdZTSdnLRyZIDdHQAgAITxEUjN+QSo=
X-Received: by 2002:a05:6214:27e8:b0:91f:1383:1bea with SMTP id
 6a1803df08f44-91f240449bamr35511756d6.2.1794569990959; Fri, 13 Nov 2026
 03:39:50 -0800 (PST)
MIME-Version: 1.0
References: <20261113101537.3586467-1-sean@geanix.com>
In-Reply-To: <20261113101537.3586467-1-sean@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Nov 2026 12:39:38 +0100
X-Gm-Features: AclHuK_ChqcS7WKIpELs-S_AOxjy9F-qFez5hQe5LWgwE40Ry09P4NUjHMngjF4
Message-ID: <CANNYZj92MutkDoJrXb6Cb+0d4_MWjLhiKswCkJihHyqUSwTsJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] license_image: don't apply
 INCOMPATIBLE_LICENSE to SDK host tools
To: sean@geanix.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d5f9e8066026e281"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 11:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250162

--000000000000d5f9e8066026e281
Content-Type: text/plain; charset="UTF-8"

Can you please split this into two patches? One that factors out the check
into its own function, the other would then introduce additional usage of
the function.

Alex

On Fri, 13 Nov 2026 at 11:15, Sean Nyekjaer via openembedded-core <sean=
geanix.com@lists.openembedded.org> wrote:

> Since the SDK host and target sysroots are passed through
> write_license_files(), do_populate_sdk checks every nativesdk and
> cross-canadian package against the image's INCOMPATIBLE_LICENSE and
> fails, e.g. with INCOMPATIBLE_LICENSE = "GPL-3.0*":
>
>   Some packages cannot be installed into the image because they have
>   incompatible licenses:
>         nativesdk-autoconf (GPL-3.0-or-later)
>
> At parse time skip_incompatible_package_licenses() exempts these
> recipes, so they are built and packaged, and only the SDK manifest
> step rejects them. Move that exemption into
> incompatible_license_check_needed() and use it in write_license_files()
> too, so host tools in the SDK are treated the same way. Target packages
> in the image and in the SDK target sysroot are still checked.
>
> Fixes: f757ae4dadab ("license_image: extend to SDK coverage")
> AI-Generated: Claude Opus 5.5 (Claude Code)
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
> Patches for the discussion here:
> https://lists.openembedded.org/g/openembedded-core/topic/122226717
>
> I would like for this to go into the wrynose branch, but it doesn't
> apply as is.
>
>  meta/classes-recipe/license_image.bbclass | 13 +++++++++---
>  meta/lib/oe/license.py                    | 25 ++++++++++++++---------
>  2 files changed, 25 insertions(+), 13 deletions(-)
>
> diff --git a/meta/classes-recipe/license_image.bbclass
> b/meta/classes-recipe/license_image.bbclass
> index 7d00b1ae53..728db8ae3a 100644
> --- a/meta/classes-recipe/license_image.bbclass
> +++ b/meta/classes-recipe/license_image.bbclass
> @@ -128,16 +128,23 @@ def write_license_files(d, license_manifest,
> pkg_dic, rootfs):
>
>              pkg_allow_licenses = oe.license.filter_pkg_license_list(pkg,
> allow_licenses)
>
> +            # Host tools in the SDK (nativesdk, cross-canadian) are not
> +            # subject to INCOMPATIBLE_LICENSE, same as at parse time.
> +            if oe.license.incompatible_license_check_needed(d,
> pkg_dic[pkg]["PN"]):
> +                pkg_bad_licenses = bad_licenses
> +            else:
> +                pkg_bad_licenses = []
> +
>              if node:
> -                if incompatible_licenses :=
> oe.license.license_allowed(node, bad_licenses, pkg_allow_licenses):
> +                if incompatible_licenses :=
> oe.license.license_allowed(node, pkg_bad_licenses, pkg_allow_licenses):
>                      incompatible_packages.append("%s (%s)" % (pkg, '
> '.join(n.to_string() for n in incompatible_licenses)))
> -                elif incompatible_licenses :=
> oe.license.license_allowed(node, bad_licenses, []):
> +                elif incompatible_licenses :=
> oe.license.license_allowed(node, pkg_bad_licenses, []):
>                      oe.qa.handle_error('license-exception', "Including %s
> with incompatible license(s) %s into the image, because it has been allowed
> by exception list." %
>                                         (pkg, ' '.join(n.to_string() for n
> in incompatible_licenses)), d)
>
>              (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
>                  oe.license.manifest_licenses(d, pkg_dic[pkg]["LICENSE"],
> -                                             bad_licenses,
> pkg_allow_licenses)
> +                                             pkg_bad_licenses,
> pkg_allow_licenses)
>
>              if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
>                  # Rootfs manifest
> diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
> index e2a2bcc47d..035311d469 100644
> --- a/meta/lib/oe/license.py
> +++ b/meta/lib/oe/license.py
> @@ -561,23 +561,28 @@ def filter_pkg_license_list(pkg, lst):
>
>      return pkg_lst
>
> +def incompatible_license_check_needed(d, pn):
> +    """
> +    Return False for recipes that INCOMPATIBLE_LICENSE does not apply to:
> +    native, nativesdk, cross and cross-canadian recipes, and gcc-source.
> +    """
> +    if pn.startswith("nativesdk-") or pn.startswith("gcc-source-"):
> +        return False
> +    for t in ["-native", "-cross-${TARGET_ARCH}",
> "-cross-initial-${TARGET_ARCH}",
> +            "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
> +            "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
> +        if pn.endswith(d.expand(t)):
> +            return False
> +    return True
> +
>  def skip_incompatible_package_licenses(d, pkgs):
>      if not pkgs:
>          return {}
>
>      pn = d.getVar("PN")
>
> -    check_license = False if pn.startswith("nativesdk-") else True
> -    for t in ["-native", "-cross-${TARGET_ARCH}",
> "-cross-initial-${TARGET_ARCH}",
> -            "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
> -            "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
> -        if pn.endswith(d.expand(t)):
> -            check_license = False
> -    if pn.startswith("gcc-source-"):
> -        check_license = False
> -
>      bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
> -    if not check_license or not bad_licenses:
> +    if not incompatible_license_check_needed(d, pn) or not bad_licenses:
>          return {}
>
>      bad_licenses = expand_wildcard_licenses(d, bad_licenses)
> --
> 2.56.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#250157):
> https://lists.openembedded.org/g/openembedded-core/message/250157
> Mute This Topic: https://lists.openembedded.org/mt/122244714/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d5f9e8066026e281
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you please split this into two patches? One that =
factors out the check into its own function, the other would then introduce=
 additional usage of the function.</div><div><br></div><div></div><div>Alex=
</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 13 Nov 2026 at 11:15, Sean Nyekjaer v=
ia openembedded-core &lt;sean=3D<a href=3D"mailto:geanix.com@lists.openembe=
dded.org">geanix.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Since the SDK host and target sy=
sroots are passed through<br>
write_license_files(), do_populate_sdk checks every nativesdk and<br>
cross-canadian package against the image&#39;s INCOMPATIBLE_LICENSE and<br>
fails, e.g. with INCOMPATIBLE_LICENSE =3D &quot;GPL-3.0*&quot;:<br>
<br>
=C2=A0 Some packages cannot be installed into the image because they have<b=
r>
=C2=A0 incompatible licenses:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 nativesdk-autoconf (GPL-3.0-or-later)<br>
<br>
At parse time skip_incompatible_package_licenses() exempts these<br>
recipes, so they are built and packaged, and only the SDK manifest<br>
step rejects them. Move that exemption into<br>
incompatible_license_check_needed() and use it in write_license_files()<br>
too, so host tools in the SDK are treated the same way. Target packages<br>
in the image and in the SDK target sysroot are still checked.<br>
<br>
Fixes: f757ae4dadab (&quot;license_image: extend to SDK coverage&quot;)<br>
AI-Generated: Claude Opus 5.5 (Claude Code)<br>
Signed-off-by: Sean Nyekjaer &lt;<a href=3D"mailto:sean@geanix.com" target=
=3D"_blank">sean@geanix.com</a>&gt;<br>
---<br>
Patches for the discussion here:<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/1222267=
17" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/o=
penembedded-core/topic/122226717</a><br>
<br>
I would like for this to go into the wrynose branch, but it doesn&#39;t<br>
apply as is.<br>
<br>
=C2=A0meta/classes-recipe/license_image.bbclass | 13 +++++++++---<br>
=C2=A0meta/lib/oe/license.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 25 ++++++++++++++---------<br>
=C2=A02 files changed, 25 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recip=
e/license_image.bbclass<br>
index 7d00b1ae53..728db8ae3a 100644<br>
--- a/meta/classes-recipe/license_image.bbclass<br>
+++ b/meta/classes-recipe/license_image.bbclass<br>
@@ -128,16 +128,23 @@ def write_license_files(d, license_manifest, pkg_dic,=
 rootfs):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg_allow_licenses =3D oe.l=
icense.filter_pkg_license_list(pkg, allow_licenses)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Host tools in the SDK (natives=
dk, cross-canadian) are not<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # subject to INCOMPATIBLE_LICENS=
E, same as at parse time.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if oe.license.incompatible_licen=
se_check_needed(d, pkg_dic[pkg][&quot;PN&quot;]):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_bad_licenses =
=3D bad_licenses<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_bad_licenses =
=3D []<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if node:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if incompatible_li=
censes :=3D oe.license.license_allowed(node, bad_licenses, pkg_allow_licens=
es):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if incompatible_li=
censes :=3D oe.license.license_allowed(node, pkg_bad_licenses, pkg_allow_li=
censes):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0incompatible_packages.append(&quot;%s (%s)&quot; % (pkg, &#39; &#39;.joi=
n(n.to_string() for n in incompatible_licenses)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif incompatible_=
licenses :=3D oe.license.license_allowed(node, bad_licenses, []):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif incompatible_=
licenses :=3D oe.license.license_allowed(node, pkg_bad_licenses, []):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0oe.qa.handle_error(&#39;license-exception&#39;, &quot;Including %s with =
incompatible license(s) %s into the image, because it has been allowed by e=
xception list.&quot; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pkg, &#=
39; &#39;.join(n.to_string() for n in incompatible_licenses)), d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(pkg_dic[pkg][&quot;LICENSE=
&quot;], pkg_dic[pkg][&quot;LICENSES&quot;]) =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.license.ma=
nifest_licenses(d, pkg_dic[pkg][&quot;LICENSE&quot;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0bad_licenses, pkg_allow_licenses)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0pkg_bad_licenses, pkg_allow_licenses)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not &quot;IMAGE_MANIFEST=
&quot; in pkg_dic[pkg]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Rootfs mani=
fest<br>
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py<br>
index e2a2bcc47d..035311d469 100644<br>
--- a/meta/lib/oe/license.py<br>
+++ b/meta/lib/oe/license.py<br>
@@ -561,23 +561,28 @@ def filter_pkg_license_list(pkg, lst):<br>
<br>
=C2=A0 =C2=A0 =C2=A0return pkg_lst<br>
<br>
+def incompatible_license_check_needed(d, pn):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Return False for recipes that INCOMPATIBLE_LICENSE does not =
apply to:<br>
+=C2=A0 =C2=A0 native, nativesdk, cross and cross-canadian recipes, and gcc=
-source.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 if pn.startswith(&quot;nativesdk-&quot;) or pn.startswith(&q=
uot;gcc-source-&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
+=C2=A0 =C2=A0 for t in [&quot;-native&quot;, &quot;-cross-${TARGET_ARCH}&q=
uot;, &quot;-cross-initial-${TARGET_ARCH}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-crosssdk-${SDK_SYS}&quot;=
, &quot;-crosssdk-initial-${SDK_SYS}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-cross-canadian-${TRANSLAT=
ED_TARGET_ARCH}&quot;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pn.endswith(d.expand(t)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
+=C2=A0 =C2=A0 return True<br>
+<br>
=C2=A0def skip_incompatible_package_licenses(d, pkgs):<br>
=C2=A0 =C2=A0 =C2=A0if not pkgs:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return {}<br>
<br>
=C2=A0 =C2=A0 =C2=A0pn =3D d.getVar(&quot;PN&quot;)<br>
<br>
-=C2=A0 =C2=A0 check_license =3D False if pn.startswith(&quot;nativesdk-&qu=
ot;) else True<br>
-=C2=A0 =C2=A0 for t in [&quot;-native&quot;, &quot;-cross-${TARGET_ARCH}&q=
uot;, &quot;-cross-initial-${TARGET_ARCH}&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-crosssdk-${SDK_SYS}&quot;=
, &quot;-crosssdk-initial-${SDK_SYS}&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-cross-canadian-${TRANSLAT=
ED_TARGET_ARCH}&quot;]:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pn.endswith(d.expand(t)):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 check_license =3D False<br>
-=C2=A0 =C2=A0 if pn.startswith(&quot;gcc-source-&quot;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 check_license =3D False<br>
-<br>
=C2=A0 =C2=A0 =C2=A0bad_licenses =3D (d.getVar(&#39;INCOMPATIBLE_LICENSE&#3=
9;) or &quot;&quot;).split()<br>
-=C2=A0 =C2=A0 if not check_license or not bad_licenses:<br>
+=C2=A0 =C2=A0 if not incompatible_license_check_needed(d, pn) or not bad_l=
icenses:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return {}<br>
<br>
=C2=A0 =C2=A0 =C2=A0bad_licenses =3D expand_wildcard_licenses(d, bad_licens=
es)<br>
-- <br>
2.56.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#250157): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/250157" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/250157</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122244714/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122244714/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d5f9e8066026e281--
