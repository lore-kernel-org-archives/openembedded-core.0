Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6D9C27F889
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 21:46:15 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id l24so18084871pgh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2019 13:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Xk+Vth6LU2YF/htPT/8ti7nHgW3x/OKDm4Qn4SKTwwg=;
	b=IdC/t8LPiCoBGm2Rbev3ODz/UMUKzk9PtviSShi+lQIq24rOrlQfN0cgUKYx5uW0FB
	N3X0uUXEMzZGbBcKiO32niveq0Z2rMUfz5ZoQktql9ilD8blXLJG2MjC52WgjC6S9M3R
	X9DPMs6hiW6Pa5yZCJL1BPy/Ox+bmQS7D9SaPh0VKs+0+D6MToxeYA+94+h4GF1B8xr/
	GUIM6CnDXiY6Q8/TsgnGKgU8QF1w5VwU6Tfi4PKCE0PkyQU88Hvtz7FgcujoiN+avcdT
	O1ecLjYlcez6cSBUJfreAWkLrF+Sn0k27uIojgmvaodGOUHjQcLCjCp8nMs3v6LStJ6i
	r1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Xk+Vth6LU2YF/htPT/8ti7nHgW3x/OKDm4Qn4SKTwwg=;
	b=bdBAegKHrMlrECPz1n63cDK/PoPEl/Qq57oSV16BBPK6nebgww2jdWn9/8Tirl0MUA
	DvqWlC4wA9tlge04NKCbkrzjraTVvcgMqvhlp5iQ2RBoMDhUe0nDZ7rNqdov4qGT2DB3
	2dhvF9astw995m9hHzee5/iC2pRQWpLYj5leUytroS1nkRYwROiQBB6A+SAuoEzTt4+m
	Z4x4oWn5cEO+VSBi9pZNg+Y9BZnMp9Di4V6m3j9+0R4coFDMFpI8oNfNtdM+VbFHQdu8
	ecLsCyvtFjHmWVPIUsxvC32iZG0yv6oQaOtjs1R/FNtNz8DgyTwjyLRrXzRVdx2hXU3E
	9hVg==
X-Gm-Message-State: APjAAAUREpgAzXI9QORCXVqzEEnjQITJ3YycfmBBayIac8zeKOoa8jE3
	fK9uGnAajWfAuiVhQypzs/OHC7Cw
X-Google-Smtp-Source: APXvYqxlBAW7mjO3nTOHcIcRGDRVXBQ6NPu0j5ImSLRsmaG3QByow4jrc/fQODsDuDA5XJmhd/i48g==
X-Received: by 2002:a17:90a:3565:: with SMTP id
	q92mr102153pjb.28.1573076775817; 
	Wed, 06 Nov 2019 13:46:15 -0800 (PST)
Received: from [10.52.14.175] ([162.249.178.138])
	by smtp.gmail.com with ESMTPSA id
	r22sm34101370pfg.54.2019.11.06.13.46.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Nov 2019 13:46:15 -0800 (PST)
To: Mikko Rapeli <mikko.rapeli@bmw.de>,
	openembedded-core@lists.openembedded.org
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <ec8a8c61-25a0-7e87-efee-b76e6c954d07@gmail.com>
Date: Wed, 6 Nov 2019 13:46:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
Subject: Re: [PATCH RFC CFH][sumo 00/47] CVE check backport
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
X-List-Received-Date: Wed, 06 Nov 2019 21:46:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello Mikko;

On 11/6/19 7:37 AM, Mikko Rapeli wrote:
> Hi,
>
> Request for comments, call for help, LTS too?
>
> Yocto 2.5 sumo isn't actively maintained by the Yocto Project
> anymore. But that does not mean that support for it
> needs to stop.
>
> I use sumo and due to various reasons like BSP layers, binary
> compatibility, contracts etc can't update to newer release
> or to master branch. I suspect I'm not alone.
>
> sumo CVE checking machinery is broken due to changes in
> NIST and NVD (see
> https://nvd.nist.gov/general/news/XML-Vulnerability-Feed-Retirement and=

> https://nvd.nist.gov/General/News/JSON-1-1-Vulnerability-Feed-Release )=

> so some backports from poky master/zeus are needed to fix the
> tooling. Thanks to Anuj, Chen, Chin, Pierre, Ross and others
> who fixed these on master branch!
>
> The tooling will expose that sumo is severely lacking in security
> patches, but the tooling is a start for anyone interested, like me,
> to fill the gaps and publish patches for bitbake recipes we care
> about.
>
> Could sumo be an LTS?=20
No, IMHO. We don't have the appropriate system in place to do so.

> Well I hope so. The LTS proposal
> http://lists.openembedded.org/pipermail/openembedded-architecture/2019-=
October/001665.html
> https://docs.google.com/document/d/1AwAFDf52f_FoXksbHEVUMlu4hpcI0JMGVG-=
Kj_sUkyc/edit
> from Yocto Project is great. Maybe as part of that work, someone could
> setup a really minimal set of QA on Yocto Project side to also test

QA resources have been a donation from Intel and Windriver above their
membership fees.=C2=A0 I don't fee right asking them to run QA.
> patches aiming at yocto 2.5 sumo. If not, would be really nice if
> someone could collect patches into sumo-next or sumo-contrib branch whe=
re us
> users could be in charge of all Quality Assurance.
I have collected other patches for sumo and built them locally but I
have no way to inform Richard they pass an AB=C2=A0 builds or automated
testing for them to get=C2=A0 into mainline sumo.

I am placing them into
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/su=
mo-community


>
> So, comments and review are welcome. Patches even more so!

i will look at them when i get back from vacation.

Thanks for sending them,

regards,
Armin
>
> Patches were tested on an x86 product tree where full stack CVE
> analysis produces good results. Then I ported them to pure poky sumo
> and ran core-image-minimal build. Tried running "bitbake world" build
> which also succeeds. The results show following bitbake target
> recipes from poky with unpatched CVEs (ignored native, SDK and cross
> tools for now):
>
> build/tmp/deploy/cve$ grep -l "Unpatched" * | egrep -v -- "-native|nati=
vesdk-|-cross" | sort
> apt
> aspell
> binutils
> bluez5
> busybox
> bzip2
> cairo
> cups
> curl
> db
> dropbear
> elfutils
> epiphany
> expat
> file
> gcc
> gcc-runtime
> gcc-sanitizers
> gcc-source-7.3.0
> ghostscript
> git
> glib-2.0
> glibc
> gnupg
> gnutls
> go
> gstreamer1.0
> libarchive
> libcomps
> libcroco
> libexif
> libgcc
> libgcrypt
> libid3tag
> libjpeg-turbo
> libpcap
> libpcre
> libpng
> librsvg
> libsndfile1
> libsolv
> libvorbis
> libx11
> libxkbcommon
> libxslt
> lighttpd
> lz4
> nasm
> ncurses
> openssh
> openssl
> pango
> patch
> pcmanfm
> perl
> python
> python3
> qemu
> shadow
> sqlite3
> sudo
> sysstat
> systemd
> tar
> tiff
> unzip
> webkitgtk
> wget
> wpa-supplicant
> xdg-utils
> xserver-xorg
> zip
>
> Sampling on the data shows that
>
>  * openssl 1.0.2p is missing patch for CVE-2019-1559
>  * openssh 7.6p1 is missing a lot more patches
>  * gcc is missing patches for CVE-2018-12886 on ARM
>    and CVE-2019-15847 on POWER9
>  * libpng is missing patch for CVE-2018-14048
>  * libjpeg-turbo is missing patch for CVE-2018-14498
>  * libgcrypt is missing patch for CVE-2018-6829
> etc.
>
> About CVE checking in yocto:
>
>  * enable with 'INHERIT +=3D "cve-check"' in conf/local.conf
>  * see the resulting reports in tmp/deploy/cve/ directory for
>    all compiled recipes
>  * there is also an image specific summary but I saw it included
>    native and nativesdk recipe data too
>  * for applying CVE patches, white listing, setting product names
>    etc see the meta/classes/cve-check.bbclass and examples in this patc=
hset
>    and in master branch
>  * note that only recompiled recipes will be analyzed for CVEs
>    so things from sstate cache will be ignored, a clean build without
>    cache may be needed when enabling the check
>
> ps. sumo still comes with gcc 7.3 and my patch to update to 7.4
> with lots of bug fixes has not been applied from
> http://lists.openembedded.org/pipermail/openembedded-core/2019-January/=
278049.html
> I've been using gcc 7.4 in several x86 and arm64 projects so I would al=
so
> apply this update to any sumo tree out there.
>
> Cheers,
>
> -Mikko
>
> Anuj Mittal (2):
>   openssl: set CVE vendor to openssl
>   rsync: fix CVEs for included zlib
>
> Chen Qi (9):
>   flac: also add flac to CVE_PRODUCT
>   xserver-xorg: set CVE_PRODUCT
>   nasm: add CVE_PRODUCT
>   dropbear: set CVE_PRODUCT
>   libsdl: set CVE_PRODUCT
>   ghostscript: set CVE_PRODUCT
>   squashfs-tools: set CVE_PRODUCT
>   libxfont2: set CVE_PRODUCT
>   webkitgtk: set CVE_PRODUCT
>
> Chin Huat Ang (1):
>   cve-update-db-native: fix https proxy issues
>
> Mikko Rapeli (1):
>   cve-check.bbclass: initialize to_append
>
> Pierre Le Magourou (13):
>   cve-update-db: New recipe to update CVE database
>   cve-check: Remove dependency to cve-check-tool-native
>   cve-check: Manage CVE_PRODUCT with more than one name
>   cve-check: Consider CVE that affects versions with less than operator=

>   cve-update-db: Use std library instead of urllib3
>   cve-update-db: Manage proxy if needed.
>   cve-update-db: do_populate_cve_db depends on do_fetch
>   cve-update-db: Catch request.urlopen errors.
>   cve-check: Depends on cve-update-db-native
>   cve-check: Update unpatched CVE matching
>   cve-check: Replace CVE_CHECK_CVE_WHITELIST by CVE_CHECK_WHITELIST
>   cve-update-db: Use NVD CPE data to populate PRODUCTS table
>   cve-update-db-native: Remove hash column from database.
>
> Ross Burton (21):
>   cve-check: be idiomatic
>   cve-check: remove redundant readline CVE whitelisting
>   cve-check-tool: remove
>   glibc: exclude child recipes from CVE scanning
>   cve-check: allow comparison of Vendor as well as Product
>   cve-update-db-native: use SQL placeholders instead of format strings
>   cve-update-db-native: use os.path.join instead of +
>   cve-update-db: actually inherit native
>   cve-update-db-native: use executemany() to optimise CPE insertion
>   cve-update-db-native: improve metadata parsing
>   cve-update-db-native: clean up JSON fetching
>   cve-check: ensure all known CVEs are in the report
>   cve-check: failure to parse versions should be more visible
>   flex: set CVE_PRODUCT to include vendor
>   libpam: set CVE_PRODUCT
>   procps: whitelist CVE-2018-1121
>   libpng: whitelist CVE-2019-17371
>   ed: set CVE vendor to avoid false positives
>   boost: set CVE vendor to Boost
>   subversion: set CVE vendor to Apache
>   git: set CVE vendor to git-scm
>
>  meta/classes/cve-check.bbclass                     | 147 ++++++++-----=

>  meta/conf/distro/include/maintainers.inc           |   2 +
>  .../recipes-connectivity/openssl/openssl_1.0.2p.bb |   2 +
>  .../recipes-connectivity/openssl/openssl_1.1.0i.bb |   2 +
>  meta/recipes-core/dropbear/dropbear.inc            |   2 +
>  meta/recipes-core/glibc/glibc-locale.inc           |   3 +
>  meta/recipes-core/glibc/glibc-mtrace.inc           |   3 +
>  meta/recipes-core/glibc/glibc-scripts.inc          |   3 +
>  meta/recipes-core/meta/cve-update-db-native.bb     | 190 +++++++++++++=
++++
>  .../cve-check-tool/cve-check-tool_5.6.4.bb         |  62 ------
>  ...01-Fix-freeing-memory-allocated-by-sqlite.patch |  50 -----
>  ...ow-overriding-default-CA-certificate-file.patch | 215 -------------=
------
>  ...ogress-in-percent-when-downloading-CVE-db.patch | 135 ------------
>  ...are-computed-vs-expected-sha256-digit-str.patch |  52 -----
>  .../check-for-malloc_trim-before-using-it.patch    |  51 -----
>  meta/recipes-devtools/flex/flex_2.6.0.bb           |   3 +
>  meta/recipes-devtools/git/git.inc                  |   2 +
>  meta/recipes-devtools/nasm/nasm_2.13.03.bb         |   2 +
>  .../rsync/files/CVE-2016-9840.patch                |  75 +++++++
>  .../rsync/files/CVE-2016-9841.patch                | 228 +++++++++++++=
++++++++
>  .../rsync/files/CVE-2016-9842.patch                |  33 +++
>  .../rsync/files/CVE-2016-9843.patch                |  53 +++++
>  meta/recipes-devtools/rsync/rsync_3.1.3.bb         |   7 +-
>  .../squashfs-tools/squashfs-tools_git.bb           |   2 +
>  .../subversion/subversion_1.9.7.bb                 |   2 +
>  meta/recipes-extended/ed/ed_1.14.2.bb              |   2 +
>  .../ghostscript/ghostscript_9.21.bb                |   3 +
>  meta/recipes-extended/pam/libpam_1.3.0.bb          |   2 +
>  meta/recipes-extended/procps/procps_3.3.12.bb      |   3 +
>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |   2 +
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb     |   2 +
>  meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb  |   2 +
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   2 +
>  meta/recipes-multimedia/flac/flac_1.3.2.bb         |   2 +-
>  meta/recipes-multimedia/libpng/libpng_1.6.34.bb    |   3 +
>  meta/recipes-sato/webkit/webkitgtk_2.18.6.bb       |   2 +
>  meta/recipes-support/boost/boost.inc               |   2 +
>  37 files changed, 731 insertions(+), 622 deletions(-)
>  create mode 100644 meta/recipes-core/meta/cve-update-db-native.bb
>  delete mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool=
_5.6.4.bb
>  delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-Fix=
-freeing-memory-allocated-by-sqlite.patch
>  delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-cur=
l-allow-overriding-default-CA-certificate-file.patch
>  delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-pri=
nt-progress-in-percent-when-downloading-CVE-db.patch
>  delete mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-upd=
ate-Compare-computed-vs-expected-sha256-digit-str.patch
>  delete mode 100644 meta/recipes-devtools/cve-check-tool/files/check-fo=
r-malloc_trim-before-using-it.patch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9840.pat=
ch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9841.pat=
ch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9842.pat=
ch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2016-9843.pat=
ch
>



