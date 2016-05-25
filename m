Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id A771960043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 10:35:11 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id bi2so68840152igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 03:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9bDsat49JkSU8yw3xR3b4kZTF40kwKCYNP0cLLSFUVg=;
	b=lRHy8G4Bj6sobLjUIMrGlXzwSOBrBABXhLLBN7eKugPEmYmJOfidzQRE6c0ljrkvBa
	PQ/JQ6hqVZJow9ygfpZPgQB3Uiiaw3LILSbqd9HSwn97u5XhSYdAwW52t3yPcM5N3cK+
	nP5SOCytRN8+6lH4fu8Wvnl/jJ5qRWhX/BthPod0ujIwr13R1JVckl1wOt0nYK2GTdYs
	Q9VzzrnAV91Fg/QMXaClkyPzHnbnOFQghCmc3MYts3xh3MRngFyVNg/iymwkAfxkog+Y
	yqM+IkcBHje/6D/+KRG9Ma1WgPBJZFgF8h7RWrtqNx1FDoN7d9G0TPaqEE6cDvVa+b6P
	mWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9bDsat49JkSU8yw3xR3b4kZTF40kwKCYNP0cLLSFUVg=;
	b=M/ljvUsn2fIyyCv/jQUo4IS8ce7Wa1R3Kxbiz+iU6gam4Q3s1H2BbpkFWp2bml+Mem
	OT+3Yh3KpSCKX4hnqgqK2fRih3GuLHysPcnPa06REhVuc+OZ1kwO0mg7QFsZyY4mTJ6b
	OWp+i8m0GtNC/emxS5UzFVXSzq09+1wOalzyqEpudwUN1RPCu07qaj4FDfPKryyWLVtj
	mc5+jLAiHWwjyRXwfitNEf1z+FF6aG1mqy4ItGQtTuMOdcZ9ubbVboBpgHOXBu+TakGh
	MgAhMb0XxeJqTjWc9pyzKSK0/sHAzW58aIR33DnnzaAqYPzRbhdTPIszWdKBLgzU5UJc
	ad2Q==
X-Gm-Message-State: AOPr4FWe8vV06RtIIiecbB8B9JFTyX+X7El11T8BEsdd26Nwq9GpBdQuLjg0lnHS8ijO87k2G+r6eSLtIquyzQ8O
X-Received: by 10.50.160.10 with SMTP id xg10mr20793642igb.52.1464172511585;
	Wed, 25 May 2016 03:35:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 25 May 2016 03:34:51 -0700 (PDT)
In-Reply-To: <5745735E.60001@windriver.com>
References: <1464160265-16527-1-git-send-email-zhenbo.gao@windriver.com>
	<1464163536.9570.92.camel@linuxfoundation.org>
	<5745735E.60001@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 May 2016 11:34:51 +0100
Message-ID: <CAJTo0LZ3zqygisS6aEPb9ORv968A-4HfELkLpNkcvfgwmagxtQ@mail.gmail.com>
To: zhenbo <zhenbo.gao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: add alias for connman
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
X-List-Received-Date: Wed, 25 May 2016 10:35:13 -0000
Content-Type: multipart/alternative; boundary=001a1136a2f27180c00533a83a80

--001a1136a2f27180c00533a83a80
Content-Type: text/plain; charset=UTF-8

On 25 May 2016 at 10:41, zhenbo <zhenbo.gao@windriver.com> wrote:

> The draft patch looks like:
> ---
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -28,8 +28,6 @@ RDEPENDS_packagegroup-self-hosted = "\
>      "
>
>  RDEPENDS_packagegroup-self-hosted-host-tools = "\
> -    connman \
> -    connman-plugin-ethernet \
>      dhcp-client \
>      e2fsprogs \
>      e2fsprogs-e2fsck \
>
> What do you think? is that ok? if so, i will send an official patch for it.
>

I don't think self-hosted should include a specific network manager, and
you can also remove dhcp-client whilst you're there.  The image that pulls
in this packagegroup should handle any networking requirements.

Ross

--001a1136a2f27180c00533a83a80
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 May 2016 at 10:41, zhenbo <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe=
nbo.gao@windriver.com" target=3D"_blank">zhenbo.gao@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4hm" class=3D"a3=
s aXjCH m154e74b68516e469">The draft patch looks like:<br>
---<br>
--- a/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup-self-h=
osted.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-self-hosted.bb<=
/a><br>
+++ b/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup-self-h=
osted.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-self-hosted.bb<=
/a><br>
@@ -28,8 +28,6 @@ RDEPENDS_packagegroup-self-hosted =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS_packagegroup-self-hosted-host-tools =3D &quot;\<br>
-=C2=A0 =C2=A0 connman \<br>
-=C2=A0 =C2=A0 connman-plugin-ethernet \<br>
=C2=A0 =C2=A0 =C2=A0dhcp-client \<br>
=C2=A0 =C2=A0 =C2=A0e2fsprogs \<br>
=C2=A0 =C2=A0 =C2=A0e2fsprogs-e2fsck \<br>
<br>
What do you think? is that ok? if so, i will send an official patch for it.=
</div></blockquote></div><br>I don&#39;t think self-hosted should include a=
 specific network manager, and you can also remove dhcp-client whilst you&#=
39;re there.=C2=A0 The image that pulls in this packagegroup should handle =
any networking requirements.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a1136a2f27180c00533a83a80--
