Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 90E16606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 13:38:40 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id b62so20234072iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 06:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JrCqlc/VZuZs4xJlV9k7IMyj2dtOqjxVzhPuTc1TmHE=;
	b=LbrbudfTrsJI56FFxaT+PrVzUayaURukfoh2gT7hfDnXvo/UVoSkpfO9NMdwtFnqtM
	PzJ0SqQH7mAIy3SdSGuYbiJkpRCjvxo5H0j2cUWgXX+Iig7SoF6wNI04Bkm2EQ1XiImp
	uiuALahLZH3v6vVYhlww9R/dljAhgwJM6b85/JpfMConEaHfj20/5XI7Ui3ytBO+z//e
	T9/v5stTtfiVERC4CVWCVLCABlnQshW8C/O8em+mq4KJ5Zm+N8ngU2pi1WbG+90GEJLa
	BWtqqxHMwRv7bvvOkR7uFfFbvrCaNy3GPWGMi/MN9W1sLthMjlmEM6LQPQV9yFUjK8+y
	b0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JrCqlc/VZuZs4xJlV9k7IMyj2dtOqjxVzhPuTc1TmHE=;
	b=edUzMyKwzMP2cKPAAsM6iLG5SGBBHjYwrMdaZ7pL/8aZ0U5cpYJrc49Fq32g15ln6x
	xhGV6Lutd8uiaNxR0Sm4qs2XILstqEG1F2LGBrJAD8ow2QWJuRVM4ksqFqDVMno4Zvxl
	xuRaV1NCGRNr81WD7Op+1L2h5ksiRLo4sCZNXWe7GKljrOvXDryqyx8LboCQzRbMw8gn
	AGCN6WMMhN5tQYiczl4tnRksQlnokomXYNdD0V8Hbx7tyCWOi0NupPrjgaB5gUSdl5it
	+ubJXRQAhUMx4sI5qehsUWLd02ngp/4QsWd5LxAM2lKS1DP7VO/WJKDbwPYZkyTXOqsL
	7hHA==
X-Gm-Message-State: AEkoouvC8EmE4LQks0lEEou6OfLRSIKwj/RTGl1iu8BjOznEMqdq15w5Wko/D8Lw/xH+YmfQLDVjP6G43wZgxKY0
X-Received: by 10.107.154.196 with SMTP id c187mr25031738ioe.99.1469540320975; 
	Tue, 26 Jul 2016 06:38:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 26 Jul 2016 06:38:21 -0700 (PDT)
In-Reply-To: <1469211845-21125-2-git-send-email-Liam.Howlett@WindRiver.com>
References: <1469211845-21125-1-git-send-email-Liam.Howlett@WindRiver.com>
	<1469211845-21125-2-git-send-email-Liam.Howlett@WindRiver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Jul 2016 14:38:21 +0100
Message-ID: <CAJTo0LaiVPOSZfFt9ruzFGgtiL2gNFOZWHCNN2yZRBRsKm41TA@mail.gmail.com>
To: "Liam R. Howlett" <Liam.Howlett@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: Add --ssh-askpass support
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
X-List-Received-Date: Tue, 26 Jul 2016 13:38:41 -0000
Content-Type: multipart/alternative; boundary=001a1140e81ed0acf805388a0415

--001a1140e81ed0acf805388a0415
Content-Type: text/plain; charset=UTF-8

On 22 July 2016 at 19:24, Liam R. Howlett <Liam.Howlett@windriver.com>
wrote:

> diff --git a/meta/recipes-extended/wget/wget/0001-wget-Add-ssh-askpass-support.patch
> b/meta/recipes-extended/wget/wget/0001-wget-Add-ssh-askpass-support.patch
> new file mode 100644
> index 0000000..e402375
> --- /dev/null
> +++ b/meta/recipes-extended/wget/wget/0001-wget
> -Add-ssh-askpass-support.patch
> [snip]
>


> diff --git a/meta/recipes-extended/wget/wget_1.18.bb
> b/meta/recipes-extended/wget/wget_1.18.bb
> index c969b98..20ec503 100644
> --- a/meta/recipes-extended/wget/wget_1.18.bb
> +++ b/meta/recipes-extended/wget/wget_1.18.bb
> @@ -1,5 +1,6 @@
>  SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
>
> file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
> +           file://0001-Add-ssh-askpass-support.patch \


As the patch and the SRC_URI don't match, this patch clearly hasn't been
tested.

Also if you're working with upstream then please change the Upstream-Status
to Submitted and provide a link (mailing list post, bug entry, whatever).

Ross

--001a1140e81ed0acf805388a0415
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 22 July 2016 at 19:24, Liam =
R. Howlett <span dir=3D"ltr">&lt;<a href=3D"mailto:Liam.Howlett@windriver.c=
om" target=3D"_blank">Liam.Howlett@windriver.com</a>&gt;</span> wrote:<br><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">diff --git a/meta/=
recipes-extended/<span class=3D"il">wget</span>/<span class=3D"il">wget</sp=
an>/0001-<span class=3D"il">wget</span>-Add-ssh-askpass-support.patch b/met=
a/recipes-extended/<span class=3D"il">wget</span>/<span class=3D"il">wget</=
span>/0001-<span class=3D"il">wget</span>-Add-ssh-askpass-support.patch<br>
new file mode 100644<br>
index 0000000..e402375<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/<span class=3D"il">wget</span>/<span class=3D"i=
l">wget</span>/0001-<span class=3D"il">wget</span>-Add-ssh-askpass-support.=
patch<br>[snip]<br></blockquote><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
diff --git a/meta/recipes-extended/<span class=3D"il">wget</span>/<a href=
=3D"http://wget_1.18.bb" rel=3D"noreferrer" target=3D"_blank">wget_1.18.bb<=
/a> b/meta/recipes-extended/<span class=3D"il">wget</span>/<a href=3D"http:=
//wget_1.18.bb" rel=3D"noreferrer" target=3D"_blank">wget_1.18.bb</a><br>
index c969b98..20ec503 100644<br>
--- a/meta/recipes-extended/<span class=3D"il">wget</span>/<a href=3D"http:=
//wget_1.18.bb" rel=3D"noreferrer" target=3D"_blank">wget_1.18.bb</a><br>
+++ b/meta/recipes-extended/<span class=3D"il">wget</span>/<a href=3D"http:=
//wget_1.18.bb" rel=3D"noreferrer" target=3D"_blank">wget_1.18.bb</a><br>
@@ -1,5 +1,6 @@<br>
=C2=A0SRC_URI =3D &quot;${GNU_MIRROR}/<span class=3D"il">wget</span>/<span =
class=3D"il">wget</span>-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Unset-need_charset_al=
ias-when-building-for-musl.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add-ssh-askpass-suppo=
rt.patch \</blockquote></div><div class=3D"gmail_extra"><br></div>As the pa=
tch and the SRC_URI don&#39;t match, this patch clearly hasn&#39;t been tes=
ted.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">A=
lso if you&#39;re working with upstream then please change the Upstream-Sta=
tus to Submitted and provide a link (mailing list post, bug entry, whatever=
).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div><div class=3D"gmail_extra"><br></div></div>

--001a1140e81ed0acf805388a0415--
