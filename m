Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 72F1160722
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 23:30:27 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id nk17so83214894igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 16:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mBFPn1RKMFeyPH++TbbR3M5xRm4vTL29D3H4PMxJR8g=;
	b=Ta+f/hZq6YMP0J+OytmPUUB0Yt2XnaYV4+BIzrEZkUSqZ7gp6LMi7iXM0TP3qNY89r
	AyQHdoK1TS33p0rCcp/O5pXvqEpXWwyeb998ZV77M1d+Io9jq47Km0G5JwM1buguUFTi
	0a+8IWljtk03xikn1MIU3YQljZcvUGmGKYHEqhgLbbLPXNmmzRqcDrHTyNLR3YIxSw+O
	keQRMzXi0UfrCEgIgedGIkQaQwEBwtHepKKb0gI1kneBuDm7vnxRgScRoTr9VKQirW82
	pQ/fgzo7NPtGA9zKZGUuc9ataHOaTwhaQomdMLyWLvSxS/Vfli7h9AQSpHQJNLmD4hTo
	lSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mBFPn1RKMFeyPH++TbbR3M5xRm4vTL29D3H4PMxJR8g=;
	b=dWGYZdoT2uHUUjXiq8q77kj4ab3aPnTDzPAHyED5G90pMLZrUewGTVyi1cVAS1danh
	6gaBmDQrhkwXeKxUfqqNIjzY7SBDGLRer3OwdWRv4rCTOury6VoovHypfuOkiSmE4RzA
	CvXjQYOXQJVrBk0ihwYxV8DZcQ9vkzBOPirwlkfpIYcor4giqgtqR2jeLqZN1d9nAQe/
	ik5qQ9HICNbz0mEXi5TTMRAWEo4ajWs2MZRUHrc1l/7NG5Z98hqEUEk5IGguFs6SWRVZ
	OERa0sEWglHJ/Fg0zGvEFdAWWZcgfIaIkTPrtIedko8HtBq880AKs++LTI9+loLujSF2
	g9fA==
X-Gm-Message-State: AD7BkJKPMEnbrv6sbwddFAbwyA3B60PLAS9us0qzY4xUHCHI9bVSSFSlE8iQJF0bkxYsuAqiYqIn+eR9n7vyLV6n
X-Received: by 10.50.43.226 with SMTP id z2mr15811700igl.78.1458603027737;
	Mon, 21 Mar 2016 16:30:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 21 Mar 2016 16:30:08 -0700 (PDT)
In-Reply-To: <98344b2eaa67b64a8397652dcb3c51d5dbe39a61.1458582024.git.jussi.kukkonen@intel.com>
References: <cover.1458582024.git.jussi.kukkonen@intel.com>
	<98344b2eaa67b64a8397652dcb3c51d5dbe39a61.1458582024.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Mar 2016 23:30:08 +0000
Message-ID: <CAJTo0LZQAcsMTkhqK8-S2LhqbCYCTWTGBS2Wqv3h6eQbh0haOg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] glib-2.0: Install gio-querymodules in main package
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
X-List-Received-Date: Mon, 21 Mar 2016 23:30:28 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f4566e87052e977b4b

--047d7bfea0f4566e87052e977b4b
Content-Type: text/plain; charset=UTF-8

On 21 March 2016 at 18:29, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> gio-querymodules should be used whenever new Gio modules are
> installed (to regenerate the module cache) so it should be
> available by default.
>

packages/corei7-64-poky-linux/glib-2.0/glib-2.0: FILELIST: added
"/usr/bin/gio-querymodules /usr/share/glib-2.0/gettext/po/Makefile.in.in"
  * FILES: added "/usr/bin/gio-querymodules"
packages/corei7-64-poky-linux/glib-2.0/glib-2.0: PKG changed from
libglib-2.0-0 to glib-2.0 [default] - may indicate debian renaming failure

(and another few pages of rename warnings as everything renamed from
libglib-2.0-0-locale-foo-bar to glib-2.0-locale-foo-bar)

Basically the debian renamer doesn't take effect if there are binaries in
the package.  Maybe we need to inherit lib_package (if possible) and put
key binaries (such as this) into libglib-2.0-bin and the rest into -utils.
A fair number of the utils could be moved to -dev anyway, such as
genmarshal and mkenums.

Looking at this did show some other odd file placement in the glib recipe
though:
* gschema.dtd in PN instead of somewhere else (PN-dev?)
* gdbus-codegen should be in PN-codegen?
* glib-gettext/Makefile.in.in should be in PN-dev?

Ross

--047d7bfea0f4566e87052e977b4b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 March 2016 at 18:29, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"=
mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex"><div id=3D":bhh" class=3D"" styl=
e=3D"overflow:hidden">gio-querymodules should be used whenever new Gio modu=
les are<br>
installed (to regenerate the module cache) so it should be<br>
available by default.</div></blockquote></div><br><div class=3D"gmail_extra=
">packages/corei7-64-poky-linux/glib-2.0/glib-2.0: FILELIST: added &quot;/u=
sr/bin/gio-querymodules /usr/share/glib-2.0/gettext/po/<a href=3D"http://Ma=
kefile.in.in">Makefile.in.in</a>&quot;</div><div class=3D"gmail_extra">=C2=
=A0 * FILES: added &quot;/usr/bin/gio-querymodules&quot;</div><div class=3D=
"gmail_extra">packages/corei7-64-poky-linux/glib-2.0/glib-2.0: PKG changed =
from libglib-2.0-0 to glib-2.0 [default] - may indicate debian renaming fai=
lure</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(=
and another few pages of rename warnings as everything renamed from libglib=
-2.0-0-locale-foo-bar to glib-2.0-locale-foo-bar)</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Basically the debian renamer do=
esn&#39;t take effect if there are binaries in the package.=C2=A0 Maybe we =
need to inherit lib_package (if possible) and put key binaries (such as thi=
s) into libglib-2.0-bin and the rest into -utils.=C2=A0 A fair number of th=
e utils could be moved to -dev anyway, such as genmarshal and mkenums.</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Looking at=
 this did show some other odd file placement in the glib recipe though:</di=
v><div class=3D"gmail_extra">* gschema.dtd in PN instead of somewhere else =
(PN-dev?)</div><div class=3D"gmail_extra">* gdbus-codegen should be in PN-c=
odegen?</div><div class=3D"gmail_extra">* glib-gettext/<a href=3D"http://Ma=
kefile.in.in">Makefile.in.in</a> should be in PN-dev?</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--047d7bfea0f4566e87052e977b4b--
