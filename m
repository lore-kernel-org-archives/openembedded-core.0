Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id A25D378641
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 14:15:26 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id c195so3015631itb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yWPJZh9ycjFfDPC9udbl7gBiINjgQLP44kz8A0JUBfU=;
	b=JeX5KWQ4PLfK14OFX53AczlyaqTmZHxfV3kMgVIq7tPecyWpG1VjnNZztEEvB/q31Z
	omE2dcuZJUa3dJ1SBZ3R0md71HcF3X9aBBjZQm2dm4fMKyqL480bAMfMxBpJTxZhk6wA
	k+FcHayI5yRzJzfXU5ojrPvYSxoJ7SBbWAVCT/8iw9Ri3cvsjxTnK0o3fcn91yIsg1yM
	W4ftWo56+ELEhCeXslXWden3FxdzRgk0SH+OEMmRCzezopneDwBpmTsycHbk5dJuOYz6
	qcXG3QgAFljkRyHIVwZn1nxEXHutUBJNUXYKkONF1155N/Do+JvdxBUz/qBDzYvPQDsI
	we/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yWPJZh9ycjFfDPC9udbl7gBiINjgQLP44kz8A0JUBfU=;
	b=CDclnN66PzAB0yc1FSnBzj9ZL9J9mcDsFK6gUbVQc7eilvdc6qvjWYz7OQG79EL8vB
	zRr9jzEvhHcD5d907U3e5S9L1WMuOBoYqsrHFoLCIiaMGWTINEeuvLs0XPEYf9+EYqRV
	GAJbUcdpiXiIXu9v8k1Gx2GH1XuDOofb9UQ5ucdKXAam5OZytDeqmxuzEBNgSw6/GCGp
	H09BRxRgvwLr5rKh/l3t7ykQPwcDrEhGLiVglADKVilE4T+mO1Yd6eezuF4H0U75bTHe
	SIzHJsOmByvGShDHRemedUmFqqUvJWP3hAwO8KVk9we1kB7QyY249imj+oCm3DTUxhsa
	fpNQ==
X-Gm-Message-State: AHPjjUhifcw8WUmJlhZyagYSBK/qw6Fccx9ruI5ZRTcZQ+ls8DzYKIJs
	kAMa7MmEKQ8zsVQd7oFcDgXGI4Is1yA+Fi+FD/cAUA==
X-Google-Smtp-Source: AOwi7QDJ3JaSslX/G+FoAXur5v4kBAk7v5oXddC/fPKUx74LOFjZWviwTV8Qjai0mUaCEinFx0AgRdUgXGlogvoa+og=
X-Received: by 10.36.237.204 with SMTP id r195mr4904334ith.48.1505312127800;
	Wed, 13 Sep 2017 07:15:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 13 Sep 2017 07:15:07 -0700 (PDT)
In-Reply-To: <20170913141259.GB3288@jama>
References: <1504215229-79715-1-git-send-email-juro.bystricky@intel.com>
	<CA+chaQfbZAM+mjNvZ-HYe=XZnNJz+H7Wq9z1vcEsMgDY=CUksg@mail.gmail.com>
	<CAJTo0LYArQkU-OtvmiSwsfa7DaxkiMNPYYTvr_kChi9RvpgC=w@mail.gmail.com>
	<CA+chaQdAuijLCAM8UzwMh1DO-7gc5tD3Ek3DYc-9rUNBY=85cg@mail.gmail.com>
	<20170913141259.GB3288@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Sep 2017 15:15:07 +0100
Message-ID: <CAJTo0LZCPU5spNk6h=E1CvU+uOQCxi0hbDZPj94QV53caVmCaw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: upgrade to version 2.10.0
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
X-List-Received-Date: Wed, 13 Sep 2017 14:15:26 -0000
Content-Type: multipart/alternative; boundary="94eb2c042c16a76ab8055912ca5f"

--94eb2c042c16a76ab8055912ca5f
Content-Type: text/plain; charset="UTF-8"

On 13 September 2017 at 15:12, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, Sep 01, 2017 at 01:44:56PM +0200, Martin Jansa wrote:
> > I don't know how accelerated GL will be in the end, but this commit:
> > https://git.qemu.org/?p=qemu.git;a=commitdiff;h=
> 474114b7305cc1be7c2ee8ba5267be159a9d56e3
> > made it possible.
> >
> > I've built qemu with my Gentoo host with virgl and spice support, and I
> > plan to try how fast it goes.
>
> I've some WIP changes to build qemu-native with virglrenderer enabled in:
> http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/qemu
>
> and few more to enable spice as well in:
> http://git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/spice


Awesome. Can't wait to see how it performs.

Ross

--94eb2c042c16a76ab8055912ca5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 13 September 2017 at 15:12, Martin Jansa <span dir=3D"l=
tr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.=
jansa@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Fri,=
 Sep 01, 2017 at 01:44:56PM +0200, Martin Jansa wrote:<br>
&gt; I don&#39;t know how accelerated GL will be in the end, but this commi=
t:<br>
&gt; <a href=3D"https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D47411=
4b7305cc1be7c2ee8ba5267be159a9d56e3" rel=3D"noreferrer" target=3D"_blank">h=
ttps://git.qemu.org/?p=3Dqemu.<wbr>git;a=3Dcommitdiff;h=3D<wbr>474114b7305c=
c1be7c2ee8ba5267be<wbr>159a9d56e3</a><br>
&gt; made it possible.<br>
&gt;<br>
&gt; I&#39;ve built qemu with my Gentoo host with virgl and spice support, =
and I<br>
&gt; plan to try how fast it goes.<br>
<br>
</span>I&#39;ve some WIP changes to build qemu-native with virglrenderer en=
abled in:<br>
<a href=3D"http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dj=
ansa/qemu" rel=3D"noreferrer" target=3D"_blank">http://git.openembedded.org=
/<wbr>openembedded-core-contrib/log/<wbr>?h=3Djansa/qemu</a><br>
<br>
and few more to enable spice as well in:<br>
<a href=3D"http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dj=
ansa/spice" rel=3D"noreferrer" target=3D"_blank">http://git.openembedded.or=
g/<wbr>meta-openembedded-contrib/log/<wbr>?h=3Djansa/spice</a></blockquote>=
<div><br></div><div>Awesome. Can&#39;t wait to see how it performs.</div><d=
iv><br></div><div>Ross</div></div></div></div>

--94eb2c042c16a76ab8055912ca5f--
