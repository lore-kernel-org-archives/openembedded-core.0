Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343F9C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 14:19:57 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.11748.1637677195883118214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 06:19:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dF6wzhCX;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id p2so44011533uad.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 06:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=84pbeht+BAEY8o4HrH9RzmvCvmSqhzPYSVxIezRVFfE=;
        b=dF6wzhCXMkfPq7Krl3bFfVkOENeDwxbEMXIc+ImGYnMcX4NBaWpUWJWdxI3CKM9Qhs
         aq42k/PFwtR3Ow943RIWaaZirp3dLjPgdNzip2pkeui698fwChe86b+xV1AG09/70alK
         BZbVxWbttAxzv0WDiDfNqPd0BsMxnq/4akZq4OeWCRiDam5TiNM8J7GqWQFmWLODuCvE
         QXL7vM5xHgpJDkdSdX1/ZDfxTbf5cKGKyKXQLI9SOAZGuLCn5u5CrtFhBMdk70KolGUc
         AXiIqf9x8DBosGYbpT3DVq2jqAD3Xj1qezNsrcu0BcG79UF8nDxabJS8hT/G4j6V6Sa+
         o9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=84pbeht+BAEY8o4HrH9RzmvCvmSqhzPYSVxIezRVFfE=;
        b=WiiFIcqhwCEgqeBt4MRjSvIsI9SE8L0hTClpE8sY+fy3izJs2QyzuE5BpkZTswD6HI
         D8lR73h+gH+gvY2kHexFkggXvDbtNId6VTpISHbsGawG7VRFKDKocS6zoGCviNehEUPG
         dJqjbycvCIHXcNwV/VRinEXSio8YkO0FNgTvnGVfdQ8IBqISn6WRNblktBsGRT91jzbt
         Pg2nxxBPACUcd2oacAjTAW4DAhdAT0VMZhMjMQjFP7Mx1Jv495wKgGS19YLGlylgVEbB
         jQnt+wlrH82JidD7fJVdPywJyG0+DWQFHTc4rUSaBGY2UdwEBurDwBcCoxBWZOwt3RZ7
         ymmA==
X-Gm-Message-State: AOAM5315BrmKdq6BEGiI0++FEXN0IggV6ejPL0b7443ITOroIBqhNaYd
	HSAcHoIyYYn8yZdkmYQZmbwIhKKKsPVzTVoH+PE=
X-Google-Smtp-Source: 
 ABdhPJwhscYqNVFJRfvLHVjQFwdgKGxJKybNVUG1kTxqgGyhLcf3WsChQhJ4dqIrA/SWx1f5uKpswe1w8Z2BYXcALVU=
X-Received: by 2002:ab0:55ce:: with SMTP id w14mr9327572uaa.93.1637677194974;
 Tue, 23 Nov 2021 06:19:54 -0800 (PST)
MIME-Version: 1.0
References: <20211123135919.26315-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211123135919.26315-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Nov 2021 15:19:43 +0100
Message-ID: 
 <CANNYZj8gkU-BL1Z35H03cMmiqQ_V9z_hXT-GTpTh=wOZDX0Ggg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildhistory: Fix do_package race issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000769a7605d1756f8a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 14:19:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158608

--000000000000769a7605d1756f8a
Content-Type: text/plain; charset="UTF-8"

Thanks Richard, this should remove occasional false failures from AUH runs
:)

Alex

On Tue, 23 Nov 2021 at 14:59, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The buildhistory_list_pkg_files function uses data from do_package, not
> do_packagedata. Usally the two are restored together but it may see
> a half complete directory or other races issues depending on timing.
>
> Rework the function so that it uses the correct task dependencies. This
> should avoid races but means the data is only restored to buildhistory
> if the do_package or do_package_setscene tasks are restored.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/buildhistory.bbclass | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> index 64df432f136..daa96f3b63b 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -91,13 +91,19 @@ buildhistory_emit_sysroot() {
>  python buildhistory_emit_pkghistory() {
>      if d.getVar('BB_CURRENTTASK') in ['populate_sysroot',
> 'populate_sysroot_setscene']:
>          bb.build.exec_func("buildhistory_emit_sysroot", d)
> -
> -    if not d.getVar('BB_CURRENTTASK') in ['packagedata',
> 'packagedata_setscene']:
>          return 0
>
>      if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
>          return 0
>
> +    if d.getVar('BB_CURRENTTASK') in ['package', 'package_setscene']:
> +        # Create files-in-<package-name>.txt files containing a list of
> files of each recipe's package
> +        bb.build.exec_func("buildhistory_list_pkg_files", d)
> +        return 0
> +
> +    if not d.getVar('BB_CURRENTTASK') in ['packagedata',
> 'packagedata_setscene']:
> +        return 0
> +
>      import re
>      import json
>      import shlex
> @@ -319,8 +325,6 @@ python buildhistory_emit_pkghistory() {
>
>          write_pkghistory(pkginfo, d)
>
> -    # Create files-in-<package-name>.txt files containing a list of files
> of each recipe's package
> -    bb.build.exec_func("buildhistory_list_pkg_files", d)
>      oe.qa.exit_if_errors(d)
>  }
>
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158603):
> https://lists.openembedded.org/g/openembedded-core/message/158603
> Mute This Topic: https://lists.openembedded.org/mt/87258776/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000769a7605d1756f8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Richard, this should remove occasional false f=
ailures from AUH runs :)</div><div><br></div><div>Alex<br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 23 =
Nov 2021 at 14:59, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linu=
xfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">The buildhistory_list_pk=
g_files function uses data from do_package, not<br>
do_packagedata. Usally the two are restored together but it may see<br>
a half complete directory or other races issues depending on timing.<br>
<br>
Rework the function so that it uses the correct task dependencies. This<br>
should avoid races but means the data is only restored to buildhistory<br>
if the do_package or do_package_setscene tasks are restored.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/classes/buildhistory.bbclass | 12 ++++++++----<br>
=C2=A01 file changed, 8 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass<br>
index 64df432f136..daa96f3b63b 100644<br>
--- a/meta/classes/buildhistory.bbclass<br>
+++ b/meta/classes/buildhistory.bbclass<br>
@@ -91,13 +91,19 @@ buildhistory_emit_sysroot() {<br>
=C2=A0python buildhistory_emit_pkghistory() {<br>
=C2=A0 =C2=A0 =C2=A0if d.getVar(&#39;BB_CURRENTTASK&#39;) in [&#39;populate=
_sysroot&#39;, &#39;populate_sysroot_setscene&#39;]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func(&quot;buildhistory_emi=
t_sysroot&quot;, d)<br>
-<br>
-=C2=A0 =C2=A0 if not d.getVar(&#39;BB_CURRENTTASK&#39;) in [&#39;packageda=
ta&#39;, &#39;packagedata_setscene&#39;]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0<br>
<br>
=C2=A0 =C2=A0 =C2=A0if not &quot;package&quot; in (d.getVar(&#39;BUILDHISTO=
RY_FEATURES&#39;) or &quot;&quot;).split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0<br>
<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;BB_CURRENTTASK&#39;) in [&#39;package&#39;,=
 &#39;package_setscene&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create files-in-&lt;package-name&gt;.txt fil=
es containing a list of files of each recipe&#39;s package<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&quot;buildhistory_list_pkg=
_files&quot;, d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
+<br>
+=C2=A0 =C2=A0 if not d.getVar(&#39;BB_CURRENTTASK&#39;) in [&#39;packageda=
ta&#39;, &#39;packagedata_setscene&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
+<br>
=C2=A0 =C2=A0 =C2=A0import re<br>
=C2=A0 =C2=A0 =C2=A0import json<br>
=C2=A0 =C2=A0 =C2=A0import shlex<br>
@@ -319,8 +325,6 @@ python buildhistory_emit_pkghistory() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_pkghistory(pkginfo, d)<br>
<br>
-=C2=A0 =C2=A0 # Create files-in-&lt;package-name&gt;.txt files containing =
a list of files of each recipe&#39;s package<br>
-=C2=A0 =C2=A0 bb.build.exec_func(&quot;buildhistory_list_pkg_files&quot;, =
d)<br>
=C2=A0 =C2=A0 =C2=A0oe.qa.exit_if_errors(d)<br>
=C2=A0}<br>
<br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158603): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158603" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158603</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87258776/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87258776/1686489</a><br>
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

--000000000000769a7605d1756f8a--

