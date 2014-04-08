Return-Path: <alex.r.damian@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id E3A4E65D8E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 12:30:36 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id i50so799850qgf.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Apr 2014 05:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XsDBHURKiQQzaT2KHJB7DjiF9gwr/01sUrKOCmm0p5I=;
	b=NQYWanUqELEmcv4qdbiORUW1GDNTMVCFceu6I6Nrfjdg1p60/Ta0oFtKS6dzixmnd6
	iuyBxotp+n8D10ztVtTCBhAydX+rnzMzFhQ6hbAZ2g+oFUquORp7c0U2CqtBod7I48pn
	Ok/P+2N5NUI+XbT0oBXd5EkqrtaEa+CsZmqVNpSnbCSJFfnyL6ptHSG/+TNlFvSItDG9
	Seh4PHOtlr0U9wMER0aMqAQyz9bB44psOTaWFXtHM6q6vZkai+GOESrNBf7mXKMuwDpL
	SKZZAF9xfrxvtJ3JKoTFPT/fyFnka1nZmH623AJaEgt9x/A1fTmIIuRgXJkfzLn9OCfg
	ixyQ==
MIME-Version: 1.0
X-Received: by 10.140.89.36 with SMTP id u33mr3627350qgd.93.1396960230917;
	Tue, 08 Apr 2014 05:30:30 -0700 (PDT)
Received: by 10.224.207.135 with HTTP; Tue, 8 Apr 2014 05:30:30 -0700 (PDT)
In-Reply-To: <1396860624-22648-1-git-send-email-cristiana.voicu@intel.com>
References: <1396860624-22648-1-git-send-email-cristiana.voicu@intel.com>
Date: Tue, 8 Apr 2014 13:30:30 +0100
Message-ID: <CAL7ttbcoftdfjmuR616wuG5hLPwpNkQGxxq++zghjGoSbgHDiw@mail.gmail.com>
From: Alex Damian <alex.r.damian@gmail.com>
To: Cristiana Voicu <cristiana.voicu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][review-request] toaster.bbclass: image file is missing a "/"
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
X-List-Received-Date: Tue, 08 Apr 2014 12:30:39 -0000
Content-Type: multipart/alternative; boundary=001a11c12744544c1304f6872619

--001a11c12744544c1304f6872619
Content-Type: text/plain; charset=ISO-8859-1

This is indeed the patch reviewed on the list.

Sorry about the mixup, can you please merge ?

Thanks,
Alex


On Mon, Apr 7, 2014 at 9:50 AM, Cristiana Voicu
<cristiana.voicu@intel.com>wrote:

> Relaced the key with the join between path and file name.
>
> [YOCTO #6090]
> Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
> ---
>  meta/classes/toaster.bbclass |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
> index 9fb2cec..d2fa82d 100644
> --- a/meta/classes/toaster.bbclass
> +++ b/meta/classes/toaster.bbclass
> @@ -153,7 +153,8 @@ python toaster_image_dumpdata() {
>      for dirpath, dirnames, filenames in os.walk(deploy_dir_image):
>          for fn in filenames:
>              if fn.startswith(image_name):
> -                image_info_data[dirpath + fn] =
> os.stat(os.path.join(dirpath, fn)).st_size
> +                image_output = os.path.join(dirpath, fn)
> +                image_info_data[image_output] =
> os.stat(image_output).st_size
>
>
>  bb.event.fire(bb.event.MetadataEvent("ImageFileSize",image_info_data), d)
>  }
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c12744544c1304f6872619
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is indeed the patch reviewed on the list.<br><br>Sorr=
y about the mixup, can you please merge ?<br><br>Thanks,<br>Alex<br></div><=
div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon, Apr 7,=
 2014 at 9:50 AM, Cristiana Voicu <span dir=3D"ltr">&lt;<a href=3D"mailto:c=
ristiana.voicu@intel.com" target=3D"_blank">cristiana.voicu@intel.com</a>&g=
t;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">Relaced the key with the joi=
n between path and file name.<br>
<br>
[YOCTO #6090]<br>
Signed-off-by: Cristiana Voicu &lt;<a href=3D"mailto:cristiana.voicu@intel.=
com">cristiana.voicu@intel.com</a>&gt;<br>
---<br>
=A0meta/classes/toaster.bbclass | =A0 =A03 ++-<br>
=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass<br=
>
index 9fb2cec..d2fa82d 100644<br>
--- a/meta/classes/toaster.bbclass<br>
+++ b/meta/classes/toaster.bbclass<br>
</div>@@ -153,7 +153,8 @@ python toaster_image_dumpdata() {<br>
=A0 =A0 =A0for dirpath, dirnames, filenames in os.walk(deploy_dir_image):<b=
r>
=A0 =A0 =A0 =A0 =A0for fn in filenames:<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0if fn.startswith(image_name):<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0image_info_data[dirpath + fn] =3D os.stat(=
os.path.join(dirpath, fn)).st_size<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0image_output =3D os.path.join(dirpath, fn)=
<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0image_info_data[image_output] =3D os.stat(=
image_output).st_size<br>
<br>
=A0 =A0 =A0bb.event.fire(bb.event.MetadataEvent(&quot;ImageFileSize&quot;,i=
mage_info_data), d)<br>
=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</div></div></blockquote></div><br></div>

--001a11c12744544c1304f6872619--
