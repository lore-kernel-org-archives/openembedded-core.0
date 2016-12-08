Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5491B6E5FC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 14:42:00 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id n6so413779546qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 06:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FQ38zYLq6h6zjS4LCVM+4jCl+bSRi8Qm+f+7O4Hf8AE=;
	b=eDHzjLI5yCkA2xUX0y3ayFQMpwgBLNevTe9LV3wJMdocqvspxj5RIn7DagKX/z+S6k
	2MnrXrF8uNWQgDdNWiDqmwPM+liHXjYisXmnixcKBOLMHMBDiXv/h5tlcnDbtf3EBQpP
	4pwNOkBJwVPLkfcab4zCOWV2v5GcCc9GXobHFEJg/AW0YuC9ZJ3dqcTp4xpp5LwWcVoo
	m9cfbkPAMLK7H88mBCj9I1Qq9kdOwBO3mbg/V+/XyDGgO63DBu/Ui9AwPzcY5DOy9nDj
	5J6+C4eHdfXMzUMjUKsp9SArcVz6e2BRh8gPAQ3HUcQC3BAkthpiZSyGEP5Auzjf3gje
	RYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FQ38zYLq6h6zjS4LCVM+4jCl+bSRi8Qm+f+7O4Hf8AE=;
	b=NMUIpM+P3L6fvn05j5I3ULNHHo97f1p0oVeWgK0k1TKaTfgKURP51tSzezMVGFX/2S
	/jLVpdmJWT3sWAUht7rAW0lRZCK2z9wRXLKmbHQij0AigcgI69nYtd6ySh0QlxDSCvDK
	+ZCKK1+Rz60aGxgAfXOlrsM+2bcKfFkelWBrsPfAwD1DUdfmJ7Qpndnl7llAXdj1tjAh
	iubOEMBJMrkNqRCOsoQkO74C0OIyXxIOMRB6dY4MFpfScAfKImmPYKjuDoQkVE7pz+ea
	LF77oNBdbk9h/qNiAXFe21ba4+TqD624OTDX8rwMEzvhAGQ7Uv7AzqyK3f1t2sYpKr7c
	+1aw==
X-Gm-Message-State: AKaTC02Oq6vHvl2mJFr98z97iVXMDukSp9kFiweyNT5xd4q3iouVxAaGFPhcOceo3ITv9UsqU76dO6WOe08YBVrX
X-Received: by 10.200.57.54 with SMTP id s51mr63278078qtb.68.1481208122324;
	Thu, 08 Dec 2016 06:42:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 8 Dec 2016 06:41:41 -0800 (PST)
In-Reply-To: <2fd5296cdd3485bd4eab59388ba8d19fce3fb022.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
	<2fd5296cdd3485bd4eab59388ba8d19fce3fb022.1481142664.git.anibal.limon@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Dec 2016 14:41:41 +0000
Message-ID: <CAJTo0LZRy2q4hAzDDqRWAn6YdwCZZznu3exfmYFYW83MOPpRAQ@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 17/32] oeqa/utils/path: Add remove_safe function
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
X-List-Received-Date: Thu, 08 Dec 2016 14:42:01 -0000
Content-Type: multipart/alternative; boundary=001a113a01e8f851e1054326a37e

--001a113a01e8f851e1054326a37e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Can you squash this into the commit that added core/utils/path.

Ross

On 7 December 2016 at 20:32, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.int=
el.com>
wrote:

> Checks if path exists before try to remove of avoid exception.
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> ---
>  meta/lib/oeqa/core/utils/path.py | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/lib/oeqa/core/utils/path.py b/meta/lib/oeqa/core/utils/
> path.py
> index cb06523..a21caad 100644
> --- a/meta/lib/oeqa/core/utils/path.py
> +++ b/meta/lib/oeqa/core/utils/path.py
> @@ -12,3 +12,8 @@ def findFile(file_name, directory):
>          if file_name in f:
>              return os.path.join(r, file_name)
>      return None
> +
> +def remove_safe(path):
> +    if os.path.exists(path):
> +        os.remove(path)
> +
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113a01e8f851e1054326a37e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you squash this into the commit that added core/utils/=
path.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On 7 December 2016 at 20:32, An=C3=ADbal Lim=C3=B3n=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:anibal.limon@linux.intel.com" targ=
et=3D"_blank">anibal.limon@linux.intel.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Checks if path exists before try to remove of avoid=
 exception.<br>
<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
nux.intel.com">anibal.limon@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/core/utils/path.<wbr>py | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/core/utils/<wbr>path.py b/meta/lib/oeqa/core/uti=
ls/<wbr>path.py<br>
index cb06523..a21caad 100644<br>
--- a/meta/lib/oeqa/core/utils/<wbr>path.py<br>
+++ b/meta/lib/oeqa/core/utils/<wbr>path.py<br>
@@ -12,3 +12,8 @@ def findFile(file_name, directory):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if file_name in f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return os.path.join(r, file=
_name)<br>
=C2=A0 =C2=A0 =C2=A0return None<br>
+<br>
+def remove_safe(path):<br>
+=C2=A0 =C2=A0 if os.path.exists(path):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(path)<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113a01e8f851e1054326a37e--
