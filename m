Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BAAC433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 06:16:08 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.7538.1654323365887508965
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 23:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kOmpnjN+;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: ernstp@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id f4so7617316iov.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 23:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JkStxabePZJhN9jDRMS5f6zZKS7N2M1Sv9sx5jhbLt4=;
        b=kOmpnjN+kuQ64KzgPQmMsJGT0+QpyS5VwfQ4dweOaV5HtpjO9WiNiIxWRuM9wSptzg
         sC0xx069wOOSS6532+TogyyNS7cwiJizo5B77kM4oyyZJlcEJYSPI712ujuAtmNMEWno
         EOp+oaII3F6RFacePIz312H81nC2gv8wDw+An0Sp9aYPhhT3ngHqHBi92pi6z0eeBNfX
         3Bf/TSaUiHgGCZyAzQZxlDGylKcpL/sMaP5jHHU4ICoVzYdkG5/XStNL6Uzkd8Sqrf52
         sOlFo80oFlq9iQmVw3Y+pJ4n3By6chYv4qwCrSBMhRsjaFu0T8Pn2NBjrzlk0KIJsLPY
         KWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JkStxabePZJhN9jDRMS5f6zZKS7N2M1Sv9sx5jhbLt4=;
        b=kLNulVOPCHFXyK1LBDFMZsc6hw5xz5fM5bw8Q9ldoiJIw+MOjzt4suqWnpp8RahJrU
         iEBtfO6Zvc7MnhinSy7ugMR/mVWDNd+diPSAujkaLBD3NHhJTnPbAyzlSZc24fW/hAAs
         xSf6OrMfp2olus1VWuKG0NWFdwHvgpk13xKlV4D3dwiqn6zOJnjU0fgTl9VimXnSU3iv
         AAFJBlNJPC0XkirxRYmgoVfdepXufnam+mXyiIs/QKyR0p9nPb/c8x18BV4SnIj3lbMt
         mL4yB75vMUdXSSwQl+JTCtXM+Y/iwg13I4CoBHQFF4CI7rEWXOPw8sK7PV0NpXYO6EtS
         B9qw==
X-Gm-Message-State: AOAM530bsfO3emkEigkCfN+B3RcVYffdHOFuq44n+zmQbQmxKmyaAA8T
	3aogrAnT/WrJJqM5F9O5bT+ll7rXbaQl91NmrqA=
X-Google-Smtp-Source: 
 ABdhPJwXrINMHVamk51ERV6GZVihIslFFKBpXMjMDrNNmMZTrXR3t50yBN4igqS6FLqirypXQa6ie4xd6P0xM7JE37c=
X-Received: by 2002:a05:6638:13d1:b0:330:df24:db42 with SMTP id
 i17-20020a05663813d100b00330df24db42mr7493417jaj.187.1654323365203; Fri, 03
 Jun 2022 23:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220603085827.2214734-1-rybczynska@gmail.com>
In-Reply-To: <20220603085827.2214734-1-rybczynska@gmail.com>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Sat, 4 Jun 2022 08:15:54 +0200
Message-ID: 
 <CAD=4a=V6xZOh65Seo84UXK+e6XHvGCQJruPXEpSYFPMTXo0O5g@mail.gmail.com>
Subject: Re: [PATCH] cve-check: move update_symlinks to a library
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: multipart/alternative; boundary="00000000000086d53405e0992c6d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 06:16:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166545

--00000000000086d53405e0992c6d
Content-Type: text/plain; charset="UTF-8"

It's not specially related to cve_check, you could put it in
lib/oe/utils.py or something like that perhaps?

Regards
//Ernst

Den fre 3 juni 2022 kl 10:58 skrev Marta Rybczynska <rybczynska@gmail.com>:

> Move the function to a library, it could be useful in other places.
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
> ---
>  meta/classes/cve-check.bbclass | 11 +++--------
>  meta/lib/oe/cve_check.py       | 10 ++++++++++
>  2 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> index c5c22c4c51..5eb0622d00 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -80,16 +80,10 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
>  # set to "alphabetical" for version using single alphabetical character
> as increment release
>  CVE_VERSION_SUFFIX ??= ""
>
> -def update_symlinks(target_path, link_path):
> -    if link_path != target_path and os.path.exists(target_path):
> -        if os.path.exists(os.path.realpath(link_path)):
> -            os.remove(link_path)
> -        os.symlink(os.path.basename(target_path), link_path)
> -
>  def generate_json_report(d, out_path, link_path):
>      if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
>          import json
> -        from oe.cve_check import cve_check_merge_jsons
> +        from oe.cve_check import cve_check_merge_jsons, update_symlinks
>
>          bb.note("Generating JSON CVE summary")
>          index_file = d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
> @@ -110,6 +104,7 @@ def generate_json_report(d, out_path, link_path):
>  python cve_save_summary_handler () {
>      import shutil
>      import datetime
> +    from oe.cve_check import update_symlinks
>
>      cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
>
> @@ -179,7 +174,7 @@ python cve_check_write_rootfs_manifest () {
>      import shutil
>      import json
>      from oe.rootfs import image_list_installed_packages
> -    from oe.cve_check import cve_check_merge_jsons
> +    from oe.cve_check import cve_check_merge_jsons, update_symlinks
>
>      if d.getVar("CVE_CHECK_COPY_FILES") == "1":
>          deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
> diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> index dc7d2e2826..aa06497727 100644
> --- a/meta/lib/oe/cve_check.py
> +++ b/meta/lib/oe/cve_check.py
> @@ -163,3 +163,13 @@ def cve_check_merge_jsons(output, data):
>              return
>
>      output["package"].append(data["package"][0])
> +
> +def update_symlinks(target_path, link_path):
> +    """
> +    Update a symbolic link link_path to point to target_path.
> +    Remove the link and recreate it if exist and is different.
> +    """
> +    if link_path != target_path and os.path.exists(target_path):
> +        if os.path.exists(os.path.realpath(link_path)):
> +            os.remove(link_path)
> +        os.symlink(os.path.basename(target_path), link_path)
> --
> 2.33.0
>
>

--00000000000086d53405e0992c6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">It&#39;s not specially related to cve_check, you could =
put it in lib/oe/utils.py or something like that perhaps?</div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></d=
iv><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-s=
erif">Regards</div><div class=3D"gmail_default" style=3D"font-family:arial,=
helvetica,sans-serif">//Ernst<br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Den fre 3 juni 2022 kl 10:58 skrev M=
arta Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com">rybczynska@gmai=
l.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">M=
ove the function to a library, it could be useful in other places.<br>
<br>
Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska@huaw=
ei.com" target=3D"_blank">marta.rybczynska@huawei.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/cve-check.bbclass | 11 +++--------<br>
=C2=A0meta/lib/oe/cve_check.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++++++++<br=
>
=C2=A02 files changed, 13 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s<br>
index c5c22c4c51..5eb0622d00 100644<br>
--- a/meta/classes/cve-check.bbclass<br>
+++ b/meta/classes/cve-check.bbclass<br>
@@ -80,16 +80,10 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D &quot;&quot;<br>
=C2=A0# set to &quot;alphabetical&quot; for version using single alphabetic=
al character as increment release<br>
=C2=A0CVE_VERSION_SUFFIX ??=3D &quot;&quot;<br>
<br>
-def update_symlinks(target_path, link_path):<br>
-=C2=A0 =C2=A0 if link_path !=3D target_path and os.path.exists(target_path=
):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(os.path.realpath(link_path))=
:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(link_path)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(os.path.basename(target_path), link=
_path)<br>
-<br>
=C2=A0def generate_json_report(d, out_path, link_path):<br>
=C2=A0 =C2=A0 =C2=A0if os.path.exists(d.getVar(&quot;CVE_CHECK_SUMMARY_INDE=
X_PATH&quot;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import json<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 from oe.cve_check import cve_check_merge_jsons=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 from oe.cve_check import cve_check_merge_jsons=
, update_symlinks<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;Generating JSON CVE summary=
&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index_file =3D d.getVar(&quot;CVE_CHECK_S=
UMMARY_INDEX_PATH&quot;)<br>
@@ -110,6 +104,7 @@ def generate_json_report(d, out_path, link_path):<br>
=C2=A0python cve_save_summary_handler () {<br>
=C2=A0 =C2=A0 =C2=A0import shutil<br>
=C2=A0 =C2=A0 =C2=A0import datetime<br>
+=C2=A0 =C2=A0 from oe.cve_check import update_symlinks<br>
<br>
=C2=A0 =C2=A0 =C2=A0cve_tmp_file =3D d.getVar(&quot;CVE_CHECK_TMP_FILE&quot=
;)<br>
<br>
@@ -179,7 +174,7 @@ python cve_check_write_rootfs_manifest () {<br>
=C2=A0 =C2=A0 =C2=A0import shutil<br>
=C2=A0 =C2=A0 =C2=A0import json<br>
=C2=A0 =C2=A0 =C2=A0from oe.rootfs import image_list_installed_packages<br>
-=C2=A0 =C2=A0 from oe.cve_check import cve_check_merge_jsons<br>
+=C2=A0 =C2=A0 from oe.cve_check import cve_check_merge_jsons, update_symli=
nks<br>
<br>
=C2=A0 =C2=A0 =C2=A0if d.getVar(&quot;CVE_CHECK_COPY_FILES&quot;) =3D=3D &q=
uot;1&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deploy_file =3D d.getVar(&quot;CVE_CHECK_=
RECIPE_FILE&quot;)<br>
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py<br>
index dc7d2e2826..aa06497727 100644<br>
--- a/meta/lib/oe/cve_check.py<br>
+++ b/meta/lib/oe/cve_check.py<br>
@@ -163,3 +163,13 @@ def cve_check_merge_jsons(output, data):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
<br>
=C2=A0 =C2=A0 =C2=A0output[&quot;package&quot;].append(data[&quot;package&q=
uot;][0])<br>
+<br>
+def update_symlinks(target_path, link_path):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Update a symbolic link link_path to point to target_path.<br=
>
+=C2=A0 =C2=A0 Remove the link and recreate it if exist and is different.<b=
r>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 if link_path !=3D target_path and os.path.exists(target_path=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(os.path.realpath(link_path))=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(link_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(os.path.basename(target_path), link=
_path)<br>
-- <br>
2.33.0<br>
<br>
</blockquote></div>

--00000000000086d53405e0992c6d--

