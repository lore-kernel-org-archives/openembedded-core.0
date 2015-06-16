Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id A35A4608B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 08:32:11 +0000 (UTC)
Received: by qkbp125 with SMTP id p125so922877qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 01:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rPHBIde/qSkmpSkzYfBdUwQo8YcU0h4ljDpkX0VB6lg=;
	b=Ojfy/2xG8j+PSlgT6sxPJmWZDu00WNhlvt7EpyXDs8XPEo5KRweJ75YCKb6rydcA2f
	QJc2NaIa9gXlUTo329vhLfWR2euwFpRZZXFO/j9znyO4+npVhEDdtWf5Xb6ROUe58ZkK
	rZUAqEuhi7jdPNK6s6V0k6E3oo0tC2508BQxBUtr8U8Z6MRdeUhARa8rdDFveISEYQp9
	s5eVpJZehv73L/zcQ7QjWtS5ge0cQlP+TQMkp8lny2qHV0KrasnCLENod2BBwmOp7At9
	wZEMiBNidy2Mj4b9tr5ap9CkY/XaHYOAcBYs/yEgeiOemuOBJciPmi7fPswKCsLePFVo
	6DmA==
X-Gm-Message-State: ALoCoQl1AnZphu1nxewovyWzK774G00iNUtZyosQl9UK6L2uIFySFfpr53mTf1b0jUuD9dosqogF
X-Received: by 10.55.40.18 with SMTP id o18mr68876320qkh.58.1434443533119;
	Tue, 16 Jun 2015 01:32:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 16 Jun 2015 01:31:52 -0700 (PDT)
In-Reply-To: <1433825286-925-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1433825286-925-1-git-send-email-jkrishnanjanappa@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Jun 2015 09:31:52 +0100
Message-ID: <CAJTo0LYykB_uAGMoiAm5zghHV9sHCtun3QJVjuVDQMx48Ey+8g@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][fido] runqemu: add support to boot arm64 qemu target from NFS
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
X-List-Received-Date: Tue, 16 Jun 2015 08:32:13 -0000
Content-Type: multipart/alternative; boundary=001a11440fb83e22ac05189e69a9

--001a11440fb83e22ac05189e69a9
Content-Type: text/plain; charset=UTF-8

On 9 June 2015 at 05:48, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> The other changes include,
> runqemu - fix MACHINE type being detected as qemuarm when qemuarm64 kernel
>           image name is given.
>
> runqemu-internal - Added console=ttyAMA0,115200 as one of the boot
> parameters
>                    for qemuarm, in order to print bootlog messages on the
>                    console.
>
>                  - Use "-nographic" option only if "serial" option is not
>                    specified. Otherwise we get below error when
>                    'runqemu <kernel_image> <rootfs_image> serial' is
> executed,
>
> (snip)
> QEMU 2.2.0 monitor - type 'help' for more information
> (qemu) qemu-system-aarch64: -serial stdio: cannot use stdio by multiple
> character devices
> -- CUT --
>
> qemuarm64 NFS booting has been tested successfully on Ubuntu 14.04 host.
>

So many changes that are unrelated to NFS on qemuarm64, please split the
patch up.

Ross

--001a11440fb83e22ac05189e69a9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2015 at 05:48, Jagadeesh Krishnanjanappa <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishnanjan=
appa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":du" class=3D"a3s" style=3D"overflow:hidden">The other changes incl=
ude,<br>
runqemu - fix MACHINE type being detected as qemuarm when qemuarm64 kernel<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image name is given.<br>
<br>
runqemu-internal - Added console=3DttyAMA0,115200 as one of the boot parame=
ters<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for qe=
muarm, in order to print bootlog messages on the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0consol=
e.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Use &quot;-=
nographic&quot; option only if &quot;serial&quot; option is not<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specif=
ied. Otherwise we get below error when<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;r=
unqemu &lt;kernel_image&gt; &lt;rootfs_image&gt; serial&#39; is executed,<b=
r>
<br>
(snip)<br>
QEMU 2.2.0 monitor - type &#39;help&#39; for more information<br>
(qemu) qemu-system-aarch64: -serial stdio: cannot use stdio by multiple cha=
racter devices<br>
-- CUT --<br>
<br>
qemuarm64 NFS booting has been tested successfully on Ubuntu 14.04 host.</d=
iv></blockquote></div><br>So many changes that are unrelated to NFS on qemu=
arm64, please split the patch up.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a11440fb83e22ac05189e69a9--
