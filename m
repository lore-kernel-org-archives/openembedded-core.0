Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B38C4708E
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 13:14:34 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web10.35217.1672665272205261962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 05:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B58Jo30m;
 spf=pass (domain: gmail.com, ip: 209.85.221.171, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id 6so13954171vkz.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 05:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ntbwfmcBrduORXK1/7jwIHI9xFpn7qt8vgM/M3Y3Aeg=;
        b=B58Jo30m3bQN2EslTCWGg2/GdQYTit7zKTkYK/kdO8nqVHF1kYivp11LYTNkfOcI7/
         vr+yqueIzctis7m1djtmgMBOfdNLir4hQnXbfIB8QtlWApK4gBcf9/hD8xBHfheBevMq
         6BdBImU+FnHNG4LmOSSNTKQmhUDslVMedX40I2nIhV8CS9jMw8s7BzTefS1P+Cpci7R9
         a1Wi2yWJ6/5cl8RSaxY63RnMC2jUIuUt3H91vFsFabPr+aBNpVzY+l+eD4/45brFjaul
         YVoPoKCnbUXYk1o7kKTW/Td1bqUnaaDatsYYM12CJ8jYA8wvTfYHy2ogEIqErVJkbmyY
         unMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntbwfmcBrduORXK1/7jwIHI9xFpn7qt8vgM/M3Y3Aeg=;
        b=LjEYnNn6TtoogKCiDGIYOzEAX3hDz97CL9H7LzGxTUewHkTA2zi4WxK3T9gdHyQ4RD
         qCPVehAYQ4mf2jCyh5e9KC0FGUDmXVHtYg3tiic5lODFH1d07z/3G94WKt6PQpefdIp0
         ZjwKYNYi5qJ2gv51wTlpOrdQ2Pv1ReD6T4ZYT0m4rgLRq+0jufrVqeM6K28iblJBgbH/
         qDK0Vf8yhwdc7e4ZSlpLm4o0DARopz5/kMr1SZkfm21ZFW/1L6++08IA7RKLGgZhx2nS
         pqjcJBMkhC+CdJVCV33hfxfWXDA9ff4gg/hZ8KQ/0qY1CZWVDfnRai6IiCQUItj9T98S
         dBNA==
X-Gm-Message-State: AFqh2krH9aVCIlfsQawRSnQQYtvlCD/qcOUgSFIeg29KS5lGdoa+y9E+
	BneH8QjakHQrMZHKK97URc1psnQLiKL2sRkJIvQ=
X-Google-Smtp-Source: AMrXdXvlS32UsfGnRyo8PtpgBbc7cRTgnJKRb6cgIlPkpiqDIJ0Uok6/8MgEAesNwINyBV6e8ojCCJi9iI59u8tF+nQ=
X-Received: by 2002:a1f:2696:0:b0:3ab:52b4:8c08 with SMTP id
 m144-20020a1f2696000000b003ab52b48c08mr4590790vkm.9.1672665271056; Mon, 02
 Jan 2023 05:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20230102070327.55373-1-rybczynska@gmail.com> <20230102070327.55373-2-rybczynska@gmail.com>
In-Reply-To: <20230102070327.55373-2-rybczynska@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 2 Jan 2023 13:14:20 +0000
Message-ID: <CANPvuRkzZFCYEFXpECrf3d1ea3tcCajMdQmz0r=x7-PyBgXNCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-update-db-native: avoid partial updates
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alberto Pianon <alberto@pianon.eu>, Marta Rybczynska <marta.rybczynska@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004f3fa505f147bba8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 13:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175315

--0000000000004f3fa505f147bba8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marta,

Marta Rybczynska <rybczynska@gmail.com> escreveu no dia segunda, 2/01/2023
=C3=A0(s) 07:03:

> The database update has been done on the original file. In case of
> network connection issues, temporary outage of the NVD server or
> a similar situation, the function could exit with incomplete data
> in the database. This patch solves the issue by performing the update
> on a copy of the database. It replaces the main one only if the whole
> update was successful.
>
> See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14929
>
> Reported-by: Alberto Pianon <alberto@pianon.eu>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@linaro.org>
> ---
>  .../recipes-core/meta/cve-update-db-native.bb | 81 +++++++++++++------
>  1 file changed, 56 insertions(+), 25 deletions(-)
>
> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb
> b/meta/recipes-core/meta/cve-update-db-native.bb
> index 642fda5395..89804b9e5c 100644
> --- a/meta/recipes-core/meta/cve-update-db-native.bb
> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> @@ -21,6 +21,8 @@ CVE_DB_UPDATE_INTERVAL ?=3D "86400"
>  # Timeout for blocking socket operations, such as the connection attempt=
.
>  CVE_SOCKET_TIMEOUT ?=3D "60"
>
> +CVE_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_DIR}/temp_nvdcve_1.1.db"
> +
>  python () {
>      if not bb.data.inherits_class("cve-check", d):
>          raise bb.parse.SkipRecipe("Skip recipe when cve-check class is
> not loaded.")
> @@ -32,19 +34,15 @@ python do_fetch() {
>      """
>      import bb.utils
>      import bb.progress
> -    import sqlite3, urllib, urllib.parse, gzip
> -    from datetime import date
> +    import shutil
>
>      bb.utils.export_proxies(d)
>
> -    YEAR_START =3D 2002
> -
>      db_file =3D d.getVar("CVE_CHECK_DB_FILE")
>      db_dir =3D os.path.dirname(db_file)
> +    db_tmp_file =3D d.getVar("CVE_DB_TEMP_FILE")
>
> -    cve_socket_timeout =3D int(d.getVar("CVE_SOCKET_TIMEOUT"))
> -
> -    cleanup_db_download(db_file)
> +    cleanup_db_download(db_file, db_tmp_file)
>
>      # The NVD database changes once a day, so no need to update more
> frequently
>      # Allow the user to force-update
> @@ -62,9 +60,55 @@ python do_fetch() {
>          pass
>
>      bb.utils.mkdirhier(db_dir)
> +    if os.path.exists(db_file):
> +        shutil.copy2(db_file, db_tmp_file)
> +
> +    if update_db_file(db_tmp_file, d) =3D=3D True:
> +        # Update downloaded correctly, can swap files
> +        shutil.move(db_tmp_file, db_file)
> +    else:
> +        # Update failed, do not modify the database
> +        bb.note("CVE database update failed")
> +        os.remove(db_tmp_file)
> +}
> +
> +do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_FILE_LOCK}"
> +do_fetch[file-checksums] =3D ""
> +do_fetch[vardeps] =3D ""
> +
> +def cleanup_db_download(db_file, db_tmp_file):
> +    """
> +    Cleanup the download space from possible failed downloads
> +    """
> +    if os.path.exists("{0}-journal".format(db_file)):
> +        # If a journal is present the last update might have been
> interrupted. In that case,
> +        # just wipe any leftovers and force the DB to be recreated.
> +        os.remove("{0}-journal".format(db_file))
> +
> +        if os.path.exists(db_file):
> +            os.remove(db_file)
> +
> +    if os.path.exists("{0}-journal".format(db_tmp_file)):
> +        # If a journal is present the last update might have been
> interrupted. In that case,
> +        # just wipe any leftovers and force the DB to be recreated.
> +        os.remove("{0}-journal".format(db_tmp_file))
> +
> +    if os.path.exists(db_tmp_file):
> +        os.remove(db_tmp_file)
> +
>

It seems to me that this function is a duplication of the old version with
an extra argument.
So I think that using the old function version and call it with the proper
argument does the same:

cleanup_db_download(db_file)
cleanup_db_download(db_tmp_file)

Jose


> +def update_db_file(db_tmp_file, d):
> +    """
> +    Update the given database file
> +    """
> +    import bb.utils, bb.progress
> +    from datetime import date
> +    import urllib, gzip, sqlite3
> +
> +    YEAR_START =3D 2002
> +    cve_socket_timeout =3D int(d.getVar("CVE_SOCKET_TIMEOUT"))
>
>      # Connect to database
> -    conn =3D sqlite3.connect(db_file)
> +    conn =3D sqlite3.connect(db_tmp_file)
>      initialize_db(conn)
>
>      with bb.progress.ProgressHandler(d) as ph,
> open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
> @@ -82,7 +126,7 @@ python do_fetch() {
>              except urllib.error.URLError as e:
>                  cve_f.write('Warning: CVE db update error, Unable to
> fetch CVE data.\n\n')
>                  bb.warn("Failed to fetch CVE data (%s)" % e.reason)
> -                return
> +                return False
>
>              if response:
>                  for l in response.read().decode("utf-8").splitlines():
> @@ -92,7 +136,7 @@ python do_fetch() {
>                          break
>                  else:
>                      bb.warn("Cannot parse CVE metadata, update failed")
> -                    return
> +                    return False
>
>              # Compare with current db last modified date
>              cursor =3D conn.execute("select DATE from META where YEAR =
=3D ?",
> (year,))
> @@ -113,7 +157,7 @@ python do_fetch() {
>                  except urllib.error.URLError as e:
>                      cve_f.write('Warning: CVE db update error, CVE data
> is outdated.\n\n')
>                      bb.warn("Cannot parse CVE data (%s), update failed" =
%
> e.reason)
> -                    return
> +                    return False
>              else:
>                  bb.debug(2, "Already up to date (last modified %s)" %
> last_modified)
>              # Update success, set the date to cve_check file.
> @@ -122,20 +166,7 @@ python do_fetch() {
>
>          conn.commit()
>          conn.close()
> -}
> -
> -do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_FILE_LOCK}"
> -do_fetch[file-checksums] =3D ""
> -do_fetch[vardeps] =3D ""
> -
> -def cleanup_db_download(db_file):
> -    if os.path.exists("{0}-journal".format(db_file)):
> -        # If a journal is present the last update might have been
> interrupted. In that case,
> -        # just wipe any leftovers and force the DB to be recreated.
> -        os.remove("{0}-journal".format(db_file))
> -
> -        if os.path.exists(db_file):
> -            os.remove(db_file)
> +        return True
>
>  def initialize_db(conn):
>      with conn:
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175314):
> https://lists.openembedded.org/g/openembedded-core/message/175314
> Mute This Topic: https://lists.openembedded.org/mt/96002809/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000004f3fa505f147bba8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Marta,</div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Marta Rybczynska &lt;<a hre=
f=3D"mailto:rybczynska@gmail.com">rybczynska@gmail.com</a>&gt; escreveu no =
dia segunda, 2/01/2023 =C3=A0(s) 07:03:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">The database update has been done on the original f=
ile. In case of<br>
network connection issues, temporary outage of the NVD server or<br>
a similar situation, the function could exit with incomplete data<br>
in the database. This patch solves the issue by performing the update<br>
on a copy of the database. It replaces the main one only if the whole<br>
update was successful.<br>
<br>
See <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14929" r=
el=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_=
bug.cgi?id=3D14929</a><br>
<br>
Reported-by: Alberto Pianon &lt;<a href=3D"mailto:alberto@pianon.eu" target=
=3D"_blank">alberto@pianon.eu</a>&gt;<br>
Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska@lina=
ro.org" target=3D"_blank">marta.rybczynska@linaro.org</a>&gt;<br>
---<br>
=C2=A0.../recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=
=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a> | 81 ++++++++=
+++++------<br>
=C2=A01 file changed, 56 insertions(+), 25 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-db-native.=
bb" rel=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a> b/meta=
/recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=3D"norefe=
rrer" target=3D"_blank">cve-update-db-native.bb</a><br>
index 642fda5395..89804b9e5c 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=
=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=
=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a><br>
@@ -21,6 +21,8 @@ CVE_DB_UPDATE_INTERVAL ?=3D &quot;86400&quot;<br>
=C2=A0# Timeout for blocking socket operations, such as the connection atte=
mpt.<br>
=C2=A0CVE_SOCKET_TIMEOUT ?=3D &quot;60&quot;<br>
<br>
+CVE_DB_TEMP_FILE ?=3D &quot;${CVE_CHECK_DB_DIR}/temp_nvdcve_1.1.db&quot;<b=
r>
+<br>
=C2=A0python () {<br>
=C2=A0 =C2=A0 =C2=A0if not bb.data.inherits_class(&quot;cve-check&quot;, d)=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipRecipe(&quot;Skip reci=
pe when cve-check class is not loaded.&quot;)<br>
@@ -32,19 +34,15 @@ python do_fetch() {<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0import bb.utils<br>
=C2=A0 =C2=A0 =C2=A0import bb.progress<br>
-=C2=A0 =C2=A0 import sqlite3, urllib, urllib.parse, gzip<br>
-=C2=A0 =C2=A0 from datetime import date<br>
+=C2=A0 =C2=A0 import shutil<br>
<br>
=C2=A0 =C2=A0 =C2=A0bb.utils.export_proxies(d)<br>
<br>
-=C2=A0 =C2=A0 YEAR_START =3D 2002<br>
-<br>
=C2=A0 =C2=A0 =C2=A0db_file =3D d.getVar(&quot;CVE_CHECK_DB_FILE&quot;)<br>
=C2=A0 =C2=A0 =C2=A0db_dir =3D os.path.dirname(db_file)<br>
+=C2=A0 =C2=A0 db_tmp_file =3D d.getVar(&quot;CVE_DB_TEMP_FILE&quot;)<br>
<br>
-=C2=A0 =C2=A0 cve_socket_timeout =3D int(d.getVar(&quot;CVE_SOCKET_TIMEOUT=
&quot;))<br>
-<br>
-=C2=A0 =C2=A0 cleanup_db_download(db_file)<br>
+=C2=A0 =C2=A0 cleanup_db_download(db_file, db_tmp_file)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# The NVD database changes once a day, so no need to up=
date more frequently<br>
=C2=A0 =C2=A0 =C2=A0# Allow the user to force-update<br>
@@ -62,9 +60,55 @@ python do_fetch() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
<br>
=C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(db_dir)<br>
+=C2=A0 =C2=A0 if os.path.exists(db_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy2(db_file, db_tmp_file)<br>
+<br>
+=C2=A0 =C2=A0 if update_db_file(db_tmp_file, d) =3D=3D True:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Update downloaded correctly, can swap files<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.move(db_tmp_file, db_file)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Update failed, do not modify the database<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;CVE database update failed&quot;=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(db_tmp_file)<br>
+}<br>
+<br>
+do_fetch[lockfiles] +=3D &quot;${CVE_CHECK_DB_FILE_LOCK}&quot;<br>
+do_fetch[file-checksums] =3D &quot;&quot;<br>
+do_fetch[vardeps] =3D &quot;&quot;<br>
+<br>
+def cleanup_db_download(db_file, db_tmp_file):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Cleanup the download space from possible failed downloads<br=
>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 if os.path.exists(&quot;{0}-journal&quot;.format(db_file)):<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If a journal is present the last update migh=
t have been interrupted. In that case,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # just wipe any leftovers and force the DB to =
be recreated.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(&quot;{0}-journal&quot;.format(db_fi=
le))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(db_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(db_file)<br>
+<br>
+=C2=A0 =C2=A0 if os.path.exists(&quot;{0}-journal&quot;.format(db_tmp_file=
)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If a journal is present the last update migh=
t have been interrupted. In that case,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # just wipe any leftovers and force the DB to =
be recreated.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(&quot;{0}-journal&quot;.format(db_tm=
p_file))<br>
+<br>
+=C2=A0 =C2=A0 if os.path.exists(db_tmp_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(db_tmp_file)<br>
+<br></blockquote><div><br></div><div>It seems to me that this function is =
a duplication of the old version with an extra argument.</div><div>So I thi=
nk that using the old function version and call it with the proper argument=
 does the same:</div><div><br><span style=3D"color:rgb(0,0,0)">cleanup_db_d=
ownload(db_file)</span><br></div><div><span style=3D"color:rgb(0,0,0)">clea=
nup_db_download(db_tmp_file)</span><br></div><div class=3D"gmail_quote"><br=
></div>Jose<br class=3D"gmail-Apple-interchange-newline"><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
+def update_db_file(db_tmp_file, d):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Update the given database file<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 import bb.utils, bb.progress<br>
+=C2=A0 =C2=A0 from datetime import date<br>
+=C2=A0 =C2=A0 import urllib, gzip, sqlite3<br>
+<br>
+=C2=A0 =C2=A0 YEAR_START =3D 2002<br>
+=C2=A0 =C2=A0 cve_socket_timeout =3D int(d.getVar(&quot;CVE_SOCKET_TIMEOUT=
&quot;))<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Connect to database<br>
-=C2=A0 =C2=A0 conn =3D sqlite3.connect(db_file)<br>
+=C2=A0 =C2=A0 conn =3D sqlite3.connect(db_tmp_file)<br>
=C2=A0 =C2=A0 =C2=A0initialize_db(conn)<br>
<br>
=C2=A0 =C2=A0 =C2=A0with bb.progress.ProgressHandler(d) as ph, open(os.path=
.join(d.getVar(&quot;TMPDIR&quot;), &#39;cve_check&#39;), &#39;a&#39;) as c=
ve_f:<br>
@@ -82,7 +126,7 @@ python do_fetch() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except urllib.error.URLErro=
r as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cve_f.write(&=
#39;Warning: CVE db update error, Unable to fetch CVE data.\n\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot=
;Failed to fetch CVE data (%s)&quot; % e.reason)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if response:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for l in resp=
onse.read().decode(&quot;utf-8&quot;).splitlines():<br>
@@ -92,7 +136,7 @@ python do_fetch() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0break<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bb.warn(&quot;Cannot parse CVE metadata, update failed&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn False<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Compare with current db l=
ast modified date<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cursor =3D conn.execute(&qu=
ot;select DATE from META where YEAR =3D ?&quot;, (year,))<br>
@@ -113,7 +157,7 @@ python do_fetch() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except urllib=
.error.URLError as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cve_f.write(&#39;Warning: CVE db update error, CVE data is outdated.\n\n=
&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bb.warn(&quot;Cannot parse CVE data (%s), update failed&quot; % e.reason=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn False<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.debug(2, &=
quot;Already up to date (last modified %s)&quot; % last_modified)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Update success, set the d=
ate to cve_check file.<br>
@@ -122,20 +166,7 @@ python do_fetch() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0conn.commit()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0conn.close()<br>
-}<br>
-<br>
-do_fetch[lockfiles] +=3D &quot;${CVE_CHECK_DB_FILE_LOCK}&quot;<br>
-do_fetch[file-checksums] =3D &quot;&quot;<br>
-do_fetch[vardeps] =3D &quot;&quot;<br>
-<br>
-def cleanup_db_download(db_file):<br>
-=C2=A0 =C2=A0 if os.path.exists(&quot;{0}-journal&quot;.format(db_file)):<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If a journal is present the last update migh=
t have been interrupted. In that case,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # just wipe any leftovers and force the DB to =
be recreated.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(&quot;{0}-journal&quot;.format(db_fi=
le))<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(db_file):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(db_file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return True<br>
<br>
=C2=A0def initialize_db(conn):<br>
=C2=A0 =C2=A0 =C2=A0with conn:<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175314): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175314" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175314</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96002809/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96002809/5052612</a><br>
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
 Quaresma</div></div></div></div>

--0000000000004f3fa505f147bba8--

