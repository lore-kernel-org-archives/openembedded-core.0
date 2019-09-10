Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
	[209.85.222.54])
	by mail.openembedded.org (Postfix) with ESMTP id E95AD7F346
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 13:18:18 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id 107so5541096uau.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 06:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YWu7BTyD2XFGTKcIDDpd6cTTUmmVuoOBR9uSmUclzEs=;
	b=g9cMpBc0mTetgGwJzDMwHhL63rh+MipRnE/XKQrk9LTqwZqoqJb6jiIYpwRQIIg6r9
	OjrPBAp2thwV2ClDoQ7nKBI6Pg882s1ksmAZegjO9Rt9m1nFYdf5vf8vztLSN1GCWepd
	SQD9CP8NCohjaX3MYvBTuKRtwhz4lbH2cDMCdPY5UosincpQJJkX8BWrQNH5B6Nt8phO
	qaoN5hbA0i4ui6lgmwKqdpX13BaSiEGFp7a5PyQnnqhmTl1WiV7hkYc4RZlpjOuhc1Vk
	fOzDI93TyD8dIFZ/FpDRwRYD0zfVUxk8tlzsaGFDI2daXaeddxwMUMJ/PbA3Mh2Tk04q
	4fTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YWu7BTyD2XFGTKcIDDpd6cTTUmmVuoOBR9uSmUclzEs=;
	b=iwq1QZPrtv75o9jjOpNdBNsX/1RLndqaXgm+kn1zAMw5r/A26sEKdMu2CrXw1omZur
	JZSjb91n1obQOv8NpuuTriY9ThY96iYIb4NXZYKK9FhgrzHUYuGuJFQu+mNf2JADm6RW
	npUNQ3qgK38jYSa6SmyRl5d0cdPePpfbaqAkAaaKH4zGG4Jp1xDaRP6tVaWBqAmBpRlB
	RpqnavVDWYNXZf4eEoz154+KpIcKBkMjspVBgz6jEpQE1o8SpuxWxE4Bze0oDGKFevys
	pu59EybGrK+nl848ULdwdlrFA4ILIhcNfxtDyqfFP7+dyASZuekMzBKq7FX48lRG8jae
	M4bA==
X-Gm-Message-State: APjAAAWT23oaV2lf/nWvBSAqrfrJeme4/OQMW+JG1b+qUP9vFVQyoibO
	/SV6jwmKCBT7MAGiBxcs9e9y1NIzIqr/TtqaD1Xnzw==
X-Google-Smtp-Source: APXvYqzq7B0hnrXpN5p4FLIekLVbnoo1fVQtcRmT7N6T7Jpxcz659Aossf8WZh8WatJzwSTyzPDZEY+EM/X4Ne2P4F8=
X-Received: by 2002:ab0:e19:: with SMTP id g25mr13160342uak.71.1568121499571; 
	Tue, 10 Sep 2019 06:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <1568026619-117196-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CANNYZj8kH3Oqp_ac8BsRCRpT4qEqnCg3VYk0LFW4vnkGxnoF9A@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B5B6E199@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CANNYZj_OBagcWxfBb0yF80Jr=CmhPg_FND5-V6ze4a4qFWYOyA@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B5B6E403@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CANNYZj-KCVLR2zTNgu-KywKoyRteOk7sn1N0ArMguAENNPLgig@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B5B6E517@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B6E517@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Sep 2019 15:18:08 +0200
Message-ID: <CANNYZj9M7kUqP_5XGqYgb-uyMqcf=o-usSUa+hNr2YBzWnaH=g@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: make rpm work in toolchain.
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
X-List-Received-Date: Tue, 10 Sep 2019 13:18:19 -0000
Content-Type: multipart/alternative; boundary="000000000000f25a73059232bc9c"

--000000000000f25a73059232bc9c
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Sep 2019 at 13:56, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> 3. Actually, my first plan  is to write ${MACHINE_ARCH} in toolchain, but
> it was rejected
>
> +++ b/meta/classes/toolchain-scripts.bbclass
>
> @@ -101,6 +101,7 @@ toolchain_shared_env_script () {
>
>         echo 'export CPPFLAGS="${TARGET_CPPFLAGS}"' >> $script
>
>         echo 'export KCFLAGS="--sysroot=$SDKTARGETSYSROOT"' >> $script
>
>         echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
>
> +       echo 'export MACHINE_ARCH=${MACHINE_ARCH}' >> $script
>
>         echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
>
>
>
> I guess if it can work, maybe post-relocate-setup.d/ facility will be
> usefull.
>

What I would like to avoid is placing rpm-specific things into SDK recipes
that have nothing to do with rpm. So please investigate
post-relocate-setup.d/, and if it is not good enough, we can perhaps extend
it.

Alex

--000000000000f25a73059232bc9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 10 Sep 2019 at 13:56, Zheng, Ruoq=
in &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujit=
su.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_7704774913935399707WordSection1"><span style=3D"font-=
size:11pt;font-family:&quot;Calibri&quot;,sans-serif">3. Actually, my first=
 plan =C2=A0is to write
</span><span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-s=
erif">${MACHINE_ARCH} in toolchain, but it was rejected</span><span style=
=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif"></span>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif">+++ b/meta/classes/toolchain-scripts.bbclass<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif">@@ -101,6 +101,7 @@ toolchain_shared_env_script () {<=
u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo &#39;=
export CPPFLAGS=3D&quot;${TARGET_CPPFLAGS}&quot;&#39; &gt;&gt; $script<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo &#39;=
export KCFLAGS=3D&quot;--sysroot=3D$SDKTARGETSYSROOT&quot;&#39; &gt;&gt; $s=
cript<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo &#39;=
export OECORE_DISTRO_VERSION=3D&quot;${DISTRO_VERSION}&quot;&#39; &gt;&gt; =
$script<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo &#39;expor=
t MACHINE_ARCH=3D${MACHINE_ARCH}&#39; &gt;&gt; $script<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo &#39;=
export OECORE_SDK_VERSION=3D&quot;${SDK_VERSION}&quot;&#39; &gt;&gt; $scrip=
t<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif">I guess if it can work, maybe
</span>post-relocate-setup.d/ facility will be usefull.<span style=3D"font-=
size:11pt;font-family:&quot;Calibri&quot;,sans-serif;color:rgb(31,73,125)">=
<u></u><u></u></span></p>
</div></div></blockquote><div><br></div><div>What I would like to avoid is =
placing rpm-specific things into SDK recipes that have nothing to do with r=
pm. So please investigate post-relocate-setup.d/, and if it is not good eno=
ugh, we can perhaps extend it.</div><div><br></div><div>Alex<br></div></div=
></div>

--000000000000f25a73059232bc9c--
