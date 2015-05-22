Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 916DF609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 11:25:43 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so9113401qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 04:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qRO+V9YoOBJz947bIuIbL35EhwRxDixQ6kUeppXQSEs=;
	b=UKY7ISSSbgO/ZYuIq/82TTc2CcTTdyBmu2QfJgudBO7Dv2J31g7JzDf/om5+impjM/
	3Mu4C9js+VC6/aOO7CuMagfshZtTfdlA80uT2q+fP++6WAAUfX9qgwQfLXCLcKGnVljk
	SnGq5KviYLSAzg//Qaf3zVmljiwq6zcydYgtq5DLdtclpTvivxvz3tO/S8kk6wzJVUcS
	+o1QgupCpiMayLPSgtdyjwN0J9PuyeJFcox+1RrJVQqAzT6uSZb5WgNhSDKfMalcr/Wq
	xY7nQdnkBaAWCwAOEfeG0zfBvow7OhxbQSfmPR7Y4XyNA/gFPC7CyhcNM5ZlTIx/LtlR
	8I1g==
X-Gm-Message-State: ALoCoQmbMb3vLDYTD4pcXYbyv6LbU4EJYGrxKZzAEVSWmahN77zKa5UZ/2FP30FHUOot87gaBDG3
X-Received: by 10.140.43.228 with SMTP id e91mr9901984qga.80.1432293944887;
	Fri, 22 May 2015 04:25:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 22 May 2015 04:25:24 -0700 (PDT)
In-Reply-To: <20150522112016.GB2376@jama>
References: <1432281469-21784-1-git-send-email-kexin.hao@windriver.com>
	<20150522112016.GB2376@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 May 2015 12:25:24 +0100
Message-ID: <CAJTo0LYRgb73pAS=5d9fnR4zrz1-TwS_ySUS67ZdFbS0du8xsw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] PCMCIA: remove the support for PCMCIA
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
X-List-Received-Date: Fri, 22 May 2015 11:25:47 -0000
Content-Type: multipart/alternative; boundary=001a113a34bcccbd120516a9eb99

--001a113a34bcccbd120516a9eb99
Content-Type: text/plain; charset=UTF-8

On 22 May 2015 at 12:20, Martin Jansa <martin.jansa@gmail.com> wrote:

>
> > @@ -741,7 +741,6 @@ COMBINED_FEATURES = "\
> >      ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "ext2",
> d)} \
> >      ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "vfat",
> d)} \
> >      ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "irda",
> d)} \
> > -    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES",
> "pcmcia", d)} \
>
> Is it worth removing here? this wasn't moved to meta-oe.


I've wondered why COMBINED_FEATURES involves a hard-coded list of features,
if we just generate it as a union of both sets then we get future proofness
(cf Cristian's patch to add nfc) and extensibility for free.

Ross

--001a113a34bcccbd120516a9eb99
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 May 2015 at 12:20, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mail=
to:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM">=
<div class=3D""><br>
&gt; @@ -741,7 +741,6 @@ COMBINED_FEATURES =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@base_both_contain(&quot;DISTRO_FEATURES&quot;, =
&quot;MACHINE_FEATURES&quot;, &quot;ext2&quot;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@base_both_contain(&quot;DISTRO_FEATURES&quot;, =
&quot;MACHINE_FEATURES&quot;, &quot;vfat&quot;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@base_both_contain(&quot;DISTRO_FEATURES&quot;, =
&quot;MACHINE_FEATURES&quot;, &quot;irda&quot;, d)} \<br>
&gt; -=C2=A0 =C2=A0 ${@base_both_contain(&quot;DISTRO_FEATURES&quot;, &quot=
;MACHINE_FEATURES&quot;, &quot;pcmcia&quot;, d)} \<br>
<br>
</div></div>Is it worth removing here? this wasn&#39;t moved to meta-oe.</b=
lockquote></div><br>I&#39;ve wondered why COMBINED_FEATURES involves a hard=
-coded list of features, if we just generate it as a union of both sets the=
n we get future proofness (cf Cristian&#39;s patch to add nfc) and extensib=
ility for free.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a113a34bcccbd120516a9eb99--
