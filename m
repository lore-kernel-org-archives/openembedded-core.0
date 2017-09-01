Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 28A3B606CB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 09:38:34 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id 81so13027177ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Sep 2017 02:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L4wlShbr1kh20PjmSYfB+gkE8EmJ0aJ6M+hGn2y77d4=;
	b=kaUf+sBcuVf8bGJ6U2cFMfY2lgVoUHr6Lqmrbo645AXdrPZT143YfEC0PeU6ZhUulf
	DtnMFihbB8kLDjpk91zYK+WnfpYKomEFgUs3p+luLhBudw24DBPggKxTRbQCtaH/IGKl
	kzfw9sB8SCnUZROWaXzrt58eljGgEOoJeH0xVGleb4eoGz9vYidMIPR+Xe4m0yl9WcSs
	LlXoaEPTfyB6YK4Zgb2jY3H4VLhmz4J9i8BiJkhh5/egtsdQpls8h5GaT3a/pItrTZHx
	KzuGSNJwjIegomWk8SZBoObdPyWZU6DsMWbNAMHzPuifsD2oV0leD5wIVWhAoxAvYVIl
	uZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L4wlShbr1kh20PjmSYfB+gkE8EmJ0aJ6M+hGn2y77d4=;
	b=MKCHSwGqgm7LmKlXi+5d5fuAfA4lv7/M2kng0iQJF9PUTTVzFeFaMLI0m7nz4f5XvH
	CGfu1WimJBnWI1cEgNoQtViQxKaSFvy1rX0z8CUVWjWUWul3R/Ymtx/2Dhi1lKr0FVxX
	+cT1jT8wbLjz/1Fpqjr81xU3rb+QaTv4DGMG/msHSMXUdalnePN1/+tBIagznzAdfazj
	fIGJO7xLI0goP+YTqhpwium+krV3s1eRNCBozEbyScklxPjGyZJhQumKV93QSkYKykE+
	2zwCwWXe70vyU6yKqibsSexu1u9GefnQIhjFFni+0lX6xpiic6MDnxyDNWOXWELXY8j8
	OAwQ==
X-Gm-Message-State: AHPjjUiAodHGrgD/2SXEqTjk0KEBTGPMcihgFTqwkVp2A4o0hEV4u3gD
	hDFS1YNrdjWI7X7isMfNkvW0cDGg8w3z
X-Google-Smtp-Source: ADKCNb7stVZ/9LtXFS70bl4v2Jq6Y0abLReJqZ5Y2Uc1zkNo+lMRH8+leCAFEtwepEPQXOlGqREAKAlZu6rXnOiUTdI=
X-Received: by 10.36.224.205 with SMTP id c196mr51362ith.18.1504258715767;
	Fri, 01 Sep 2017 02:38:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Fri, 1 Sep 2017 02:38:15 -0700 (PDT)
In-Reply-To: <1504219258.27472.330.camel@linux.intel.com>
References: <1504219258.27472.330.camel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Sep 2017 10:38:15 +0100
Message-ID: <CAJTo0LaEJCdOE34WQs64-_Go=m_o06UWjkjGKj0gsv5b35YRZw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][resend] insane.bbclass: Warn if ${COREBASE}/LICENSE is used
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
X-List-Received-Date: Fri, 01 Sep 2017 09:38:35 -0000
Content-Type: multipart/alternative; boundary="94eb2c19df86676f1305581d8673"

--94eb2c19df86676f1305581d8673
Content-Type: text/plain; charset="UTF-8"

This and the other patch have been wrapped by your mailer, and also base64
encoded so I can't trivially fix the whitespace.  Are they in a branch, or
can you resend them using git-send-email?

Ross

On 31 August 2017 at 23:40, Saul Wold <sgw@linux.intel.com> wrote:

> The top level LICENSE file is not actually a license, it refers
> other licenses that are used by Bitbake and Meta-data. Relying
> on this file could cause problems for recipes when this file
> changes, which it is about to.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/insane.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 479d39c..6d20eb6 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -659,7 +659,7 @@ python populate_lic_qa_checksum() {
>          sane = package_qa_handle_error("license-checksum", pn + ":
> Recipe file fetches files and does not have license file information
> (LIC_FILES_CHKSUM)", d)
>
>      srcdir = d.getVar('S')
> -
> +    corebase_licensefile = d.getVar('COREBASE') + "/LICENSE"
>      for url in lic_files.split():
>          try:
>              (type, host, path, user, pswd, parm) =
> bb.fetch.decodeurl(url)
> @@ -670,6 +670,10 @@ python populate_lic_qa_checksum() {
>          if not os.path.isfile(srclicfile):
>              package_qa_handle_error("license-checksum", pn + ":
> LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
>              continue
> +
> +        if (srclicfile == corebase_licensefile):
> +            bb.warn("${COREBASE}/LICENSE is not a valid license file,
> please use '${COMMON_LICENSE_DIR}/MIT' for a MIT License file in
> LIC_FILES_CHKSUM")
> +            bb.warn("This will become an error in the next release")
>
>          recipemd5 = parm.get('md5', '')
>          beginline, endline = 0, 0
> --
> 2.7.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c19df86676f1305581d8673
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This and the other patch have been wrapped by your mailer,=
 and also base64 encoded so I can&#39;t trivially fix the whitespace.=C2=A0=
 Are they in a branch, or can you resend them using git-send-email?<div><br=
></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On 31 August 2017 at 23:40, Saul Wold <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The top level LICENSE=
 file is not actually a license, it refers<br>
other licenses that are used by Bitbake and Meta-data. Relying<br>
on this file could cause problems for recipes when this file<br>
changes, which it is about to.<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/insane.bbclass | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass<br>
index 479d39c..6d20eb6 100644<br>
--- a/meta/classes/insane.bbclass<br>
+++ b/meta/classes/insane.bbclass<br>
@@ -659,7 +659,7 @@ python populate_lic_qa_checksum() {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sane =3D package_qa_h=
andle_error(&quot;<wbr>license-checksum&quot;, pn + &quot;:<br>
Recipe file fetches files and does not have license file information<br>
(LIC_FILES_CHKSUM)&quot;, d)<br>
=C2=A0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0srcdir =3D d.getVar(&#39;S&#39;)<br>
-<br>
+=C2=A0=C2=A0=C2=A0=C2=A0corebase_licensefile =3D d.getVar(&#39;COREBASE&#3=
9;) + &quot;/LICENSE&quot;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for url in lic_files.split():<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0try:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0(type, host, path, user, pswd, parm) =3D<br>
bb.fetch.decodeurl(url)<br>
@@ -670,6 +670,10 @@ python populate_lic_qa_checksum() {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if not os.path.isfile=
(srclicfile):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0package_qa_<wbr>handle_error(&quot;license-<wbr>checksum&quot;, pn + &qu=
ot;:<br>
LIC_FILES_CHKSUM points to an invalid file: &quot; + srclicfile, d)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0continue<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (srclicfile =3D=3D core=
base_licensefile):<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bb=
.warn(&quot;${<wbr>COREBASE}/LICENSE is not a valid license file,<br>
please use &#39;${COMMON_LICENSE_DIR}/MIT&#39; for a MIT License file in<br=
>
LIC_FILES_CHKSUM&quot;)<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bb=
.warn(&quot;This will become an error in the next release&quot;)<br>
=C2=A0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0recipemd5 =3D parm.ge=
t(&#39;md5&#39;, &#39;&#39;)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0beginline, endline =
=3D 0, 0<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--=C2=A0<br>
2.7.5<br>
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

--94eb2c19df86676f1305581d8673--
