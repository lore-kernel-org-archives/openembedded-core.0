Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 90C547BD20
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 20:44:27 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id k15-v6so4573713ljc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 12:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=g1s/ires31kNj/q4c4yBIR3/B0RtkTY0iSvhGPMNKEo=;
	b=OL74U8t2qGj51WycwZ4OgcdkBmCp+F/4b2l06RB1PKuikqN+ldXsxPY63J9RBocRiG
	J0t3XiUuiQPxBN2sS3hf2xffNf+koQ107w9M2olwaT2rHRt60K3V6rjLOl0ekMXV6zh+
	DhrpGoMg3o+wornsK/yRU5wLNap6L4d/FbAYwpYiDyP6Zs3+MZIR1zVlEPtEd1VSzG/c
	m/odc5yy4kWgZgaLgQqJfVSfQTfAMQSQ0SWHAormplAx4X5u1IdvonlRCXvUMeml/OTx
	hOCoxNCb4/H6sdyqx2zq0juQF4bUfiYiRPhw0SboqXDpbGw3cOYBbWCAKY9AsHgcNC6v
	jxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=g1s/ires31kNj/q4c4yBIR3/B0RtkTY0iSvhGPMNKEo=;
	b=rqBUdqAHerynlXwFkOlQg0L7NszBXvRhjwGvH2Zib/vTmuctZIRYH68ffUIwIizxoM
	e9aGJCE94khB4WU5yHuppnaEaCAOQsolQqsJPnZSnv0YpQT2EeIJ1ZB7Hw4Hy+PyCie8
	ULUfvGkAbJ4NbJdmexuFRdddTbLadoLuLfsLsd9qdVAgfFhA0C4gTbugxVbwS29b3zsX
	BWTYAvIveElue7kxV+oTRnepA+gaFODwZ3sgVxnM/KByihLDigWFb7X3aaN/inuXLlKT
	+mh/nHsOhTHd2Dinf9fXGdO7kl2lA9Pt6RqcgmhyQ/WCetYM9s/2cFXlinZcO3pkxOuy
	hNEA==
X-Gm-Message-State: AJcUukcPjjQfrUbvdXKgSDpqG2FSVl2zX6twa49KH4pRkAeR5kXzV+A3
	TG+UkWk+soR8lPACLfEbf+iW3y6qbULrRJ4KHMM=
X-Google-Smtp-Source: ALg8bN7mdM5rSPh8T3vr6P0oWwn7+Pyd2kTIKkpoXVP5+DT7dzcszJZY+EnY47VKfSJaUdghzwMkoz7cbmUGKG/Wawc=
X-Received: by 2002:a2e:9059:: with SMTP id
	n25-v6mr1905918ljg.155.1546980267783; 
	Tue, 08 Jan 2019 12:44:27 -0800 (PST)
MIME-Version: 1.0
References: <20190108204249.8087-1-raj.khem@gmail.com>
	<20190108204249.8087-2-raj.khem@gmail.com>
In-Reply-To: <20190108204249.8087-2-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 8 Jan 2019 15:44:16 -0500
Message-ID: <CADkTA4N1iy_i+QBtR3ezN=LTiqhgR7BOx0eJfDf=ULgdR_T9Xg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] linux-libc-headers: Remove spurious x.mbox file
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
X-List-Received-Date: Tue, 08 Jan 2019 20:44:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

oops! Thanks Khem!

Bruce

On Tue, Jan 8, 2019 at 3:43 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux-libc-headers/x.mbox | 174 ------------------
>  1 file changed, 174 deletions(-)
>  delete mode 100644 meta/recipes-kernel/linux-libc-headers/x.mbox
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/x.mbox b/meta/recipes=
-kernel/linux-libc-headers/x.mbox
> deleted file mode 100644
> index 25e76e7595..0000000000
> --- a/meta/recipes-kernel/linux-libc-headers/x.mbox
> +++ /dev/null
> @@ -1,174 +0,0 @@
> -From openembedded-core-bounces@lists.openembedded.org Tue Dec 25 20:46:0=
9 2018
> -Delivered-To: bruce.ashfield@gmail.com
> -Received: by 2002:a2e:4c3:0:0:0:0:0 with SMTP id a64-v6csp5312962ljf;
> -        Tue, 25 Dec 2018 17:46:09 -0800 (PST)
> -X-Google-Smtp-Source: ALg8bN5+ydksOT9csVRJHxYDz7K6mUppK0qIlnMBsbGWz9Sq8F=
dlk64bzsaJk68T9XGeIzgSwxS9
> -X-Received: by 2002:a63:295:: with SMTP id 143mr16751743pgc.362.15457887=
69434;
> -        Tue, 25 Dec 2018 17:46:09 -0800 (PST)
> -ARC-Seal: i=3D1; a=3Drsa-sha256; t=3D1545788769; cv=3Dnone;
> -        d=3Dgoogle.com; s=3Darc-20160816;
> -        b=3DjG9fBrPvXAw8K+BjylRwE9cyo1dGTSQIXWYQAsxDXBL4sJKb/9HQ7t9CARYj=
48ptNC
> -         PyU9C1SF8FBe8jel1WM2zKHYxcoKShkfNv92t9jrw7thhkeRGtOPIfoQXt1ma6+=
1MLGa
> -         hdinQ5eBKdQt2AouG0A8huAMuHJfxYB9XpD5771sN0XD51Ecc8oYTYOEPmzg21E=
Yg9EC
> -         /8A+bodbKwBlIjg6x/O1ucx7W6fV5iyeyaOsJbzbPZeTdC3FqGycgSfErAkyoEJ=
jYwAP
> -         /k5PPo4vm6SU3PHJOV7a2cLbWfG6bS5K6/cxzdpXQKTGheKZOc6FFE3ptZfAwkF=
bVxfX
> -         Siww=3D=3D
> -ARC-Message-Signature: i=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dg=
oogle.com; s=3Darc-20160816;
> -        h=3Derrors-to:sender:content-transfer-encoding:mime-version
> -         :list-subscribe:list-help:list-post:list-archive:list-unsubscri=
be
> -         :list-id:precedence:subject:cc:message-id:date:to:from:delivere=
d-to;
> -        bh=3DL66KCbYgtwDc95aWv7eY3oTToexeHY5x8MVGyHJ/gPM=3D;
> -        b=3DrrE3b6NDRkazf03I4sTmeHnGX/emKFRWJSUcjyKS2hmAS83KcWTj/WfkinO4=
w4TeuB
> -         S7hPfsAA+DsVLI8Qz0Y2FpZp8dyCeDTDkJtPqZdlDhErV2b3weNNFqbiY4fjIlR=
EkYO/
> -         OIg0TgyyPGu4Ekur2dkYbdGmxIGtNsdIEQwv/zROwASqQiK/jpz7M156pGCbKYi=
SZz1g
> -         k3Bwrg+ON72xwBpMoN/x/9Ep7UXl3dvKAkgxUgPaBnPuwDW3HV+y4a3AYyiBoXR=
RILvm
> -         NDuAEwBRysljjsAeD1fxvwtKosRKuNfQpKDwibdgcsHjywPZKykADwYvp3Yc9bd=
OUwry
> -         A8FA=3D=3D
> -ARC-Authentication-Results: i=3D1; mx.google.com;
> -       spf=3Dpass (google.com: best guess record for domain of openembed=
ded-core-bounces@lists.openembedded.org designates 140.211.169.62 as permit=
ted sender) smtp.mailfrom=3Dopenembedded-core-bounces@lists.openembedded.or=
g
> -Return-Path: <openembedded-core-bounces@lists.openembedded.org>
> -Received: from mail.openembedded.org (mail.openembedded.org. [140.211.16=
9.62])
> -        by mx.google.com with ESMTP id j35si31697173pgl.223.2018.12.25.1=
7.46.08;
> -        Tue, 25 Dec 2018 17:46:09 -0800 (PST)
> -Received-SPF: pass (google.com: best guess record for domain of openembe=
dded-core-bounces@lists.openembedded.org designates 140.211.169.62 as permi=
tted sender) client-ip=3D140.211.169.62;
> -Authentication-Results: mx.google.com;
> -       spf=3Dpass (google.com: best guess record for domain of openembed=
ded-core-bounces@lists.openembedded.org designates 140.211.169.62 as permit=
ted sender) smtp.mailfrom=3Dopenembedded-core-bounces@lists.openembedded.or=
g
> -Received: from 165.28.230.35.bc.googleusercontent.com (localhost [127.0.=
0.1])
> -       by mail.openembedded.org (Postfix) with ESMTP id 564896BEF4;
> -       Wed, 26 Dec 2018 01:45:54 +0000 (UTC)
> -X-Original-To: openembedded-core@lists.openembedded.org
> -Delivered-To: openembedded-core@lists.openembedded.org
> -Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
> -       by mail.openembedded.org (Postfix) with ESMTP id 812D86B79B
> -       for <openembedded-core@lists.openembedded.org>;
> -       Wed, 26 Dec 2018 01:45:45 +0000 (UTC)
> -Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
> -       by mail.windriver.com (8.15.2/8.15.1) with SMTP id wBQ1ji3b015924=
;
> -       Tue, 25 Dec 2018 17:45:44 -0800 (PST)
> -Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
> -       Tue, 25 Dec 2018 17:45:44 -0800
> -From: He Zhe <zhe.he@windriver.com>
> -To: openembedded-core@lists.openembedded.org
> -Date: Tue, 25 Dec 2018 17:45:44 -0800
> -Message-Id: <20181226014544.1991-1-zhe.he@windriver.com>
> -X-Mailer: git-send-email 2.11.0
> -Cc: bruce.ashfield@windriver.com
> -Subject: [OE-core] [PATCH] linux-libc-headers: Fix build failure with fi=
xed
> -       input and output files instead of pipe
> -X-BeenThere: openembedded-core@lists.openembedded.org
> -X-Mailman-Version: 2.1.12
> -Precedence: list
> -List-Id: Patches and discussions about the oe-core layer
> -       <openembedded-core.lists.openembedded.org>
> -List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openemb=
edded-core>,
> -       <mailto:openembedded-core-request@lists.openembedded.org?subject=
=3Dunsubscribe>
> -List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core=
/>
> -List-Post: <mailto:openembedded-core@lists.openembedded.org>
> -List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subj=
ect=3Dhelp>
> -List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core>,
> -       <mailto:openembedded-core-request@lists.openembedded.org?subject=
=3Dsubscribe>
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3D"us-ascii"
> -Content-Transfer-Encoding: 7bit
> -Sender: openembedded-core-bounces@lists.openembedded.org
> -Errors-To: openembedded-core-bounces@lists.openembedded.org
> -Status: RO
> -X-Status: A
> -Content-Length: 4076
> -Lines: 94
> -
> -This is an amendment for
> -2322dc4 "linux-libc-headers: Fix build failure by using fixed temporary =
file instead of pipe"
> -which moves just the temporary input file from /tmp to build directory. =
But the
> -build directory may not in the same file system with the output file,
> -/dev/null, either and thus make it possible to trigger that bug, 67f846b=
, in
> -binutil v2.31.
> -
> -This patch puts both the input and output files into build directory for=
 good.
> -
> -Signed-off-by: He Zhe <zhe.he@windriver.com>
> ----
> - ...fixed-input-and-output-files-instead-of-.patch} | 22 ++++++++++-----=
-------
> - .../linux-libc-headers/linux-libc-headers_4.18.bb  |  2 +-
> - 2 files changed, 11 insertions(+), 13 deletions(-)
> - rename meta/recipes-kernel/linux-libc-headers/linux-libc-headers/{0001-=
scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch =3D> 0001-script=
s-Use-fixed-input-and-output-files-instead-of-.patch} (83%)
> -
> -diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0=
001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch b/meta/recip=
es-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-inpu=
t-and-output-files-instead-of-.patch
> -similarity index 83%
> -rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers/00=
01-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
> -rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001=
-scripts-Use-fixed-input-and-output-files-instead-of-.patch
> -index 0d8fa80939..9ba1c076e8 100644
> ---- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scr=
ipts-Use-fixed-temporary-file-instead-of-pipe-for.patch
> -+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scr=
ipts-Use-fixed-input-and-output-files-instead-of-.patch
> -@@ -1,7 +1,7 @@
> --From 3bbea65e11918f8753e8006a2198b999cdb0af58 Mon Sep 17 00:00:00 2001
> -+From 694eba7bb974f6b8bd308804cb24350150108b2b Mon Sep 17 00:00:00 2001
> - From: He Zhe <zhe.he@windriver.com>
> - Date: Wed, 21 Nov 2018 15:12:43 +0800
> --Subject: [PATCH] scripts: Use fixed temporary file instead of pipe for
> -+Subject: [PATCH] scripts: Use fixed input and output files instead of p=
ipe for
> -  here-doc
> -
> - There was a bug of "as" in binutils that when it checks if the input fi=
le and
> -@@ -40,31 +40,29 @@ Upstream-Status: Inappropriate [A work around for bi=
nutils v2.31]
> -
> - Signed-off-by: He Zhe <zhe.he@windriver.com>
> - ---
> -- scripts/gcc-goto.sh | 7 ++++++-
> -- 1 file changed, 6 insertions(+), 1 deletion(-)
> -+ scripts/gcc-goto.sh | 5 ++++-
> -+ 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> - diff --git a/scripts/gcc-goto.sh b/scripts/gcc-goto.sh
> --index 083c526..0aaf1b4 100755
> -+index 083c526..8dfac55 100755
> - --- a/scripts/gcc-goto.sh
> - +++ b/scripts/gcc-goto.sh
> --@@ -3,7 +3,9 @@
> -+@@ -3,7 +3,7 @@
> -  # Test for gcc 'asm goto' support
> -  # Copyright (C) 2010, Jason Baron <jbaron@redhat.com>
> -
> - -cat << "END" | $@ -x c - -c -o /dev/null >/dev/null 2>&1 && echo "y"
> --+TMPFILE=3D`mktemp -p .`
> --+
> --+cat << "END" > ${TMPFILE}
> -++cat << "END" > ./input
> -  int main(void)
> -  {
> -  #if defined(__arm__) || defined(__aarch64__)
> --@@ -20,3 +22,6 @@ entry:
> -+@@ -20,3 +20,6 @@ entry:
> -       return 0;
> -  }
> -  END
> - +
> --+$@ -x c ${TMPFILE} -c -o /dev/null && echo "y"
> --+rm ${TMPFILE}
> -++$@ -x c ./input -c -o ./output && echo "y"
> -++rm ./input ./output
> - --
> - 2.7.4
> -
> -diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4=
.18.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
> -index 00420aa6f7..229a0027d7 100644
> ---- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
> -+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
> -@@ -10,7 +10,7 @@ SRC_URI_append_libc-musl =3D "\
> -    "
> -
> - SRC_URI_append =3D "\
> --    file://0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.pa=
tch \
> -+    file://0001-scripts-Use-fixed-input-and-output-files-instead-of-.pa=
tch \
> - "
> -
> - SRC_URI[md5sum] =3D "bee5fe53ee1c3142b8f0c12c0d3348f9"
> ---
> -2.11.0
> -
> ---
> -_______________________________________________
> -Openembedded-core mailing list
> -Openembedded-core@lists.openembedded.org
> -http://lists.openembedded.org/mailman/listinfo/openembedded-core
> -
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

