Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id E172377286
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:51:07 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id c47so147078998qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 05:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m4YPEhfENM90VmXXuJqpeCT4laYiPaxd841/cO1juPs=;
	b=YRMBHk01/bZ2K3iexWJU3ESrtlpiIcDM1jbJnjrHgW99YgnSsFgrjZH65/xxiD0EAO
	lFoau5RB8zP2PLR3pEidLX4CJW/XDvPajUC8GLrXguUakQWHV3HDRiN1Gq/Jo1wCj069
	hpdJ9dFI9zyU+ShB4mqBaika252NWhJZn+WDgFQ3M2RzMTUf27HPDty+mz9Egwnp7jtg
	hiz5NmYh85Lf9RIS443jUYaEXcrT1nE2PrnrNuzxjG2nslI9GTROSNdDQ1fdlykHcpnT
	G3Em48tx/bvZ+oVG1aYxeBkVX7hYAiF/nF/tngBw09SD5Jx2LqExGp0SIorpUx1ZHr3u
	jHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m4YPEhfENM90VmXXuJqpeCT4laYiPaxd841/cO1juPs=;
	b=Vm+v8Pty1iFYCFmmbaCoHtvzEGlyk3mTVPS7VqezRK33BSfzgbgqsRsa0yQC3fBzWD
	RDrn1ISeL3CpPHHxHwLozpfRBuXrmYzbK3+yqbO+L8UYYE5dgh0Fgwn8lG/nUDMBQ+m/
	NhCArCRJ6bWaxU4nT1vjTNT5yowPI3VAnsnoYkLLyRaPfUViwqVlu8AVUfhP1IWfHMjW
	Q5u39FAwmt2lr0yXtyvENu5IBe67eg7FRo1YBfY169jDrla6Tk39Dng1h2T7+357liYr
	mbc4KLB/Dxp1hZizpiwc0KopUBUdyFuTy3hhtASQUXZt2kHltNx8TB48VZ8qkTXuWjRC
	2f0w==
X-Gm-Message-State: AIkVDXI4triZpxnjW+/mC45ulAEkI+5VDaCXS18gPy63wIbINoaJRYAbuGZ76lNN6g4Ov/z3yyy4umY6X+DJk7Lr
X-Received: by 10.200.47.38 with SMTP id j35mr2944350qta.136.1482155469156;
	Mon, 19 Dec 2016 05:51:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.34.74 with HTTP; Mon, 19 Dec 2016 05:50:38 -0800 (PST)
In-Reply-To: <0782ba71aee9d8be9fb448f805195f5bd96bb0de.1482154012.git.jussi.kukkonen@intel.com>
References: <cover.1482154012.git.jussi.kukkonen@intel.com>
	<0782ba71aee9d8be9fb448f805195f5bd96bb0de.1482154012.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 19 Dec 2016 15:50:38 +0200
Message-ID: <CAHiDW_HQSUppcnbbBqT1da9=7Fq=7Mhbe2=03Q4074JTW1-Kjg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] mirrors.bbclass: Fix gnutls mirror directory
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
X-List-Received-Date: Mon, 19 Dec 2016 13:51:09 -0000
Content-Type: multipart/alternative; boundary=001a1135da063dc53605440336f0

--001a1135da063dc53605440336f0
Content-Type: text/plain; charset=UTF-8

On 19 December 2016 at 15:35, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>

This commit message is a little terse: I believe I just got the mirror path
wrong originally -- at least currently this new version finds the right
directory.

Jussi


> ---
>  meta/classes/mirrors.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
> index 1184708..1174ef6 100644
> --- a/meta/classes/mirrors.bbclass
> +++ b/meta/classes/mirrors.bbclass
> @@ -27,7 +27,7 @@ ${GNUPG_MIRROR}       ftp://mirrors.dotsrc.org/gcrypt
> \n \
>  ftp://dante.ctan.org/tex-archive ftp://ftp.fu-berlin.de/tex/CTAN \n \
>  ftp://dante.ctan.org/tex-archive http://sunsite.sut.ac.jp/pub/
> archives/ctan/ \n \
>  ftp://dante.ctan.org/tex-archive http://ctan.unsw.edu.au/ \n \
> -ftp://ftp.gnutls.org/gcrypt/gnutls ${GNUPG_MIRROR} \n \
> +ftp://ftp.gnutls.org/gcrypt/gnutls ${GNUPG_MIRROR}/gnutls \n \
>  http://ftp.info-zip.org/pub/infozip/src/ http://mirror.switch.ch/ftp/
> mirror/infozip/src/ \n \
>  http://ftp.info-zip.org/pub/infozip/src/ ftp://sunsite.icm.edu.pl/pub/
> unix/archiving/info-zip/src/ \n \
>  ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
> ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof/ \n \
> --
> 2.1.4
>
>

--001a1135da063dc53605440336f0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
9 December 2016 at 15:35, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:</div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkone=
n@intel.com">jussi.kukkonen@intel.com</a>&gt;<br></blockquote><div><br></di=
v><div>This commit message is a little terse: I believe I just got the mirr=
or path wrong originally -- at least currently this new version finds the r=
ight directory.</div><div><br></div><div>Jussi</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
---<br>
=C2=A0meta/classes/mirrors.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass<br=
>
index 1184708..1174ef6 100644<br>
--- a/meta/classes/mirrors.bbclass<br>
+++ b/meta/classes/mirrors.bbclass<br>
@@ -27,7 +27,7 @@ ${GNUPG_MIRROR}=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ftp:=
//mirrors.dotsrc.org/gcrypt" rel=3D"noreferrer" target=3D"_blank">ftp://mir=
rors.dotsrc.org/<wbr>gcrypt</a> \n \<br>
=C2=A0<a href=3D"ftp://dante.ctan.org/tex-archive" rel=3D"noreferrer" targe=
t=3D"_blank">ftp://dante.ctan.org/tex-<wbr>archive</a> <a href=3D"ftp://ftp=
.fu-berlin.de/tex/CTAN" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.fu-b=
erlin.de/tex/<wbr>CTAN</a> \n \<br>
=C2=A0<a href=3D"ftp://dante.ctan.org/tex-archive" rel=3D"noreferrer" targe=
t=3D"_blank">ftp://dante.ctan.org/tex-<wbr>archive</a> <a href=3D"http://su=
nsite.sut.ac.jp/pub/archives/ctan/" rel=3D"noreferrer" target=3D"_blank">ht=
tp://sunsite.sut.ac.jp/pub/<wbr>archives/ctan/</a> \n \<br>
=C2=A0<a href=3D"ftp://dante.ctan.org/tex-archive" rel=3D"noreferrer" targe=
t=3D"_blank">ftp://dante.ctan.org/tex-<wbr>archive</a> <a href=3D"http://ct=
an.unsw.edu.au/" rel=3D"noreferrer" target=3D"_blank">http://ctan.unsw.edu.=
au/</a> \n \<br>
-<a href=3D"ftp://ftp.gnutls.org/gcrypt/gnutls" rel=3D"noreferrer" target=
=3D"_blank">ftp://ftp.gnutls.org/gcrypt/<wbr>gnutls</a> ${GNUPG_MIRROR} \n =
\<br>
+<a href=3D"ftp://ftp.gnutls.org/gcrypt/gnutls" rel=3D"noreferrer" target=
=3D"_blank">ftp://ftp.gnutls.org/gcrypt/<wbr>gnutls</a> ${GNUPG_MIRROR}/gnu=
tls \n \<br>
=C2=A0<a href=3D"http://ftp.info-zip.org/pub/infozip/src/" rel=3D"noreferre=
r" target=3D"_blank">http://ftp.info-zip.org/pub/<wbr>infozip/src/</a> <a h=
ref=3D"http://mirror.switch.ch/ftp/mirror/infozip/src/" rel=3D"noreferrer" =
target=3D"_blank">http://mirror.switch.ch/ftp/<wbr>mirror/infozip/src/</a> =
\n \<br>
=C2=A0<a href=3D"http://ftp.info-zip.org/pub/infozip/src/" rel=3D"noreferre=
r" target=3D"_blank">http://ftp.info-zip.org/pub/<wbr>infozip/src/</a> <a h=
ref=3D"ftp://sunsite.icm.edu.pl/pub/unix/archiving/info-zip/src/" rel=3D"no=
referrer" target=3D"_blank">ftp://sunsite.icm.edu.pl/pub/<wbr>unix/archivin=
g/info-zip/src/</a> \n \<br>
=C2=A0<a href=3D"ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/" rel=3D"no=
referrer" target=3D"_blank">ftp://lsof.itap.purdue.edu/<wbr>pub/tools/unix/=
lsof/</a>=C2=A0 <a href=3D"ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysut=
ils/lsof/" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.cerias.purdue.edu=
/<wbr>pub/tools/unix/sysutils/lsof/</a> \n \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a1135da063dc53605440336f0--
