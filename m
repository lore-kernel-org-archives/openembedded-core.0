Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id D091071DDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 10:20:36 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id x49so66013838qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 02:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bmjyMs4TD4mUb7GNAO5/gXZEnGLBf+YJrfEwcNQDL/I=;
	b=zkT3TUpUMbSgBt/rjXzRe30SUaEnloUgxUfH7BmThp+a5x+ax88L1UJZ9A+ODkd5z+
	bXfQ/8zftrUEbiy5CdDEme2lIxtkC7gAhv62bUyZvXjxgnPLRGKa8/p98RYJyd8ZyYvB
	x/Kzts5noD8YdjqExoeyKSq/Mal6vo3DosZlNBjkocQIRXRj3DYRVWhvbH4HxLZUJ5Fc
	tsRg9EaTqSFskcK1c8Bk0UPEX752+Bc1wHPNkIzJXRy8Sk4+xMkmBvf6UR0ERS/qFGec
	k8W9SBDo8umscXSqwqfoYKeetNhFJB4X24yVSoOKhWdGp7Vf0dSj0hMPBOZDid5dUTJE
	xqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bmjyMs4TD4mUb7GNAO5/gXZEnGLBf+YJrfEwcNQDL/I=;
	b=Vq0a4U/GSMkMV69az2NXmKyUCPHtV8cE1Alur3DjZHD1D3c0i054OCc58hN/DHk92T
	o+/kEs3eZquxrgTMlsx00qeZoVpOs2m+mnS45L+EbJv6EmrvO+QVDBKxpwUXcGVozIiD
	HknPaFIs9FUT7s/1GjRge2DLGzLy1WgDrQsGtQmFQm0cG/txd2QVHDsktqtO+ClOtI6A
	G0A0o1SEj5tnW/PLSCE0kvGn29k+qg7rWCwLAdA08YYVh47w+j6HD8VMsUoJsFyO5N2B
	k4bysK40O6GJUtENpKEZWwc4HOf6UUqon3ZnJ8jxwawMVE8dGjbcJ4a4ltm0hX+n9IvM
	qZ1w==
X-Gm-Message-State: AIkVDXKcl5h3LOqwdL1uP/MetUrND3a5fh17VuGD8mf2LE9maf0r963TPb1iBZdlIQWCJPbnb3pj2nwhgeq3Rh1+
X-Received: by 10.55.183.133 with SMTP id h127mr1958457qkf.121.1485426036538; 
	Thu, 26 Jan 2017 02:20:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 26 Jan 2017 02:20:16 -0800 (PST)
In-Reply-To: <1485165540-16646-2-git-send-email-maxin.john@intel.com>
References: <1485165540-16646-1-git-send-email-maxin.john@intel.com>
	<1485165540-16646-2-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Jan 2017 10:20:16 +0000
Message-ID: <CAJTo0Lb8z9QbKF5qebO+54tqPe9rnZEXSd7EHMgXnK6XAZ1Lsw@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] libtasn1: Upgrade 4.9 -> 4.10
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
X-List-Received-Date: Thu, 26 Jan 2017 10:20:49 -0000
Content-Type: multipart/alternative; boundary=94eb2c0600563f97f60546fcb30b

--94eb2c0600563f97f60546fcb30b
Content-Type: text/plain; charset=UTF-8

On 23 January 2017 at 09:58, Maxin B. John <maxin.john@intel.com> wrote:

> Removed the following Backported patches:
>  1. 0001-configure-don-t-add-Werror-to-build-flags.patch
>  2. 0002-ASN.y-corrected-compiler-warning.patch
>  3. 0003-parser_aux-corrected-potential-null-pointer-derefere.patch
>  4. 0004-tools-eliminated-compiler-warnings.patch
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
>

This breaks on musl in the most amusing way:

|                  from ../../libtasn1-4.10/gl/getopt.c:28:
| ./stdint.h:89:5: error: #if with no expression
|  #if
|      ^

When it says stdint.h it doesn't mean the system stdint.h because that
would be too sensible.  libtasn1 uses gnulib which writes its own system
headers, so this is in fact build/gl/stdint.h which does indeed just do
'#if '.  The source for this file is gl/stdint.in.h in this block:

/* Override WINT_MIN and WINT_MAX if gnulib's <wchar.h> or <wctype.h>
overrides
   wint_t.  */
#if @GNULIB_OVERRIDES_WINT_T@
# undef WINT_MIN
# undef WINT_MAX
# define WINT_MIN 0x0U
# define WINT_MAX 0xffffffffU
#endif

For some reason when this executes @GNULIB_OVERRIDES_WINT_T@ isn't defined.

Cheers,
Ross

--94eb2c0600563f97f60546fcb30b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 January 2017 at 09:58, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D"gmail-:7m" class=3D"gmail-a3=
s gmail-aXjCH gmail-m159cac4ddfd33723">Removed the following Backported pat=
ches:<br>
=C2=A01. 0001-configure-don-t-add-<wbr>Werror-to-build-flags.patch<br>
=C2=A02. 0002-ASN.y-corrected-compiler-<wbr>warning.patch<br>
=C2=A03. 0003-parser_aux-corrected-<wbr>potential-null-pointer-<wbr>derefer=
e.patch<br>
=C2=A04. 0004-tools-eliminated-<wbr>compiler-warnings.patch<br>
<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;</div></blockquote></div><br>This breaks on musl =
in the most amusing way:<br></div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra"><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../../libtasn1-4.10/gl/getopt=
.c:28:</div><div class=3D"gmail_extra">| ./stdint.h:89:5: error: #if with n=
o expression</div><div class=3D"gmail_extra">| =C2=A0#if</div><div class=3D=
"gmail_extra">| =C2=A0 =C2=A0 =C2=A0^</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">When it says stdint.h it doesn&#39;t mean t=
he system stdint.h because that would be too sensible. =C2=A0libtasn1 uses =
gnulib which writes its own system headers, so this is in fact build/gl/std=
int.h which does indeed just do &#39;#if &#39;.=C2=A0 The source for this f=
ile is gl/stdint.in.h in this block:</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra"><div class=3D"gmail_extra">/* Override WINT_=
MIN and WINT_MAX if gnulib&#39;s &lt;wchar.h&gt; or &lt;wctype.h&gt; overri=
des</div><div class=3D"gmail_extra">=C2=A0 =C2=A0wint_t. =C2=A0*/</div><div=
 class=3D"gmail_extra">#if @GNULIB_OVERRIDES_WINT_T@</div><div class=3D"gma=
il_extra"># undef WINT_MIN</div><div class=3D"gmail_extra"># undef WINT_MAX=
</div><div class=3D"gmail_extra"># define WINT_MIN 0x0U</div><div class=3D"=
gmail_extra"># define WINT_MAX 0xffffffffU</div><div class=3D"gmail_extra">=
#endif</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>For some reason when this executes @GNULIB_OVERRIDES_WINT_T@ isn&#39;t def=
ined.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Cheers,</div><div class=3D"gmail_extra">Ross</div></div></div></div>

--94eb2c0600563f97f60546fcb30b--
