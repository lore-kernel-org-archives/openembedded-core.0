Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4BFB471AC6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 15:35:29 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id s186so102305819qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 07:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ATAeMyDtbCNOZOBo66g91COphJYCJC5WNdv+WesjyU8=;
	b=U/TkB5DPKgRQ61j3wRyQp7RMEvp/7mqE6UFzskFtZhNuKNGjmPQvCvYPj4IHs9Pmtg
	Rr4WNrb9TrlJr7P/0BVghZXXm0B3mKRl4FSFnvyZmF+O1WFeHOHORkSgYvWsZj4GHjCA
	XIFYL8BkanpMsqciq/kBHvuppNrOoNvOfsh+xehg3Y+fAVte5JklSfuQA0H2rfgzCq9i
	dEFGGtMyYtlmkT+IlYnGrencpv9K7P7PuD5K+0j4m9x6pJknNodEe+Zl1ldJDd4a2y+R
	QZr9U6Pi1RxA1BApc7IZjoqlPoBJUWIPIXmsoyRFsg7tc6eQm3Kd0iYIh53KzMW4mcqC
	DoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ATAeMyDtbCNOZOBo66g91COphJYCJC5WNdv+WesjyU8=;
	b=XVSb4nd80THmrDVdXRDQQXTKHeCOJi8iY1lpu7ceYhQyM5xK0DMEAFXm1yZpb3Cwvh
	LuGpQDDsXVfO79MF/uMjEFGE21ubrYn4VblTgqLfTGl9/mTdITjdaPkS5qWZLVfTMFUb
	mgRBodQ4xaZ0Inz4jGD6CiaDuX+TlDObd7Wopm5SRSV3r5AQg96jueij0KpmsXbdjN6S
	TI61u7R+jDyVsbym2aH54bdYbfq3L9GB9N5R5uCQMRoxYuwnHwitQTmv1wEs8uumEF4U
	/mX66SRCgn4pxqY1K6FQiGfBwcUCgWmPruaW2qlB1RDJibno91E1GzZUXAg2m/YAfwpl
	FNkQ==
X-Gm-Message-State: AMke39l/Wr+dJ4OPm5AEKMYphcxfJOOezf2XUX2nRBEFa9mbuFPQRbHw0yEYgstH2QftnS9j/O1xtEbqnYzsD+t2
X-Received: by 10.55.1.134 with SMTP id u6mr18136781qkg.36.1488209730736; Mon,
	27 Feb 2017 07:35:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 27 Feb 2017 07:35:10 -0800 (PST)
In-Reply-To: <20170227150536.15378-1-andhorsthemke@gmail.com>
References: <20170227150536.15378-1-andhorsthemke@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Feb 2017 15:35:10 +0000
Message-ID: <CAJTo0LYmQj2y_HxBt02efd0906Ljs+FcJE06s=_svn1cCCLHzg@mail.gmail.com>
To: Andreas Horsthemke <andhorsthemke@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lz4: upgrade to v1.7.5
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
X-List-Received-Date: Mon, 27 Feb 2017 15:35:31 -0000
Content-Type: multipart/alternative; boundary=001a114046c45a8ebe054984d4b4

--001a114046c45a8ebe054984d4b4
Content-Type: text/plain; charset=UTF-8

On 27 February 2017 at 15:05, Andreas Horsthemke <andhorsthemke@gmail.com>
wrote:

> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=0b0d063f37a4477b54af2459477dca
> fd"
> +# The source includes GPLv2 and BSD licensed files.
> +# The library in the `lib` directory is under BSD 2-Clause license.
> +# The CLI tools are GPLv2 licensed.
> +LICENSE = "GPLv2 & BSD"
> +LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc
> \
> +                    file://programs/COPYING;md5=
> b234ee4d69f5fce4486a80fdaf4a4263"
>

If you split the package into a library and binaries then the respective
licenses can be on the right parts.


> -PV = "131+git${SRCPV}"
> +PV = "1.7.5+git${SRCPV}"
>

131 > 1.7.5, so you'll need to add PE="1" to ensure upgrades happen.

Ross

--001a114046c45a8ebe054984d4b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 February 2017 at 15:05, Andreas Horsthemke <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:andhorsthemke@gmail.com" target=3D"_blank">andhorsthemke@gmai=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4=
8y" class=3D"a3s aXjCH m15a801c9c4e4dc5a">-LICENSE =3D &quot;BSD&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://lib/LICENSE;md5=3D<wbr>0b0d063f37a4477b5=
4af2459477dca<wbr>fd&quot;<br>
+# The source includes GPLv2 and BSD licensed files.<br>
+# The library in the `lib` directory is under BSD 2-Clause license.<br>
+# The CLI tools are GPLv2 licensed.<br>
+LICENSE =3D &quot;GPLv2 &amp; BSD&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://lib/LICENSE;md5=3D<wbr>ebc2ea4814a64de77=
08f1571904b32<wbr>cc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://programs/COPYING;md5=3D<wbr>b234ee4d69f5fce4486a80fdaf4a42<wbr>63&quot;<=
br></div></blockquote><div><br></div><div>If you split the package into a l=
ibrary and binaries then the respective licenses can be on the right parts.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":48y" clas=
s=3D"a3s aXjCH m15a801c9c4e4dc5a">-PV =3D &quot;131+git${SRCPV}&quot;<br>
+PV =3D &quot;1.7.5+git${SRCPV}&quot;</div></blockquote></div><br>131 &gt; =
1.7.5, so you&#39;ll need to add PE=3D&quot;1&quot; to ensure upgrades happ=
en.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a114046c45a8ebe054984d4b4--
