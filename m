Return-Path: <liu.ming50@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id C294C7823D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 14:32:01 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id y23so1438389qkb.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 07:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VmMYE8kq6FMeE+Vy/TfYv/P7jVg1jdTXg3pOAC0Al04=;
	b=ber/VrFppmfLIeaVEQVI5cLpS3Q7xUOHr92SmzoPCQJLVlfX3r5+MPQjfcmk//kYe9
	YO2+Eh+dtXR9Ifa/aqqNmpN0Z0u0H8xJFi9uAC8XJLhnAJUwGrLJlc3CQMe5YkAcrJQa
	gVKEt6fMSGQ8zB9VLJWvTR552vUA45W2rVITD1J6noz8UDtLU60OQozjk8N9vP0FaAp+
	gijnWaMTPm7tQBTvwcNFP5K5BXqH4DXHs0lzV/NjCCOvaR1eyEq0wVru0glG+kibDBH1
	sAG+o0XLYNqbKMfyZyMoYwvcOK1ugs7ZGkueew8S3tCyo0UhL4Aq5wXGhyN4Q7Gt34V+
	QjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VmMYE8kq6FMeE+Vy/TfYv/P7jVg1jdTXg3pOAC0Al04=;
	b=Tewwa5F6bLQ+QfVjdO8q8BN58Ew7QdWBynEcrbQcW1iOjqvmqatqm/P1uICfIozi2/
	5f6/wgwwvBDKwIh8gcimBQM8We8BOPUHdrGQSI5H4jEN9RT+lUwvdjhUMLKSeE864ES0
	B84dlkO8Ivtpy+K0leEIOMhNMgSrcRhzL/vGaywiuKf0iGmDOZZcq7gvjF6wAJD8UW8i
	DLEbnEipptiKhLWZJBTAAK6JDtX3fipkN+pRflsDAV03Qv5arG+b+wIarlltikSATKWl
	Lz64q0R/at+sAKIS/JNXh49MBon/jr7j7rKCmhsS6pgGqSFPtfcFLkP3OQe2QLAJLOaK
	9G0w==
X-Gm-Message-State: AMCzsaWq2louJT0fuDksSlobQfx+++yWiDbCL229ytoB/WxVAXrmun2U
	EqZehJ8SsoX12L+lX55OHwc/94/po/xAtf5q4Aw=
X-Google-Smtp-Source: ABhQp+TGPHf9FGrQNFlT7GnDQZrdZTExspYZZB85WwzlXtJolTkG2iQGvJ00LTvAX6z4TObYLwNg/sWnk+ouEpiyjj8=
X-Received: by 10.55.154.146 with SMTP id c140mr742938qke.131.1507818722674;
	Thu, 12 Oct 2017 07:32:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.34.196 with HTTP; Thu, 12 Oct 2017 07:32:02 -0700 (PDT)
In-Reply-To: <1506429076-9750-1-git-send-email-liu.ming50@gmail.com>
References: <1506429076-9750-1-git-send-email-liu.ming50@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 12 Oct 2017 16:32:02 +0200
Message-ID: <CALatG=5-sxdSD5Z3C4qkN3XH05prfGfBv38PJyAcoESFEMGJ0A@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: Re: [PATCH] image.bbclass: let do_image depend on do_populate_lic of EXTRA_IMAGEDEPENDS
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
X-List-Received-Date: Thu, 12 Oct 2017 14:32:01 -0000
Content-Type: multipart/alternative; boundary="94eb2c06fc2659ca8d055b5a6737"

--94eb2c06fc2659ca8d055b5a6737
Content-Type: text/plain; charset="UTF-8"

Ping, hi, maintainers, this issue is blocking our release, please kindly
help me review it and let me know if you think it's not correct.

//Ming Liu

2017-09-26 14:31 GMT+02:00 <liu.ming50@gmail.com>:

> From: Ming Liu <liu.ming50@gmail.com>
>
> The licenses of EXTRA_IMAGEDEPENDS recipes are being referenced in
> image postcommand write_deploy_manifest, but a dependency is missing
> between do_image and do_populate_lic of EXTRA_IMAGEDEPENDS recipes,
> this leads some license files not present when write_deploy_manifest
> runs, hence will cause build errors.
>
> Fixed by letting do_image depend on do_populate_lic of
> EXTRA_IMAGEDEPENDS recipes.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes/image.bbclass | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 0d14250..6bc4f04 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -145,14 +145,18 @@ IMAGE_TYPE_wic = "image_types_wic"
>  inherit ${IMAGE_TYPE_wic}
>
>  python () {
> +    def extraimage_getdepends(task):
> +        deps = ""
> +        for dep in (d.getVar('EXTRA_IMAGEDEPENDS') or "").split():
> +            deps += " %s:%s" % (dep, task)
> +        return deps
> +
> +    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_
> populate_lic'))
> +    d.appendVarFlag('do_image_complete', 'depends',
> extraimage_getdepends('do_populate_sysroot'))
> +
>      deps = " " + imagetypes_getdepends(d)
>      d.appendVarFlag('do_rootfs', 'depends', deps)
>
> -    deps = ""
> -    for dep in (d.getVar('EXTRA_IMAGEDEPENDS') or "").split():
> -        deps += " %s:do_populate_sysroot" % dep
> -    d.appendVarFlag('do_image_complete', 'depends', deps)
> -
>      #process IMAGE_FEATURES, we must do this before runtime_mapping_rename
>      #Check for replaces image features
>      features = set(oe.data.typed_value('IMAGE_FEATURES', d))
> --
> 2.7.4
>
>

--94eb2c06fc2659ca8d055b5a6737
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping, hi, maintainers, this issue is blocking our release,=
 please kindly help me review it and let me know if you think it&#39;s not =
correct.<div><br></div><div>//Ming Liu</div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">2017-09-26 14:31 GMT+02:00  <span dir=3D"l=
tr">&lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.ming5=
0@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Ming Li=
u &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gmail.com</a>&gt;<=
br>
<br>
The licenses of EXTRA_IMAGEDEPENDS recipes are being referenced in<br>
image postcommand write_deploy_manifest, but a dependency is missing<br>
between do_image and do_populate_lic of EXTRA_IMAGEDEPENDS recipes,<br>
this leads some license files not present when write_deploy_manifest<br>
runs, hence will cause build errors.<br>
<br>
Fixed by letting do_image depend on do_populate_lic of<br>
EXTRA_IMAGEDEPENDS recipes.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.min=
g50@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/image.bbclass | 14 +++++++++-----<br>
=C2=A01 file changed, 9 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<br>
index 0d14250..6bc4f04 100644<br>
--- a/meta/classes/image.bbclass<br>
+++ b/meta/classes/image.bbclass<br>
@@ -145,14 +145,18 @@ IMAGE_TYPE_wic =3D &quot;image_types_wic&quot;<br>
=C2=A0inherit ${IMAGE_TYPE_wic}<br>
<br>
=C2=A0python () {<br>
+=C2=A0 =C2=A0 def extraimage_getdepends(task):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deps =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dep in (d.getVar(&#39;EXTRA_IMAGEDEPENDS&#=
39;<wbr>) or &quot;&quot;).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps +=3D &quot; %s:%s&quot; % (=
dep, task)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return deps<br>
+<br>
+=C2=A0 =C2=A0 d.appendVarFlag(&#39;do_image&#39;, &#39;depends&#39;, extra=
image_getdepends(&#39;do_<wbr>populate_lic&#39;))<br>
+=C2=A0 =C2=A0 d.appendVarFlag(&#39;do_image_<wbr>complete&#39;, &#39;depen=
ds&#39;, extraimage_getdepends(&#39;do_<wbr>populate_sysroot&#39;))<br>
+<br>
=C2=A0 =C2=A0 =C2=A0deps =3D &quot; &quot; + imagetypes_getdepends(d)<br>
=C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_rootfs&#39;, &#39;depends&#39;,=
 deps)<br>
<br>
-=C2=A0 =C2=A0 deps =3D &quot;&quot;<br>
-=C2=A0 =C2=A0 for dep in (d.getVar(&#39;EXTRA_IMAGEDEPENDS&#39;<wbr>) or &=
quot;&quot;).split():<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 deps +=3D &quot; %s:do_populate_sysroot&quot; =
% dep<br>
-=C2=A0 =C2=A0 d.appendVarFlag(&#39;do_image_<wbr>complete&#39;, &#39;depen=
ds&#39;, deps)<br>
-<br>
=C2=A0 =C2=A0 =C2=A0#process IMAGE_FEATURES, we must do this before runtime=
_mapping_rename<br>
=C2=A0 =C2=A0 =C2=A0#Check for replaces image features<br>
=C2=A0 =C2=A0 =C2=A0features =3D set(oe.data.typed_value(&#39;<wbr>IMAGE_FE=
ATURES&#39;, d))<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c06fc2659ca8d055b5a6737--
