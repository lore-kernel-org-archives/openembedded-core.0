Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D58EB64DC
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 13:42:14 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.8313.1687786925796193074
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 06:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=Wr5vF03K;
 spf=pass (domain: mvista.com, ip: 209.85.167.48, mailfrom: vkumbhar@mvista.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f6283d0d84so4428931e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687786924; x=1690378924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DkVQlaiAfJd0rRVVYEknPlqkWvcKECETPIWezhBHCro=;
        b=Wr5vF03Kl6Bog6tIEVGXYRkrGAruId2fSHonk4bnbr9Zhag+ncrUll51VPword0F14
         WZmEMn4Hd/d/geCKK1xxG2kgm4tXd2AMcMZRxR/ACFarCRpH4+1/RwBOrAdvd9mDE3cw
         sHnyxgyIYsuG/fjcouKRVFZUcPdz4hH336UHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687786924; x=1690378924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkVQlaiAfJd0rRVVYEknPlqkWvcKECETPIWezhBHCro=;
        b=JgCuLc+RCPH298XCSpUpypxLpRHTC8656Haeu8ARjV88Hm0GiiS0XZUoKDJUcg6Ypj
         qZUpnwoIn1jyYQnSAQ6NTyq+RtgnekN7UD3mMQgQBzHW3kJlpGHBuCABXunfUNn3kRQG
         TP6oUEkhTULKdTOe66MnnIliZ6fZQvyrjICFLOs4frPrOqjNuebiiNxR+TdRYuxPUr9s
         oNChlvr+rj1emkZI4vDtmkBfogZ+1tpe8Hap8wXqp1fahm9jPCfBTVnMNbo3OyFPqCmx
         Sk0QNayfIHJEXOVSNSZulkO4VIFcvcvOwBZEIGmXi1nSIbNMa7Vrod2MWqwTFk7e0dpc
         CilQ==
X-Gm-Message-State: AC+VfDz2QT7xqkf9U+9KXM/cUQmXPTf79Y76Cwd8EQ34kciNVg9aa1M9
	gQL/8w1xWxbfxGKeyFhVjVtq0bwdx9VCAHPc+q9J9w==
X-Google-Smtp-Source: ACHHUZ6TbB0T9OG6dT3ELnlwmPB9CJMXfX1vJ5Oe3/uRP4YxfS0qEuupZ9yPnzyEeozJeuDstm9NGgdmHARXi6ihsCw=
X-Received: by 2002:a05:6512:b08:b0:4f7:6966:36fb with SMTP id
 w8-20020a0565120b0800b004f7696636fbmr19133507lfu.12.1687786923529; Mon, 26
 Jun 2023 06:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230623051913.843560-1-vkumbhar@mvista.com> <CH3PR05MB938888DFAA8F20B852C7396AF423A@CH3PR05MB9388.namprd05.prod.outlook.com>
In-Reply-To: <CH3PR05MB938888DFAA8F20B852C7396AF423A@CH3PR05MB9388.namprd05.prod.outlook.com>
From: Vivek Kumbhar <vkumbhar@mvista.com>
Date: Mon, 26 Jun 2023 19:11:52 +0530
Message-ID: <CAPun1rG4oT2VxZciSA5j6GkkDb6TiVe1Y46mbNhGJDsCqR54NA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] libcap: CVE-2023-2603 Integer
 Overflow in _libcap_strdup()
To: Russ Dill <russ.dill@nikolamotor.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000008a9d705ff08842a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 13:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183419

--00000000000008a9d705ff08842a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Russ pointing out this issue, modified patch v2 has been sent for
review.

Kind Regards,
Vivek

On Sat, Jun 24, 2023 at 2:09=E2=80=AFAM Russ Dill <russ.dill@nikolamotor.co=
m> wrote:

> Due to a space in the URL the backport resolves to the wrong patch (HEAD)
> which is included rather than the one actually at
>
> https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=3D422bec=
25ae4a1ab03fd4d6f728695ed279173b18
> ------------------------------
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> on behalf of vkumbhar via
> lists.openembedded.org <vkumbhar=3Dmvista.com@lists.openembedded.org>
> *Sent:* Thursday, June 22, 2023 10:19 PM
> *To:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Cc:* Vivek Kumbhar <vkumbhar@mvista.com>
> *Subject:* [OE-core][kirkstone][PATCH] libcap: CVE-2023-2603 Integer
> Overflow in _libcap_strdup()
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../libcap/files/CVE-2023-2603.patch          | 31 +++++++++++++++++++
>  meta/recipes-support/libcap/libcap_2.66.bb    |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-support/libcap/files/CVE-2023-2603.patch
>
> diff --git a/meta/recipes-support/libcap/files/CVE-2023-2603.patch
> b/meta/recipes-support/libcap/files/CVE-2023-2603.patch
> new file mode 100644
> index 0000000000..c5ecb70896
> --- /dev/null
> +++ b/meta/recipes-support/libcap/files/CVE-2023-2603.patch
> @@ -0,0 +1,31 @@
> +From 8785077d6c69482a2814a2f771aaada2f6ea1894 Mon Sep 17 00:00:00 2001
> +From: "Andrew G. Morgan" <morgan@kernel.org>
> +Date: Wed, 24 May 2023 06:55:47 -0700
> +Subject: Tidy up the overview example for the "cap" package.
> +
> +Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
> +
> +Upstream-Status: Backport [
> https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?%20id=3D422=
bec25ae4a1ab03fd4d6f728695ed279173b18
> ]
> +CVE: CVE-2023-2603
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + cap/cap.go | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/cap/cap.go b/cap/cap.go
> +index 784bf65..df32436 100644
> +--- a/cap/cap.go
> ++++ b/cap/cap.go
> +@@ -17,7 +17,8 @@
> + //
> + //   // Read and display the capabilities of the running process
> + //   c :=3D cap.GetProc()
> +-//   log.Printf("this process has these caps:", c)
> ++//   iab :=3D cap.IABGetProc()
> ++//   log.Printf("this process has these caps: %q [%v]", c, iab)
> + //
> + //   // Drop any privilege a process might have (including for root,
> + //   // but note root 'owns' a lot of system files so a cap-limited
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/libcap/libcap_2.66.bb
> b/meta/recipes-support/libcap/libcap_2.66.bb
> index c50e9d8cc7..844ae58506 100644
> --- a/meta/recipes-support/libcap/libcap_2.66.bb
> +++ b/meta/recipes-support/libcap/libcap_2.66.bb
> @@ -19,6 +19,7 @@ SRC_URI =3D
> "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
>             "
>  SRC_URI:append:class-nativesdk =3D " \
>
> file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
> +           file://CVE-2023-2603.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "15c40ededb3003d70a283fe587a36b7d19c8b3b554e33f86129c059a4bb466b2"
>
> --
> 2.25.1
>
>

--00000000000008a9d705ff08842a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Russ pointing out this issue, modified patch v2 has=
 been sent for review.<div><br></div><div>Kind Regards,</div><div>Vivek=C2=
=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Sat, Jun 24, 2023 at 2:09=E2=80=AFAM Russ Dill &lt;<a href=3D"m=
ailto:russ.dill@nikolamotor.com">russ.dill@nikolamotor.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg=
-1308002887344624322">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Due to a space in the URL the backport resolves to the wrong patch (HEAD) w=
hich is included rather than the one actually at</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<a href=3D"https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=
=3D422bec25ae4a1ab03fd4d6f728695ed279173b18" id=3D"m_-1308002887344624322LP=
lnk651427" target=3D"_blank">https://git.kernel.org/pub/scm/libs/libcap/lib=
cap.git/commit/?id=3D422bec25ae4a1ab03fd4d6f728695ed279173b18</a><br>
</div>
<div id=3D"m_-1308002887344624322appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-1308002887344624322divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b>=
 <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_bla=
nk">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:open=
embedded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@l=
ists.openembedded.org</a>&gt; on behalf of vkumbhar via <a href=3D"http://l=
ists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;vku=
mbhar=3D<a href=3D"mailto:mvista.com@lists.openembedded.org" target=3D"_bla=
nk">mvista.com@lists.openembedded.org</a>&gt;<br>
<b>Sent:</b> Thursday, June 22, 2023 10:19 PM<br>
<b>To:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt;<br>
<b>Cc:</b> Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com" target=
=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
<b>Subject:</b> [OE-core][kirkstone][PATCH] libcap: CVE-2023-2603 Integer O=
verflow in _libcap_strdup()</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com=
" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../libcap/files/CVE-2023-2603.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 31 +++++++++++++++++++<br>
=C2=A0meta/recipes-support/libcap/<a href=3D"http://libcap_2.66.bb" target=
=3D"_blank">libcap_2.66.bb</a>=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 32 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/libcap/files/CVE-2023-2603.pa=
tch<br>
<br>
diff --git a/meta/recipes-support/libcap/files/CVE-2023-2603.patch b/meta/r=
ecipes-support/libcap/files/CVE-2023-2603.patch<br>
new file mode 100644<br>
index 0000000000..c5ecb70896<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libcap/files/CVE-2023-2603.patch<br>
@@ -0,0 +1,31 @@<br>
+From 8785077d6c69482a2814a2f771aaada2f6ea1894 Mon Sep 17 00:00:00 2001<br>
+From: &quot;Andrew G. Morgan&quot; &lt;<a href=3D"mailto:morgan@kernel.org=
" target=3D"_blank">morgan@kernel.org</a>&gt;<br>
+Date: Wed, 24 May 2023 06:55:47 -0700<br>
+Subject: Tidy up the overview example for the &quot;cap&quot; package.<br>
+<br>
+Signed-off-by: Andrew G. Morgan &lt;<a href=3D"mailto:morgan@kernel.org" t=
arget=3D"_blank">morgan@kernel.org</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://git.kernel.org/pub/scm/libs/=
libcap/libcap.git/commit/?%20id=3D422bec25ae4a1ab03fd4d6f728695ed279173b18"=
 target=3D"_blank">https://git.kernel.org/pub/scm/libs/libcap/libcap.git/co=
mmit/?%20id=3D422bec25ae4a1ab03fd4d6f728695ed279173b18</a>]<br>
+CVE: CVE-2023-2603<br>
+Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com" ta=
rget=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
+---<br>
+ cap/cap.go | 3 ++-<br>
+ 1 file changed, 2 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/cap/cap.go b/cap/cap.go<br>
+index 784bf65..df32436 100644<br>
+--- a/cap/cap.go<br>
++++ b/cap/cap.go<br>
+@@ -17,7 +17,8 @@<br>
+ //<br>
+ //=C2=A0=C2=A0 // Read and display the capabilities of the running proces=
s<br>
+ //=C2=A0=C2=A0 c :=3D cap.GetProc()<br>
+-//=C2=A0=C2=A0 log.Printf(&quot;this process has these caps:&quot;, c)<br=
>
++//=C2=A0=C2=A0 iab :=3D cap.IABGetProc()<br>
++//=C2=A0=C2=A0 log.Printf(&quot;this process has these caps: %q [%v]&quot=
;, c, iab)<br>
+ //<br>
+ //=C2=A0=C2=A0 // Drop any privilege a process might have (including for =
root,<br>
+ //=C2=A0=C2=A0 // but note root &#39;owns&#39; a lot of system files so a=
 cap-limited<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-support/libcap/<a href=3D"http://libcap_2.66.bb" =
target=3D"_blank">libcap_2.66.bb</a> b/meta/recipes-support/libcap/<a href=
=3D"http://libcap_2.66.bb" target=3D"_blank">libcap_2.66.bb</a><br>
index c50e9d8cc7..844ae58506 100644<br>
--- a/meta/recipes-support/libcap/<a href=3D"http://libcap_2.66.bb" target=
=3D"_blank">libcap_2.66.bb</a><br>
+++ b/meta/recipes-support/libcap/<a href=3D"http://libcap_2.66.bb" target=
=3D"_blank">libcap_2.66.bb</a><br>
@@ -19,6 +19,7 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/libs/security=
/linux-privs/${BPN}2/${BPN}-${<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;<b=
r>
=C2=A0SRC_URI:append:class-nativesdk =3D &quot; \<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>
file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch</a> =
\<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>file://CVE=
-2023-2603.patch</a> \<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;<b=
r>
=C2=A0SRC_URI[sha256sum] =3D &quot;15c40ededb3003d70a283fe587a36b7d19c8b3b5=
54e33f86129c059a4bb466b2&quot;<br>
=C2=A0<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>

</div></blockquote></div>

--00000000000008a9d705ff08842a--

