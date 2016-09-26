Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 85BFF605BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 17:09:53 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id n202so13983809oig.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 10:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=oFI/nk7yMLZiqeYrJuyaCh0WqmQDfxgmi1I29iwGA4c=;
	b=o6YhGv743vqokHtCCptwcgbsox/ijkITPSNhJgGBWCCfofKnEspYVVxklSP2KRYqQO
	kEnGw9RF0jsMSyUFwmArBXj1rNtnxxPgP3j0lBLfzGX5thlgMfmEea+Nysy5C4kJo/+Y
	GUneCVCtk7wO54ybax3g+zdJ69aIg5UZmb9gb0klYxir5i2ZNGv3LIFD34eMoIB++Hv0
	d+R83yxV1axYOj3wWL1tZ2vvzpO9Hw/rOUoxfdj6TnqR3PQ8yTV34t7/nIgOsdLVIzx7
	B3KtH1KJrhk27GIasuXzH/Eg8confSRQlg/kowzOytw6YXL78Bk7ZnVeP/ASm0NGx33q
	orfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=oFI/nk7yMLZiqeYrJuyaCh0WqmQDfxgmi1I29iwGA4c=;
	b=SQAvCxDzMkk6e6jaCXnpgy8+woeRwo72muo2SOACkuTjxevsxWqHNHdUk3RJWBMZrd
	icPjf7HjnNHK9KVB/A1vKJ6k5rIuR6VYD+kbbo6I7S8TgEYNqkg/HcddsqWS8JnLKNIl
	l14sN6vYkeK52ai3hpuvycWCk58ps/j+E8VuaVlghU7sk0FYzvCBR5nXYot71Cqg3kdR
	KZARygIIxGy8ATOT/ZOEiyZS5FDprhYL04W2lnzn7YvSq6S/uq2pv3bYCBc1SQZbPbGO
	rcb+xzKvjLpNNScVW/kayvEMTwFJ4tPkjem5aeQMtxUILDjv8D2hCv/eh0tYL6+07AJG
	tqFg==
X-Gm-Message-State: AE9vXwMeZmpqctEOoSOWIbvBV1pwhOQN37QxdNWUX9/t1vQezXAZV34xJf+McGji3Nq/AhCArii5EzF7v7aQ6Q==
X-Received: by 10.202.74.78 with SMTP id x75mr28947115oia.77.1474909794781;
	Mon, 26 Sep 2016 10:09:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Mon, 26 Sep 2016 10:09:34 -0700 (PDT)
In-Reply-To: <1474036373-13300-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1474036373-13300-1-git-send-email-ed.bartosh@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 26 Sep 2016 10:09:34 -0700
X-Google-Sender-Auth: gEpIHUUbHvuYXvGM4NPZhgcamyM
Message-ID: <CABcZANnzHTW3Jj1GQ=OReji8K535ArUZ8AijVQzCnWzCLDJuUg@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] image_types: add parted-native to do_image_wic depends
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
X-List-Received-Date: Mon, 26 Sep 2016 17:09:55 -0000
Content-Type: multipart/alternative; boundary=001a11c1829e64f988053d6c322d

--001a11c1829e64f988053d6c322d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2016 at 7:32 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.
> bbclass
> index 5ef6f60..0bb6252 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -218,6 +218,7 @@ IMAGE_CMD_wic[vardepsexclude] =3D "WKS_FULL_PATH
> WKS_FILES"
>  USING_WIC =3D "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + '
> '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
>  WKS_FILE_CHECKSUM =3D "${@'${WKS_FULL_PATH}:%s' %
> os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
>  do_image_wic[file-checksums] +=3D "${WKS_FILE_CHECKSUM}"
> +do_image_wic[depends] +=3D "parted-native:do_populate_sysroot"
>

This is redundant. image_types.bbclass already sets IMAGE_DEPENDS_wic =3D
"parted-native=E2=80=9D.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c1829e64f988053d6c322d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Sep 16, 2016 at 7:32 AM, Ed Bartosh <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:6w" =
class=3D"gmail-a3s gmail-aXjCH gmail-m1573374487f8e1f9">diff --git a/meta/c=
lasses/image_types.<wbr>bbclass b/meta/classes/image_types.<wbr>bbclass<br>
index 5ef6f60..0bb6252 100644<br>
--- a/meta/classes/image_types.<wbr>bbclass<br>
+++ b/meta/classes/image_types.<wbr>bbclass<br>
@@ -218,6 +218,7 @@ IMAGE_CMD_wic[vardepsexclude] =3D &quot;WKS_FULL_PATH W=
KS_FILES&quot;<br>
=C2=A0USING_WIC =3D &quot;${@bb.utils.contains_any(&#39;<wbr>IMAGE_FSTYPES&=
#39;, &#39;wic &#39; + &#39; &#39;.join(&#39;wic.%s&#39; % c for c in &#39;=
${CONVERSIONTYPES}&#39;.split()), &#39;1&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0WKS_FILE_CHECKSUM =3D &quot;${@&#39;${WKS_FULL_PATH}:%s&#39; % os.pat=
h.exists(&#39;${WKS_FULL_<wbr>PATH}&#39;) if &#39;${USING_WIC}&#39; else &#=
39;&#39;}&quot;<br>
=C2=A0do_image_wic[file-checksums] +=3D &quot;${WKS_FILE_CHECKSUM}&quot;<br=
>
+do_image_wic[depends] +=3D &quot;<span class=3D"gmail-il">parted</span>-<s=
pan class=3D"gmail-il">native</span>:do_populate_<wbr>sysroot&quot;</div></=
blockquote></div><br>This is redundant. image_types.bbclass already sets=C2=
=A0IMAGE_DEPENDS_wic =3D &quot;parted-native=E2=80=9D.<br>-- <br><div class=
=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Fo=
under - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior S=
oftware Engineer, Mentor Graphics</div>
</div></div>

--001a11c1829e64f988053d6c322d--
