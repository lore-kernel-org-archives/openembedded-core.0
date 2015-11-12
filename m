Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 84EE277291
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:46:42 +0000 (UTC)
Received: by ioir85 with SMTP id r85so41194721ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=VmGssAUXXVpC1vL8Tq6K01G+nwAqDm5SYY73J1hhAM4=;
	b=QgUOW18wHUXORql/TUnEoRMVmAu1dqVXEpM33XMb5OkJF6WtExqhKE/3f06tOOPQmX
	xCj4XpPvb0MVWI5m0Y8W8J3TMp9tVuMDw9ZwFJUObnNA19wLSz+pS/nM2r9dlE5jQXbj
	BBqq0OTiJq5KgD9umN3dgJg/kBvu0yHfkafYZpTJGA264D3PoS6mPpkI08rgM2qao0Io
	Hf4LhTufshEjlaA8bx6BOXbv4WLSOuRDFYojYlJabO3BLSkiYnIejWbvMD8fU5R/2Sls
	IcHUPo3g0CotR2eEXqTKyNfatJm7lV/5HTT9bQBTxcOhgTmcdbXbHmM+bmR5nsDKJRYb
	m3jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=VmGssAUXXVpC1vL8Tq6K01G+nwAqDm5SYY73J1hhAM4=;
	b=HmRPNzl+vFq9usFHp6p4uP/t+jA6DqFNuxcvVKUI171T5zLw7Pc1KcfxjY7LBaARLc
	l8Go2u5uW2ie3YuCAxzYILKloq0+x60oBzPdVLMYn5kFKHmK4WcAqOgfJmqLWz+MdRbT
	LuxfC2MUIvdNHGqWkoSNF3INJA/j9lwXtP59QZxkKorNo75fLQNAiPxI+ALYT9KF19mk
	Mzmtsb+4Q+FNixUW0DdaQ8bO1wvHVXYqhtmRERksRDtvRL0s3K6c+NOcnQ6h38gVGhrK
	S5mn3LPJqYuhJgccSLna87iO11nunfb49p66qD8hixCgA5/oCaMV7IAkIeiAMOlqmqZX
	hnpA==
X-Received: by 10.107.38.70 with SMTP id m67mr19564044iom.98.1447372002922;
	Thu, 12 Nov 2015 15:46:42 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.93.7 with HTTP; Thu, 12 Nov 2015 15:46:23 -0800 (PST)
In-Reply-To: <0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
References: <cover.1447371041.git.chris_larson@mentor.com>
	<0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Thu, 12 Nov 2015 16:46:23 -0700
X-Google-Sender-Auth: xElM_zckYKqNZxFJzlxKzWsEIJg
Message-ID: <CABcZAN=d_jt6VwZ560X95Tt_=Mt-fEu1NO__+rJVvML0yy_E4A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/7] image_types: improve wks path specification
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
X-List-Received-Date: Thu, 12 Nov 2015 23:46:46 -0000
Content-Type: multipart/alternative; boundary=001a1140fe4017982a0524608ec1

--001a1140fe4017982a0524608ec1
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 12, 2015 at 4:40 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Hardcoding a full input path with zero flexibility goes against everything
> the
> Yocto Project is about. Rework it to let the user specify the wks base
> filename with WKS_FILE and it'll search the layers for the wks file and use
> it.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/classes/image_types.bbclass | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> index 5036919..431df3a 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -170,15 +170,23 @@ IMAGE_CMD_ubi () {
>
>  IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o
> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
>
> +WKS_FILE ?= "${FILE_DIRNAME}/${IMAGE_BASENAME}.${MACHINE}.wks"
> +WKS_FULL_PATH = "${@bb.utils.which('${WKS_SEARCH_PATH}', '${WKS_FILE}')
> if not os.path.isabs('${WKS_FILE}') else '${WKS_FILE}'}"
> +WKS_FULL_PATH[vardepvalue] = "${WKS_FULL_PATH}"
> +WKS_SEARCH_PATH ?= "${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l
> in '${BBLAYERS}'.split())}"
> +
>  IMAGE_CMD_wic () {
> -       out=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}
> -       wks=${FILE_DIRNAME}/${IMAGE_BASENAME}.${MACHINE}.wks
> -       [ -e $wks ] || wks=${FILE_DIRNAME}/${IMAGE_BASENAME}.wks
> -       [ -e $wks ] || bbfatal "Kiskstart file $wks doesn't exist"
> -       BUILDDIR=${TOPDIR} wic create $wks --vars
> ${STAGING_DIR_TARGET}/imgdata/ -e ${IMAGE_BASENAME} -o $out/
> -       mv $out/build/${IMAGE_BASENAME}*.direct $out.rootfs.wic
> -       rm -rf $out/
> +       out="${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}"
> +       wks="${WKS_FULL_PATH}"
> +       if [ ! -e "$wks" ]; then
> +               bbfatal "Kickstart file $wks doesn't exist"
> +       fi
> +
> +       BUILDDIR="${TOPDIR}" wic create "$wks" --vars
> "${STAGING_DIR_TARGET}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/"
> +       mv "$out/build/$(basename "${wks%.wks}")"*.direct "$out.rootfs.wic"
> +       rm -rf "$out/"
>  }
> +IMAGE_CMD_wic[file-checksums] += "${WKS_FULLPATH}"
>

Gah, I'll have to fix this and re-submit if needed, the varname is typoed,
missing _. Also, it might be worth excluding WKS_FULL_PATH from vardeps
entirely -- having to rerun the image build if a layer is moved isn't
ideal, and we already have it in file-checksums.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1140fe4017982a0524608ec1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 12, 2015 at 4:40 PM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2d1" class=
=3D"a3s" style=3D"overflow:hidden">From: Christopher Larson &lt;<a href=3D"=
mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
Hardcoding a full input path with zero flexibility goes against everything =
the<br>
Yocto Project is about. Rework it to let the user specify the wks base<br>
filename with WKS_FILE and it&#39;ll search the layers for the wks file and=
 use<br>
it.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/image_types.bbclass | 22 +++++++++++++++-------<br>
=C2=A01 file changed, 15 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class<br>
index 5036919..431df3a 100644<br>
--- a/meta/classes/image_types.bbclass<br>
+++ b/meta/classes/image_types.bbclass<br>
@@ -170,15 +170,23 @@ IMAGE_CMD_ubi () {<br>
<br>
=C2=A0IMAGE_CMD_ubifs =3D &quot;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_D=
IR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}&quot;<br>
<br>
+WKS_FILE ?=3D &quot;${FILE_DIRNAME}/${IMAGE_BASENAME}.${MACHINE}.wks&quot;=
<br>
+WKS_FULL_PATH =3D &quot;${@bb.utils.which(&#39;${WKS_SEARCH_PATH}&#39;, &#=
39;${WKS_FILE}&#39;) if not os.path.isabs(&#39;${WKS_FILE}&#39;) else &#39;=
${WKS_FILE}&#39;}&quot;<br>
+WKS_FULL_PATH[vardepvalue] =3D &quot;${WKS_FULL_PATH}&quot;<br>
+WKS_SEARCH_PATH ?=3D &quot;${@&#39;:&#39;.join(&#39;%s/scripts/lib/wic/can=
ned-wks&#39; % l for l in &#39;${BBLAYERS}&#39;.split())}&quot;<br>
+<br>
=C2=A0IMAGE_CMD_wic () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0out=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0wks=3D${FILE_DIRNAME}/${IMAGE_BASENAME}.${MACHI=
NE}.wks<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -e $wks ] || wks=3D${FILE_DIRNAME}/${IMAGE_BA=
SENAME}.wks<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -e $wks ] || bbfatal &quot;Kiskstart file $wk=
s doesn&#39;t exist&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILDDIR=3D${TOPDIR} wic create $wks --vars ${S=
TAGING_DIR_TARGET}/imgdata/ -e ${IMAGE_BASENAME} -o $out/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mv $out/build/${IMAGE_BASENAME}*.direct $out.ro=
otfs.wic<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf $out/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0out=3D&quot;${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}&q=
uot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wks=3D&quot;${WKS_FULL_PATH}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -e &quot;$wks&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;Kicks=
tart file $wks doesn&#39;t exist&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILDDIR=3D&quot;${TOPDIR}&quot; wic create &qu=
ot;$wks&quot; --vars &quot;${STAGING_DIR_TARGET}/imgdata/&quot; -e &quot;${=
IMAGE_BASENAME}&quot; -o &quot;$out/&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mv &quot;$out/build/$(basename &quot;${wks%.wks=
}&quot;)&quot;*.direct &quot;$out.rootfs.wic&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf &quot;$out/&quot;<br>
=C2=A0}<br>
+IMAGE_CMD_wic[file-checksums] +=3D &quot;${WKS_FULLPATH}&quot;</div></bloc=
kquote></div><br>Gah, I&#39;ll have to fix this and re-submit if needed, th=
e varname is typoed, missing _. Also, it might be worth excluding WKS_FULL_=
PATH from vardeps entirely -- having to rerun the image build if a layer is=
 moved isn&#39;t ideal, and we already have it in file-checksums.=C2=A0<br>=
-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<b=
r>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<b=
r>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div></di=
v>
</div></div>

--001a1140fe4017982a0524608ec1--
