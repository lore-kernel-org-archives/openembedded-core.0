Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id E116865D3B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 11:14:12 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id bm13so3330277qab.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 03:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vDkMWWuEiOYyLbcSfXR01qbzpY4kHk0GZafOCj7uyH0=;
	b=AORxY+DRN5rfHoQ7CIFZ+oWc/WpZVLc2us3ZHTYzvk242IgtqDxiNVN0+R9M2ucqTg
	8Q2tTfzCW3TrynsSLh8jyJUzO9TjVEHeSOeG7fTly9IIoqtCnZlwWcHdlKhdI5+T6z7O
	eFLrd0Dz78B78rZJJrH4Vc9yG+itCu/xx9vnBL+AOAKMFGMLoN9iUUK7Kwpz45fO2Iad
	0WynbM0gZHlQmYGFCGpzpJ3Ye30eWaRPP7Y71AMhjOUGSffcwKAL3bZo9e2mpG5Jp+Ed
	XGxgR4cYlKIHWlpAg1Hwo/kcr+TzjSYEyn3PO3terli4h96OkNt15YZoUinNeyVrypz5
	C10A==
X-Gm-Message-State: ALoCoQmb7OlWr8Zqeeoo39XB1UBfXfugFTTSvbtzbo11NP0lPJ2h0D4QEX80f2WNbGdAHMQuO6I0
X-Received: by 10.224.92.205 with SMTP id s13mr18848946qam.52.1418296453018;
	Thu, 11 Dec 2014 03:14:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 11 Dec 2014 03:13:51 -0800 (PST)
In-Reply-To: <20141211092332.GA2467@jama>
References: <20141211092332.GA2467@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Dec 2014 11:13:51 +0000
Message-ID: <CAJTo0LYwYW40XvxNN=rY4z6fK+4NJ2ZFxa2xsUvuspERa_MT+A@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, test-dependencies 2014-12-11
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
X-List-Received-Date: Thu, 11 Dec 2014 11:14:23 -0000
Content-Type: multipart/alternative; boundary=089e015375e444ce150509eee04b

--089e015375e444ce150509eee04b
Content-Type: text/plain; charset=UTF-8

On 11 December 2014 at 09:23, Martin Jansa <martin.jansa@gmail.com> wrote:

> WARN: gst-plugins-bad: gst-plugins-bad-meta rdepends on
> gst-plugins-bad-rtmp, but it isn't a build dependency?
> ERROR: gst-plugins-bad: gst-plugins-bad-rtmp package isn't created when
> building with minimal dependencies?
> ERROR: gst-plugins-bad: gst-plugins-bad-rtmp-dev package isn't created
> when building with minimal dependencies?
>

Coincidently last night my world run gave me warnings that
gst-plugins-bad-rtmp was depending on rtmpdump without a build depends, so
I've copied the PACKAGECONFIG[rtmp] from gstreamer1.0-plugins-bad to
gst-plugins-bad.  Presumably this will fix these errors, although that
warning seems odd.

Ross

--089e015375e444ce150509eee04b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
1 December 2014 at 09:23, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":32d" class=3D=
"a3s" style=3D"overflow:hidden">WARN: gst-plugins-bad: gst-plugins-bad-meta=
 rdepends on gst-plugins-bad-rtmp, but it isn&#39;t a build dependency?<br>=
ERROR: gst-plugins-bad: gst-plugins-bad-rtmp package isn&#39;t created when=
 building with minimal dependencies?<br>
ERROR: gst-plugins-bad: gst-plugins-bad-rtmp-dev package isn&#39;t created =
when building with minimal dependencies?</div></blockquote></div><br>Coinci=
dently last night my world run gave me warnings that gst-plugins-bad-rtmp w=
as depending on rtmpdump without a build depends, so I&#39;ve copied the PA=
CKAGECONFIG[rtmp] from gstreamer1.0-plugins-bad to gst-plugins-bad.=C2=A0 P=
resumably this will fix these errors, although that warning seems odd.</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--089e015375e444ce150509eee04b--
