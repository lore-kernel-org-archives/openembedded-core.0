Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id E4B677806E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 17:25:46 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id w94so13446030ioi.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 10:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cwGdp0QbR+SgU1df7S1+mWOReU/b+ktE3vTryLsyH0E=;
	b=h1xO2svwxc0p/upgeBJH1N/+N1ctxzJ5v0RwWEWU34QHKF2/oYkaOxWxSE6Vbdyr8F
	qf+RMMR/pTzroxrvXmULi/ZCeIMdeHOs2RxPGJKrN16uLPpWDldryM4Mz+scsMQsMnb8
	+X1wGMDFJCQdOgoFrTJwOyJu7LsydRfPeT9Hk08hJfOY4+GbvhLALNVapig6irCWufb5
	Mf08v1ylHQUOuOFNppovBUYq33NiTTHK2qmEnffsvPPloaq94OsaleBjQ8KH7GplVtyD
	nePpcT6l1MS4f8w+pJ6N4yPrOGZ9X5srmewpCRct2tjOok8rf4UwuimcoM0l4CGf8TQ8
	Hcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cwGdp0QbR+SgU1df7S1+mWOReU/b+ktE3vTryLsyH0E=;
	b=WR3x2OA6FPVN31foL9Go2fLdR/M2FMoCiOr1rGjKRsO2OM0+YCCsnPfyUGZj+KtTNw
	gLbo990EuD85YFiE3sCi8i/br7B6WYn+K35aJJ3FjI1PprC1pMO/L38mYVS08aBBIX7Z
	jEkXWWLAPXuGEraWQ8SlVS053EcOt8irWEGyepcM5Dzh1Yq26UDLcjbkxbTnPJE2kuCy
	Flx3dP0BPei+Yxf09lpd29KRqSREGM3bRvSBvD83blrvBjVpJs6TIlxh35zWdUHD/Voi
	UpqiimFRsHeTu4ogVWfuP5vxZlmlThBJvo+1y01CltJQYJn8ojKFaYfiEdu26gUusOrF
	Jivw==
X-Gm-Message-State: AHPjjUi+3qNVGX2FRUsUWzC4nNFFbO0UgZnND83sntPotAVJV2U2SdcV
	001UnlGNjlSrKJyOIn6ijKWoW6f6lKhbGNwRlzxF7A==
X-Google-Smtp-Source: AOwi7QAlh07OJdF9Yv4AKWSv5HTfDRlPP9t7fsgeUhZKnYHSVOZXXw/y+xy9x+nCeEpbuVoSHgCVqxqbUzJgl/mX1gM=
X-Received: by 10.107.41.135 with SMTP id p129mr14839341iop.142.1506446747993; 
	Tue, 26 Sep 2017 10:25:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 26 Sep 2017 10:25:27 -0700 (PDT)
In-Reply-To: <a1a29ef4-1e62-1455-2810-6388a076c038@linux.intel.com>
References: <20170926165637.36321-1-alejandro.hernandez@linux.intel.com>
	<CAJTo0LZOkD1OOws7Fa2bHGBs5093Koiy=619CGUUZs7UOzYNaQ@mail.gmail.com>
	<a1a29ef4-1e62-1455-2810-6388a076c038@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Sep 2017 18:25:27 +0100
Message-ID: <CAJTo0Lb-RHGu+pPOb+Aa-i7DFi_YsvzuaTy7g8+zXDxOt8FXqg@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-native: Build with ipv6 enabled
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
X-List-Received-Date: Tue, 26 Sep 2017 17:25:47 -0000
Content-Type: multipart/alternative; boundary="001a1141f226499940055a1af797"

--001a1141f226499940055a1af797
Content-Type: text/plain; charset="UTF-8"

On 26 September 2017 at 18:23, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> Using EXTRA_OECONF_append gets added to the correct
> EXTRA_OECONF_class-<target/natve> correctly, otherwise its disregarded.
>
>
I guess the subtext was

+EXTRA_OECONF_class-native = "\
+  --enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES_NATIVE', 'ipv6',
'yes', 'no', d)} \


That is totally wrong.  In a native recipe, DISTRO_FEATURES has been
altered based on DISTRO_FEATURES_NATIVE.  You don't need to make other
changes, and I suspect that reverting this chunk means the other chunks can
also be reverted.

Ross

--001a1141f226499940055a1af797
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 26 September 2017 at 18:23, Alejandro Hernandez <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:alejandro.hernandez@linux.intel.com" targe=
t=3D"_blank">alejandro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><=
div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <span class=3D"gmail-"><blockquote type=3D"cite"><div dir=3D"ltr"><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div>Using EXTRA_OECONF_ap=
pend gets added to the correct
    EXTRA_OECONF_class-&lt;target/<wbr>natve&gt; correctly, otherwise its
    disregarded.<br></div></div></div></div></blockquote></span></div></blo=
ckquote><div><br></div><div>I guess the subtext was</div><div><br></div><sp=
an style=3D"font-size:12.800000190734863px">+EXTRA_OECONF_class-native =3D =
&quot;\</span><br style=3D"font-size:12.800000190734863px"><span style=3D"f=
ont-size:12.800000190734863px">+=C2=A0 --enable-ipv6=3D${@bb.utils.</span><=
wbr style=3D"font-size:12.800000190734863px"><span style=3D"font-size:12.80=
0000190734863px">contains(&#39;DISTRO_FEATURES_</span><wbr style=3D"font-si=
ze:12.800000190734863px"><span style=3D"font-size:12.800000190734863px">NAT=
IVE&#39;, &#39;ipv6&#39;, &#39;yes&#39;, &#39;no&#39;, d)} \</span><br styl=
e=3D"font-size:12.800000190734863px"><div><br></div><div><br></div><div>Tha=
t is totally wrong.=C2=A0 In a native recipe, DISTRO_FEATURES has been alte=
red based on DISTRO_FEATURES_NATIVE.=C2=A0 You don&#39;t need to make other=
 changes, and I suspect that reverting this chunk means the other chunks ca=
n also be reverted.</div><div><br></div><div>Ross=C2=A0</div></div><br></di=
v></div>

--001a1141f226499940055a1af797--
