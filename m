Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id EA68D7304E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 19:57:44 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id 1so136468995qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 11:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aEemgJoUwIXp+p7S5f/yQrBLVTEGQVp9rlc1LahTcww=;
	b=YCBLsXgIWnSY/dOUvBQIoW/NeYOiX+sxXQyYBTOWqyhIbht4utltCU/devpQmuf88E
	FxlUuK/Dn4vSKyTHbq7r+KsJ8FliMhulF8vfqsTlvu7V3WkPR9j43U1o+4BvDvBvcmfM
	hnDS+sAw9uH4HODpM+jCdV4gT9GYfwFApqrMr+6RXQoq7Mwy14OoJ9aJJ5NQS3vCd8Q6
	VWn8ezh8+DH1/X9yecJ93RMVUuOjIawNnTaRKglSXrZeD8KhJPezsRHslyoHeBfW2L4F
	dXGLtZv7SIMDygo4jZ1C2gwWrUmHB0IKiCLukspmhH7YwVmpKlwAqNrQHDXBu3DZRK5R
	WxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aEemgJoUwIXp+p7S5f/yQrBLVTEGQVp9rlc1LahTcww=;
	b=Wzd5jea0rbDkkhtyWnShUV/V1v+agToQoVeFIW03aFocoyeL4Rotyl31gEgHyNP6ti
	Rz4axpiNiPuKtBDrsYhayPs4F/tZVGxh5H8tNqvSRmkDBPuTpWYHjoXQMaSWlp10r1R1
	plII7WoPferSXh8uOQOuUljCIEMH5Ic9kJSjqfu5G+qQqtrNn3+zWnvOkmP9qUK8VfYf
	oZlkyK0fnGK32ISqQsLNywVb2ub/+xdKKQBJVhZu4KoC5aNNT/Mah9ThkUfHZhUox+Qt
	5A8dDvxao7Gi/DFgoupQYkOKWtlZkXtE6UR09VjikYHb4o5lu53AjI9GYx5lXACPonn7
	edJw==
X-Gm-Message-State: AMke39m8WUB12QTgG0GBQMM5ysrntYowU4KFW4P4jKHpIvE2qvwQJL7QhL4++CY8lySFInZwWLqSAtJaRlP9JOv1
X-Received: by 10.237.53.9 with SMTP id a9mr15673912qte.188.1489089465961;
	Thu, 09 Mar 2017 11:57:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 9 Mar 2017 11:57:25 -0800 (PST)
In-Reply-To: <1485209611-23858-1-git-send-email-jose.perez.carranza@linux.intel.com>
References: <1485209611-23858-1-git-send-email-jose.perez.carranza@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Mar 2017 19:57:25 +0000
Message-ID: <CAJTo0LZNJx08iHnc7G6ka57ky0=NbkV2WDE9ihT29-pba+8Y1g@mail.gmail.com>
To: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@intel.com>,
	Jose Perez Carranza <jose.perez.carranza@linux-ntel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/devtool: Add test to verify "modify virtual/kernel"
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
X-List-Received-Date: Thu, 09 Mar 2017 19:57:46 -0000
Content-Type: multipart/alternative; boundary=001a11c0285ea8694d054a51a857

--001a11c0285ea8694d054a51a857
Content-Type: text/plain; charset=UTF-8

On 23 January 2017 at 22:13, <jose.perez.carranza@linux.intel.com> wrote:
>
> +        checkmodcode = runCmd("strings %s | head -n 10 | grep '%s'" %
(bzimagefile, modstring))


Annoyingly this bit is failing on some autobuilders:

AssertionError: Command 'strings
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86-poky-linux/linux-yocto/4.10+git999-r0/image/boot/bzImage-4.10.0-yocto-standard
| head -n 10 | grep 'use a boot loader - Devtool kernel testing'' returned
non-zero exit status 1:
BFD:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86-poky-linux/linux-yocto/4.10+git999-r0/image/boot/bzImage-4.10.0-yocto-standard:
Warning: Ignoring section flag IMAGE_SCN_MEM_NOT_PAGED in section .bss

I'm wondering if grep on its own - not strings|head|grep - would work
around this?

(note that strings is "smart" and if executed on an ELF will use libbfd to
extract the segments with human strings in, which is why it's returning
errors from BFD)

Ross

--001a11c0285ea8694d054a51a857
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>On 23 January 2017 at 22:13, &lt;<a href=3D"mailto:jos=
e.perez.carranza@linux.intel.com">jose.perez.carranza@linux.intel.com</a>&g=
t; wrote:<br>&gt;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0checkmodcode =3D run=
Cmd(&quot;strings %s | head -n 10 | grep &#39;%s&#39;&quot; % (bzimagefile,=
 modstring))<br><br><br>Annoyingly this bit is failing on some autobuilders=
:<br><br>AssertionError: Command &#39;strings /home/pokybuild/yocto-autobui=
lder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86-poky-lin=
ux/linux-yocto/4.10+git999-r0/image/boot/bzImage-4.10.0-yocto-standard | he=
ad -n 10 | grep &#39;use a boot loader - Devtool kernel testing&#39;&#39; r=
eturned non-zero exit status 1:<br>BFD: /home/pokybuild/yocto-autobuilder/y=
octo-worker/nightly-oe-selftest/build/build/tmp/work/qemux86-poky-linux/lin=
ux-yocto/4.10+git999-r0/image/boot/bzImage-4.10.0-yocto-standard: Warning: =
Ignoring section flag IMAGE_SCN_MEM_NOT_PAGED in section .bss<div><br></div=
><div>I&#39;m wondering if grep on its own - not strings|head|grep - would =
work around this?</div><div><br></div><div>(note that strings is &quot;smar=
t&quot; and if executed on an ELF will use libbfd to extract the segments w=
ith human strings in, which is why it&#39;s returning errors from BFD)</div=
><div><br></div><div>Ross</div></div>

--001a11c0285ea8694d054a51a857--
