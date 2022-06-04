Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D244C43334
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 06:18:48 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web09.7581.1654323522428176013
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 23:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fdw2v6bh;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: ernstp@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id h72so1064064iof.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 23:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=27zrCJx1Y8+76mLakVpmgRtwSPt+J6InFKk7ZQTp7cs=;
        b=fdw2v6bhMv05pnsSXYEtHeV7nmgJhFTRNZGcef/IId+VwRANlULaw/DsM4Wcw9Fn67
         DfEsmvyyO0Vqa/AiAg/y0esa0MUiTV7A37ZaSZGbVBW+rFJ8oVySSHjpa+vdMdhMUcO6
         IM7iNb7OiM2zPAm/NXhyHr+xSRkNf+C07uMfskLE+6VLwTEtRY+vuCcBGAU9fA58Sf1A
         QdLvPdyoZ+iIWe6RkAfAYa7xonqqyFsKgqEjMFtOijHb/UM5InMnPjKrNWOlhyiU/nSC
         eDKSdYifxCvaNRH7QMh0IdHzICZNZtLPLMUzJ3NXlO9BSX6wh8RRJS6ecpBtfbl32B5Y
         fJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=27zrCJx1Y8+76mLakVpmgRtwSPt+J6InFKk7ZQTp7cs=;
        b=edw5y7mSmUKHrEqMt3fbCfjLRk87d2o+jtlZbVcM35GN0WOtqpFDKoTM51YA3c5bNC
         w3y2/vaS4EjN/eBc0g0VSxfrhWMKfWtMwnVyoF77eBtU+SZqqpQT7bBE4Ruo+xcUJKWt
         8R48nB+gBnI13kMQd7nqYlof8Chv8NIXgS7jd6VCUlKzGwOwPcHh0Wwg/Xg5uC9HGsUL
         0T1HYQt8xqccsqB8kJvqLr4gJ7xucHXnwQkW6mP3/gYuDhRS8YqENcpGPF8iw6GOWklA
         1mwrYwfeyL5l2eKTSzIgueF4BX3D9AjDgbe65AfXZ2j7j9qOUrTcWhRsfWbopp8ikTFt
         zNDg==
X-Gm-Message-State: AOAM533LAa56CagJ8OkSjLVj5lArXztYxTKbUYD+x2vRNBXZxiv7pq3y
	88emnvrtMf6jLH+BWwEx96ui5+iQCtRGefjPmms=
X-Google-Smtp-Source: 
 ABdhPJwkbneeDYw/CDE4TwhbH86SAcRrmIZvdwpZW5HabdjEZJdKYobIWTnqYh7PZnt7xie1M1r2SUSe8OHqUIouq/M=
X-Received: by 2002:a02:ac0b:0:b0:331:68c6:9dd2 with SMTP id
 a11-20020a02ac0b000000b0033168c69dd2mr856691jao.247.1654323521913; Fri, 03
 Jun 2022 23:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220603121710.2443242-1-rybczynska@gmail.com>
In-Reply-To: <20220603121710.2443242-1-rybczynska@gmail.com>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Sat, 4 Jun 2022 08:18:31 +0200
Message-ID: 
 <CAD=4a=WMxCgcutfnrNvGH=69T7rXpscbKJM9PMdFg9=Vf7fHFA@mail.gmail.com>
Subject: Re: [PATCH] cve-check: write empty fragment files in the text mode
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000de058005e09935a5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 06:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166546

--000000000000de058005e09935a5
Content-Type: text/plain; charset="UTF-8"

Den fre 3 juni 2022 kl 14:17 skrev Marta Rybczynska <rybczynska@gmail.com>:

> In the cve-check text mode output, we didn't write fragment
> files if there are no CVEs (if CVE_CHECK_REPORT_PATCHED is 1),
> or no unpached CVEs otherwise.
>
> However, in a system after multiple builds,
> cve_check_write_rootfs_manifest might find older files and use
> them as current, what leads to incorrect reporting.
>
> Fix it by always writing a fragment file, even if empty.
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
> ---
>  meta/classes/cve-check.bbclass | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> index c80a365819..0579d882db 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -440,23 +440,22 @@ def cve_write_data_text(d, patched, unpatched,
> ignored, cve_data):
>      if unpatched_cves and d.getVar("CVE_CHECK_SHOW_WARNINGS") == "1":
>          bb.warn("Found unpatched CVE (%s), for more information check %s"
> % (" ".join(unpatched_cves),cve_file))
>
> -    if write_string:
> -        with open(cve_file, "w") as f:
> -            bb.note("Writing file %s with CVE information" % cve_file)
> -            f.write(write_string)
> +    with open(cve_file, "w") as f:
> +        bb.note("Writing file %s with CVE information" % cve_file)
>

This note feels quite redundant now.


> +        f.write(write_string)
>
> -        if d.getVar("CVE_CHECK_COPY_FILES") == "1":
> -            deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
> -            bb.utils.mkdirhier(os.path.dirname(deploy_file))
> -            with open(deploy_file, "w") as f:
> -                f.write(write_string)
> +    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
> +        deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
> +        bb.utils.mkdirhier(os.path.dirname(deploy_file))
> +        with open(deploy_file, "w") as f:
> +            f.write(write_string)
>
> -        if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
> -            cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
> -            bb.utils.mkdirhier(cvelogpath)
> +    if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
> +        cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
> +        bb.utils.mkdirhier(cvelogpath)
>
> -            with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
> -                f.write("%s" % write_string)
> +        with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
> +            f.write("%s" % write_string)
>
>  def cve_check_write_json_output(d, output, direct_file, deploy_file,
> manifest_file):
>      """
> --
> 2.33.0
>
>

--000000000000de058005e09935a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif">Den fre 3 juni 2022 kl 14:17 skrev Mar=
ta Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com">rybczynska@gmail.=
com</a>&gt;:<br></div></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">In the cve-check text mode output, we didn&#3=
9;t write fragment<br>
files if there are no CVEs (if CVE_CHECK_REPORT_PATCHED is 1),<br>
or no unpached CVEs otherwise.<br>
<br>
However, in a system after multiple builds,<br>
cve_check_write_rootfs_manifest might find older files and use<br>
them as current, what leads to incorrect reporting.<br>
<br>
Fix it by always writing a fragment file, even if empty.<br>
<br>
Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska@huaw=
ei.com" target=3D"_blank">marta.rybczynska@huawei.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/cve-check.bbclass | 27 +++++++++++++--------------<br>
=C2=A01 file changed, 13 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s<br>
index c80a365819..0579d882db 100644<br>
--- a/meta/classes/cve-check.bbclass<br>
+++ b/meta/classes/cve-check.bbclass<br>
@@ -440,23 +440,22 @@ def cve_write_data_text(d, patched, unpatched, ignore=
d, cve_data):<br>
=C2=A0 =C2=A0 =C2=A0if unpatched_cves and d.getVar(&quot;CVE_CHECK_SHOW_WAR=
NINGS&quot;) =3D=3D &quot;1&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;Found unpatched CVE (%s), f=
or more information check %s&quot; % (&quot; &quot;.join(unpatched_cves),cv=
e_file))<br>
<br>
-=C2=A0 =C2=A0 if write_string:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(cve_file, &quot;w&quot;) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Writing file %s wi=
th CVE information&quot; % cve_file)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(write_string)<br>
+=C2=A0 =C2=A0 with open(cve_file, &quot;w&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Writing file %s with CVE informa=
tion&quot; % cve_file)<br></blockquote><div><br></div><div><div style=3D"fo=
nt-family:arial,helvetica,sans-serif" class=3D"gmail_default">This note fee=
ls quite redundant now.</div></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(write_string)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;CVE_CHECK_COPY_FILES&quot;) =
=3D=3D &quot;1&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deploy_file =3D d.getVar(&quot;C=
VE_CHECK_RECIPE_FILE&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(os.path.dirna=
me(deploy_file))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(deploy_file, &quot;w&q=
uot;) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(write_stri=
ng)<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;CVE_CHECK_COPY_FILES&quot;) =3D=3D &quot;1=
&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deploy_file =3D d.getVar(&quot;CVE_CHECK_RECIP=
E_FILE&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(os.path.dirname(deploy_file=
))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(deploy_file, &quot;w&quot;) as f:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(write_string)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;CVE_CHECK_CREATE_MANIFEST&qu=
ot;) =3D=3D &quot;1&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cvelogpath =3D d.getVar(&quot;CV=
E_CHECK_SUMMARY_DIR&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(cvelogpath)<b=
r>
+=C2=A0 =C2=A0 if d.getVar(&quot;CVE_CHECK_CREATE_MANIFEST&quot;) =3D=3D &q=
uot;1&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cvelogpath =3D d.getVar(&quot;CVE_CHECK_SUMMAR=
Y_DIR&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(cvelogpath)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(d.getVar(&quot;CVE_CHE=
CK_TMP_FILE&quot;), &quot;a&quot;) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;%s&q=
uot; % write_string)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(d.getVar(&quot;CVE_CHECK_TMP_FILE&qu=
ot;), &quot;a&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;%s&quot; % write_s=
tring)<br>
<br>
=C2=A0def cve_check_write_json_output(d, output, direct_file, deploy_file, =
manifest_file):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-- <br>
2.33.0<br>
<br>
</blockquote></div></div>

--000000000000de058005e09935a5--

