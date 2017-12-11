Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8477A78745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 17:31:42 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id b5so17747504itc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 09:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i51YpcosCi1QVnzUwVyvg5mDthPXLdvvXt5LnNcz5UU=;
	b=xzZk2XaKe4Ua2Vu5bNcyrnCO8Q2873AKNd9fN4DhJFXPOo8GCdFI2F0IYHumPkvZe7
	LCSSnu+dmxpy3sWNc8oOzProFjddDd7XuAcn/b0CGmozZ+BuFLOUvMjR4tBpPMV+GT7S
	o6pCmb7GeT7RkshTgemdL05yDx53qKueUpPJBl76bb+EYnTbB2d/P7lbhp2M1rFEwvt4
	6SkbnuyMPujz3H4jU2m3LzRGl3y9GI3wKKUvvJewyW8njrpuIGDYbrkUD9S4Q8n93HBh
	ZFnbWoankvJxyyr27zjwzbbDdNvk1RdDGvo7+uuISja3fE/2d5CFIYBMqd1n98ldeQiY
	0eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i51YpcosCi1QVnzUwVyvg5mDthPXLdvvXt5LnNcz5UU=;
	b=YxpJJaZBe86qWrw1DiczMqdqqID20agZdz6ZTFtYoV1wB+bhifevWEyIgvzyBr6iQl
	f5QRJiHqnd8WOkwXADIc2o8OjYr+Ff2EmwSSQ8HRYpk5reR9ZY289SBz0lTfPGecfj6K
	4TdQ7R0dakIYLH8JT10zg2jdHa2AFCp/fAQMSVMFi1KGkEztSlWmM6gkZju/KHnhU8t+
	DT06tJ7ZgEC9SEfzs/sHI2Jq4jnKydydhnMAWPcE7MKuZekNrbX3fytaWnCB281Om5Zu
	PK9oyNH6ZdnIHW8K+AibgqK9fzdzxSTTZtW5yFMKNm5mxQbjNs8yvLuIMtSY5uFJfaze
	dNSw==
X-Gm-Message-State: AKGB3mKs8h2Ih5Wml6xfms86MCik9E/SIkY6mut3BJ99JYVuYj0A27Fa
	Y0rDugu8Q7PBVmCBwDqJogJry/ivp89gxRDSAxaGHg==
X-Google-Smtp-Source: ACJfBoubTKr9yXVEqn7czSSjmmsW5XIIzHkrq9qGqxtHRT1dRbcepNT59cTfe2XN669H2vI04axMgpV0H3jRwhFidcY=
X-Received: by 10.36.17.15 with SMTP id 15mr2117965itf.53.1513013503737; Mon,
	11 Dec 2017 09:31:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Mon, 11 Dec 2017 09:31:23 -0800 (PST)
In-Reply-To: <91239d937858880057ddc741cc6a80fda699575b.1512765610.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
References: <cover.1512765610.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
	<91239d937858880057ddc741cc6a80fda699575b.1512765610.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Dec 2017 17:31:23 +0000
Message-ID: <CAJTo0LZivThwAmomtXT=Y6NP4JPqfYVJVezzGEkqKd6oPr9yPA@mail.gmail.com>
To: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 1/2] imagefeatures.py: Added testcase to track IMAGE_GEN_DEBUGFS
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
X-List-Received-Date: Mon, 11 Dec 2017 17:31:42 -0000
Content-Type: multipart/alternative; boundary="001a11445d686e5d12056013e8f7"

--001a11445d686e5d12056013e8f7
Content-Type: text/plain; charset="UTF-8"

On 8 December 2017 at 21:03, Jair Gonzalez <
jair.de.jesus.gonzalez.plascencia@linux.intel.com> wrote:

> +    def test_image_gen_debugfs(self):
> +        """
> +        Summary:     Check debugfs generation
> +        Expected:    1. core-image-minimal can be build with
> IMAGE_GEN_DEBUGFS variable set
> +                     2. debug filesystem is created when variable set
> +        Product:     oe-core
> +        Author:      Humberto Ibarra <humberto.ibarra.lopez@intel.com>
> +        """
> +
> +        image_name = 'core-image-minimal'
> +        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
> +
> +        features = 'IMAGE_GEN_DEBUGFS = "1"\n'
> +        features += 'IMAGE_FSTYPES_DEBUGFS = "tar.bz2"'
> +        self.write_config(features)
> +
> +        bitbake(image_name)
> +        debug_files = glob.glob(os.path.join(deploy_
> dir_image,"*-dbg.rootfs.tar.bz2"))
> +        self.assertNotEqual(len(debug_files), 0, 'debug filesystem not
> generated')


Checking the file exists doesn't really exercise the codepaths, it should
at least verify the tarball contains the debug symbols for some packages
that are in that image.

Ross

--001a11445d686e5d12056013e8f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 8 December 2017 at 21:03, Jair Gonzalez <span dir=3D"lt=
r">&lt;<a href=3D"mailto:jair.de.jesus.gonzalez.plascencia@linux.intel.com"=
 target=3D"_blank">jair.de.jesus.gonzalez.plascencia@linux.intel.com</a>&gt=
;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">+=C2=A0 =C2=A0 def test_image_gen_debugfs(self=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0 =C2=A0Check debugfs gene=
ration<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 =C2=A0 1. core-image-minimal c=
an be build with IMAGE_GEN_DEBUGFS variable set<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A02. debug filesystem is created when variable set<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Product:=C2=A0 =C2=A0 =C2=A0oe-core<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Author:=C2=A0 =C2=A0 =C2=A0 Humberto Ibarra &l=
t;<a href=3D"mailto:humberto.ibarra.lopez@intel.com">humberto.ibarra.lopez@=
intel.<wbr>com</a>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_name =3D &#39;core-image-minimal&#39;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deploy_dir_image =3D get_bb_var(&#39;DEPLOY_DI=
R_IMAGE&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D &#39;IMAGE_GEN_DEBUGFS =3D &quot;=
1&quot;\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;IMAGE_FSTYPES_DEBUGFS =3D &=
quot;tar.bz2&quot;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(features)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(image_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 debug_files =3D glob.glob(os.path.join(deploy_=
<wbr>dir_image,&quot;*-dbg.rootfs.tar.<wbr>bz2&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertNotEqual(len(debug_<wbr>files), 0, =
&#39;debug filesystem not generated&#39;)</blockquote><div><br></div><div>C=
hecking the file exists doesn&#39;t really exercise the codepaths, it shoul=
d at least verify the tarball contains the debug symbols for some packages =
that are in that image.</div><div><br></div><div>Ross</div></div></div></di=
v>

--001a11445d686e5d12056013e8f7--
