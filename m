Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SocVF-00029N-N6
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 17:37:30 +0200
Received: by yhjj56 with SMTP id j56so98466yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=k60pS+XtQCmwWdnMCrb53l7v29cFig3jGmMwDm1YEYg=;
	b=X7hxu79gPwGsCZ+/SL4WV1WcSRH0P13nn9vb0ZjitRLPcRdCWn34YNK4KUFVzgwGEH
	RQK11j2+ubkIBkNbdmEzE4+YK2Gpy6Tc89hGh66+leo71RQ1tVxyO2cO8wvLCxYtJw9W
	HypVzRf1hyXb4RDkY5FIL9B1fQiwKp6rSGxaQe1ItCbZngNqE/BcxC+OuCxQTS9Oi9Oy
	Q7ZrElzDgMuE6eUFjSbMg/7tU9ddIvSWS4RIKZKgNIcbyJ/02vjRJyzoyWAa3s2YsILa
	CxnAVUK9y0RhHUba93fgXDAjUc7InM/YE5i+1rhhztmZekN4ST63RUO8u+QOexRLjJHs
	63CA==
Received: by 10.68.240.73 with SMTP id vy9mr69106362pbc.102.1341933978364;
	Tue, 10 Jul 2012 08:26:18 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id og4sm30052513pbb.48.2012.07.10.08.26.16
	(version=SSLv3 cipher=OTHER); Tue, 10 Jul 2012 08:26:17 -0700 (PDT)
Message-ID: <4FFC4999.3090004@gmail.com>
Date: Tue, 10 Jul 2012 08:26:17 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1341931858-16028-1-git-send-email-msm@freescale.com>
In-Reply-To: <1341931858-16028-1-git-send-email-msm@freescale.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [PATCH v3 2/2] libgomp: add libgomp (openmp) library, and build for powerpc targets by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2012 15:37:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 7/10/2012 7:50 AM, Matthew McClintock wrote:
> Signed-off-by: Matthew McClintock <msm@freescale.com> --- 
> meta/recipes-devtools/gcc/gcc-4.7.inc               |    2 +- 
> meta/recipes-devtools/gcc/gcc-configure-runtime.inc |    7 +++++++ 
> meta/recipes-devtools/gcc/gcc-package-runtime.inc   |   14
> +++++++++++++- 3 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc
> b/meta/recipes-devtools/gcc/gcc-4.7.inc index c7dbc3c..be142a1
> 100644 --- a/meta/recipes-devtools/gcc/gcc-4.7.inc +++
> b/meta/recipes-devtools/gcc/gcc-4.7.inc @@ -1,6 +1,6 @@ require
> gcc-common.inc
> 
> -PR = "r3" +PR = "r4"
> 
> # Third digit in PV should be incremented after a minor release #
> happens from this branch on gcc e.g. currently its 4.7.1 diff --git
> a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc index
> 095d6c1..acd6599 100644 ---
> a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc +++
> b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc @@ -8,6 +8,8
> @@ EXTRA_OECONF_PATHS = " \ 
> --with-build-sysroot=${STAGING_DIR_TARGET}"
> 
> RUNTIMETARGET = "libssp libstdc++-v3" +RUNTIMETARGET_append_powerpc
> = " libgomp" +RUNTIMETARGET_append_powerpc64 = " libgomp" #  ? #
> libiberty # libmudflap @@ -41,6 +43,11 @@ do_install () { for d in
> ${RUNTIMETARGET}; do cd ${B}/$target/$d/ oe_runmake 'DESTDIR=${D}'
> MULTIBUILDTOP=${B}/$target/$d/ install +		if [ "$d" == "libgomp" ];
> then

== is still bash :) use = instead
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/8SZkACgkQuwUzVZGdMxS67QCeL7wjlRjmmhS7XdnAXm8EnaE0
3mQAnjwC9nKb6MLXEuvPmAJLUxkxwoTk
=gxTt
-----END PGP SIGNATURE-----


