Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 314F66612D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 11:06:57 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id w1so71257541qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 04:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qbTUrsX44K8dLlJ+oxRPE8wkkqXJTd4nMoVHWe6I/0I=;
	b=Tj/UZOS8UzQYNS4uPITFp/jniLbjqe2f0Emv1Q2cyuoKVC/70NLgGuBgTSUu/gvmYF
	XhaJMYzX8VhKim9CbGvkE5lK9aF8eaRuDQRZWTtiHMnJ8AG9podNjIw+2q7dgtt+BJ1R
	LveJl4GDSl8YmPo81LKsjwVBZf3MD+hOUUpyuet5bkEt4VbHYClwN49PsRCZBgozBS+T
	y5YQdPMtXM43S2reJtmuIO8BQ/UfAhbKy2noBMxQo5r6lFBuqfpkkPe4a4bZcgMG2ZSt
	HW3sSzzjMiXNFUDxybf3mWsK6vVDwL0pLYyIJT92YQfP2BsZ7EI/hcqtmv7H0nSdor+E
	zTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qbTUrsX44K8dLlJ+oxRPE8wkkqXJTd4nMoVHWe6I/0I=;
	b=Pg27FOK5YhRFj0XUckLAOmT5mnRtzW6DidQmY9k1OZwHPfk/op+xvkZFDBuO43qjDV
	CtKpGXd0xy7naO+PARojyFQAtCiVbwhd3ETQZcYsPzgVND1z6lAPI92GD0EJWDEVEcRE
	1L9PESXROd/fH8O0AzjsTFWldbrmWqoQqY8z4wHTDGt+BD5W9jSaqDb0iMVJURQI4F22
	+wnCNI0xRpZgpSZg+3WyquFqDpQofuHn2lpjK0GKzLrzOMhTx2zs1PSst3cSZbSD1Z/5
	FDHmf1WNTc7n5FXAvWIJADQcdpfaH3Bf6yYFlJaIntED0UShXnup9W85WzL1Oa/6zN/R
	0LRw==
X-Gm-Message-State: AODbwcBHSerq6WUfWinLI//6S2Asu53MnOYh7MBF2V+DntK8yvwAa8MN
	R/TBCeewVjd/UWH/dLnxYgZZSq7Xy3TK
X-Received: by 10.200.62.25 with SMTP id z25mr37194627qtf.139.1497006418766;
	Fri, 09 Jun 2017 04:06:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 9 Jun 2017 04:06:38 -0700 (PDT)
In-Reply-To: <1496926311-12090-1-git-send-email-changhyeok.bae@gmail.com>
References: <1496926311-12090-1-git-send-email-changhyeok.bae@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Jun 2017 12:06:38 +0100
Message-ID: <CAJTo0LYqAfsfkKqcViGt92_JK8g3q3LXAgX57z+mmMSgqA5uOw@mail.gmail.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] openssl: Upgrade 1.0.2k -> 1.0.2l
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
X-List-Received-Date: Fri, 09 Jun 2017 11:07:00 -0000
Content-Type: multipart/alternative; boundary="f403045ee67ed140d4055184f7df"

--f403045ee67ed140d4055184f7df
Content-Type: text/plain; charset="UTF-8"

On 8 June 2017 at 13:51, Changhyeok Bae <changhyeok.bae@gmail.com> wrote:

> Dropped obsolete patches, because the new version contains them:
>   - fix-cipher-des-ede3-cfb1.patch
>   - openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>
This failed all over the autobuilder:

http://errors.yoctoproject.org/Errors/Details/144268/:

mips64-poky-linux-objcopy: Unable to recognise the format of the input file
`TOPDIR/tmp/work/mips64-poky-linux/openssl/1.0.2l-r0/package/usr/lib/openssl/ptest/test/x509aux'

http://errors.yoctoproject.org/Errors/Details/144261/:
Architecture did not match (x86-64, expected x86) on
/work/i586-poky-linux/openssl/1.0.2l-r0/packages-split/openssl-ptest/usr/lib/openssl/ptest/test/x509aux
[arch]

If that file is an ELF (which is unlikely) then removing the executable bit
should be enough.

Ross

--f403045ee67ed140d4055184f7df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 June 2017 at 13:51, Changhyeok Bae <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:changhyeok.bae@gmail.com" target=3D"_blank">changhyeok.bae@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-=
color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:24q" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m15c87c34368033c0">Dropped obsolete patches, beca=
use the new version contains them:<br>
=C2=A0 - fix-cipher-des-ede3-cfb1.patch<br>
=C2=A0 - <span class=3D"gmail-il">openssl</span>-avoid-NULL-pointer-<wbr>de=
reference-in-EVP_DigestInit_<wbr>ex.patch<br></div></blockquote></div>This =
failed all over the autobuilder:<br><br><a href=3D"http://errors.yoctoproje=
ct.org/Errors/Details/144268/">http://errors.yoctoproject.org/Errors/Detail=
s/144268/</a>:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">mips64-poky-linux-objcopy: Unable to recognise the format of the i=
nput file `TOPDIR/tmp/work/mips64-poky-linux/openssl/1.0.2l-r0/package/usr/=
lib/openssl/ptest/test/x509aux&#39;<br><br><div class=3D"gmail_extra"><a hr=
ef=3D"http://errors.yoctoproject.org/Errors/Details/144261/">http://errors.=
yoctoproject.org/Errors/Details/144261/</a>:</div><div class=3D"gmail_extra=
">Architecture did not match (x86-64, expected x86) on /work/i586-poky-linu=
x/openssl/1.0.2l-r0/packages-split/openssl-ptest/usr/lib/openssl/ptest/test=
/x509aux [arch]</div></div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">If that file is an ELF (which is unlikely) then removing t=
he executable bit should be enough.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--f403045ee67ed140d4055184f7df--
