Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8112260720
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 16:36:49 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id 1so127046723qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 08:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ge5ITU/zyqajZ20dhlfwU5cM22yUTCiIni1X4mqA0dg=;
	b=KnYRorL31zIp07zR22jFhUT/5w5iLFVOFuWm4W+6tGtwFw3IfbhRVa6voh4ofTuFbE
	WhIE6eMLBvmEth3UmYUD1kr5XSgljl6m6YlVRVUxxGUHtg3EJ5xo38Waw7WmK7wJ5q7D
	Nm65rpqCCuY1t4xue+WhNUSq/Ql78pFlyxu2IBgDqjVDSXe4zxRMW/TJP0d7qWbKDmEI
	3eHtr68XXfXfz/K3Vy+jg+dpGnxIWn12KXzw++D4xq07b2lgRFpp2S+/T4TcJPU70jJn
	Ta+wg6zmScGaYRUMh4ev3byxYycYeac53VBJD81fjVMV25318F7gOHwqdg8dR4SFBwZo
	N6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ge5ITU/zyqajZ20dhlfwU5cM22yUTCiIni1X4mqA0dg=;
	b=eoNFIO8H0lxG2o5yrjKcrR/E/0xQtLkPlU9BpUehvjDKmOO+r61u9TOOhMsHCHejJ/
	x8vKEfv0hpskSozYzMF0GVH9vEcZk9Vz0/tWPHK7ZOoNjOcjB/WgSlb3Cpg3AyMKVGIB
	22bJF8lavoGSt/fnGrwAQL7rG5kUtWyv5ZJVAjRjD0Btz62f9Wu/lISwq0s6bNevsIrV
	sLpHF8n3l0tcvl++aVW74tW/aeWpE+1aGmVMCNaUq7plinn6/sBA2/XE2qmGxF4YUlc0
	P23Kw9l9/f1P/42pY8OVW4VkCQGqH7AmW1vH0iKxuG58GMi+59Corci6v+vqieH711tr
	+UeA==
X-Gm-Message-State: AFeK/H1tCDKlWioKzTC0MdZbfIRa8qPeF5IArFP9QyrOsgzKVo69ofBSTCaRc7roJPhrGKF2AOTGsekWAoNy/hpi
X-Received: by 10.55.221.1 with SMTP id n1mr14078945qki.221.1489077410390;
	Thu, 09 Mar 2017 08:36:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 9 Mar 2017 08:36:30 -0800 (PST)
In-Reply-To: <20170309143139.2785-2-andrew.shadura@collabora.co.uk>
References: <20170309143139.2785-1-andrew.shadura@collabora.co.uk>
	<20170309143139.2785-2-andrew.shadura@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Mar 2017 16:36:30 +0000
Message-ID: <CAJTo0LYuWM7i-snTJyJ5BPdeKRez_8WzTk5EhUbbfFXFTDrfsQ@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] ghostscript: build and install libgs
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
X-List-Received-Date: Thu, 09 Mar 2017 16:36:49 -0000
Content-Type: multipart/alternative; boundary=001a1149d7dc1717db054a4edab9

--001a1149d7dc1717db054a4edab9
Content-Type: text/plain; charset=UTF-8

On 9 March 2017 at 14:31, Andrew Shadura <andrew.shadura@collabora.co.uk>
wrote:

> Build and install libgs library, which is a build dependency
> of a few other libraries, such as libspectre.
>
> We don't want to ship the executable binaries, only the library and its
> headers, hence oe_runmake install-so + rm -rf, not e.g. oe_libinstall.
>

This does *way* more:

packages/corei7-64-poky-linux/ghostscript/ghostscript-dev: PKGSIZE changed
from 0 to 38856 (+100%)
  * FILELIST: added "/usr/include/ghostscript/gdevdsp.h
/usr/include/ghostscript/iapi.h /usr/lib/libgs.so
/usr/include/ghostscript/gserrors.h /usr/include/ghostscript/ierrors.h"
packages/corei7-64-poky-linux/ghostscript/ghostscript-dev: RDEPENDS: added
"ghostscript-lib"
packages/corei7-64-poky-linux/ghostscript/ghostscript-dev: FILELIST: added
"/usr/include/ghostscript/gdevdsp.h /usr/include/ghostscript/iapi.h
/usr/lib/libgs.so /usr/include/ghostscript/gserrors.h
/usr/include/ghostscript/ierrors.h"
packages/corei7-64-poky-linux/ghostscript/ghostscript-dev: RRECOMMENDS:
added "ghostscript-lib-dev"

That's all good.

packages/corei7-64-poky-linux/ghostscript/ghostscript-doc: PKGSIZE changed
from 45465 to 0 (-100%)
  * FILELIST: removed all items "/usr/share/man/de/man1/ps2pdf.1 ...
/usr/share/man/man1/pdf2ps.1"

All the man pages disappeared

packages/corei7-64-poky-linux/ghostscript/ghostscript: PKGSIZE changed from
61037876 to 16376087 (-73%)
  * FILELIST: removed "/usr/share/ghostscript/9.20/doc/index.html
/usr/share/ghostscript/9.20/doc/gs.css
/usr/share/ghostscript/9.20/lib/bjc610a0.upp ...
/usr/share/ghostscript/9.20/doc/Make.htm /usr/share/ghostscript/9.20/lib/
wrfont.ps"

Pretty much all of ghostscript disappeared.

packages/corei7-64-poky-linux/ghostscript/ghostscript: RDEPENDS: removed
all items "cups-libimage (['>= 2.2.2']) glibc (['>= 2.25']) cups-lib (['>=
2.2.2']) libpng (['>= 1.6.28']) tiff (['>= 4.0.7']) fontconfig (['>=
2.12.1'])"

Was that the intention?  Having libgs sounds sensible but surely both
should be packaged.

Ross

--001a1149d7dc1717db054a4edab9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 March 2017 at 14:31, Andrew Shadura <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:andrew.shadura@collabora.co.uk" target=3D"_blank">andrew.shadura@coll=
abora.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:3rl=
" class=3D"gmail-a3s gmail-aXjCH gmail-m15ab37c5777202fa">Build and install=
 libgs library, which is a build dependency<br>
of a few other libraries, such as libspectre.<br>
<br>
We don&#39;t want to ship the executable binaries, only the library and its=
<br>
headers, hence oe_runmake install-so + rm -rf, not e.g. oe_libinstall.</div=
></blockquote></div><br>This does *way* more:</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">packages=
/corei7-64-poky-linux/ghostscript/ghostscript-dev: PKGSIZE changed from 0 t=
o 38856 (+100%)</div><div class=3D"gmail_extra">=C2=A0 * FILELIST: added &q=
uot;/usr/include/ghostscript/gdevdsp.h /usr/include/ghostscript/iapi.h /usr=
/lib/libgs.so /usr/include/ghostscript/gserrors.h /usr/include/ghostscript/=
ierrors.h&quot;</div><div class=3D"gmail_extra">packages/corei7-64-poky-lin=
ux/ghostscript/ghostscript-dev: RDEPENDS: added &quot;ghostscript-lib&quot;=
</div><div class=3D"gmail_extra">packages/corei7-64-poky-linux/ghostscript/=
ghostscript-dev: FILELIST: added &quot;/usr/include/ghostscript/gdevdsp.h /=
usr/include/ghostscript/iapi.h /usr/lib/libgs.so /usr/include/ghostscript/g=
serrors.h /usr/include/ghostscript/ierrors.h&quot;</div><div class=3D"gmail=
_extra">packages/corei7-64-poky-linux/ghostscript/ghostscript-dev: RRECOMME=
NDS: added &quot;ghostscript-lib-dev&quot;</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">That&#39;s all good.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">packages/corei7-64-po=
ky-linux/ghostscript/ghostscript-doc: PKGSIZE changed from 45465 to 0 (-100=
%)</div><div class=3D"gmail_extra">=C2=A0 * FILELIST: removed all items &qu=
ot;/usr/share/man/de/man1/ps2pdf.1 ... /usr/share/man/man1/pdf2ps.1&quot;</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">All the=
 man pages disappeared</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">packages/corei7-64-poky-linux/ghostscript/ghostscript: PKG=
SIZE changed from 61037876 to 16376087 (-73%)</div><div class=3D"gmail_extr=
a">=C2=A0 * FILELIST: removed &quot;/usr/share/ghostscript/9.20/doc/index.h=
tml /usr/share/ghostscript/9.20/doc/gs.css /usr/share/ghostscript/9.20/lib/=
bjc610a0.upp ... /usr/share/ghostscript/9.20/doc/Make.htm /usr/share/ghosts=
cript/9.20/lib/<a href=3D"http://wrfont.ps">wrfont.ps</a>&quot;</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Pretty much all o=
f ghostscript disappeared.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">packages/corei7-64-poky-linux/ghostscript/ghostscript:=
 RDEPENDS: removed all items &quot;cups-libimage ([&#39;&gt;=3D 2.2.2&#39;]=
) glibc ([&#39;&gt;=3D 2.25&#39;]) cups-lib ([&#39;&gt;=3D 2.2.2&#39;]) lib=
png ([&#39;&gt;=3D 1.6.28&#39;]) tiff ([&#39;&gt;=3D 4.0.7&#39;]) fontconfi=
g ([&#39;&gt;=3D 2.12.1&#39;])&quot;</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Was that the intention?=C2=A0 Having libgs s=
ounds sensible but surely both should be packaged.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a1149d7dc1717db054a4edab9--
