Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCECAC433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 09:08:47 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.8373.1651482521755991518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 02:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Clfe5DJM;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id x17so24186234lfa.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 02:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dCD3ojEGSjKIUXOW5usIbovdJqNer7PXIRkN3XtgTho=;
        b=Clfe5DJMF7dQLPSa8VNrnfgr1tuv64UHIVi+T9f2o+NvqyQq5VjWrRztCjLbi71mpQ
         /60z2xDrGU7QYPtUkHFibCK+hX+8j6LulTnmHMnmNyne0wuqiYCxZdlGbgF9XrtKuWu+
         GoojgCDQflXtp7VdanrN5xFT0bLMsPmod/SqsmP6kKxPlNpKnDMFlbjdqZ69N4JN9QA9
         Jm8w5oVU8wsCL1trd1TYvHTnwTJ157yaANYfAe67JuVaoZPGAPbNyzCw/JZ8wtC6qjS9
         RvVwQrquUv4nSlGrFkMaqiJObRW3Y4snn3T23wE9kWMckcv8nIKmV+r72mlcqhFQWNAD
         f3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dCD3ojEGSjKIUXOW5usIbovdJqNer7PXIRkN3XtgTho=;
        b=tHAYrqEeX6qGqgQwFShBIW6UxYXMZ/iWz7aZcCvimOgFzcCiRJ9RnV4680n0phszYE
         xinh7g1pDwo7nu7VQqbq9+iNr1y3AUsjMXOLnA27MVf0kh9Oexz6F6XMhc+3Ja6bArCN
         3GOggckJMwLiQU+zpiEpIrMDzWJswtxe1u4HO3EzoPOKHx9FgFEg3zV++tZUOYU9QULt
         3IOt//nRxoO5eAlYlj4XC2wd5jxa/XGBgof81XK7MIxKgKU3yg2tVgneqal1PR1gSwph
         dHPN/ULmiMusjxPfBCA9de1Eb+03s/Y07+39kPhOcvXksVpzzjLAF29Tp8tXbeCwZbam
         vOyQ==
X-Gm-Message-State: AOAM5315Eyu8tavGIezJ2Og9vsR9KPzJHnqXQVvCXy+SPT/m8aflDwP/
	8qg5eYLdGKRtjV7TXfC01DXGbjbObX3FUWkPK78=
X-Google-Smtp-Source: 
 ABdhPJxzR8r9BuuOvMo0FqvK9Gc/D69+Buh/O4BjUYvX+uWiJpS7TBtWeO9iRW3gPwQ5c417lTLqYoMqe7RY/kM4hlM=
X-Received: by 2002:ac2:5f6e:0:b0:472:4922:f610 with SMTP id
 c14-20020ac25f6e000000b004724922f610mr8243030lfc.555.1651482519956; Mon, 02
 May 2022 02:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220502074317.6470-1-davide.gardenal@huawei.com>
In-Reply-To: <20220502074317.6470-1-davide.gardenal@huawei.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 2 May 2022 10:08:28 +0100
Message-ID: 
 <CANPvuRk-V6T6m1xWgmw6JQu7QgV8AdeFPjj6Xe3UHRt-Wzsavw@mail.gmail.com>
Subject: Re: [OE-core] [master][kirkstone][PATCH] cve-check: add JSON format
 to summary output
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Davide Gardenal <davide.gardenal@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000f471ec05de03bcbb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 09:08:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165162

--000000000000f471ec05de03bcbb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Davide,

This patch needs to be sent first for the master branch and backported
for kirkstone only after that.

Jose

Davide Gardenal <davidegarde2000@gmail.com> escreveu no dia segunda,
2/05/2022 =C3=A0(s) 08:43:

> Create generate_json_report including all the code used to generate the
> JSON
> manifest file.
> Add to cve_save_summary_handler the ability to create the summary in JSON
> format.
>
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
>  meta/classes/cve-check.bbclass | 50 +++++++++++++-------
>  1 file changed, 32 insertions(+), 18 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> index 78516d0..64875d7 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -79,6 +79,29 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
>  # set to "alphabetical" for version using single alphabetical character
> as increment release
>  CVE_VERSION_SUFFIX ??=3D ""
>
> +def generate_json_report(out_path, link_path):
> +    if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
> +        import json
> +        from oe.cve_check import cve_check_merge_jsons
> +
> +        bb.note("Generating JSON CVE summary")
> +        index_file =3D d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
> +        summary =3D {"version":"1", "package": []}
> +        with open(index_file) as f:
> +            filename =3D f.readline()
> +            while filename:
> +                with open(filename.rstrip()) as j:
> +                    data =3D json.load(j)
> +                    cve_check_merge_jsons(summary, data)
> +                filename =3D f.readline()
> +
> +        with open(out_path, "w") as f:
> +            json.dump(summary, f, indent=3D2)
> +
> +        if os.path.exists(os.path.realpath(link_path)):
> +            os.remove(link_path)
> +        os.symlink(os.path.basename(out_path), link_path)
> +
>  python cve_save_summary_handler () {
>      import shutil
>      import datetime
> @@ -101,6 +124,11 @@ python cve_save_summary_handler () {
>              if os.path.exists(os.path.realpath(cvefile_link)):
>                  os.remove(cvefile_link)
>              os.symlink(os.path.basename(cve_summary_file), cvefile_link)
> +
> +        json_summary_link_name =3D os.path.join(cvelogpath,
> d.getVar("CVE_CHECK_SUMMARY_FILE_NAME_JSON"))
> +        json_summary_name =3D os.path.join(cvelogpath, "%s-%s.json" %
> (cve_summary_name, timestamp))
> +        generate_json_report(json_summary_name, json_summary_link_name)
> +        bb.plain("CVE report summary created at: %s" %
> json_summary_link_name)
>  }
>
>  addhandler cve_save_summary_handler
> @@ -175,25 +203,11 @@ python cve_check_write_rootfs_manifest () {
>              os.symlink(os.path.basename(manifest_name), manifest_link)
>              bb.plain("Image CVE report stored in: %s" % manifest_name)
>
> -    if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
> -        import json
> +        link_path =3D os.path.join(deploy_dir, "%s.json" % link_name)
> +        manifest_path =3D d.getVar("CVE_CHECK_MANIFEST_JSON")
>          bb.note("Generating JSON CVE manifest")
> -        deploy_dir =3D d.getVar("DEPLOY_DIR_IMAGE")
> -        link_name =3D d.getVar("IMAGE_LINK_NAME")
> -        manifest_name =3D d.getVar("CVE_CHECK_MANIFEST_JSON")
> -        index_file =3D d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
> -        manifest =3D {"version":"1", "package": []}
> -        with open(index_file) as f:
> -            filename =3D f.readline()
> -            while filename:
> -                with open(filename.rstrip()) as j:
> -                    data =3D json.load(j)
> -                    cve_check_merge_jsons(manifest, data)
> -                filename =3D f.readline()
> -
> -        with open(manifest_name, "w") as f:
> -            json.dump(manifest, f, indent=3D2)
> -        bb.plain("Image CVE report stored in: %s" % manifest_name)
> +        generate_json_report(json_summary_name, json_summary_link_name)
> +        bb.plain("Image CVE JSON report stored in: %s" % link_path)
>  }
>
>  ROOTFS_POSTPROCESS_COMMAND:prepend =3D
> "${@'cve_check_write_rootfs_manifest; ' if
> d.getVar('CVE_CHECK_CREATE_MANIFEST') =3D=3D '1' else ''}"
> --
> 2.32.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165160):
> https://lists.openembedded.org/g/openembedded-core/message/165160
> Mute This Topic: https://lists.openembedded.org/mt/90830880/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000f471ec05de03bcbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Davide,<div><br></div><div>This patch needs to be sent =
first for the master branch and backported for=C2=A0kirkstone only after th=
at.</div><div><br></div><div>Jose</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Davide Gardenal &lt;<a href=3D"mailt=
o:davidegarde2000@gmail.com">davidegarde2000@gmail.com</a>&gt; escreveu no =
dia segunda, 2/05/2022 =C3=A0(s) 08:43:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Create generate_json_report including all the code =
used to generate the JSON<br>
manifest file.<br>
Add to cve_save_summary_handler the ability to create the summary in JSON f=
ormat.<br>
<br>
Signed-off-by: Davide Gardenal &lt;<a href=3D"mailto:davide.gardenal@huawei=
.com" target=3D"_blank">davide.gardenal@huawei.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/cve-check.bbclass | 50 +++++++++++++-------<br>
=C2=A01 file changed, 32 insertions(+), 18 deletions(-)<br>
<br>
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s<br>
index 78516d0..64875d7 100644<br>
--- a/meta/classes/cve-check.bbclass<br>
+++ b/meta/classes/cve-check.bbclass<br>
@@ -79,6 +79,29 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D &quot;&quot;<br>
=C2=A0# set to &quot;alphabetical&quot; for version using single alphabetic=
al character as increment release<br>
=C2=A0CVE_VERSION_SUFFIX ??=3D &quot;&quot;<br>
<br>
+def generate_json_report(out_path, link_path):<br>
+=C2=A0 =C2=A0 if os.path.exists(d.getVar(&quot;CVE_CHECK_SUMMARY_INDEX_PAT=
H&quot;)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import json<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 from oe.cve_check import cve_check_merge_jsons=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Generating JSON CVE summary&quot=
;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 index_file =3D d.getVar(&quot;CVE_CHECK_SUMMAR=
Y_INDEX_PATH&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 summary =3D {&quot;version&quot;:&quot;1&quot;=
, &quot;package&quot;: []}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(index_file) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D f.readline()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while filename:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(filename=
.rstrip()) as j:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data=
 =3D json.load(j)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_=
check_merge_jsons(summary, data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D f.rea=
dline()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(out_path, &quot;w&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 json.dump(summary, f, indent=3D2=
)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(os.path.realpath(link_path))=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(link_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(os.path.basename(out_path), link_pa=
th)<br>
+<br>
=C2=A0python cve_save_summary_handler () {<br>
=C2=A0 =C2=A0 =C2=A0import shutil<br>
=C2=A0 =C2=A0 =C2=A0import datetime<br>
@@ -101,6 +124,11 @@ python cve_save_summary_handler () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(os.path.r=
ealpath(cvefile_link)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.remove(cve=
file_link)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symlink(os.path.basename=
(cve_summary_file), cvefile_link)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 json_summary_link_name =3D os.path.join(cvelog=
path, d.getVar(&quot;CVE_CHECK_SUMMARY_FILE_NAME_JSON&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 json_summary_name =3D os.path.join(cvelogpath,=
 &quot;%s-%s.json&quot; % (cve_summary_name, timestamp))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 generate_json_report(json_summary_name, json_s=
ummary_link_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.plain(&quot;CVE report summary created at: =
%s&quot; % json_summary_link_name)<br>
=C2=A0}<br>
<br>
=C2=A0addhandler cve_save_summary_handler<br>
@@ -175,25 +203,11 @@ python cve_check_write_rootfs_manifest () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symlink(os.path.basename=
(manifest_name), manifest_link)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.plain(&quot;Image CVE re=
port stored in: %s&quot; % manifest_name)<br>
<br>
-=C2=A0 =C2=A0 if os.path.exists(d.getVar(&quot;CVE_CHECK_SUMMARY_INDEX_PAT=
H&quot;)):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 import json<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 link_path =3D os.path.join(deploy_dir, &quot;%=
s.json&quot; % link_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifest_path =3D d.getVar(&quot;CVE_CHECK_MAN=
IFEST_JSON&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;Generating JSON CVE manifes=
t&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 deploy_dir =3D d.getVar(&quot;DEPLOY_DIR_IMAGE=
&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 link_name =3D d.getVar(&quot;IMAGE_LINK_NAME&q=
uot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifest_name =3D d.getVar(&quot;CVE_CHECK_MAN=
IFEST_JSON&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 index_file =3D d.getVar(&quot;CVE_CHECK_SUMMAR=
Y_INDEX_PATH&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifest =3D {&quot;version&quot;:&quot;1&quot=
;, &quot;package&quot;: []}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(index_file) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D f.readline()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while filename:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(filename=
.rstrip()) as j:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data=
 =3D json.load(j)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_=
check_merge_jsons(manifest, data)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D f.rea=
dline()<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(manifest_name, &quot;w&quot;) as f:<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 json.dump(manifest, f, indent=3D=
2)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.plain(&quot;Image CVE report stored in: %s&=
quot; % manifest_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 generate_json_report(json_summary_name, json_s=
ummary_link_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.plain(&quot;Image CVE JSON report stored in=
: %s&quot; % link_path)<br>
=C2=A0}<br>
<br>
=C2=A0ROOTFS_POSTPROCESS_COMMAND:prepend =3D &quot;${@&#39;cve_check_write_=
rootfs_manifest; &#39; if d.getVar(&#39;CVE_CHECK_CREATE_MANIFEST&#39;) =3D=
=3D &#39;1&#39; else &#39;&#39;}&quot;<br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#165160): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/165160" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/165160</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90830880/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90830880/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--000000000000f471ec05de03bcbb--

