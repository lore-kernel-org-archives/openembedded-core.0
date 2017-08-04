Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id BC8A6600B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 16:24:58 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id h199so10129074ith.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Aug 2017 09:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bsDCjg7Q3ZghGFPBRJL4qV92SGULuewOaXQpPK35NTw=;
	b=aaHmT8It1vuLOW0lpmTJ4TKyfqLp8nhzaHZQfX64xyuTZdo6lirsQeJMev7U+QYq8u
	KfdZLFHNo5tCUko++7ct8xiTiOlHSud/mCgkL325q6YZTsZrf6uYopb/+rcxZvdakuyK
	gNrtZ8lZSjZkX/P5CgmmXmVbv/kASc/Bw46FdOTDUkZHnVgL93VPmwjax0HtqAsnUnNZ
	7vMzouIhVHEWgla3K2jee/N4ItVfyxT5MLin7bhmu2xN+L0hOLqVouKH3439NlVwOkzG
	LJZPDsryjmuEQ+hSdtbP+o9mr2DmjCSB8921SP/VmswfPq4S0c5AtZjN1YmAhjbykQrK
	Gb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bsDCjg7Q3ZghGFPBRJL4qV92SGULuewOaXQpPK35NTw=;
	b=NO1o86Q33UZTpLHA7djSGwLOtf8P+3TPCMby11zk6IgBbonN3/P/gLjJjk60c3+ceN
	6KJfEvfA5qOZw4jr803gydxfrrluyXTQvyhs0HSkpeFwiRxd9AphypmtTFsEXnf0Z0MJ
	vM4ET7IsiUhel3lz2l/0eRPsE4ev/tCqGJ34yG6HYB4FJYud64Co64+UT6iyube8virQ
	uWwedrtxLhWta7z/PdhaRUBAEzTjfp7rnjHl+Ru477NZkoDinnbkKLuA38MZTEWWWfX6
	o82hNk9ncZTL9TO5DyG6o7xHgqUsNS2lUcd9OxK/PCYOFNHIsNRE6mhvu9hjqce0wqLw
	0SpA==
X-Gm-Message-State: AHYfb5jkqVKXe/A+8/feDcGausWxsxDVCe74PeAHXETW/OgHE7D/kQEz
	eg3xDrH2r9is1A1ev9ghCVHC+H4pXIlQ
X-Received: by 10.36.48.193 with SMTP id q184mr3042386itq.112.1501863899738;
	Fri, 04 Aug 2017 09:24:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Fri, 4 Aug 2017 09:24:39 -0700 (PDT)
In-Reply-To: <4f118163-c586-1772-f8e3-85652a0a1b69@gmail.com>
References: <20170804094421.13226-1-ross.burton@intel.com>
	<4f118163-c586-1772-f8e3-85652a0a1b69@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Aug 2017 17:24:39 +0100
Message-ID: <CAJTo0LZgSq1AmrvQaPp9hZwFYcnjG=6O9tgz0JdWY0NHVFK1Rg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] checkpkg_exceptions: add LLVM
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
X-List-Received-Date: Fri, 04 Aug 2017 16:24:58 -0000
Content-Type: multipart/alternative; boundary="001a11c010303ed2240555eff002"

--001a11c010303ed2240555eff002
Content-Type: text/plain; charset="UTF-8"

Awesome, good to know.

Can you try to remember to verify checkpkg works, and remove this line?  If
we both try to remember then hopefully one of us will...

Ross

On 4 August 2017 at 17:12, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 8/4/17 2:44 AM, Ross Burton wrote:
> > The git mirror of LLVM doesn't have any tags we can track for release
> > announcements, so exclude llvm from the checkpkg test.
>
> we will switch to tarball based release once 5.0 is out.
>
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta-selftest/files/distrodata/checkpkg_exceptions | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-selftest/files/distrodata/checkpkg_exceptions
> b/meta-selftest/files/distrodata/checkpkg_exceptions
> > index ff54cf0baed..d87a80de7a7 100644
> > --- a/meta-selftest/files/distrodata/checkpkg_exceptions
> > +++ b/meta-selftest/files/distrodata/checkpkg_exceptions
> > @@ -8,6 +8,7 @@ gst-player
> >  kmscube
> >  libxcalibrate
> >  linux-firmware
> > +llvm
> >  lsb
> >  mmc-utils
> >  ovmf
> >
>
>

--001a11c010303ed2240555eff002
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Awesome, good to know.<div><br></div><div>Can you try to r=
emember to verify checkpkg works, and remove this line?=C2=A0 If we both tr=
y to remember then hopefully one of us will...</div><div><br></div><div>Ros=
s</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 4=
 August 2017 at 17:12, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
<br>
On 8/4/17 2:44 AM, Ross Burton wrote:<br>
&gt; The git mirror of LLVM doesn&#39;t have any tags we can track for rele=
ase<br>
&gt; announcements, so exclude llvm from the checkpkg test.<br>
<br>
</span>we will switch to tarball based release once 5.0 is out.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
">ross.burton@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-selftest/files/<wbr>distrodata/checkpkg_exceptions | 1 +<br=
>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta-selftest/files/<wbr>distrodata/checkpkg_exceptions b=
/meta-selftest/files/<wbr>distrodata/checkpkg_exceptions<br>
&gt; index ff54cf0baed..d87a80de7a7 100644<br>
&gt; --- a/meta-selftest/files/<wbr>distrodata/checkpkg_exceptions<br>
&gt; +++ b/meta-selftest/files/<wbr>distrodata/checkpkg_exceptions<br>
&gt; @@ -8,6 +8,7 @@ gst-player<br>
&gt;=C2=A0 kmscube<br>
&gt;=C2=A0 libxcalibrate<br>
&gt;=C2=A0 linux-firmware<br>
&gt; +llvm<br>
&gt;=C2=A0 lsb<br>
&gt;=C2=A0 mmc-utils<br>
&gt;=C2=A0 ovmf<br>
&gt;<br>
<br>
</div></div></blockquote></div><br></div>

--001a11c010303ed2240555eff002--
