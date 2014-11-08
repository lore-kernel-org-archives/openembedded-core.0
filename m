Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id EEA3C7029A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 09:55:47 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id z107so3564065qgd.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Nov 2014 01:55:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3ZDBH8qMHzMwtfDe3+lDKz3sOaP8TP0zN2+6Exq61Vc=;
	b=c1cFOeOsZ2o1ii+NfueRJIGb1CFuI5H5++V8i0+kQuEfe/F/3PoG2FiupjWf6L+QYI
	cBUgybs+XuvNPYHx5HRdMP3k6W9gc7N6OyKS0Dbiuf3qjhWRSzGo1uSEClb71od1VYO6
	UshpqIzZikSYRddxvfkl6p51UzdK7B0xfN0NdKag9F9hf05Y8vNdu9U2wIjKyd7zgblM
	m2thMLNUVS87XTRpHoDGHNK1ahhyvpxjfOVI26BR5dB6e7lEk3fYWTHs5YIWRyTADb9w
	oUkDoD/pCmfOOOWhVYM9SZKZ8TbnQHAdY5KfdwJY5biTUz9yOrBminpFr5qfisMNlcz6
	uC2w==
X-Gm-Message-State: ALoCoQnQpuDFn/8f4t0f8JWQZ3Zpy/QUjERcgzk13v9RGyv8yw2YWkWu2QwtOGZi92eg7wbigryd
X-Received: by 10.140.28.70 with SMTP id 64mr7070251qgy.15.1415440548113; Sat,
	08 Nov 2014 01:55:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Sat, 8 Nov 2014 01:55:27 -0800 (PST)
In-Reply-To: <CAJTo0LbUiPaj5aE0Eb0W9zGthfqx5ct4+6-obv0pJEwPMseuiw@mail.gmail.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
	<CAJTo0LbUiPaj5aE0Eb0W9zGthfqx5ct4+6-obv0pJEwPMseuiw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 8 Nov 2014 09:55:27 +0000
Message-ID: <CAJTo0LY+Mx8KnjsuCQ==ROG5V286_ZDViJ1xPVe0FxAY58mm9A@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/25] Add machine qemuarm64
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
X-List-Received-Date: Sat, 08 Nov 2014 09:55:51 -0000
Content-Type: multipart/alternative; boundary=001a113a970a124a63050755ef55

--001a113a970a124a63050755ef55
Content-Type: text/plain; charset=UTF-8

On 8 November 2014 08:53, Burton, Ross <ross.burton@intel.com> wrote:

> On 6 November 2014 15:34, Kai Kang <kai.kang@windriver.com> wrote:
>
>> It has been tested for core-image-minimal core-image-sato
>> core-image-sato-sdk
>> meta-toolchain and world.
>>
>
> When I boot core-image-sato, X can't start.  Does the virtual machine that
> qemu runs not have video support at the moment?
>

I also see that the gdk-pixbuf postinstall script that runs in a userspace
qemu on the host is failing with the "FATAL: kernel too old".  Is this a
known issue?

Ross

--001a113a970a124a63050755ef55
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 8=
 November 2014 08:53, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:=
ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><=
div class=3D"gmail_quote"><span class=3D"">On 6 November 2014 15:34, Kai Ka=
ng <span dir=3D"ltr">&lt;<a href=3D"mailto:kai.kang@windriver.com" target=
=3D"_blank">kai.kang@windriver.com</a>&gt;</span> wrote:<br></span><span cl=
ass=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex"><div style=3D"overflow:hidden">It has been tested=
 for core-image-minimal core-image-sato core-image-sato-sdk<br>
meta-toolchain and world.</div></blockquote><div><br></div></span><div>When=
 I boot core-image-sato, X can&#39;t start.=C2=A0 Does the virtual machine =
that qemu runs not have video support at the moment?</div><span class=3D"">=
<font color=3D"#888888"><div></div></font></span></div></div></div></blockq=
uote></div><br></div><div class=3D"gmail_extra">I also see that the gdk-pix=
buf postinstall script that runs in a userspace qemu on the host is failing=
 with the &quot;FATAL: kernel too old&quot;.=C2=A0 Is this a known issue?</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a113a970a124a63050755ef55--
