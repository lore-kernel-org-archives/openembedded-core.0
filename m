Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id ECEEB719D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:03:49 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id x35so37885826qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 06:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DsaL+WQwZynoD1diwaBaGHLP6CNWiezutJk9dOeJJ9w=;
	b=lwVbBIRBHUzfSAyAFwsb1MZasY/+ZMvkSnZ0BfndCOdNyuitQ7dGIAnZ1qUOw1Bq44
	hlIInzt1AsiTKjZZijrd2wIz8LSDoQNypXj1U0x5BWnR4OXm2UU6u9WFTITcnMQWsjrJ
	1SG8GQuene6c3eF45nALAsQzXITdFIkl4ungGVAOyLHw4QUIceUnifptssAHJNr8XA5b
	YpH607CFM5dUxhXBp668lcZgNehFD87/5AlJx7VllZzScQrgzWGUpQVUbd3VoCxjOKSM
	iDFCc3UWpkLQncp9r5+DeSBBka5CCAT5JLTFQpcGcWMFmDW1JTbtuFnlfHWo2RV1nuMZ
	1ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DsaL+WQwZynoD1diwaBaGHLP6CNWiezutJk9dOeJJ9w=;
	b=TNIrQTOhvDhj6d5gY6ZhVoeG/O5/V9NOF7SU9avIXIy4fi/TGgd8OYvSJEBxVNBuWi
	SkZIoW16tPrf21SYfdj7jt4jf/XeEsSpQJnY52M4c6ySkawoRYau/LTlif9OcOAzqGVa
	yyUh/tv6UGmCOirCJldGyIbzE0dnneKp17rlNqMybHX1FASO/hZgKXmPJ4JjllcJk5o3
	vg3C87IEHIeFxSevXjPZEC6u2Gna6RpSZL5dE2wMBGWRONnCFaHyZDgHOqpjgoSMRhvN
	3CCfB1VYiYnH2E90HfbY6Ln9AaYPzgpn3ixvWWy+3EG3112G0inNPIDk7hQ58sM7E+mJ
	K84A==
X-Gm-Message-State: AMke39kMMIMnYP8lepk+vq8wOI6ZTuQ1U1MbTLk2UjD6OdtOPXuTmq0gUfhte2yasEdbWjZLpjB22OcDtWdSCF0q
X-Received: by 10.200.45.247 with SMTP id q52mr26938660qta.197.1487685829940; 
	Tue, 21 Feb 2017 06:03:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 21 Feb 2017 06:03:29 -0800 (PST)
In-Reply-To: <1487685312-14595-1-git-send-email-alexandru.moise@windriver.com>
References: <1487685312-14595-1-git-send-email-alexandru.moise@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Feb 2017 14:03:29 +0000
Message-ID: <CAJTo0LZJsjBUws9P8AJ7=8nhxd3rn5h5MaNhfhmPQXbwtBEYxA@mail.gmail.com>
To: Alexandru Moise <alexandru.moise@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [meta-selinux] [PATCH] refpolicy-mls: user native bzip2 instead of host
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
X-List-Received-Date: Tue, 21 Feb 2017 14:03:53 -0000
Content-Type: multipart/alternative; boundary=001a1139cdf06e732805490ad9dc

--001a1139cdf06e732805490ad9dc
Content-Type: text/plain; charset=UTF-8

On 21 February 2017 at 13:55, Alexandru Moise <alexandru.moise@windriver.com
> wrote:

> -DEPENDS += "checkpolicy-native policycoreutils-native m4-native"
> +DEPENDS += "checkpolicy-native policycoreutils-native m4-native
> bzip2-native"
>

bzip2-native is in ASSUME_PROVIDED, so this won't do anything.


> +       native_bzip2=${STAGING_BINDIR_NATIVE}/bzip2-native/bzip2
> +       native_bunzip2=${STAGING_BINDIR_NATIVE}/bzip2-native/bunzip2
>

The proper way to do this is as follows:

DEPENDS += "bzip2-replacement-native"
EXTRANATIVEPATH += "bzip2-native"

This will ensure that you get our bzip2-native in the sysroot, and
EXTRANATIVEPATH will extend $PATH to include it so you don't need to use
absolute paths but can just use bzip2 as usual.

Ross

--001a1139cdf06e732805490ad9dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 February 2017 at 13:55, Alexandru Moise <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexandru.moise@windriver.com" target=3D"_blank">alexandru.moise=
@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rg=
b(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:=
4am" class=3D"gmail-a3s gmail-aXjCH gmail-m15a60f4e4f7143a3">-DEPENDS +=3D =
&quot;checkpolicy-native policycoreutils-native m4-native&quot;<br>
+DEPENDS +=3D &quot;checkpolicy-native policycoreutils-native m4-native bzi=
p2-native&quot;<br></div></blockquote><div><br></div><div>bzip2-native is i=
n ASSUME_PROVIDED, so this won&#39;t do anything.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padd=
ing-left:1ex"><div id=3D"gmail-:4am" class=3D"gmail-a3s gmail-aXjCH gmail-m=
15a60f4e4f7143a3">+=C2=A0 =C2=A0 =C2=A0 =C2=A0native_bzip2=3D${STAGING_BIND=
IR_<wbr>NATIVE}/bzip2-native/bzip2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0native_bunzip2=3D${STAGING_<wbr>BINDIR_NATIVE}/=
bzip2-native/<wbr>bunzip2</div></blockquote></div><div class=3D"gmail_extra=
"><br></div>The proper way to do this is as follows:</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_extra">DEPENDS +=3D &quot;bzip2-replaceme=
nt-native&quot;<br></div><div class=3D"gmail_extra"><div class=3D"gmail_ext=
ra">EXTRANATIVEPATH +=3D &quot;bzip2-native&quot;</div><div><br></div><div>=
This will ensure that you get our bzip2-native in the sysroot, and EXTRANAT=
IVEPATH will extend $PATH to include it so you don&#39;t need to use absolu=
te paths but can just use bzip2 as usual.</div><div><br></div><div>Ross</di=
v></div></div></div>

--001a1139cdf06e732805490ad9dc--
