Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1C80371C27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 15:41:23 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id f11so16320135qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 08:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uPQz9GA3Dv2VBdADP1eLChd1BhnlRJizb1sy3GnpzD0=;
	b=MGDr0w2Pu2RPA2Zsn2lT0LSLcGG4kuVF4Ii9AUZqcINimN+xXxK98Xli6ibAbG1h1q
	6rFSpFdwj1ATiwTGHBiaAh6dfOWZjVVPeM5MgslGBtTDSWu3btPzo2raVTCCFVTkkKb0
	Og9Dn+K9vkBiQ8QlacOTOyHBmF6fzW54ygSQe5x7A88fJ5P5mwDW8BwqezlZzTR5Z13w
	9hbVQ9anih/nEKQGSKRixPKEm1j/bmMWdynA5+iz6U4WJJlL/bHb8lv/ha3OzJEoVjWr
	1KDWKCL6hFy+1Gqdcc6bKi+AZCeyw+JyeHO+2QqDfO3dXMZnUVd9GTB/t3L6KWHLkGnX
	zUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uPQz9GA3Dv2VBdADP1eLChd1BhnlRJizb1sy3GnpzD0=;
	b=CyreY+n+7Gn7trjHsTiM9MUr5usCoDtYwkrtT19397ZM4bNLhnCxPZRO5bP8YbS5fh
	dOd/Kz57Ir7ZGXnGiLdLCzAPn61ZGS469GRphW6etYAnQJYXX5i63A6R6+9u9VoQZaK2
	EI6b1L2aAgHTSdnKNxBhdUFP47Gciw52VkyPI+eLJWHmEKbMl022A1kEu4u4CWzuInsI
	q1wT4nlwfNRIxgSlhS11CUvq2nk1elNV0D3kEW3GRuefM6LrpDbMOvbAPhbeujXV0olg
	IZ+1Xn+BqYiJuJBU6GkTJp3AdYRsee784cpzfHUnrbCadzPe1Kj3nM6hUb6V/6B4WnDG
	jIiw==
X-Gm-Message-State: AFeK/H029c0TzWL9EbIiXnDtxtcYT38IMO6SmGDPyyKq5IlcQo1ATJupLM3n/1zL65PN9U6nuSKZAL7Ay0R6dMjT
X-Received: by 10.55.20.100 with SMTP id e97mr1268118qkh.3.1490802084162; Wed,
	29 Mar 2017 08:41:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 29 Mar 2017 08:41:03 -0700 (PDT)
In-Reply-To: <1490741109-18909-1-git-send-email-stefan@agner.ch>
References: <1490741109-18909-1-git-send-email-stefan@agner.ch>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Mar 2017 16:41:03 +0100
Message-ID: <CAJTo0LZS0OKSGiX2=6Q-dWFgGrKfF0VXhwq88wtHExTSP9iFpw@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] util-linux: make blkdiscard a separate package
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
X-List-Received-Date: Wed, 29 Mar 2017 15:41:24 -0000
Content-Type: multipart/alternative; boundary=001a11401104a86e47054be068cb

--001a11401104a86e47054be068cb
Content-Type: text/plain; charset=UTF-8

On 28 March 2017 at 23:45, Stefan Agner <stefan@agner.ch> wrote:

> @@ -30,8 +30,8 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk
> util-linux-cfdisk util-linux-sfd
>               util-linux-swaponoff util-linux-losetup util-linux-umount \
>               util-linux-mount util-linux-readprofile util-linux-uuidd \
>               util-linux-uuidgen util-linux-lscpu util-linux-fsck.cramfs
> util-linux-fsck \
> -             util-linux-blkid util-linux-mkfs util-linux-mcookie
> util-linux-reset \
> -             util-linux-lsblk util-linux-mkfs.cramfs util-linux-fstrim \
> +             util-linux-blkdiscard util-linux-blkid util-linux-mkfs
> util-linux-mcookie \
> +             util-linux-reset util-linux-lsblk util-linux-mkfs.cramfs
> util-linux-fstrim \
>               util-linux-partx util-linux-hwclock util-linux-mountpoint \
>               util-linux-findfs util-linux-getopt util-linux-sulogin
> util-linux-prlimit"
>

We're growing a lot of packages containing a single binary.  Would it be
sensible to group them into "file system tools", "process tools", etc?

Ross

--001a11401104a86e47054be068cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 March 2017 at 23:45, Stefan Agner <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:stefan@agner.ch" target=3D"_blank">stefan@agner.ch</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":yn" class=3D"a3s aXjCH m15=
b171ab2ecb0014">@@ -30,8 +30,8 @@ PACKAGES =3D+ &quot;util-linux-agetty uti=
l-linux-fdisk util-linux-cfdisk util-linux-sfd<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 util-linu=
x-swaponoff util-linux-losetup util-linux-umount \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 util-linux-mount util-linu=
x-readprofile util-linux-uuidd \<br>
</span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 util-linux-uuidgen =
util-linux-lscpu util-linux-fsck.cramfs util-linux-fsck \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-linux-blkid util-linu=
x-mkfs util-linux-mcookie util-linux-reset \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-linux-lsblk util-linu=
x-mkfs.cramfs util-linux-fstrim \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-linux-blkdiscard util=
-linux-blkid util-linux-mkfs util-linux-mcookie \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-linux-reset util-linu=
x-lsblk util-linux-mkfs.cramfs util-linux-fstrim \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 util-linux-partx util-linu=
x-hwclock util-linux-mountpoint \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 util-linux-findfs util-lin=
ux-getopt util-linux-sulogin util-linux-prlimit&quot;</div></blockquote></d=
iv><br>We&#39;re growing a lot of packages containing a single binary.=C2=
=A0 Would it be sensible to group them into &quot;file system tools&quot;, =
&quot;process tools&quot;, etc?</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--001a11401104a86e47054be068cb--
