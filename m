Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id BE1F06FF80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 21:11:52 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id e6so125381577pfk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 14:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=yvrD2OLCSb2OUpGm0SWmIiM5rZpHsIMlnejbrTg396U=;
	b=rFYvuHj/MgmPwQXkSdl3PMOMW3Al/nSZUqM+XN04iwPapUuKkGroNSHKWu0k+/iQjJ
	gk3rmLp7TjM1kTfz6OihX3ftPFx3+R1nJRDfjqX6932tl52iWVrs1TEGAuv4MwDWFkbV
	XDY5az1oM1o52Vr8ibb0o9pYpm72tElTqKYenP3hDr40s1LCeIgqwyUaXDLNtsC6Gkdx
	m6ftBGFrDDcVtYxAeKKo3vGCs+ug5EU0oZNC2Ys2acAKmdWJ7RDbVFvsoFIRMy9lYtrO
	x9j0O2AbESohIcky705tP2viKkjdHku4fXUopnzB9J3KG4wX3pB5TURz25z1X2Il9ZRr
	2HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=yvrD2OLCSb2OUpGm0SWmIiM5rZpHsIMlnejbrTg396U=;
	b=WzsSsXh0DaoBj4gNncvjopFD/g+ZYBCbzoF6QZ/8ytvrAzwAUgi8QIq4N8XNfNk0BP
	MjIV6qvHQkq4GN8fhm7Dh5qwy0li8jKcy5YwsBiZJcW/sF3Ljr9BwU4uk4jTQr896rCT
	cOGJwyJpsnmiR9gzzZiXfSbe5EuIfMLR4kgl2PJ8YirbusyRz8XfrcmzA8Z8nRiHdbeA
	hC8EbhA9i98qfDjjtt5zG29OKPFBFdzof2UwQp5w1pai3FACUIiqXr8x6sXNeUbQahi5
	Vv6IDSfvQr408Nrasfcr8sdzhPCaaXYIkRjwjgygXImpOgYcQPssZFgvONB5Y5fYx4RJ
	Rjhw==
X-Gm-Message-State: ABUngvdnCiZAubpaK47GMu/denbgoKvzGTXghiIt1cJl/SIkI1g73ADWbj/90fA2a4v1nA==
X-Received: by 10.98.36.91 with SMTP id r88mr43059506pfj.10.1477429912913;
	Tue, 25 Oct 2016 14:11:52 -0700 (PDT)
Received: from [10.22.11.115] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	xo5sm35590681pab.13.2016.10.25.14.11.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Oct 2016 14:11:52 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1476987951-61774-1-git-send-email-sona.sarmadi@enea.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d94f99a2-9f9c-f65d-68e5-223c47c82ca0@gmail.com>
Date: Tue, 25 Oct 2016 14:11:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1476987951-61774-1-git-send-email-sona.sarmadi@enea.com>
Subject: Re: [PATCH][krogoth] dropbear: Fix multiple CVEs
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
X-List-Received-Date: Tue, 25 Oct 2016 21:11:55 -0000
Content-Type: multipart/alternative;
	boundary="------------FB175B4B63BE079C5D7C88D9"

--------------FB175B4B63BE079C5D7C88D9
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit



On 10/20/2016 11:25 AM, Sona Sarmadi wrote:
> CVE-2016-7406
> CVE-2016-7407
> CVE-2016-7408
> CVE-2016-7409

merged to staging.

- armin
>
> Reference:
> https://matt.ucc.asn.au/dropbear/CHANGES
>
> [YOCTO #10443]
>
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> ---
>   meta/recipes-core/dropbear/dropbear.inc            |    4 +
>   .../dropbear/dropbear/CVE-2016-7406.patch          |  104 +
>   .../dropbear/dropbear/CVE-2016-7407.patch          | 2485 ++++++++++++++++++++
>   .../dropbear/dropbear/CVE-2016-7408.patch          |  101 +
>   .../dropbear/dropbear/CVE-2016-7409.patch          |   26 +
>   5 files changed, 2720 insertions(+)
>   create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2016-7406.patch
>   create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2016-7407.patch
>   create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2016-7408.patch
>   create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2016-7409.patch
>
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
> index 923d31c..ee2cd98 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -17,6 +17,10 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
>              file://0003-configure.patch \
>              file://0004-fix-2kb-keys.patch \
>              file://0007-dropbear-fix-for-x32-abi.patch \
> +           file://CVE-2016-7406.patch \
> +           file://CVE-2016-7407.patch \
> +           file://CVE-2016-7408.patch \
> +           file://CVE-2016-7409.patch \
>              file://init \
>              file://dropbearkey.service \
>              file://dropbear@.service \
> diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2016-7406.patch b/meta/recipes-core/dropbear/dropbear/CVE-2016-7406.patch
> new file mode 100644
> index 0000000..22b494c
> --- /dev/null
> +++ b/meta/recipes-core/dropbear/dropbear/CVE-2016-7406.patch
> @@ -0,0 +1,104 @@
> +# HG changeset patch
> +# User Matt Johnston <matt@ucc.asn.au>
> +# Date 1468249773 -28800
> +# Node ID b66a483f3dcb66a70341845dd36e922ddaee4c5a
> +# Parent  eed9376a4ad68e3ae7f17d154dbf126ee66c54bc
> +Improve exit message formatting
> +
> +Patch is backported from:
> +https://secure.ucc.asn.au/hg/dropbear/rev/b66a483f3dcb
> +
> +CVE: CVE-2016-7406
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> +
> +diff -ruN a/cli-main.c b/cli-main.c
> +--- a/cli-main.c	2016-03-09 15:54:53.000000000 +0100
> ++++ b/cli-main.c	2016-10-20 12:49:00.323501119 +0200
> +@@ -85,29 +85,30 @@
> + #endif /* DBMULTI stuff */
> +
> + static void cli_dropbear_exit(int exitcode, const char* format, va_list param) {
> ++	char exitmsg[150];
> ++	char fullmsg[300];
> +
> +-	char fmtbuf[300];
> +-	char exitmsg[500];
> ++	/* Note that exit message must be rendered before session cleanup */
> +
> ++	/* Render the formatted exit message */
> ++	vsnprintf(exitmsg, sizeof(exitmsg), format, param);
> ++
> ++	/* Add the prefix depending on session/auth state */
> + 	if (!sessinitdone) {
> +-		snprintf(fmtbuf, sizeof(fmtbuf), "Exited: %s",
> +-				format);
> ++		snprintf(fullmsg, sizeof(fullmsg), "Exited: %s", exitmsg);
> + 	} else {
> +-		snprintf(fmtbuf, sizeof(fmtbuf),
> ++		snprintf(fullmsg, sizeof(fullmsg),
> + 				"Connection to %s@%s:%s exited: %s",
> + 				cli_opts.username, cli_opts.remotehost,
> +-				cli_opts.remoteport, format);
> ++				cli_opts.remoteport, exitmsg);
> + 	}
> +
> +-	/* Arguments to the exit printout may be unsafe to use after session_cleanup() */
> +-	vsnprintf(exitmsg, sizeof(exitmsg), fmtbuf, param);
> +-
> + 	/* Do the cleanup first, since then the terminal will be reset */
> + 	session_cleanup();
> + 	/* Avoid printing onwards from terminal cruft */
> + 	fprintf(stderr, "\n");
> +
> +-	dropbear_log(LOG_INFO, "%s", exitmsg);;
> ++	dropbear_log(LOG_INFO, "%s", fullmsg);
> + 	exit(exitcode);
> + }
> +
> +diff -ruN a/svr-session.c b/svr-session.c
> +--- a/svr-session.c	2016-03-09 15:54:54.000000000 +0100
> ++++ b/svr-session.c	2016-10-20 13:27:20.629628336 +0200
> +@@ -145,30 +145,33 @@
> + /* failure exit - format must be <= 100 chars */
> + void svr_dropbear_exit(int exitcode, const char* format, va_list param) {
> +
> +-	char fmtbuf[300];
> ++	char exitmsg[150];
> ++	char fullmsg[300];
> + 	int i;
> +
> ++	/* Render the formatted exit message */
> ++	vsnprintf(exitmsg, sizeof(exitmsg), format, param);
> ++
> ++	/* Add the prefix depending on session/auth state */
> + 	if (!sessinitdone) {
> + 		/* before session init */
> +-		snprintf(fmtbuf, sizeof(fmtbuf),
> +-				"Early exit: %s", format);
> ++                snprintf(fullmsg, sizeof(fullmsg), "Early exit: %s", exitmsg);
> + 	} else if (ses.authstate.authdone) {
> + 		/* user has authenticated */
> +-		snprintf(fmtbuf, sizeof(fmtbuf),
> ++		snprintf(fullmsg, sizeof(fullmsg),
> + 				"Exit (%s): %s",
> +-				ses.authstate.pw_name, format);
> ++				ses.authstate.pw_name, exitmsg);
> + 	} else if (ses.authstate.pw_name) {
> + 		/* we have a potential user */
> +-		snprintf(fmtbuf, sizeof(fmtbuf),
> ++		snprintf(fullmsg, sizeof(fullmsg),
> + 				"Exit before auth (user '%s', %d fails): %s",
> +-				ses.authstate.pw_name, ses.authstate.failcount, format);
> ++				ses.authstate.pw_name, ses.authstate.failcount, exitmsg);
> + 	} else {
> + 		/* before userauth */
> +-		snprintf(fmtbuf, sizeof(fmtbuf),
> +-				"Exit before auth: %s", format);
> ++		snprintf(fullmsg, sizeof(fullmsg), "Exit before auth: %s", exitmsg);
> + 	}
> +
> +-	_dropbear_log(LOG_INFO, fmtbuf, param);
> ++	dropbear_log(LOG_INFO, "%s", fullmsg);
> +
> + #ifdef USE_VFORK
> + 	/* For uclinux only the main server process should cleanup - we don't want
> diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2016-7407.patch b/meta/recipes-core/dropbear/dropbear/CVE-2016-7407.patch
> new file mode 100644
> index 0000000..6cfc3f5
> --- /dev/null
> +++ b/meta/recipes-core/dropbear/dropbear/CVE-2016-7407.patch
> @@ -0,0 +1,2485 @@
> +
> +# HG changeset patch
> +# User Matt Johnston <matt@ucc.asn.au>
> +# Date 1468335601 -28800
> +# Node ID 34e6127ef02eb52d1f1f9494b9cbfe89bec0e925
> +# Parent  6914eedb10721db4833c8f005b4acd37f71fb975
> +merge fixes from PuTTY import.c
> +
> +toint() from misc.c
> +
> +(revids are from hggit conversion)
> +
> +changeset:   4620:60a336a6c85c
> +user:        Simon Tatham <anakin@pobox.com>
> +date:        Thu Feb 25 20:26:33 2016 +0000
> +files:       import.c
> +description:
> +Fix potential segfaults in reading OpenSSH's ASN.1 key format.
> +
> +The length coming back from ber_read_id_len might have overflowed, so
> +treat it as potentially negative. Also, while I'm here, accumulate it
> +inside ber_read_id_len as an unsigned, so as to avoid undefined
> +behaviour on integer overflow, and toint() it before return.
> +
> +Thanks to Hanno Böck for spotting this, with the aid of AFL.
> +
> +(cherry picked from commit 5b7833cd474a24ec098654dcba8cb9509f3bf2c1)
> +
> +Conflicts:
> +	import.c
> +
> +(cherry-picker's note: resolving the conflict involved removing an
> +entire section of the original commit which fixed ECDSA code not
> +present on this branch)
> +
> +
> +changeset:   4619:9c6c638d98d8
> +user:        Simon Tatham <anakin@pobox.com>
> +date:        Sun Jul 14 10:45:54 2013 +0000
> +files:       import.c ssh.c sshdss.c sshpubk.c sshrsa.c
> +description:
> +Tighten up a lot of casts from unsigned to int which are read by one
> +of the GET_32BIT macros and then used as length fields. Missing bounds
> +checks against zero have been added, and also I've introduced a helper
> +function toint() which casts from unsigned to int in such a way as to
> +avoid C undefined behaviour, since I'm not sure I trust compilers any
> +more to do the obviously sensible thing.
> +
> +[originally from svn r9918]
> +
> +
> +changeset:   4618:3957829f24d3
> +user:        Simon Tatham <anakin@pobox.com>
> +date:        Mon Jul 08 22:36:04 2013 +0000
> +files:       import.c sshdss.c sshrsa.c
> +description:
> +Add an assortment of extra safety checks.
> +
> +[originally from svn r9896]
> +
> +
> +changeset:   4617:2cddee0bce12
> +user:        Jacob Nevins <jacobn@chiark.greenend.org.uk>
> +date:        Wed Dec 07 00:24:45 2005 +0000
> +files:       import.c
> +description:
> +Institutional failure to memset() things pointed at rather than pointers.
> +Things should now be zeroed and memory not leaked. Spotted by Brant Thomsen.
> +
> +[originally from svn r6476]
> +
> +
> +changeset:   4616:24ac78a9c71d
> +user:        Simon Tatham <anakin@pobox.com>
> +date:        Wed Feb 11 13:58:27 2004 +0000
> +files:       import.c
> +description:
> +Jacob's last-minute testing found a couple of trivial bugs in
> +import.c, and my attempts to reproduce them in cmdgen found another
> +one there :-)
> +
> +[originally from svn r3847]
> +
> +
> +changeset:   4615:088d39a73db0
> +user:        Simon Tatham <anakin@pobox.com>
> +date:        Thu Jan 22 18:52:49 2004 +0000
> +files:       import.c
> +description:
> +Placate some gcc warnings.
> +
> +[originally from svn r3761]
> +
> +
> +changeset:   4614:e4288bad4d93
> +parent:      1758:108b8924593d
> +user:        Simon Tatham <anakin@pobox.com>
> +date:        Fri Oct 03 21:21:23 2003 +0000
> +files:       import.c
> +description:
> +My ASN.1 decoder returned wrong IDs for anything above 0x1E! Good
> +job it's never had to yet. Ahem.
> +
> +[originally from svn r3479]
> +
> +Patch is backported from:
> +https://secure.ucc.asn.au/hg/dropbear/rev/34e6127ef02e
> +
> +CVE: CVE-2016-7407
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> +
> +diff -r 6914eedb1072 -r 34e6127ef02e keyimport.c
> +--- a/keyimport.c	Mon Jul 11 23:34:18 2016 +0800
> ++++ b/keyimport.c	Tue Jul 12 23:00:01 2016 +0800
> +@@ -47,65 +47,67 @@
> +   (cp)[0] = (unsigned char)((value) >> 24); } while (0)
> +
> + #define GET_32BIT(cp) \
> +-	(((unsigned long)(unsigned char)(cp)[0] << 24) | \
> +-	((unsigned long)(unsigned char)(cp)[1] << 16) | \
> +-	((unsigned long)(unsigned char)(cp)[2] << 8) | \
> +-	((unsigned long)(unsigned char)(cp)[3]))
> ++    (((unsigned long)(unsigned char)(cp)[0] << 24) | \
> ++    ((unsigned long)(unsigned char)(cp)[1] << 16) | \
> ++    ((unsigned long)(unsigned char)(cp)[2] << 8) | \
> ++    ((unsigned long)(unsigned char)(cp)[3]))
> +
> + static int openssh_encrypted(const char *filename);
> + static sign_key *openssh_read(const char *filename, char *passphrase);
> + static int openssh_write(const char *filename, sign_key *key,
> +-				  char *passphrase);
> ++		  char *passphrase);
> +
> + static int dropbear_write(const char*filename, sign_key * key);
> + static sign_key *dropbear_read(const char* filename);
> +
> ++static int toint(unsigned u);
> ++
> + #if 0
> + static int sshcom_encrypted(const char *filename, char **comment);
> + static struct ssh2_userkey *sshcom_read(const char *filename, char *passphrase);
> + static int sshcom_write(const char *filename, struct ssh2_userkey *key,
> +-				 char *passphrase);
> ++		 char *passphrase);
> + #endif
> +
> + int import_encrypted(const char* filename, int filetype) {
> +
> + 	if (filetype == KEYFILE_OPENSSH) {
> +-		return openssh_encrypted(filename);
> ++	return openssh_encrypted(filename);
> + #if 0
> + 	} else if (filetype == KEYFILE_SSHCOM) {
> + 		return sshcom_encrypted(filename, NULL);
> + #endif
> +-	}
> +-	return 0;
> ++    }
> ++    return 0;
> + }
> +
> + sign_key *import_read(const char *filename, char *passphrase, int filetype) {
> +
> + 	if (filetype == KEYFILE_OPENSSH) {
> +-		return openssh_read(filename, passphrase);
> ++	return openssh_read(filename, passphrase);
> + 	} else if (filetype == KEYFILE_DROPBEAR) {
> + 		return dropbear_read(filename);
> + #if 0
> + 	} else if (filetype == KEYFILE_SSHCOM) {
> +-		return sshcom_read(filename, passphrase);
> ++	return sshcom_read(filename, passphrase);
> + #endif
> + 	}
> +-	return NULL;
> ++    return NULL;
> + }
> +
> + int import_write(const char *filename, sign_key *key, char *passphrase,
> + 		int filetype) {
> +
> + 	if (filetype == KEYFILE_OPENSSH) {
> +-		return openssh_write(filename, key, passphrase);
> ++	return openssh_write(filename, key, passphrase);
> + 	} else if (filetype == KEYFILE_DROPBEAR) {
> + 		return dropbear_write(filename, key);
> + #if 0
> + 	} else if (filetype == KEYFILE_SSHCOM) {
> +-		return sshcom_write(filename, key, passphrase);
> ++	return sshcom_write(filename, key, passphrase);
> + #endif
> + 	}
> +-	return 0;
> ++    return 0;
> + }
> +
> + static sign_key *dropbear_read(const char* filename) {
> +@@ -183,11 +185,11 @@
> +  * Helper routines. (The base64 ones are defined in sshpubk.c.)
> +  */
> +
> +-#define isbase64(c) (	((c) >= 'A' && (c) <= 'Z') || \
> +-						 ((c) >= 'a' && (c) <= 'z') || \
> +-						 ((c) >= '0' && (c) <= '9') || \
> +-						 (c) == '+' || (c) == '/' || (c) == '=' \
> +-						 )
> ++#define isbase64(c) (    ((c) >= 'A' && (c) <= 'Z') || \
> ++                         ((c) >= 'a' && (c) <= 'z') || \
> ++                         ((c) >= '0' && (c) <= '9') || \
> ++                         (c) == '+' || (c) == '/' || (c) == '=' \
> ++                         )
> +
> + /* cpl has to be less than 100 */
> + static void base64_encode_fp(FILE * fp, unsigned char *data,
> +@@ -220,57 +222,58 @@
> +  */
> +
> + /* ASN.1 tag classes. */
> +-#define ASN1_CLASS_UNIVERSAL		(0 << 6)
> +-#define ASN1_CLASS_APPLICATION	  (1 << 6)
> ++#define ASN1_CLASS_UNIVERSAL        (0 << 6)
> ++#define ASN1_CLASS_APPLICATION      (1 << 6)
> + #define ASN1_CLASS_CONTEXT_SPECIFIC (2 << 6)
> +-#define ASN1_CLASS_PRIVATE		  (3 << 6)
> +-#define ASN1_CLASS_MASK			 (3 << 6)
> ++#define ASN1_CLASS_PRIVATE          (3 << 6)
> ++#define ASN1_CLASS_MASK             (3 << 6)
> +
> + /* Primitive versus constructed bit. */
> +-#define ASN1_CONSTRUCTED			(1 << 5)
> ++#define ASN1_CONSTRUCTED            (1 << 5)
> +
> + static int ber_read_id_len(void *source, int sourcelen,
> +-						   int *id, int *length, int *flags)
> ++			   int *id, int *length, int *flags)
> + {
> +-	unsigned char *p = (unsigned char *) source;
> ++    unsigned char *p = (unsigned char *) source;
> +
> +-	if (sourcelen == 0)
> ++    if (sourcelen == 0)
> ++	return -1;
> ++
> ++    *flags = (*p & 0xE0);
> ++    if ((*p & 0x1F) == 0x1F) {
> ++	*id = 0;
> ++	while (*p & 0x80) {
> ++	    p++, sourcelen--;
> ++	    if (sourcelen == 0)
> + 		return -1;
> ++	    *id = (*id << 7) | (*p & 0x7F);
> ++	}
> ++	p++, sourcelen--;
> ++    } else {
> ++	*id = *p & 0x1F;
> ++	p++, sourcelen--;
> ++    }
> +
> +-	*flags = (*p & 0xE0);
> +-	if ((*p & 0x1F) == 0x1F) {
> +-		*id = 0;
> +-		while (*p & 0x80) {
> +-			*id = (*id << 7) | (*p & 0x7F);
> +-			p++, sourcelen--;
> +-			if (sourcelen == 0)
> +-				return -1;
> +-		}
> +-		*id = (*id << 7) | (*p & 0x7F);
> +-		p++, sourcelen--;
> +-	} else {
> +-		*id = *p & 0x1F;
> +-		p++, sourcelen--;
> +-	}
> ++    if (sourcelen == 0)
> ++	return -1;
> +
> +-	if (sourcelen == 0)
> +-		return -1;
> ++    if (*p & 0x80) {
> ++        unsigned len;
> ++	int n = *p & 0x7F;
> ++	p++, sourcelen--;
> ++	if (sourcelen < n)
> ++	    return -1;
> ++	len = 0;
> ++	while (n--)
> ++	    len = (len << 8) | (*p++);
> ++	sourcelen -= n;
> ++        *length = toint(len);
> ++    } else {
> ++	*length = *p;
> ++	p++, sourcelen--;
> ++    }
> +
> +-	if (*p & 0x80) {
> +-		int n = *p & 0x7F;
> +-		p++, sourcelen--;
> +-		if (sourcelen < n)
> +-			return -1;
> +-		*length = 0;
> +-		while (n--)
> +-			*length = (*length << 8) | (*p++);
> +-		sourcelen -= n;
> +-	} else {
> +-		*length = *p;
> +-		p++, sourcelen--;
> +-	}
> +-
> +-	return p - (unsigned char *) source;
> ++    return p - (unsigned char *) source;
> + }
> +
> + /*
> +@@ -281,57 +284,57 @@
> +  */
> + static int ber_write_id_len(void *dest, int id, int length, int flags)
> + {
> +-	unsigned char *d = (unsigned char *)dest;
> +-	int len = 0;
> ++    unsigned char *d = (unsigned char *)dest;
> ++    int len = 0;
> +
> +-	if (id <= 30) {
> +-		/*
> +-		 * Identifier is one byte.
> +-		 */
> +-		len++;
> +-		if (d) *d++ = id | flags;
> +-	} else {
> +-		int n;
> +-		/*
> +-		 * Identifier is multiple bytes: the first byte is 11111
> +-		 * plus the flags, and subsequent bytes encode the value of
> +-		 * the identifier, 7 bits at a time, with the top bit of
> +-		 * each byte 1 except the last one which is 0.
> +-		 */
> +-		len++;
> +-		if (d) *d++ = 0x1F | flags;
> +-		for (n = 1; (id >> (7*n)) > 0; n++)
> +-			continue;					   /* count the bytes */
> +-		while (n--) {
> +-			len++;
> +-			if (d) *d++ = (n ? 0x80 : 0) | ((id >> (7*n)) & 0x7F);
> +-		}
> ++    if (id <= 30) {
> ++	/*
> ++	 * Identifier is one byte.
> ++	 */
> ++	len++;
> ++	if (d) *d++ = id | flags;
> ++    } else {
> ++	int n;
> ++	/*
> ++	 * Identifier is multiple bytes: the first byte is 11111
> ++	 * plus the flags, and subsequent bytes encode the value of
> ++	 * the identifier, 7 bits at a time, with the top bit of
> ++	 * each byte 1 except the last one which is 0.
> ++	 */
> ++	len++;
> ++	if (d) *d++ = 0x1F | flags;
> ++	for (n = 1; (id >> (7*n)) > 0; n++)
> ++	    continue;		       /* count the bytes */
> ++	while (n--) {
> ++	    len++;
> ++	    if (d) *d++ = (n ? 0x80 : 0) | ((id >> (7*n)) & 0x7F);
> + 	}
> ++    }
> +
> +-	if (length < 128) {
> +-		/*
> +-		 * Length is one byte.
> +-		 */
> +-		len++;
> +-		if (d) *d++ = length;
> +-	} else {
> +-		int n;
> +-		/*
> +-		 * Length is multiple bytes. The first is 0x80 plus the
> +-		 * number of subsequent bytes, and the subsequent bytes
> +-		 * encode the actual length.
> +-		 */
> +-		for (n = 1; (length >> (8*n)) > 0; n++)
> +-			continue;					   /* count the bytes */
> +-		len++;
> +-		if (d) *d++ = 0x80 | n;
> +-		while (n--) {
> +-			len++;
> +-			if (d) *d++ = (length >> (8*n)) & 0xFF;
> +-		}
> ++    if (length < 128) {
> ++	/*
> ++	 * Length is one byte.
> ++	 */
> ++	len++;
> ++	if (d) *d++ = length;
> ++    } else {
> ++	int n;
> ++	/*
> ++	 * Length is multiple bytes. The first is 0x80 plus the
> ++	 * number of subsequent bytes, and the subsequent bytes
> ++	 * encode the actual length.
> ++	 */
> ++	for (n = 1; (length >> (8*n)) > 0; n++)
> ++	    continue;		       /* count the bytes */
> ++	len++;
> ++	if (d) *d++ = 0x80 | n;
> ++	while (n--) {
> ++	    len++;
> ++	    if (d) *d++ = (length >> (8*n)) & 0xFF;
> + 	}
> ++    }
> +
> +-	return len;
> ++    return len;
> + }
> +
> +
> +@@ -344,99 +347,99 @@
> +
> + enum { OSSH_DSA, OSSH_RSA, OSSH_EC };
> + struct openssh_key {
> +-	int type;
> +-	int encrypted;
> +-	char iv[32];
> +-	unsigned char *keyblob;
> ++    int type;
> ++    int encrypted;
> ++    char iv[32];
> ++    unsigned char *keyblob;
> + 	unsigned int keyblob_len, keyblob_size;
> + };
> +
> + static struct openssh_key *load_openssh_key(const char *filename)
> + {
> +-	struct openssh_key *ret;
> ++    struct openssh_key *ret;
> + 	FILE *fp = NULL;
> +-	char buffer[256];
> ++    char buffer[256];
> + 	char *errmsg = NULL, *p = NULL;
> +-	int headers_done;
> ++    int headers_done;
> + 	unsigned long len, outlen;
> +
> + 	ret = (struct openssh_key*)m_malloc(sizeof(struct openssh_key));
> +-	ret->keyblob = NULL;
> +-	ret->keyblob_len = ret->keyblob_size = 0;
> +-	ret->encrypted = 0;
> +-	memset(ret->iv, 0, sizeof(ret->iv));
> ++    ret->keyblob = NULL;
> ++    ret->keyblob_len = ret->keyblob_size = 0;
> ++    ret->encrypted = 0;
> ++    memset(ret->iv, 0, sizeof(ret->iv));
> +
> + 	if (strlen(filename) == 1 && filename[0] == '-') {
> + 		fp = stdin;
> + 	} else {
> + 		fp = fopen(filename, "r");
> + 	}
> +-	if (!fp) {
> +-		errmsg = "Unable to open key file";
> +-		goto error;
> +-	}
> +-	if (!fgets(buffer, sizeof(buffer), fp) ||
> +-		0 != strncmp(buffer, "-----BEGIN ", 11) ||
> +-		0 != strcmp(buffer+strlen(buffer)-17, "PRIVATE KEY-----\n")) {
> +-		errmsg = "File does not begin with OpenSSH key header";
> +-		goto error;
> +-	}
> +-	if (!strcmp(buffer, "-----BEGIN RSA PRIVATE KEY-----\n"))
> +-		ret->type = OSSH_RSA;
> +-	else if (!strcmp(buffer, "-----BEGIN DSA PRIVATE KEY-----\n"))
> +-		ret->type = OSSH_DSA;
> ++    if (!fp) {
> ++	errmsg = "Unable to open key file";
> ++	goto error;
> ++    }
> ++    if (!fgets(buffer, sizeof(buffer), fp) ||
> ++	0 != strncmp(buffer, "-----BEGIN ", 11) ||
> ++	0 != strcmp(buffer+strlen(buffer)-17, "PRIVATE KEY-----\n")) {
> ++	errmsg = "File does not begin with OpenSSH key header";
> ++	goto error;
> ++    }
> ++    if (!strcmp(buffer, "-----BEGIN RSA PRIVATE KEY-----\n"))
> ++	ret->type = OSSH_RSA;
> ++    else if (!strcmp(buffer, "-----BEGIN DSA PRIVATE KEY-----\n"))
> ++	ret->type = OSSH_DSA;
> + 	else if (!strcmp(buffer, "-----BEGIN EC PRIVATE KEY-----\n"))
> + 		ret->type = OSSH_EC;
> +-	else {
> +-		errmsg = "Unrecognised key type";
> ++    else {
> ++	errmsg = "Unrecognised key type";
> ++	goto error;
> ++    }
> ++
> ++    headers_done = 0;
> ++    while (1) {
> ++	if (!fgets(buffer, sizeof(buffer), fp)) {
> ++	    errmsg = "Unexpected end of file";
> ++	    goto error;
> ++	}
> ++	if (0 == strncmp(buffer, "-----END ", 9) &&
> ++	    0 == strcmp(buffer+strlen(buffer)-17, "PRIVATE KEY-----\n"))
> ++	    break;		       /* done */
> ++	if ((p = strchr(buffer, ':')) != NULL) {
> ++	    if (headers_done) {
> ++		errmsg = "Header found in body of key data";
> + 		goto error;
> +-	}
> ++	    }
> ++	    *p++ = '\0';
> ++	    while (*p && isspace((unsigned char)*p)) p++;
> ++	    if (!strcmp(buffer, "Proc-Type")) {
> ++		if (p[0] != '4' || p[1] != ',') {
> ++		    errmsg = "Proc-Type is not 4 (only 4 is supported)";
> ++		    goto error;
> ++		}
> ++		p += 2;
> ++		if (!strcmp(p, "ENCRYPTED\n"))
> ++		    ret->encrypted = 1;
> ++	    } else if (!strcmp(buffer, "DEK-Info")) {
> ++		int i, j;
> +
> +-	headers_done = 0;
> +-	while (1) {
> +-		if (!fgets(buffer, sizeof(buffer), fp)) {
> +-			errmsg = "Unexpected end of file";
> +-			goto error;
> ++		if (strncmp(p, "DES-EDE3-CBC,", 13)) {
> ++		    errmsg = "Ciphers other than DES-EDE3-CBC not supported";
> ++		    goto error;
> + 		}
> +-		if (0 == strncmp(buffer, "-----END ", 9) &&
> +-			0 == strcmp(buffer+strlen(buffer)-17, "PRIVATE KEY-----\n"))
> +-			break;					   /* done */
> +-		if ((p = strchr(buffer, ':')) != NULL) {
> +-			if (headers_done) {
> +-				errmsg = "Header found in body of key data";
> +-				goto error;
> +-			}
> +-			*p++ = '\0';
> +-			while (*p && isspace((unsigned char)*p)) p++;
> +-			if (!strcmp(buffer, "Proc-Type")) {
> +-				if (p[0] != '4' || p[1] != ',') {
> +-					errmsg = "Proc-Type is not 4 (only 4 is supported)";
> +-					goto error;
> +-				}
> +-				p += 2;
> +-				if (!strcmp(p, "ENCRYPTED\n"))
> +-					ret->encrypted = 1;
> +-			} else if (!strcmp(buffer, "DEK-Info")) {
> +-				int i, j;
> +-
> +-				if (strncmp(p, "DES-EDE3-CBC,", 13)) {
> +-					errmsg = "Ciphers other than DES-EDE3-CBC not supported";
> +-					goto error;
> +-				}
> +-				p += 13;
> +-				for (i = 0; i < 8; i++) {
> +-					if (1 != sscanf(p, "%2x", &j))
> +-						break;
> +-					ret->iv[i] = j;
> +-					p += 2;
> +-				}
> +-				if (i < 8) {
> +-					errmsg = "Expected 16-digit iv in DEK-Info";
> +-					goto error;
> +-				}
> +-			}
> +-		} else {
> +-			headers_done = 1;
> ++		p += 13;
> ++		for (i = 0; i < 8; i++) {
> ++		    if (1 != sscanf(p, "%2x", &j))
> ++			break;
> ++		    ret->iv[i] = j;
> ++		    p += 2;
> ++		}
> ++		if (i < 8) {
> ++		    errmsg = "Expected 16-digit iv in DEK-Info";
> ++		    goto error;
> ++		}
> ++	    }
> ++	} else {
> ++	    headers_done = 1;
> + 			len = strlen(buffer);
> + 			outlen = len*4/3;
> + 			if (ret->keyblob_len + outlen > ret->keyblob_size) {
> +@@ -448,65 +451,65 @@
> + 			if (base64_decode((const unsigned char *)buffer, len,
> + 						ret->keyblob + ret->keyblob_len, &outlen) != CRYPT_OK){
> + 				errmsg = "Error decoding base64";
> +-				goto error;
> +-			}
> ++                        goto error;
> ++                    }
> + 			ret->keyblob_len += outlen;
> +-		}
> ++                }
> + 	}
> +
> +-	if (ret->keyblob_len == 0 || !ret->keyblob) {
> +-		errmsg = "Key body not present";
> +-		goto error;
> +-	}
> ++    if (ret->keyblob_len == 0 || !ret->keyblob) {
> ++	errmsg = "Key body not present";
> ++	goto error;
> ++    }
> +
> +-	if (ret->encrypted && ret->keyblob_len % 8 != 0) {
> +-		errmsg = "Encrypted key blob is not a multiple of cipher block size";
> +-		goto error;
> +-	}
> ++    if (ret->encrypted && ret->keyblob_len % 8 != 0) {
> ++	errmsg = "Encrypted key blob is not a multiple of cipher block size";
> ++	goto error;
> ++    }
> +
> + 	m_burn(buffer, sizeof(buffer));
> +-	return ret;
> ++    return ret;
> +
> +-	error:
> ++    error:
> + 	m_burn(buffer, sizeof(buffer));
> +-	if (ret) {
> +-		if (ret->keyblob) {
> ++    if (ret) {
> ++	if (ret->keyblob) {
> + 			m_burn(ret->keyblob, ret->keyblob_size);
> + 			m_free(ret->keyblob);
> +-		}
> ++        }
> + 		m_free(ret);
> + 	}
> + 	if (fp) {
> + 		fclose(fp);
> +-	}
> ++    }
> + 	if (errmsg) {
> + 		fprintf(stderr, "Error: %s\n", errmsg);
> + 	}
> +-	return NULL;
> ++    return NULL;
> + }
> +
> + static int openssh_encrypted(const char *filename)
> + {
> +-	struct openssh_key *key = load_openssh_key(filename);
> +-	int ret;
> ++    struct openssh_key *key = load_openssh_key(filename);
> ++    int ret;
> +
> +-	if (!key)
> +-		return 0;
> +-	ret = key->encrypted;
> ++    if (!key)
> ++	return 0;
> ++    ret = key->encrypted;
> + 	m_burn(key->keyblob, key->keyblob_size);
> + 	m_free(key->keyblob);
> + 	m_free(key);
> +-	return ret;
> ++    return ret;
> + }
> +
> + static sign_key *openssh_read(const char *filename, char * UNUSED(passphrase))
> + {
> + 	struct openssh_key *key;
> +-	unsigned char *p;
> +-	int ret, id, len, flags;
> ++    unsigned char *p;
> ++    int ret, id, len, flags;
> + 	int i, num_integers = 0;
> + 	sign_key *retval = NULL;
> +-	char *errmsg;
> ++    char *errmsg;
> + 	unsigned char *modptr = NULL;
> + 	int modlen = -9999;
> + 	enum signkey_type type;
> +@@ -518,86 +521,87 @@
> +
> + 	key = load_openssh_key(filename);
> +
> +-	if (!key)
> +-		return NULL;
> ++    if (!key)
> ++	return NULL;
> +
> +-	if (key->encrypted) {
> ++    if (key->encrypted) {
> + 		errmsg = "encrypted keys not supported currently";
> + 		goto error;
> + #if 0
> + 		/* matt TODO */
> +-		/*
> +-		 * Derive encryption key from passphrase and iv/salt:
> +-		 *
> +-		 *  - let block A equal MD5(passphrase || iv)
> +-		 *  - let block B equal MD5(A || passphrase || iv)
> +-		 *  - block C would be MD5(B || passphrase || iv) and so on
> +-		 *  - encryption key is the first N bytes of A || B
> +-		 */
> +-		struct MD5Context md5c;
> +-		unsigned char keybuf[32];
> ++	/*
> ++	 * Derive encryption key from passphrase and iv/salt:
> ++	 *
> ++	 *  - let block A equal MD5(passphrase || iv)
> ++	 *  - let block B equal MD5(A || passphrase || iv)
> ++	 *  - block C would be MD5(B || passphrase || iv) and so on
> ++	 *  - encryption key is the first N bytes of A || B
> ++	 */
> ++	struct MD5Context md5c;
> ++	unsigned char keybuf[32];
> +
> +-		MD5Init(&md5c);
> +-		MD5Update(&md5c, (unsigned char *)passphrase, strlen(passphrase));
> +-		MD5Update(&md5c, (unsigned char *)key->iv, 8);
> +-		MD5Final(keybuf, &md5c);
> ++	MD5Init(&md5c);
> ++	MD5Update(&md5c, (unsigned char *)passphrase, strlen(passphrase));
> ++	MD5Update(&md5c, (unsigned char *)key->iv, 8);
> ++	MD5Final(keybuf, &md5c);
> +
> +-		MD5Init(&md5c);
> +-		MD5Update(&md5c, keybuf, 16);
> +-		MD5Update(&md5c, (unsigned char *)passphrase, strlen(passphrase));
> +-		MD5Update(&md5c, (unsigned char *)key->iv, 8);
> +-		MD5Final(keybuf+16, &md5c);
> +-
> +-		/*
> +-		 * Now decrypt the key blob.
> +-		 */
> +-		des3_decrypt_pubkey_ossh(keybuf, (unsigned char *)key->iv,
> +-								 key->keyblob, key->keyblob_len);
> +-
> +-		memset(&md5c, 0, sizeof(md5c));
> +-		memset(keybuf, 0, sizeof(keybuf));
> +-#endif
> +-	}
> ++	MD5Init(&md5c);
> ++	MD5Update(&md5c, keybuf, 16);
> ++	MD5Update(&md5c, (unsigned char *)passphrase, strlen(passphrase));
> ++	MD5Update(&md5c, (unsigned char *)key->iv, 8);
> ++	MD5Final(keybuf+16, &md5c);
> +
> + 	/*
> +-	 * Now we have a decrypted key blob, which contains an ASN.1
> +-	 * encoded private key. We must now untangle the ASN.1.
> +-	 *
> +-	 * We expect the whole key blob to be formatted as a SEQUENCE
> +-	 * (0x30 followed by a length code indicating that the rest of
> +-	 * the blob is part of the sequence). Within that SEQUENCE we
> +-	 * expect to see a bunch of INTEGERs. What those integers mean
> +-	 * depends on the key type:
> +-	 *
> +-	 *  - For RSA, we expect the integers to be 0, n, e, d, p, q,
> +-	 *	dmp1, dmq1, iqmp in that order. (The last three are d mod
> +-	 *	(p-1), d mod (q-1), inverse of q mod p respectively.)
> +-	 *
> +-	 *  - For DSA, we expect them to be 0, p, q, g, y, x in that
> +-	 *	order.
> ++	 * Now decrypt the key blob.
> + 	 */
> +-	
> +-	p = key->keyblob;
> ++	des3_decrypt_pubkey_ossh(keybuf, (unsigned char *)key->iv,
> ++				 key->keyblob, key->keyblob_len);
> +
> +-	/* Expect the SEQUENCE header. Take its absence as a failure to decrypt. */
> +-	ret = ber_read_id_len(p, key->keyblob_len, &id, &len, &flags);
> +-	p += ret;
> +-	if (ret < 0 || id != 16) {
> ++        memset(&md5c, 0, sizeof(md5c));
> ++        memset(keybuf, 0, sizeof(keybuf));
> ++#endif
> ++    }
> ++
> ++    /*
> ++     * Now we have a decrypted key blob, which contains an ASN.1
> ++     * encoded private key. We must now untangle the ASN.1.
> ++     *
> ++     * We expect the whole key blob to be formatted as a SEQUENCE
> ++     * (0x30 followed by a length code indicating that the rest of
> ++     * the blob is part of the sequence). Within that SEQUENCE we
> ++     * expect to see a bunch of INTEGERs. What those integers mean
> ++     * depends on the key type:
> ++     *
> ++     *  - For RSA, we expect the integers to be 0, n, e, d, p, q,
> ++     *    dmp1, dmq1, iqmp in that order. (The last three are d mod
> ++     *    (p-1), d mod (q-1), inverse of q mod p respectively.)
> ++     *
> ++     *  - For DSA, we expect them to be 0, p, q, g, y, x in that
> ++     *    order.
> ++     */
> ++
> ++    p = key->keyblob;
> ++
> ++    /* Expect the SEQUENCE header. Take its absence as a failure to decrypt. */
> ++    ret = ber_read_id_len(p, key->keyblob_len, &id, &len, &flags);
> ++    p += ret;
> ++    if (ret < 0 || id != 16 || len < 0 ||
> ++        key->keyblob+key->keyblob_len-p < len) {
> + 		errmsg = "ASN.1 decoding failure - wrong password?";
> +-		goto error;
> +-	}
> ++	goto error;
> ++    }
> +
> +-	/* Expect a load of INTEGERs. */
> +-	if (key->type == OSSH_RSA)
> +-		num_integers = 9;
> +-	else if (key->type == OSSH_DSA)
> +-		num_integers = 6;
> ++    /* Expect a load of INTEGERs. */
> ++    if (key->type == OSSH_RSA)
> ++	num_integers = 9;
> ++    else if (key->type == OSSH_DSA)
> ++	num_integers = 6;
> + 	else if (key->type == OSSH_EC)
> + 		num_integers = 1;
> +
> +-	/*
> +-	 * Space to create key blob in.
> +-	 */
> ++    /*
> ++     * Space to create key blob in.
> ++     */
> + 	blobbuf = buf_new(3000);
> +
> + #ifdef DROPBEAR_DSS
> +@@ -613,17 +617,17 @@
> + 	}
> + #endif
> +
> +-	for (i = 0; i < num_integers; i++) {
> +-		ret = ber_read_id_len(p, key->keyblob+key->keyblob_len-p,
> +-							  &id, &len, &flags);
> +-		p += ret;
> +-		if (ret < 0 || id != 2 ||
> +-			key->keyblob+key->keyblob_len-p < len) {
> +-			errmsg = "ASN.1 decoding failure";
> +-			goto error;
> +-		}
> ++    for (i = 0; i < num_integers; i++) {
> ++	ret = ber_read_id_len(p, key->keyblob+key->keyblob_len-p,
> ++			      &id, &len, &flags);
> ++	p += ret;
> ++	if (ret < 0 || id != 2 || len < 0 ||
> ++	    key->keyblob+key->keyblob_len-p < len) {
> ++	    errmsg = "ASN.1 decoding failure";
> ++	    goto error;
> ++	}
> +
> +-		if (i == 0) {
> ++	if (i == 0) {
> + 			/* First integer is a version indicator */
> + 			int expected = -1;
> + 			switch (key->type) {
> +@@ -636,35 +640,35 @@
> + 					break;
> + 			}
> + 			if (len != 1 || p[0] != expected) {
> +-				errmsg = "Version number mismatch";
> +-				goto error;
> +-			}
> +-		} else if (key->type == OSSH_RSA) {
> +-			/*
> ++		errmsg = "Version number mismatch";
> ++		goto error;
> ++	    }
> ++	} else if (key->type == OSSH_RSA) {
> ++	    /*
> + 			 * OpenSSH key order is n, e, d, p, q, dmp1, dmq1, iqmp
> + 			 * but we want e, n, d, p, q
> +-			 */
> +-			if (i == 1) {
> +-				/* Save the details for after we deal with number 2. */
> ++	     */
> ++	    if (i == 1) {
> ++		/* Save the details for after we deal with number 2. */
> + 				modptr = p;
> +-				modlen = len;
> ++		modlen = len;
> + 			} else if (i >= 2 && i <= 5) {
> + 				buf_putstring(blobbuf, (const char*)p, len);
> +-				if (i == 2) {
> ++		if (i == 2) {
> + 					buf_putstring(blobbuf, (const char*)modptr, modlen);
> +-				}
> +-			}
> +-		} else if (key->type == OSSH_DSA) {
> +-			/*
> ++		}
> ++	    }
> ++	} else if (key->type == OSSH_DSA) {
> ++	    /*
> + 			 * OpenSSH key order is p, q, g, y, x,
> + 			 * we want the same.
> +-			 */
> ++	     */
> + 			buf_putstring(blobbuf, (const char*)p, len);
> +-		}
> ++	}
> +
> +-		/* Skip past the number. */
> +-		p += len;
> +-	}
> ++	/* Skip past the number. */
> ++	p += len;
> ++    }
> +
> + #ifdef DROPBEAR_ECDSA
> + 	if (key->type == OSSH_EC) {
> +@@ -780,12 +784,12 @@
> + 	}
> + #endif /* DROPBEAR_ECDSA */
> +
> +-	/*
> +-	 * Now put together the actual key. Simplest way to do this is
> +-	 * to assemble our own key blobs and feed them to the createkey
> +-	 * functions; this is a bit faffy but it does mean we get all
> +-	 * the sanity checks for free.
> +-	 */
> ++    /*
> ++     * Now put together the actual key. Simplest way to do this is
> ++     * to assemble our own key blobs and feed them to the createkey
> ++     * functions; this is a bit faffy but it does mean we get all
> ++     * the sanity checks for free.
> ++     */
> + 	if (key->type == OSSH_RSA || key->type == OSSH_DSA) {
> + 		buf_setpos(blobbuf, 0);
> + 		type = DROPBEAR_SIGNKEY_ANY;
> +@@ -794,18 +798,18 @@
> + 			errmsg = "unable to create key structure";
> + 			sign_key_free(retkey);
> + 			retkey = NULL;
> +-			goto error;
> +-		}
> ++	goto error;
> ++    }
> + 	}
> +
> +-	errmsg = NULL;					 /* no error */
> +-	retval = retkey;
> ++    errmsg = NULL;                     /* no error */
> ++    retval = retkey;
> +
> +-	error:
> ++    error:
> + 	if (blobbuf) {
> + 		buf_burn(blobbuf);
> + 		buf_free(blobbuf);
> +-	}
> ++    }
> + 	m_burn(key->keyblob, key->keyblob_size);
> + 	m_free(key->keyblob);
> + 	m_burn(key, sizeof(*key));
> +@@ -813,22 +817,22 @@
> + 	if (errmsg) {
> + 		fprintf(stderr, "Error: %s\n", errmsg);
> + 	}
> +-	return retval;
> ++    return retval;
> + }
> +
> + static int openssh_write(const char *filename, sign_key *key,
> +-				  char *passphrase)
> ++		  char *passphrase)
> + {
> + 	buffer * keyblob = NULL;
> + 	buffer * extrablob = NULL; /* used for calculated values to write */
> + 	unsigned char *outblob = NULL;
> + 	int outlen = -9999;
> +-	struct mpint_pos numbers[9];
> ++    struct mpint_pos numbers[9];
> + 	int nnumbers = -1, pos = 0, len = 0, seqlen, i;
> + 	char *header = NULL, *footer = NULL;
> +-	char zero[1];
> +-	int ret = 0;
> +-	FILE *fp;
> ++    char zero[1];
> ++    int ret = 0;
> ++    FILE *fp;
> +
> + #ifdef DROPBEAR_RSA
> + 	mp_int dmp1, dmq1, iqmp, tmpval; /* for rsa */
> +@@ -843,9 +847,9 @@
> + #endif
> + 			0)
> + 	{
> +-		/*
> +-		 * Fetch the key blobs.
> +-		 */
> ++    /*
> ++     * Fetch the key blobs.
> ++     */
> + 		keyblob = buf_new(3000);
> + 		buf_put_priv_key(keyblob, key, key->type);
> +
> +@@ -853,10 +857,10 @@
> + 		/* skip the "ssh-rsa" or "ssh-dss" header */
> + 		buf_incrpos(keyblob, buf_getint(keyblob));
> +
> +-		/*
> +-		 * Find the sequence of integers to be encoded into the OpenSSH
> +-		 * key blob, and also decide on the header line.
> +-		 */
> ++    /*
> ++     * Find the sequence of integers to be encoded into the OpenSSH
> ++     * key blob, and also decide on the header line.
> ++     */
> + 		numbers[0].start = zero; numbers[0].bytes = 1; zero[0] = '\0';
> +
> + 	#ifdef DROPBEAR_RSA
> +@@ -871,17 +875,17 @@
> + 			numbers[2].bytes = buf_getint(keyblob);
> + 			numbers[2].start = buf_getptr(keyblob, numbers[2].bytes);
> + 			buf_incrpos(keyblob, numbers[2].bytes);
> +-			
> ++
> + 			/* n */
> + 			numbers[1].bytes = buf_getint(keyblob);
> + 			numbers[1].start = buf_getptr(keyblob, numbers[1].bytes);
> + 			buf_incrpos(keyblob, numbers[1].bytes);
> +-			
> ++
> + 			/* d */
> + 			numbers[3].bytes = buf_getint(keyblob);
> + 			numbers[3].start = buf_getptr(keyblob, numbers[3].bytes);
> + 			buf_incrpos(keyblob, numbers[3].bytes);
> +-			
> ++
> + 			/* p */
> + 			numbers[4].bytes = buf_getint(keyblob);
> + 			numbers[4].start = buf_getptr(keyblob, numbers[4].bytes);
> +@@ -949,9 +953,9 @@
> + 			numbers[8].start = buf_getptr(extrablob, numbers[8].bytes);
> + 			buf_incrpos(extrablob, numbers[8].bytes);
> +
> +-			nnumbers = 9;
> +-			header = "-----BEGIN RSA PRIVATE KEY-----\n";
> +-			footer = "-----END RSA PRIVATE KEY-----\n";
> ++        nnumbers = 9;
> ++        header = "-----BEGIN RSA PRIVATE KEY-----\n";
> ++        footer = "-----END RSA PRIVATE KEY-----\n";
> + 		}
> + 	#endif /* DROPBEAR_RSA */
> +
> +@@ -983,45 +987,45 @@
> + 			numbers[5].start = buf_getptr(keyblob, numbers[5].bytes);
> + 			buf_incrpos(keyblob, numbers[5].bytes);
> +
> +-			nnumbers = 6;
> +-			header = "-----BEGIN DSA PRIVATE KEY-----\n";
> +-			footer = "-----END DSA PRIVATE KEY-----\n";
> +-		}
> ++        nnumbers = 6;
> ++        header = "-----BEGIN DSA PRIVATE KEY-----\n";
> ++        footer = "-----END DSA PRIVATE KEY-----\n";
> ++    }
> + 	#endif /* DROPBEAR_DSS */
> +
> +-		/*
> +-		 * Now count up the total size of the ASN.1 encoded integers,
> +-		 * so as to determine the length of the containing SEQUENCE.
> +-		 */
> +-		len = 0;
> +-		for (i = 0; i < nnumbers; i++) {
> +-			len += ber_write_id_len(NULL, 2, numbers[i].bytes, 0);
> +-			len += numbers[i].bytes;
> +-		}
> +-		seqlen = len;
> +-		/* Now add on the SEQUENCE header. */
> +-		len += ber_write_id_len(NULL, 16, seqlen, ASN1_CONSTRUCTED);
> +-		/* Round up to the cipher block size, ensuring we have at least one
> +-		 * byte of padding (see below). */
> +-		outlen = len;
> +-		if (passphrase)
> +-			outlen = (outlen+8) &~ 7;
> ++    /*
> ++     * Now count up the total size of the ASN.1 encoded integers,
> ++     * so as to determine the length of the containing SEQUENCE.
> ++     */
> ++    len = 0;
> ++    for (i = 0; i < nnumbers; i++) {
> ++	len += ber_write_id_len(NULL, 2, numbers[i].bytes, 0);
> ++	len += numbers[i].bytes;
> ++    }
> ++    seqlen = len;
> ++    /* Now add on the SEQUENCE header. */
> ++    len += ber_write_id_len(NULL, 16, seqlen, ASN1_CONSTRUCTED);
> ++    /* Round up to the cipher block size, ensuring we have at least one
> ++     * byte of padding (see below). */
> ++    outlen = len;
> ++    if (passphrase)
> ++	outlen = (outlen+8) &~ 7;
> +
> +-		/*
> +-		 * Now we know how big outblob needs to be. Allocate it.
> +-		 */
> ++    /*
> ++     * Now we know how big outblob needs to be. Allocate it.
> ++     */
> + 		outblob = (unsigned char*)m_malloc(outlen);
> +
> +-		/*
> +-		 * And write the data into it.
> +-		 */
> +-		pos = 0;
> +-		pos += ber_write_id_len(outblob+pos, 16, seqlen, ASN1_CONSTRUCTED);
> +-		for (i = 0; i < nnumbers; i++) {
> +-			pos += ber_write_id_len(outblob+pos, 2, numbers[i].bytes, 0);
> +-			memcpy(outblob+pos, numbers[i].start, numbers[i].bytes);
> +-			pos += numbers[i].bytes;
> +-		}
> ++    /*
> ++     * And write the data into it.
> ++     */
> ++    pos = 0;
> ++    pos += ber_write_id_len(outblob+pos, 16, seqlen, ASN1_CONSTRUCTED);
> ++    for (i = 0; i < nnumbers; i++) {
> ++	pos += ber_write_id_len(outblob+pos, 2, numbers[i].bytes, 0);
> ++	memcpy(outblob+pos, numbers[i].start, numbers[i].bytes);
> ++	pos += numbers[i].bytes;
> ++    }
> + 	} /* end RSA and DSS handling */
> +
> + #ifdef DROPBEAR_ECDSA
> +@@ -1116,40 +1120,40 @@
> + 	}
> + #endif
> +
> +-	/*
> +-	 * Padding on OpenSSH keys is deterministic. The number of
> +-	 * padding bytes is always more than zero, and always at most
> +-	 * the cipher block length. The value of each padding byte is
> +-	 * equal to the number of padding bytes. So a plaintext that's
> +-	 * an exact multiple of the block size will be padded with 08
> +-	 * 08 08 08 08 08 08 08 (assuming a 64-bit block cipher); a
> +-	 * plaintext one byte less than a multiple of the block size
> +-	 * will be padded with just 01.
> +-	 *
> +-	 * This enables the OpenSSL key decryption function to strip
> +-	 * off the padding algorithmically and return the unpadded
> +-	 * plaintext to the next layer: it looks at the final byte, and
> +-	 * then expects to find that many bytes at the end of the data
> +-	 * with the same value. Those are all removed and the rest is
> +-	 * returned.
> +-	 */
> ++    /*
> ++     * Padding on OpenSSH keys is deterministic. The number of
> ++     * padding bytes is always more than zero, and always at most
> ++     * the cipher block length. The value of each padding byte is
> ++     * equal to the number of padding bytes. So a plaintext that's
> ++     * an exact multiple of the block size will be padded with 08
> ++     * 08 08 08 08 08 08 08 (assuming a 64-bit block cipher); a
> ++     * plaintext one byte less than a multiple of the block size
> ++     * will be padded with just 01.
> ++     *
> ++     * This enables the OpenSSL key decryption function to strip
> ++     * off the padding algorithmically and return the unpadded
> ++     * plaintext to the next layer: it looks at the final byte, and
> ++     * then expects to find that many bytes at the end of the data
> ++     * with the same value. Those are all removed and the rest is
> ++     * returned.
> ++     */
> + 	dropbear_assert(pos == len);
> +-	while (pos < outlen) {
> +-		outblob[pos++] = outlen - len;
> +-	}
> ++    while (pos < outlen) {
> ++        outblob[pos++] = outlen - len;
> ++    }
> +
> +-	/*
> +-	 * Encrypt the key.
> +-	 */
> +-	if (passphrase) {
> ++    /*
> ++     * Encrypt the key.
> ++     */
> ++    if (passphrase) {
> + 		fprintf(stderr, "Encrypted keys aren't supported currently\n");
> + 		goto error;
> +-	}
> ++    }
> +
> +-	/*
> +-	 * And save it. We'll use Unix line endings just in case it's
> +-	 * subsequently transferred in binary mode.
> +-	 */
> ++    /*
> ++     * And save it. We'll use Unix line endings just in case it's
> ++     * subsequently transferred in binary mode.
> ++     */
> + 	if (strlen(filename) == 1 && filename[0] == '-') {
> + 		fp = stdout;
> + 	} else {
> +@@ -1157,28 +1161,28 @@
> + 	}
> + 	if (!fp) {
> + 		fprintf(stderr, "Failed opening output file\n");
> +-		goto error;
> ++	goto error;
> + 	}
> +-	fputs(header, fp);
> ++    fputs(header, fp);
> + 	base64_encode_fp(fp, outblob, outlen, 64);
> +-	fputs(footer, fp);
> +-	fclose(fp);
> +-	ret = 1;
> ++    fputs(footer, fp);
> ++    fclose(fp);
> ++    ret = 1;
> +
> +-	error:
> +-	if (outblob) {
> +-		memset(outblob, 0, outlen);
> ++    error:
> ++    if (outblob) {
> ++        memset(outblob, 0, outlen);
> + 		m_free(outblob);
> +-	}
> ++    }
> + 	if (keyblob) {
> + 		buf_burn(keyblob);
> + 		buf_free(keyblob);
> +-	}
> ++    }
> + 	if (extrablob) {
> + 		buf_burn(extrablob);
> + 		buf_free(extrablob);
> +-	}
> +-	return ret;
> ++    }
> ++    return ret;
> + }
> +
> + #if 0
> +@@ -1196,10 +1200,10 @@
> +  *
> +  * So. The blob contains:
> +  *
> +- *  - uint32 0x3f6ff9eb	   (magic number)
> +- *  - uint32 size			 (total blob size)
> +- *  - string key-type		 (see below)
> +- *  - string cipher-type	  (tells you if key is encrypted)
> ++ *  - uint32 0x3f6ff9eb       (magic number)
> ++ *  - uint32 size             (total blob size)
> ++ *  - string key-type         (see below)
> ++ *  - string cipher-type      (tells you if key is encrypted)
> +  *  - string encrypted-blob
> +  *
> +  * (The first size field includes the size field itself and the
> +@@ -1255,654 +1259,679 @@
> +  *  - first 16 bytes are MD5(passphrase)
> +  *  - next 16 bytes are MD5(passphrase || first 16 bytes)
> +  *  - if there were more, they'd be MD5(passphrase || first 32),
> +- *	and so on.
> ++ *    and so on.
> +  */
> +
> + #define SSHCOM_MAGIC_NUMBER 0x3f6ff9eb
> +
> + struct sshcom_key {
> +-	char comment[256];				 /* allowing any length is overkill */
> +-	unsigned char *keyblob;
> +-	int keyblob_len, keyblob_size;
> ++    char comment[256];                 /* allowing any length is overkill */
> ++    unsigned char *keyblob;
> ++    int keyblob_len, keyblob_size;
> + };
> +
> + static struct sshcom_key *load_sshcom_key(const char *filename)
> + {
> +-	struct sshcom_key *ret;
> +-	FILE *fp;
> +-	char buffer[256];
> +-	int len;
> +-	char *errmsg, *p;
> +-	int headers_done;
> +-	char base64_bit[4];
> +-	int base64_chars = 0;
> ++    struct sshcom_key *ret;
> ++    FILE *fp;
> ++    char buffer[256];
> ++    int len;
> ++    char *errmsg, *p;
> ++    int headers_done;
> ++    char base64_bit[4];
> ++    int base64_chars = 0;
> +
> +-	ret = snew(struct sshcom_key);
> +-	ret->comment[0] = '\0';
> +-	ret->keyblob = NULL;
> +-	ret->keyblob_len = ret->keyblob_size = 0;
> ++    ret = snew(struct sshcom_key);
> ++    ret->comment[0] = '\0';
> ++    ret->keyblob = NULL;
> ++    ret->keyblob_len = ret->keyblob_size = 0;
> +
> + 	fp = fopen(filename, "r");
> +-	if (!fp) {
> +-		errmsg = "Unable to open key file";
> ++    if (!fp) {
> ++	errmsg = "Unable to open key file";
> ++	goto error;
> ++    }
> ++    if (!fgets(buffer, sizeof(buffer), fp) ||
> ++	0 != strcmp(buffer, "---- BEGIN SSH2 ENCRYPTED PRIVATE KEY ----\n")) {
> ++	errmsg = "File does not begin with ssh.com key header";
> ++	goto error;
> ++    }
> ++
> ++    headers_done = 0;
> ++    while (1) {
> ++	if (!fgets(buffer, sizeof(buffer), fp)) {
> ++	    errmsg = "Unexpected end of file";
> ++	    goto error;
> ++	}
> ++        if (!strcmp(buffer, "---- END SSH2 ENCRYPTED PRIVATE KEY ----\n"))
> ++            break;                     /* done */
> ++	if ((p = strchr(buffer, ':')) != NULL) {
> ++	    if (headers_done) {
> ++		errmsg = "Header found in body of key data";
> + 		goto error;
> ++	    }
> ++	    *p++ = '\0';
> ++	    while (*p && isspace((unsigned char)*p)) p++;
> ++            /*
> ++             * Header lines can end in a trailing backslash for
> ++             * continuation.
> ++             */
> ++            while ((len = strlen(p)) > (int)(sizeof(buffer) - (p-buffer) -1) ||
> ++                   p[len-1] != '\n' || p[len-2] == '\\') {
> ++                if (len > (int)((p-buffer) + sizeof(buffer)-2)) {
> ++                    errmsg = "Header line too long to deal with";
> ++                    goto error;
> ++                }
> ++                if (!fgets(p+len-2, sizeof(buffer)-(p-buffer)-(len-2), fp)) {
> ++                    errmsg = "Unexpected end of file";
> ++                    goto error;
> ++                }
> ++            }
> ++            p[strcspn(p, "\n")] = '\0';
> ++            if (!strcmp(buffer, "Comment")) {
> ++                /* Strip quotes in comment if present. */
> ++                if (p[0] == '"' && p[strlen(p)-1] == '"') {
> ++                    p++;
> ++                    p[strlen(p)-1] = '\0';
> ++                }
> ++                strncpy(ret->comment, p, sizeof(ret->comment));
> ++                ret->comment[sizeof(ret->comment)-1] = '\0';
> ++            }
> ++	} else {
> ++	    headers_done = 1;
> ++
> ++	    p = buffer;
> ++	    while (isbase64(*p)) {
> ++                base64_bit[base64_chars++] = *p;
> ++                if (base64_chars == 4) {
> ++                    unsigned char out[3];
> ++
> ++                    base64_chars = 0;
> ++
> ++                    len = base64_decode_atom(base64_bit, out);
> ++
> ++                    if (len <= 0) {
> ++                        errmsg = "Invalid base64 encoding";
> ++                        goto error;
> ++                    }
> ++
> ++                    if (ret->keyblob_len + len > ret->keyblob_size) {
> ++                        ret->keyblob_size = ret->keyblob_len + len + 256;
> ++                        ret->keyblob = sresize(ret->keyblob, ret->keyblob_size,
> ++					       unsigned char);
> ++                    }
> ++
> ++                    memcpy(ret->keyblob + ret->keyblob_len, out, len);
> ++                    ret->keyblob_len += len;
> ++                }
> ++
> ++		p++;
> ++	    }
> + 	}
> +-	if (!fgets(buffer, sizeof(buffer), fp) ||
> +-		0 != strcmp(buffer, "---- BEGIN SSH2 ENCRYPTED PRIVATE KEY ----\n")) {
> +-		errmsg = "File does not begin with ssh.com key header";
> +-		goto error;
> +-	}
> ++    }
> +
> +-	headers_done = 0;
> +-	while (1) {
> +-		if (!fgets(buffer, sizeof(buffer), fp)) {
> +-			errmsg = "Unexpected end of file";
> +-			goto error;
> +-		}
> +-		if (!strcmp(buffer, "---- END SSH2 ENCRYPTED PRIVATE KEY ----\n"))
> +-			break;					 /* done */
> +-		if ((p = strchr(buffer, ':')) != NULL) {
> +-			if (headers_done) {
> +-				errmsg = "Header found in body of key data";
> +-				goto error;
> +-			}
> +-			*p++ = '\0';
> +-			while (*p && isspace((unsigned char)*p)) p++;
> +-			/*
> +-			 * Header lines can end in a trailing backslash for
> +-			 * continuation.
> +-			 */
> +-			while ((len = strlen(p)) > (int)(sizeof(buffer) - (p-buffer) -1) ||
> +-				   p[len-1] != '\n' || p[len-2] == '\\') {
> +-				if (len > (int)((p-buffer) + sizeof(buffer)-2)) {
> +-					errmsg = "Header line too long to deal with";
> +-					goto error;
> +-				}
> +-				if (!fgets(p+len-2, sizeof(buffer)-(p-buffer)-(len-2), fp)) {
> +-					errmsg = "Unexpected end of file";
> +-					goto error;
> +-				}
> +-			}
> +-			p[strcspn(p, "\n")] = '\0';
> +-			if (!strcmp(buffer, "Comment")) {
> +-				/* Strip quotes in comment if present. */
> +-				if (p[0] == '"' && p[strlen(p)-1] == '"') {
> +-					p++;
> +-					p[strlen(p)-1] = '\0';
> +-				}
> +-				strncpy(ret->comment, p, sizeof(ret->comment));
> +-				ret->comment[sizeof(ret->comment)-1] = '\0';
> +-			}
> +-		} else {
> +-			headers_done = 1;
> ++    if (ret->keyblob_len == 0 || !ret->keyblob) {
> ++	errmsg = "Key body not present";
> ++	goto error;
> ++    }
> +
> +-			p = buffer;
> +-			while (isbase64(*p)) {
> +-				base64_bit[base64_chars++] = *p;
> +-				if (base64_chars == 4) {
> +-					unsigned char out[3];
> ++    return ret;
> +
> +-					base64_chars = 0;
> +-
> +-					len = base64_decode_atom(base64_bit, out);
> +-
> +-					if (len <= 0) {
> +-						errmsg = "Invalid base64 encoding";
> +-						goto error;
> +-					}
> +-
> +-					if (ret->keyblob_len + len > ret->keyblob_size) {
> +-						ret->keyblob_size = ret->keyblob_len + len + 256;
> +-						ret->keyblob = sresize(ret->keyblob, ret->keyblob_size,
> +-											   unsigned char);
> +-					}
> +-
> +-					memcpy(ret->keyblob + ret->keyblob_len, out, len);
> +-					ret->keyblob_len += len;
> +-				}
> +-
> +-				p++;
> +-			}
> +-		}
> +-	}
> +-
> +-	if (ret->keyblob_len == 0 || !ret->keyblob) {
> +-		errmsg = "Key body not present";
> +-		goto error;
> +-	}
> +-
> +-	return ret;
> +-
> +-	error:
> +-	if (ret) {
> +-		if (ret->keyblob) {
> +-			memset(ret->keyblob, 0, ret->keyblob_size);
> ++    error:
> ++    if (ret) {
> ++	if (ret->keyblob) {
> ++            memset(ret->keyblob, 0, ret->keyblob_size);
> + 			m_free(ret->keyblob);
> +-		}
> +-		memset(&ret, 0, sizeof(ret));
> ++        }
> ++        memset(ret, 0, sizeof(*ret));
> + 		m_free(ret);
> +-	}
> +-	return NULL;
> ++    }
> ++    return NULL;
> + }
> +
> + int sshcom_encrypted(const char *filename, char **comment)
> + {
> +-	struct sshcom_key *key = load_sshcom_key(filename);
> +-	int pos, len, answer;
> ++    struct sshcom_key *key = load_sshcom_key(filename);
> ++    int pos, len, answer;
> +
> +-	*comment = NULL;
> +-	if (!key)
> +-		return 0;
> ++    *comment = NULL;
> ++    if (!key)
> ++        return 0;
> +
> +-	/*
> +-	 * Check magic number.
> +-	 */
> +-	if (GET_32BIT(key->keyblob) != 0x3f6ff9eb)
> +-		return 0;					  /* key is invalid */
> ++    /*
> ++     * Check magic number.
> ++     */
> ++    if (GET_32BIT(key->keyblob) != 0x3f6ff9eb)
> ++        return 0;                      /* key is invalid */
> +
> +-	/*
> +-	 * Find the cipher-type string.
> +-	 */
> +-	answer = 0;
> +-	pos = 8;
> +-	if (key->keyblob_len < pos+4)
> +-		goto done;					 /* key is far too short */
> +-	pos += 4 + GET_32BIT(key->keyblob + pos);   /* skip key type */
> +-	if (key->keyblob_len < pos+4)
> +-		goto done;					 /* key is far too short */
> +-	len = GET_32BIT(key->keyblob + pos);   /* find cipher-type length */
> +-	if (key->keyblob_len < pos+4+len)
> +-		goto done;					 /* cipher type string is incomplete */
> +-	if (len != 4 || 0 != memcmp(key->keyblob + pos + 4, "none", 4))
> +-		answer = 1;
> ++    /*
> ++     * Find the cipher-type string.
> ++     */
> ++    answer = 0;
> ++    pos = 8;
> ++    if (key->keyblob_len < pos+4)
> ++        goto done;                     /* key is far too short */
> ++    len = toint(GET_32BIT(key->keyblob + pos));
> ++    if (len < 0 || len > key->keyblob_len - pos - 4)
> ++        goto done;                     /* key is far too short */
> ++    pos += 4 + len;                    /* skip key type */
> ++    len = toint(GET_32BIT(key->keyblob + pos)); /* find cipher-type length */
> ++    if (len < 0 || len > key->keyblob_len - pos - 4)
> ++        goto done;                     /* cipher type string is incomplete */
> ++    if (len != 4 || 0 != memcmp(key->keyblob + pos + 4, "none", 4))
> ++        answer = 1;
> +
> +-	done:
> +-	*comment = dupstr(key->comment);
> +-	memset(key->keyblob, 0, key->keyblob_size);
> ++    done:
> ++    *comment = dupstr(key->comment);
> ++    memset(key->keyblob, 0, key->keyblob_size);
> + 	m_free(key->keyblob);
> +-	memset(&key, 0, sizeof(key));
> ++    memset(key, 0, sizeof(*key));
> + 	m_free(key);
> +-	return answer;
> ++    return answer;
> + }
> +
> + static int sshcom_read_mpint(void *data, int len, struct mpint_pos *ret)
> + {
> +-	int bits;
> +-	int bytes;
> +-	unsigned char *d = (unsigned char *) data;
> ++    unsigned bits, bytes;
> ++    unsigned char *d = (unsigned char *) data;
> +
> +-	if (len < 4)
> +-		goto error;
> +-	bits = GET_32BIT(d);
> ++    if (len < 4)
> ++        goto error;
> ++    bits = GET_32BIT(d);
> +
> +-	bytes = (bits + 7) / 8;
> +-	if (len < 4+bytes)
> +-		goto error;
> ++    bytes = (bits + 7) / 8;
> ++    if (len < 4+bytes)
> ++        goto error;
> +
> +-	ret->start = d + 4;
> +-	ret->bytes = bytes;
> +-	return bytes+4;
> ++    ret->start = d + 4;
> ++    ret->bytes = bytes;
> ++    return bytes+4;
> +
> +-	error:
> +-	ret->start = NULL;
> +-	ret->bytes = -1;
> +-	return len;						/* ensure further calls fail as well */
> ++    error:
> ++    ret->start = NULL;
> ++    ret->bytes = -1;
> ++    return len;                        /* ensure further calls fail as well */
> + }
> +
> + static int sshcom_put_mpint(void *target, void *data, int len)
> + {
> +-	unsigned char *d = (unsigned char *)target;
> +-	unsigned char *i = (unsigned char *)data;
> +-	int bits = len * 8 - 1;
> ++    unsigned char *d = (unsigned char *)target;
> ++    unsigned char *i = (unsigned char *)data;
> ++    int bits = len * 8 - 1;
> +
> +-	while (bits > 0) {
> +-		if (*i & (1 << (bits & 7)))
> +-			break;
> +-		if (!(bits-- & 7))
> +-			i++, len--;
> +-	}
> ++    while (bits > 0) {
> ++	if (*i & (1 << (bits & 7)))
> ++	    break;
> ++	if (!(bits-- & 7))
> ++	    i++, len--;
> ++    }
> +
> +-	PUT_32BIT(d, bits+1);
> +-	memcpy(d+4, i, len);
> +-	return len+4;
> ++    PUT_32BIT(d, bits+1);
> ++    memcpy(d+4, i, len);
> ++    return len+4;
> + }
> +
> + sign_key *sshcom_read(const char *filename, char *passphrase)
> + {
> +-	struct sshcom_key *key = load_sshcom_key(filename);
> +-	char *errmsg;
> +-	int pos, len;
> +-	const char prefix_rsa[] = "if-modn{sign{rsa";
> +-	const char prefix_dsa[] = "dl-modp{sign{dsa";
> +-	enum { RSA, DSA } type;
> +-	int encrypted;
> +-	char *ciphertext;
> +-	int cipherlen;
> +-	struct ssh2_userkey *ret = NULL, *retkey;
> +-	const struct ssh_signkey *alg;
> +-	unsigned char *blob = NULL;
> +-	int blobsize, publen, privlen;
> ++    struct sshcom_key *key = load_sshcom_key(filename);
> ++    char *errmsg;
> ++    int pos, len;
> ++    const char prefix_rsa[] = "if-modn{sign{rsa";
> ++    const char prefix_dsa[] = "dl-modp{sign{dsa";
> ++    enum { RSA, DSA } type;
> ++    int encrypted;
> ++    char *ciphertext;
> ++    int cipherlen;
> ++    struct ssh2_userkey *ret = NULL, *retkey;
> ++    const struct ssh_signkey *alg;
> ++    unsigned char *blob = NULL;
> ++    int blobsize = 0, publen, privlen;
> +
> +-	if (!key)
> +-		return NULL;
> ++    if (!key)
> ++        return NULL;
> ++
> ++    /*
> ++     * Check magic number.
> ++     */
> ++    if (GET_32BIT(key->keyblob) != SSHCOM_MAGIC_NUMBER) {
> ++        errmsg = "Key does not begin with magic number";
> ++        goto error;
> ++    }
> ++
> ++    /*
> ++     * Determine the key type.
> ++     */
> ++    pos = 8;
> ++    if (key->keyblob_len < pos+4 ||
> ++        (len = GET_32BIT(key->keyblob + pos)) > key->keyblob_len - pos - 4) {
> ++        errmsg = "Key blob does not contain a key type string";
> ++        goto error;
> ++    }
> ++    if (len > sizeof(prefix_rsa) - 1 &&
> ++        !memcmp(key->keyblob+pos+4, prefix_rsa, sizeof(prefix_rsa) - 1)) {
> ++        type = RSA;
> ++    } else if (len > sizeof(prefix_dsa) - 1 &&
> ++        !memcmp(key->keyblob+pos+4, prefix_dsa, sizeof(prefix_dsa) - 1)) {
> ++        type = DSA;
> ++    } else {
> ++        errmsg = "Key is of unknown type";
> ++        goto error;
> ++    }
> ++    pos += 4+len;
> ++
> ++    /*
> ++     * Determine the cipher type.
> ++     */
> ++    if (key->keyblob_len < pos+4 ||
> ++        (len = GET_32BIT(key->keyblob + pos)) > key->keyblob_len - pos - 4) {
> ++        errmsg = "Key blob does not contain a cipher type string";
> ++        goto error;
> ++    }
> ++    if (len == 4 && !memcmp(key->keyblob+pos+4, "none", 4))
> ++        encrypted = 0;
> ++    else if (len == 8 && !memcmp(key->keyblob+pos+4, "3des-cbc", 8))
> ++        encrypted = 1;
> ++    else {
> ++        errmsg = "Key encryption is of unknown type";
> ++        goto error;
> ++    }
> ++    pos += 4+len;
> ++
> ++    /*
> ++     * Get hold of the encrypted part of the key.
> ++     */
> ++    if (key->keyblob_len < pos+4 ||
> ++        (len = GET_32BIT(key->keyblob + pos)) > key->keyblob_len - pos - 4) {
> ++        errmsg = "Key blob does not contain actual key data";
> ++        goto error;
> ++    }
> ++    ciphertext = (char *)key->keyblob + pos + 4;
> ++    cipherlen = len;
> ++    if (cipherlen == 0) {
> ++        errmsg = "Length of key data is zero";
> ++        goto error;
> ++    }
> ++
> ++    /*
> ++     * Decrypt it if necessary.
> ++     */
> ++    if (encrypted) {
> ++	/*
> ++	 * Derive encryption key from passphrase and iv/salt:
> ++	 *
> ++	 *  - let block A equal MD5(passphrase)
> ++	 *  - let block B equal MD5(passphrase || A)
> ++	 *  - block C would be MD5(passphrase || A || B) and so on
> ++	 *  - encryption key is the first N bytes of A || B
> ++	 */
> ++	struct MD5Context md5c;
> ++	unsigned char keybuf[32], iv[8];
> ++
> ++        if (cipherlen % 8 != 0) {
> ++            errmsg = "Encrypted part of key is not a multiple of cipher block"
> ++                " size";
> ++            goto error;
> ++        }
> ++
> ++	MD5Init(&md5c);
> ++	MD5Update(&md5c, (unsigned char *)passphrase, strlen(passphrase));
> ++	MD5Final(keybuf, &md5c);
> ++
> ++	MD5Init(&md5c);
> ++	MD5Update(&md5c, (unsigned char *)passphrase, strlen(passphrase));
> ++	MD5Update(&md5c, keybuf, 16);
> ++	MD5Final(keybuf+16, &md5c);
> +
> + 	/*
> +-	 * Check magic number.
> ++	 * Now decrypt the key blob.
> + 	 */
> +-	if (GET_32BIT(key->keyblob) != SSHCOM_MAGIC_NUMBER) {
> +-		errmsg = "Key does not begin with magic number";
> +-		goto error;
> +-	}
> ++        memset(iv, 0, sizeof(iv));
> ++	des3_decrypt_pubkey_ossh(keybuf, iv, (unsigned char *)ciphertext,
> ++				 cipherlen);
> +
> +-	/*
> +-	 * Determine the key type.
> +-	 */
> +-	pos = 8;
> +-	if (key->keyblob_len < pos+4 ||
> +-		(len = GET_32BIT(key->keyblob + pos)) > key->keyblob_len - pos - 4) {
> +-		errmsg = "Key blob does not contain a key type string";
> +-		goto error;
> +-	}
> +-	if (len > sizeof(prefix_rsa) - 1 &&
> +-		!memcmp(key->keyblob+pos+4, prefix_rsa, sizeof(prefix_rsa) - 1)) {
> +-		type = RSA;
> +-	} else if (len > sizeof(prefix_dsa) - 1 &&
> +-		!memcmp(key->keyblob+pos+4, prefix_dsa, sizeof(prefix_dsa) - 1)) {
> +-		type = DSA;
> +-	} else {
> +-		errmsg = "Key is of unknown type";
> +-		goto error;
> +-	}
> +-	pos += 4+len;
> ++        memset(&md5c, 0, sizeof(md5c));
> ++        memset(keybuf, 0, sizeof(keybuf));
> +
> +-	/*
> +-	 * Determine the cipher type.
> +-	 */
> +-	if (key->keyblob_len < pos+4 ||
> +-		(len = GET_32BIT(key->keyblob + pos)) > key->keyblob_len - pos - 4) {
> +-		errmsg = "Key blob does not contain a cipher type string";
> +-		goto error;
> +-	}
> +-	if (len == 4 && !memcmp(key->keyblob+pos+4, "none", 4))
> +-		encrypted = 0;
> +-	else if (len == 8 && !memcmp(key->keyblob+pos+4, "3des-cbc", 8))
> +-		encrypted = 1;
> +-	else {
> +-		errmsg = "Key encryption is of unknown type";
> +-		goto error;
> +-	}
> +-	pos += 4+len;
> ++        /*
> ++         * Hereafter we return WRONG_PASSPHRASE for any parsing
> ++         * error. (But only if we've just tried to decrypt it!
> ++         * Returning WRONG_PASSPHRASE for an unencrypted key is
> ++         * automatic doom.)
> ++         */
> ++        if (encrypted)
> ++            ret = SSH2_WRONG_PASSPHRASE;
> ++    }
> +
> +-	/*
> +-	 * Get hold of the encrypted part of the key.
> +-	 */
> +-	if (key->keyblob_len < pos+4 ||
> +-		(len = GET_32BIT(key->keyblob + pos)) > key->keyblob_len - pos - 4) {
> +-		errmsg = "Key blob does not contain actual key data";
> +-		goto error;
> +-	}
> +-	ciphertext = (char *)key->keyblob + pos + 4;
> +-	cipherlen = len;
> +-	if (cipherlen == 0) {
> +-		errmsg = "Length of key data is zero";
> +-		goto error;
> +-	}
> ++    /*
> ++     * Strip away the containing string to get to the real meat.
> ++     */
> ++    len = toint(GET_32BIT(ciphertext));
> ++    if (len < 0 || len > cipherlen-4) {
> ++        errmsg = "containing string was ill-formed";
> ++        goto error;
> ++    }
> ++    ciphertext += 4;
> ++    cipherlen = len;
> +
> +-	/*
> +-	 * Decrypt it if necessary.
> +-	 */
> +-	if (encrypted) {
> +-		/*
> +-		 * Derive encryption key from passphrase and iv/salt:
> +-		 *
> +-		 *  - let block A equal MD5(passphrase)
> +-		 *  - let block B equal MD5(passphrase || A)
> +-		 *  - block C would be MD5(passphrase || A || B) and so on
> +-		 *  - encryption key is the first N bytes of A || B
> +-		 */
> +-		struct MD5Context md5c;
> +-		unsigned char keybuf[32], iv[8];
> ++    /*
> ++     * Now we break down into RSA versus DSA. In either case we'll
> ++     * construct public and private blobs in our own format, and
> ++     * end up feeding them to alg->createkey().
> ++     */
> ++    blobsize = cipherlen + 256;
> ++    blob = snewn(blobsize, unsigned char);
> ++    privlen = 0;
> ++    if (type == RSA) {
> ++        struct mpint_pos n, e, d, u, p, q;
> ++        int pos = 0;
> ++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &e);
> ++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &d);
> ++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &n);
> ++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &u);
> ++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &p);
> ++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &q);
> ++        if (!q.start) {
> ++            errmsg = "key data did not contain six integers";
> ++            goto error;
> ++        }
> +
> +-		if (cipherlen % 8 != 0) {
> +-			errmsg = "Encrypted part of key is not a multiple of cipher block"
> +-				" size";
> +-			goto error;
> +-		}
> ++        alg = &ssh_rsa;
> ++        pos = 0;
> ++        pos += put_string(blob+pos, "ssh-rsa", 7);
> ++        pos += put_mp(blob+pos, e.start, e.bytes);
> ++        pos += put_mp(blob+pos, n.start, n.bytes);
> ++        publen = pos;
> ++        pos += put_string(blob+pos, d.start, d.bytes);
> ++        pos += put_mp(blob+pos, q.start, q.bytes);
> ++        pos += put_mp(blob+pos, p.start, p.bytes);
> ++        pos += put_mp(blob+pos, u.start, u.bytes);
> ++        privlen = pos - publen;
> ++    } else if (type == DSA) {
> ++        struct mpint_pos p, q, g, x, y;
> ++        int pos = 4;
> ++        if (GET_32BIT(ciphertext) != 0) {
> ++            errmsg = "predefined DSA parameters not supported";
> ++            goto error;
> ++        }
> ++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &p);
> ++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &g);
> ++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &q);
> ++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &y);
> ++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &x);
> ++        if (!x.start) {
> ++            errmsg = "key data did not contain five integers";
> ++            goto error;
> ++        }
> +
> +-		MD5Init(&md5c);
> +-		MD5Update(&md5c, (unsigned char *)passphrase, strlen(passphrase));
> +-		MD5Final(keybuf, &md5c);
> +-
> +-		MD5Init(&md5c);
> +-		MD5Update(&md5c, (unsigned char *)passphrase, strlen(passphrase));
> +-		MD5Update(&md5c, keybuf, 16);
> +-		MD5Final(keybuf+16, &md5c);
> +-
> +-		/*
> +-		 * Now decrypt the key blob.
> +-		 */
> +-		memset(iv, 0, sizeof(iv));
> +-		des3_decrypt_pubkey_ossh(keybuf, iv, (unsigned char *)ciphertext,
> +-								 cipherlen);
> +-
> +-		memset(&md5c, 0, sizeof(md5c));
> +-		memset(keybuf, 0, sizeof(keybuf));
> +-
> +-		/*
> +-		 * Hereafter we return WRONG_PASSPHRASE for any parsing
> +-		 * error. (But only if we've just tried to decrypt it!
> +-		 * Returning WRONG_PASSPHRASE for an unencrypted key is
> +-		 * automatic doom.)
> +-		 */
> +-		if (encrypted)
> +-			ret = SSH2_WRONG_PASSPHRASE;
> +-	}
> +-
> +-	/*
> +-	 * Strip away the containing string to get to the real meat.
> +-	 */
> +-	len = GET_32BIT(ciphertext);
> +-	if (len > cipherlen-4) {
> +-		errmsg = "containing string was ill-formed";
> +-		goto error;
> +-	}
> +-	ciphertext += 4;
> +-	cipherlen = len;
> +-
> +-	/*
> +-	 * Now we break down into RSA versus DSA. In either case we'll
> +-	 * construct public and private blobs in our own format, and
> +-	 * end up feeding them to alg->createkey().
> +-	 */
> +-	blobsize = cipherlen + 256;
> +-	blob = snewn(blobsize, unsigned char);
> +-	privlen = 0;
> +-	if (type == RSA) {
> +-		struct mpint_pos n, e, d, u, p, q;
> +-		int pos = 0;
> +-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &e);
> +-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &d);
> +-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &n);
> +-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &u);
> +-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &p);
> +-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &q);
> +-		if (!q.start) {
> +-			errmsg = "key data did not contain six integers";
> +-			goto error;
> +-		}
> +-
> +-		alg = &ssh_rsa;
> +-		pos = 0;
> +-		pos += put_string(blob+pos, "ssh-rsa", 7);
> +-		pos += put_mp(blob+pos, e.start, e.bytes);
> +-		pos += put_mp(blob+pos, n.start, n.bytes);
> +-		publen = pos;
> +-		pos += put_string(blob+pos, d.start, d.bytes);
> +-		pos += put_mp(blob+pos, q.start, q.bytes);
> +-		pos += put_mp(blob+pos, p.start, p.bytes);
> +-		pos += put_mp(blob+pos, u.start, u.bytes);
> +-		privlen = pos - publen;
> +-	} else if (type == DSA) {
> +-		struct mpint_pos p, q, g, x, y;
> +-		int pos = 4;
> +-		if (GET_32BIT(ciphertext) != 0) {
> +-			errmsg = "predefined DSA parameters not supported";
> +-			goto error;
> +-		}
> +-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &p);
> +-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &g);
> +-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &q);
> +-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &y);
> +-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &x);
> +-		if (!x.start) {
> +-			errmsg = "key data did not contain five integers";
> +-			goto error;
> +-		}
> +-
> +-		alg = &ssh_dss;
> +-		pos = 0;
> +-		pos += put_string(blob+pos, "ssh-dss", 7);
> +-		pos += put_mp(blob+pos, p.start, p.bytes);
> +-		pos += put_mp(blob+pos, q.start, q.bytes);
> +-		pos += put_mp(blob+pos, g.start, g.bytes);
> +-		pos += put_mp(blob+pos, y.start, y.bytes);
> +-		publen = pos;
> +-		pos += put_mp(blob+pos, x.start, x.bytes);
> +-		privlen = pos - publen;
> +-	}
> ++        alg = &ssh_dss;
> ++        pos = 0;
> ++        pos += put_string(blob+pos, "ssh-dss", 7);
> ++        pos += put_mp(blob+pos, p.start, p.bytes);
> ++        pos += put_mp(blob+pos, q.start, q.bytes);
> ++        pos += put_mp(blob+pos, g.start, g.bytes);
> ++        pos += put_mp(blob+pos, y.start, y.bytes);
> ++        publen = pos;
> ++        pos += put_mp(blob+pos, x.start, x.bytes);
> ++        privlen = pos - publen;
> ++    } else
> ++	return NULL;
> +
> + 	dropbear_assert(privlen > 0);			   /* should have bombed by now if not */
> +
> +-	retkey = snew(struct ssh2_userkey);
> +-	retkey->alg = alg;
> +-	retkey->data = alg->createkey(blob, publen, blob+publen, privlen);
> +-	if (!retkey->data) {
> ++    retkey = snew(struct ssh2_userkey);
> ++    retkey->alg = alg;
> ++    retkey->data = alg->createkey(blob, publen, blob+publen, privlen);
> ++    if (!retkey->data) {
> + 		m_free(retkey);
> +-		errmsg = "unable to create key data structure";
> +-		goto error;
> +-	}
> +-	retkey->comment = dupstr(key->comment);
> ++	errmsg = "unable to create key data structure";
> ++	goto error;
> ++    }
> ++    retkey->comment = dupstr(key->comment);
> +
> +-	errmsg = NULL; /* no error */
> +-	ret = retkey;
> ++    errmsg = NULL; /* no error */
> ++    ret = retkey;
> +
> +-	error:
> +-	if (blob) {
> +-		memset(blob, 0, blobsize);
> ++    error:
> ++    if (blob) {
> ++        memset(blob, 0, blobsize);
> + 		m_free(blob);
> +-	}
> +-	memset(key->keyblob, 0, key->keyblob_size);
> ++    }
> ++    memset(key->keyblob, 0, key->keyblob_size);
> + 	m_free(key->keyblob);
> +-	memset(&key, 0, sizeof(key));
> ++    memset(key, 0, sizeof(*key));
> + 	m_free(key);
> +-	return ret;
> ++    return ret;
> + }
> +
> + int sshcom_write(const char *filename, sign_key *key,
> +-				 char *passphrase)
> ++		 char *passphrase)
> + {
> +-	unsigned char *pubblob, *privblob;
> +-	int publen, privlen;
> +-	unsigned char *outblob;
> +-	int outlen;
> +-	struct mpint_pos numbers[6];
> +-	int nnumbers, initial_zero, pos, lenpos, i;
> +-	char *type;
> +-	char *ciphertext;
> +-	int cipherlen;
> +-	int ret = 0;
> +-	FILE *fp;
> ++    unsigned char *pubblob, *privblob;
> ++    int publen, privlen;
> ++    unsigned char *outblob;
> ++    int outlen;
> ++    struct mpint_pos numbers[6];
> ++    int nnumbers, initial_zero, pos, lenpos, i;
> ++    char *type;
> ++    char *ciphertext;
> ++    int cipherlen;
> ++    int ret = 0;
> ++    FILE *fp;
> +
> +-	/*
> +-	 * Fetch the key blobs.
> +-	 */
> +-	pubblob = key->alg->public_blob(key->data, &publen);
> +-	privblob = key->alg->private_blob(key->data, &privlen);
> +-	outblob = NULL;
> ++    /*
> ++     * Fetch the key blobs.
> ++     */
> ++    pubblob = key->alg->public_blob(key->data, &publen);
> ++    privblob = key->alg->private_blob(key->data, &privlen);
> ++    outblob = NULL;
> +
> +-	/*
> +-	 * Find the sequence of integers to be encoded into the OpenSSH
> +-	 * key blob, and also decide on the header line.
> +-	 */
> +-	if (key->alg == &ssh_rsa) {
> +-		int pos;
> +-		struct mpint_pos n, e, d, p, q, iqmp;
> ++    /*
> ++     * Find the sequence of integers to be encoded into the OpenSSH
> ++     * key blob, and also decide on the header line.
> ++     */
> ++    if (key->alg == &ssh_rsa) {
> ++        int pos;
> ++        struct mpint_pos n, e, d, p, q, iqmp;
> +
> +-		pos = 4 + GET_32BIT(pubblob);
> +-		pos += ssh2_read_mpint(pubblob+pos, publen-pos, &e);
> +-		pos += ssh2_read_mpint(pubblob+pos, publen-pos, &n);
> +-		pos = 0;
> +-		pos += ssh2_read_mpint(privblob+pos, privlen-pos, &d);
> +-		pos += ssh2_read_mpint(privblob+pos, privlen-pos, &p);
> +-		pos += ssh2_read_mpint(privblob+pos, privlen-pos, &q);
> +-		pos += ssh2_read_mpint(privblob+pos, privlen-pos, &iqmp);
> ++        pos = 4 + GET_32BIT(pubblob);
> ++        pos += ssh2_read_mpint(pubblob+pos, publen-pos, &e);
> ++        pos += ssh2_read_mpint(pubblob+pos, publen-pos, &n);
> ++        pos = 0;
> ++        pos += ssh2_read_mpint(privblob+pos, privlen-pos, &d);
> ++        pos += ssh2_read_mpint(privblob+pos, privlen-pos, &p);
> ++        pos += ssh2_read_mpint(privblob+pos, privlen-pos, &q);
> ++        pos += ssh2_read_mpint(privblob+pos, privlen-pos, &iqmp);
> +
> + 		dropbear_assert(e.start && iqmp.start); /* can't go wrong */
> +
> +-		numbers[0] = e;
> +-		numbers[1] = d;
> +-		numbers[2] = n;
> +-		numbers[3] = iqmp;
> +-		numbers[4] = q;
> +-		numbers[5] = p;
> ++        numbers[0] = e;
> ++        numbers[1] = d;
> ++        numbers[2] = n;
> ++        numbers[3] = iqmp;
> ++        numbers[4] = q;
> ++        numbers[5] = p;
> +
> +-		nnumbers = 6;
> +-		initial_zero = 0;
> +-		type = "if-modn{sign{rsa-pkcs1-sha1},encrypt{rsa-pkcs1v2-oaep}}";
> +-	} else if (key->alg == &ssh_dss) {
> +-		int pos;
> +-		struct mpint_pos p, q, g, y, x;
> ++        nnumbers = 6;
> ++	initial_zero = 0;
> ++	type = "if-modn{sign{rsa-pkcs1-sha1},encrypt{rsa-pkcs1v2-oaep}}";
> ++    } else if (key->alg == &ssh_dss) {
> ++        int pos;
> ++        struct mpint_pos p, q, g, y, x;
> +
> +-		pos = 4 + GET_32BIT(pubblob);
> +-		pos += ssh2_read_mpint(pubblob+pos, publen-pos, &p);
> +-		pos += ssh2_read_mpint(pubblob+pos, publen-pos, &q);
> +-		pos += ssh2_read_mpint(pubblob+pos, publen-pos, &g);
> +-		pos += ssh2_read_mpint(pubblob+pos, publen-pos, &y);
> +-		pos = 0;
> +-		pos += ssh2_read_mpint(privblob+pos, privlen-pos, &x);
> ++        pos = 4 + GET_32BIT(pubblob);
> ++        pos += ssh2_read_mpint(pubblob+pos, publen-pos, &p);
> ++        pos += ssh2_read_mpint(pubblob+pos, publen-pos, &q);
> ++        pos += ssh2_read_mpint(pubblob+pos, publen-pos, &g);
> ++        pos += ssh2_read_mpint(pubblob+pos, publen-pos, &y);
> ++        pos = 0;
> ++        pos += ssh2_read_mpint(privblob+pos, privlen-pos, &x);
> +
> + 		dropbear_assert(y.start && x.start); /* can't go wrong */
> +
> +-		numbers[0] = p;
> +-		numbers[1] = g;
> +-		numbers[2] = q;
> +-		numbers[3] = y;
> +-		numbers[4] = x;
> ++        numbers[0] = p;
> ++        numbers[1] = g;
> ++        numbers[2] = q;
> ++        numbers[3] = y;
> ++        numbers[4] = x;
> +
> +-		nnumbers = 5;
> +-		initial_zero = 1;
> +-		type = "dl-modp{sign{dsa-nist-sha1},dh{plain}}";
> +-	} else {
> ++        nnumbers = 5;
> ++	initial_zero = 1;
> ++	type = "dl-modp{sign{dsa-nist-sha1},dh{plain}}";
> ++    } else {
> + 		dropbear_assert(0);					 /* zoinks! */
> +-	}
> ++    }
> +
> +-	/*
> +-	 * Total size of key blob will be somewhere under 512 plus
> +-	 * combined length of integers. We'll calculate the more
> +-	 * precise size as we construct the blob.
> +-	 */
> +-	outlen = 512;
> +-	for (i = 0; i < nnumbers; i++)
> +-		outlen += 4 + numbers[i].bytes;
> +-	outblob = snewn(outlen, unsigned char);
> ++    /*
> ++     * Total size of key blob will be somewhere under 512 plus
> ++     * combined length of integers. We'll calculate the more
> ++     * precise size as we construct the blob.
> ++     */
> ++    outlen = 512;
> ++    for (i = 0; i < nnumbers; i++)
> ++	outlen += 4 + numbers[i].bytes;
> ++    outblob = snewn(outlen, unsigned char);
> +
> +-	/*
> +-	 * Create the unencrypted key blob.
> +-	 */
> +-	pos = 0;
> +-	PUT_32BIT(outblob+pos, SSHCOM_MAGIC_NUMBER); pos += 4;
> +-	pos += 4;							   /* length field, fill in later */
> +-	pos += put_string(outblob+pos, type, strlen(type));
> +-	{
> +-		char *ciphertype = passphrase ? "3des-cbc" : "none";
> +-		pos += put_string(outblob+pos, ciphertype, strlen(ciphertype));
> +-	}
> +-	lenpos = pos;					   /* remember this position */
> +-	pos += 4;							   /* encrypted-blob size */
> +-	pos += 4;							   /* encrypted-payload size */
> +-	if (initial_zero) {
> +-		PUT_32BIT(outblob+pos, 0);
> +-		pos += 4;
> +-	}
> +-	for (i = 0; i < nnumbers; i++)
> +-		pos += sshcom_put_mpint(outblob+pos,
> +-								numbers[i].start, numbers[i].bytes);
> +-	/* Now wrap up the encrypted payload. */
> +-	PUT_32BIT(outblob+lenpos+4, pos - (lenpos+8));
> +-	/* Pad encrypted blob to a multiple of cipher block size. */
> +-	if (passphrase) {
> +-		int padding = -(pos - (lenpos+4)) & 7;
> +-		while (padding--)
> +-			outblob[pos++] = random_byte();
> +-	}
> +-	ciphertext = (char *)outblob+lenpos+4;
> +-	cipherlen = pos - (lenpos+4);
> ++    /*
> ++     * Create the unencrypted key blob.
> ++     */
> ++    pos = 0;
> ++    PUT_32BIT(outblob+pos, SSHCOM_MAGIC_NUMBER); pos += 4;
> ++    pos += 4;			       /* length field, fill in later */
> ++    pos += put_string(outblob+pos, type, strlen(type));
> ++    {
> ++	char *ciphertype = passphrase ? "3des-cbc" : "none";
> ++	pos += put_string(outblob+pos, ciphertype, strlen(ciphertype));
> ++    }
> ++    lenpos = pos;		       /* remember this position */
> ++    pos += 4;			       /* encrypted-blob size */
> ++    pos += 4;			       /* encrypted-payload size */
> ++    if (initial_zero) {
> ++	PUT_32BIT(outblob+pos, 0);
> ++	pos += 4;
> ++    }
> ++    for (i = 0; i < nnumbers; i++)
> ++	pos += sshcom_put_mpint(outblob+pos,
> ++				numbers[i].start, numbers[i].bytes);
> ++    /* Now wrap up the encrypted payload. */
> ++    PUT_32BIT(outblob+lenpos+4, pos - (lenpos+8));
> ++    /* Pad encrypted blob to a multiple of cipher block size. */
> ++    if (passphrase) {
> ++	int padding = -(pos - (lenpos+4)) & 7;
> ++	while (padding--)
> ++	    outblob[pos++] = random_byte();
> ++    }
> ++    ciphertext = (char *)outblob+lenpos+4;
> ++    cipherlen = pos - (lenpos+4);
> + 	dropbear_assert(!passphrase || cipherlen % 8 == 0);
> +-	/* Wrap up the encrypted blob string. */
> +-	PUT_32BIT(outblob+lenpos, cipherlen);
> +-	/* And finally fill in the total length field. */
> +-	PUT_32BIT(outblob+4, pos);
> ++    /* Wrap up the encrypted blob string. */
> ++    PUT_32BIT(outblob+lenpos, cipherlen);
> ++    /* And finally fill in the total length field. */
> ++    PUT_32BIT(outblob+4, pos);
> +
> + 	dropbear_assert(pos < outlen);
> +
> ++    /*
> ++     * Encrypt the key.
> ++     */
> ++    if (passphrase) {
> + 	/*
> +-	 * Encrypt the key.
> ++	 * Derive encryption key from passphrase and iv/salt:
> ++	 *
> ++	 *  - let block A equal MD5(passphrase)
> ++	 *  - let block B equal MD5(passphrase || A)
> ++	 *  - block C would be MD5(passphrase || A || B) and so on
> ++	 *  - encryption key is the first N bytes of A || B
> + 	 */
> +-	if (passphrase) {
> +-		/*
> +-		 * Derive encryption key from passphrase and iv/salt:
> +-		 *
> +-		 *  - let block A equal MD5(passphrase)
> +-		 *  - let block B equal MD5(passphrase || A)
> +-		 *  - block C would be MD5(passphrase || A || B) and so on
> +-		 *  - encryption key is the first N bytes of A || B
> +-		 */
> +-		struct MD5Context md5c;
> +-		unsigned char keybuf[32], iv[8];
> ++	struct MD5Context md5c;
> ++	unsigned char keybuf[32], iv[8];
> +
> +-		MD5Init(&md5c);
> +-		MD5Update(&md5c, (unsigned char *)passphrase, strlen(passphrase));
> +-		MD5Final(keybuf, &md5c);
> ++	MD5Init(&md5c);
> ++	MD5Update(&md5c, (unsigned char *)passphrase, strlen(passphrase));
> ++	MD5Final(keybuf, &md5c);
> +
> +-		MD5Init(&md5c);
> +-		MD5Update(&md5c, (unsigned char *)passphrase, strlen(passphrase));
> +-		MD5Update(&md5c, keybuf, 16);
> +-		MD5Final(keybuf+16, &md5c);
> +-
> +-		/*
> +-		 * Now decrypt the key blob.
> +-		 */
> +-		memset(iv, 0, sizeof(iv));
> +-		des3_encrypt_pubkey_ossh(keybuf, iv, (unsigned char *)ciphertext,
> +-								 cipherlen);
> +-
> +-		memset(&md5c, 0, sizeof(md5c));
> +-		memset(keybuf, 0, sizeof(keybuf));
> +-	}
> ++	MD5Init(&md5c);
> ++	MD5Update(&md5c, (unsigned char *)passphrase, strlen(passphrase));
> ++	MD5Update(&md5c, keybuf, 16);
> ++	MD5Final(keybuf+16, &md5c);
> +
> + 	/*
> +-	 * And save it. We'll use Unix line endings just in case it's
> +-	 * subsequently transferred in binary mode.
> ++	 * Now decrypt the key blob.
> + 	 */
> ++        memset(iv, 0, sizeof(iv));
> ++	des3_encrypt_pubkey_ossh(keybuf, iv, (unsigned char *)ciphertext,
> ++				 cipherlen);
> ++
> ++        memset(&md5c, 0, sizeof(md5c));
> ++        memset(keybuf, 0, sizeof(keybuf));
> ++    }
> ++
> ++    /*
> ++     * And save it. We'll use Unix line endings just in case it's
> ++     * subsequently transferred in binary mode.
> ++     */
> + 	fp = fopen(filename, "wb");	  /* ensure Unix line endings */
> +-	if (!fp)
> +-		goto error;
> +-	fputs("---- BEGIN SSH2 ENCRYPTED PRIVATE KEY ----\n", fp);
> +-	fprintf(fp, "Comment: \"");
> +-	/*
> +-	 * Comment header is broken with backslash-newline if it goes
> +-	 * over 70 chars. Although it's surrounded by quotes, it
> +-	 * _doesn't_ escape backslashes or quotes within the string.
> +-	 * Don't ask me, I didn't design it.
> +-	 */
> +-	{
> +-		int slen = 60;					   /* starts at 60 due to "Comment: " */
> +-		char *c = key->comment;
> +-		while ((int)strlen(c) > slen) {
> +-			fprintf(fp, "%.*s\\\n", slen, c);
> +-			c += slen;
> +-			slen = 70;					   /* allow 70 chars on subsequent lines */
> +-		}
> +-		fprintf(fp, "%s\"\n", c);
> ++    if (!fp)
> ++	goto error;
> ++    fputs("---- BEGIN SSH2 ENCRYPTED PRIVATE KEY ----\n", fp);
> ++    fprintf(fp, "Comment: \"");
> ++    /*
> ++     * Comment header is broken with backslash-newline if it goes
> ++     * over 70 chars. Although it's surrounded by quotes, it
> ++     * _doesn't_ escape backslashes or quotes within the string.
> ++     * Don't ask me, I didn't design it.
> ++     */
> ++    {
> ++	int slen = 60;		       /* starts at 60 due to "Comment: " */
> ++	char *c = key->comment;
> ++	while ((int)strlen(c) > slen) {
> ++	    fprintf(fp, "%.*s\\\n", slen, c);
> ++	    c += slen;
> ++	    slen = 70;		       /* allow 70 chars on subsequent lines */
> + 	}
> ++	fprintf(fp, "%s\"\n", c);
> ++    }
> + 	base64_encode_fp(fp, outblob, pos, 70);
> +-	fputs("---- END SSH2 ENCRYPTED PRIVATE KEY ----\n", fp);
> +-	fclose(fp);
> +-	ret = 1;
> ++    fputs("---- END SSH2 ENCRYPTED PRIVATE KEY ----\n", fp);
> ++    fclose(fp);
> ++    ret = 1;
> +
> +-	error:
> +-	if (outblob) {
> +-		memset(outblob, 0, outlen);
> ++    error:
> ++    if (outblob) {
> ++        memset(outblob, 0, outlen);
> + 		m_free(outblob);
> +-	}
> +-	if (privblob) {
> +-		memset(privblob, 0, privlen);
> ++    }
> ++    if (privblob) {
> ++        memset(privblob, 0, privlen);
> + 		m_free(privblob);
> +-	}
> +-	if (pubblob) {
> +-		memset(pubblob, 0, publen);
> ++    }
> ++    if (pubblob) {
> ++        memset(pubblob, 0, publen);
> + 		m_free(pubblob);
> +-	}
> +-	return ret;
> ++    }
> ++    return ret;
> + }
> + #endif /* ssh.com stuff disabled */
> ++
> ++/* From PuTTY misc.c */
> ++static int toint(unsigned u)
> ++{
> ++    /*
> ++     * Convert an unsigned to an int, without running into the
> ++     * undefined behaviour which happens by the strict C standard if
> ++     * the value overflows. You'd hope that sensible compilers would
> ++     * do the sensible thing in response to a cast, but actually I
> ++     * don't trust modern compilers not to do silly things like
> ++     * assuming that _obviously_ you wouldn't have caused an overflow
> ++     * and so they can elide an 'if (i < 0)' test immediately after
> ++     * the cast.
> ++     *
> ++     * Sensible compilers ought of course to optimise this entire
> ++     * function into 'just return the input value'!
> ++     */
> ++    if (u <= (unsigned)INT_MAX)
> ++        return (int)u;
> ++    else if (u >= (unsigned)INT_MIN)   /* wrap in cast _to_ unsigned is OK */
> ++        return INT_MIN + (int)(u - (unsigned)INT_MIN);
> ++    else
> ++        return INT_MIN; /* fallback; should never occur on binary machines */
> ++}
> +
> diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2016-7408.patch b/meta/recipes-core/dropbear/dropbear/CVE-2016-7408.patch
> new file mode 100644
> index 0000000..995eec5
> --- /dev/null
> +++ b/meta/recipes-core/dropbear/dropbear/CVE-2016-7408.patch
> @@ -0,0 +1,101 @@
> +
> +# HG changeset patch
> +# User Matt Johnston <matt@ucc.asn.au>
> +# Date 1468248038 -28800
> +# Node ID eed9376a4ad68e3ae7f17d154dbf126ee66c54bc
> +# Parent  6a14b1f6dc04e70933c49ea335184e68c1deeb94
> +improve algorithm list parsing
> +
> +Patch is backported from:
> +https://secure.ucc.asn.au/hg/dropbear/rev/eed9376a4ad6
> +
> +CVE: CVE-2016-7408
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> +
> +diff -r 6a14b1f6dc04 -r eed9376a4ad6 common-algo.c
> +--- a/common-algo.c	Mon Jul 11 21:51:25 2016 +0800
> ++++ b/common-algo.c	Mon Jul 11 22:40:38 2016 +0800
> +@@ -531,21 +531,6 @@
> + 	return NULL;
> + }
> +
> +-static void
> +-try_add_algo(const char *algo_name, algo_type *algos,
> +-		const char *algo_desc, algo_type * new_algos, int *num_ret)
> +-{
> +-	algo_type *match_algo = check_algo(algo_name, algos);
> +-	if (!match_algo)
> +-	{
> +-		dropbear_log(LOG_WARNING, "This Dropbear program does not support '%s' %s algorithm", algo_name, algo_desc);
> +-		return;
> +-	}
> +-
> +-	new_algos[*num_ret] = *match_algo;
> +-	(*num_ret)++;
> +-}
> +-
> + /* Checks a user provided comma-separated algorithm list for available
> +  * options. Any that are not acceptable are removed in-place. Returns the
> +  * number of valid algorithms. */
> +@@ -553,30 +538,43 @@
> + check_user_algos(const char* user_algo_list, algo_type * algos,
> + 		const char *algo_desc)
> + {
> +-	algo_type new_algos[MAX_PROPOSED_ALGO];
> +-	/* this has two passes. first we sweep through the given list of
> +-	 * algorithms and mark them as usable=2 in the algo_type[] array... */
> +-	int num_ret = 0;
> ++	algo_type new_algos[MAX_PROPOSED_ALGO+1];
> + 	char *work_list = m_strdup(user_algo_list);
> +-	char *last_name = work_list;
> ++	char *start = work_list;
> + 	char *c;
> +-	for (c = work_list; *c; c++)
> ++	int n;
> ++	/* So we can iterate and look for null terminator */
> ++	memset(new_algos, 0x0, sizeof(new_algos));
> ++	for (c = work_list, n = 0; ; c++)
> + 	{
> +-		if (*c == ',')
> +-		{
> ++		char oc = *c;
> ++		if (n >= MAX_PROPOSED_ALGO) {
> ++			dropbear_exit("Too many algorithms '%s'", user_algo_list);
> ++		}
> ++		if (*c == ',' || *c == '\0') {
> ++			algo_type *match_algo = NULL;
> + 			*c = '\0';
> +-			try_add_algo(last_name, algos, algo_desc, new_algos, &num_ret);
> ++			match_algo = check_algo(start, algos);
> ++			if (match_algo) {
> ++				if (check_algo(start, new_algos)) {
> ++					TRACE(("Skip repeated algorithm '%s'", start))
> ++				} else {
> ++					new_algos[n] = *match_algo;
> ++					n++;
> ++				}
> ++			} else {
> ++				dropbear_log(LOG_WARNING, "This Dropbear program does not support '%s' %s algorithm", start, algo_desc);
> ++			}
> + 			c++;
> +-			last_name = c;
> ++			start = c;
> ++		}
> ++		if (oc == '\0') {
> ++			break;
> + 		}
> + 	}
> +-	try_add_algo(last_name, algos, algo_desc, new_algos, &num_ret);
> + 	m_free(work_list);
> +-
> +-	new_algos[num_ret].name = NULL;
> +-
> +-	/* Copy one more as a blank delimiter */
> +-	memcpy(algos, new_algos, sizeof(*new_algos) * (num_ret+1));
> +-	return num_ret;
> ++	/* n+1 to include a null terminator */
> ++	memcpy(algos, new_algos, sizeof(*new_algos) * (n+1));
> ++	return n;
> + }
> + #endif /* ENABLE_USER_ALGO_LIST */
> +
> diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2016-7409.patch b/meta/recipes-core/dropbear/dropbear/CVE-2016-7409.patch
> new file mode 100644
> index 0000000..fc4762d
> --- /dev/null
> +++ b/meta/recipes-core/dropbear/dropbear/CVE-2016-7409.patch
> @@ -0,0 +1,26 @@
> +# HG changeset patch
> +# User Matt Johnston <matt@ucc.asn.au>
> +# Date 1468245085 -28800
> +# Node ID 6a14b1f6dc04e70933c49ea335184e68c1deeb94
> +# Parent  309e1c4a87682b6ca7d80b8555a1db416c3cb7ac
> +better TRACE of failed remote ident
> +
> +Patch is backported from:
> +https://secure.ucc.asn.au/hg/dropbear/rev/6a14b1f6dc04
> +
> +CVE: CVE-2016-7409
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> +
> +diff -r 309e1c4a8768 -r 6a14b1f6dc04 common-session.c
> +--- a/common-session.c	Fri Mar 18 22:44:36 2016 +0800
> ++++ b/common-session.c	Mon Jul 11 21:51:25 2016 +0800
> +@@ -361,7 +361,7 @@
> + 	}
> +
> + 	if (!done) {
> +-		TRACE(("err: %s for '%s'\n", strerror(errno), linebuf))
> ++		TRACE(("error reading remote ident: %s\n", strerror(errno)))
> + 		ses.remoteclosed();
> + 	} else {
> + 		/* linebuf is already null terminated */
> +
>
>


--------------FB175B4B63BE079C5D7C88D9
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 10/20/2016 11:25 AM, Sona Sarmadi
      wrote:<br>
    </div>
    <blockquote
      cite="mid:1476987951-61774-1-git-send-email-sona.sarmadi@enea.com"
      type="cite">
      <pre wrap="">CVE-2016-7406
CVE-2016-7407
CVE-2016-7408
CVE-2016-7409</pre>
    </blockquote>
    <br>
    merged to staging.<br>
    <br>
    - armin<br>
    <blockquote
      cite="mid:1476987951-61774-1-git-send-email-sona.sarmadi@enea.com"
      type="cite">
      <pre wrap="">

Reference:
<a class="moz-txt-link-freetext" href="https://matt.ucc.asn.au/dropbear/CHANGES">https://matt.ucc.asn.au/dropbear/CHANGES</a>

[YOCTO #10443]

Signed-off-by: Sona Sarmadi <a class="moz-txt-link-rfc2396E" href="mailto:sona.sarmadi@enea.com">&lt;sona.sarmadi@enea.com&gt;</a>
---
 meta/recipes-core/dropbear/dropbear.inc            |    4 +
 .../dropbear/dropbear/CVE-2016-7406.patch          |  104 +
 .../dropbear/dropbear/CVE-2016-7407.patch          | 2485 ++++++++++++++++++++
 .../dropbear/dropbear/CVE-2016-7408.patch          |  101 +
 .../dropbear/dropbear/CVE-2016-7409.patch          |   26 +
 5 files changed, 2720 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2016-7406.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2016-7407.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2016-7408.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2016-7409.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 923d31c..ee2cd98 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -17,6 +17,10 @@ SRC_URI = "<a class="moz-txt-link-freetext" href="http://matt.ucc.asn.au/dropbear/releases/dropbear-$">http://matt.ucc.asn.au/dropbear/releases/dropbear-$</a>{PV}.tar.bz2 \
            <a class="moz-txt-link-freetext" href="file://0003-configure.patch">file://0003-configure.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0004-fix-2kb-keys.patch">file://0004-fix-2kb-keys.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0007-dropbear-fix-for-x32-abi.patch">file://0007-dropbear-fix-for-x32-abi.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2016-7406.patch">file://CVE-2016-7406.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2016-7407.patch">file://CVE-2016-7407.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2016-7408.patch">file://CVE-2016-7408.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2016-7409.patch">file://CVE-2016-7409.patch</a> \
            <a class="moz-txt-link-freetext" href="file://init">file://init</a> \
            <a class="moz-txt-link-freetext" href="file://dropbearkey.service">file://dropbearkey.service</a> \
            <a class="moz-txt-link-freetext" href="file://dropbear@.service">file://dropbear@.service</a> \
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2016-7406.patch b/meta/recipes-core/dropbear/dropbear/CVE-2016-7406.patch
new file mode 100644
index 0000000..22b494c
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2016-7406.patch
@@ -0,0 +1,104 @@
+# HG changeset patch
+# User Matt Johnston <a class="moz-txt-link-rfc2396E" href="mailto:matt@ucc.asn.au">&lt;matt@ucc.asn.au&gt;</a>
+# Date 1468249773 -28800
+# Node ID b66a483f3dcb66a70341845dd36e922ddaee4c5a
+# Parent  eed9376a4ad68e3ae7f17d154dbf126ee66c54bc
+Improve exit message formatting
+
+Patch is backported from:
+https://secure.ucc.asn.au/hg/dropbear/rev/b66a483f3dcb
+
+CVE: CVE-2016-7406
+Signed-off-by: Sona Sarmadi <a class="moz-txt-link-rfc2396E" href="mailto:sona.sarmadi@enea.com">&lt;sona.sarmadi@enea.com&gt;</a>
+
+diff -ruN a/cli-main.c b/cli-main.c
+--- a/cli-main.c	2016-03-09 15:54:53.000000000 +0100
++++ b/cli-main.c	2016-10-20 12:49:00.323501119 +0200
+@@ -85,29 +85,30 @@
+ #endif /* DBMULTI stuff */
+ 
+ static void cli_dropbear_exit(int exitcode, const char* format, va_list param) {
++	char exitmsg[150];
++	char fullmsg[300];
+ 
+-	char fmtbuf[300];
+-	char exitmsg[500];
++	/* Note that exit message must be rendered before session cleanup */
+ 
++	/* Render the formatted exit message */
++	vsnprintf(exitmsg, sizeof(exitmsg), format, param);
++
++	/* Add the prefix depending on session/auth state */
+ 	if (!sessinitdone) {
+-		snprintf(fmtbuf, sizeof(fmtbuf), "Exited: %s",
+-				format);
++		snprintf(fullmsg, sizeof(fullmsg), "Exited: %s", exitmsg);
+ 	} else {
+-		snprintf(fmtbuf, sizeof(fmtbuf), 
++		snprintf(fullmsg, sizeof(fullmsg), 
+ 				"Connection to %s@%s:%s exited: %s", 
+ 				cli_opts.username, cli_opts.remotehost, 
+-				cli_opts.remoteport, format);
++				cli_opts.remoteport, exitmsg);
+ 	}
+ 
+-	/* Arguments to the exit printout may be unsafe to use after session_cleanup() */
+-	vsnprintf(exitmsg, sizeof(exitmsg), fmtbuf, param);
+-
+ 	/* Do the cleanup first, since then the terminal will be reset */
+ 	session_cleanup();
+ 	/* Avoid printing onwards from terminal cruft */
+ 	fprintf(stderr, "\n");
+ 
+-	dropbear_log(LOG_INFO, "%s", exitmsg);;
++	dropbear_log(LOG_INFO, "%s", fullmsg);
+ 	exit(exitcode);
+ }
+ 
+diff -ruN a/svr-session.c b/svr-session.c
+--- a/svr-session.c	2016-03-09 15:54:54.000000000 +0100
++++ b/svr-session.c	2016-10-20 13:27:20.629628336 +0200
+@@ -145,30 +145,33 @@
+ /* failure exit - format must be &lt;= 100 chars */
+ void svr_dropbear_exit(int exitcode, const char* format, va_list param) {
+ 
+-	char fmtbuf[300];
++	char exitmsg[150];
++	char fullmsg[300];
+ 	int i;
+ 
++	/* Render the formatted exit message */
++	vsnprintf(exitmsg, sizeof(exitmsg), format, param);
++
++	/* Add the prefix depending on session/auth state */
+ 	if (!sessinitdone) {
+ 		/* before session init */
+-		snprintf(fmtbuf, sizeof(fmtbuf), 
+-				"Early exit: %s", format);
++                snprintf(fullmsg, sizeof(fullmsg), "Early exit: %s", exitmsg);
+ 	} else if (ses.authstate.authdone) {
+ 		/* user has authenticated */
+-		snprintf(fmtbuf, sizeof(fmtbuf),
++		snprintf(fullmsg, sizeof(fullmsg),
+ 				"Exit (%s): %s", 
+-				ses.authstate.pw_name, format);
++				ses.authstate.pw_name, exitmsg);
+ 	} else if (ses.authstate.pw_name) {
+ 		/* we have a potential user */
+-		snprintf(fmtbuf, sizeof(fmtbuf), 
++		snprintf(fullmsg, sizeof(fullmsg),
+ 				"Exit before auth (user '%s', %d fails): %s",
+-				ses.authstate.pw_name, ses.authstate.failcount, format);
++				ses.authstate.pw_name, ses.authstate.failcount, exitmsg);
+ 	} else {
+ 		/* before userauth */
+-		snprintf(fmtbuf, sizeof(fmtbuf), 
+-				"Exit before auth: %s", format);
++		snprintf(fullmsg, sizeof(fullmsg), "Exit before auth: %s", exitmsg);
+ 	}
+ 
+-	_dropbear_log(LOG_INFO, fmtbuf, param);
++	dropbear_log(LOG_INFO, "%s", fullmsg);
+ 
+ #ifdef USE_VFORK
+ 	/* For uclinux only the main server process should cleanup - we don't want
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2016-7407.patch b/meta/recipes-core/dropbear/dropbear/CVE-2016-7407.patch
new file mode 100644
index 0000000..6cfc3f5
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2016-7407.patch
@@ -0,0 +1,2485 @@
+
+# HG changeset patch
+# User Matt Johnston <a class="moz-txt-link-rfc2396E" href="mailto:matt@ucc.asn.au">&lt;matt@ucc.asn.au&gt;</a>
+# Date 1468335601 -28800
+# Node ID 34e6127ef02eb52d1f1f9494b9cbfe89bec0e925
+# Parent  6914eedb10721db4833c8f005b4acd37f71fb975
+merge fixes from PuTTY import.c
+
+toint() from misc.c
+
+(revids are from hggit conversion)
+
+changeset:   4620:60a336a6c85c
+user:        Simon Tatham <a class="moz-txt-link-rfc2396E" href="mailto:anakin@pobox.com">&lt;anakin@pobox.com&gt;</a>
+date:        Thu Feb 25 20:26:33 2016 +0000
+files:       import.c
+description:
+Fix potential segfaults in reading OpenSSH's ASN.1 key format.
+
+The length coming back from ber_read_id_len might have overflowed, so
+treat it as potentially negative. Also, while I'm here, accumulate it
+inside ber_read_id_len as an unsigned, so as to avoid undefined
+behaviour on integer overflow, and toint() it before return.
+
+Thanks to Hanno Böck for spotting this, with the aid of AFL.
+
+(cherry picked from commit 5b7833cd474a24ec098654dcba8cb9509f3bf2c1)
+
+Conflicts:
+	import.c
+
+(cherry-picker's note: resolving the conflict involved removing an
+entire section of the original commit which fixed ECDSA code not
+present on this branch)
+
+
+changeset:   4619:9c6c638d98d8
+user:        Simon Tatham <a class="moz-txt-link-rfc2396E" href="mailto:anakin@pobox.com">&lt;anakin@pobox.com&gt;</a>
+date:        Sun Jul 14 10:45:54 2013 +0000
+files:       import.c ssh.c sshdss.c sshpubk.c sshrsa.c
+description:
+Tighten up a lot of casts from unsigned to int which are read by one
+of the GET_32BIT macros and then used as length fields. Missing bounds
+checks against zero have been added, and also I've introduced a helper
+function toint() which casts from unsigned to int in such a way as to
+avoid C undefined behaviour, since I'm not sure I trust compilers any
+more to do the obviously sensible thing.
+
+[originally from svn r9918]
+
+
+changeset:   4618:3957829f24d3
+user:        Simon Tatham <a class="moz-txt-link-rfc2396E" href="mailto:anakin@pobox.com">&lt;anakin@pobox.com&gt;</a>
+date:        Mon Jul 08 22:36:04 2013 +0000
+files:       import.c sshdss.c sshrsa.c
+description:
+Add an assortment of extra safety checks.
+
+[originally from svn r9896]
+
+
+changeset:   4617:2cddee0bce12
+user:        Jacob Nevins <a class="moz-txt-link-rfc2396E" href="mailto:jacobn@chiark.greenend.org.uk">&lt;jacobn@chiark.greenend.org.uk&gt;</a>
+date:        Wed Dec 07 00:24:45 2005 +0000
+files:       import.c
+description:
+Institutional failure to memset() things pointed at rather than pointers.
+Things should now be zeroed and memory not leaked. Spotted by Brant Thomsen.
+
+[originally from svn r6476]
+
+
+changeset:   4616:24ac78a9c71d
+user:        Simon Tatham <a class="moz-txt-link-rfc2396E" href="mailto:anakin@pobox.com">&lt;anakin@pobox.com&gt;</a>
+date:        Wed Feb 11 13:58:27 2004 +0000
+files:       import.c
+description:
+Jacob's last-minute testing found a couple of trivial bugs in
+import.c, and my attempts to reproduce them in cmdgen found another
+one there :-)
+
+[originally from svn r3847]
+
+
+changeset:   4615:088d39a73db0
+user:        Simon Tatham <a class="moz-txt-link-rfc2396E" href="mailto:anakin@pobox.com">&lt;anakin@pobox.com&gt;</a>
+date:        Thu Jan 22 18:52:49 2004 +0000
+files:       import.c
+description:
+Placate some gcc warnings.
+
+[originally from svn r3761]
+
+
+changeset:   4614:e4288bad4d93
+parent:      1758:108b8924593d
+user:        Simon Tatham <a class="moz-txt-link-rfc2396E" href="mailto:anakin@pobox.com">&lt;anakin@pobox.com&gt;</a>
+date:        Fri Oct 03 21:21:23 2003 +0000
+files:       import.c
+description:
+My ASN.1 decoder returned wrong IDs for anything above 0x1E! Good
+job it's never had to yet. Ahem.
+
+[originally from svn r3479]
+
+Patch is backported from:
+https://secure.ucc.asn.au/hg/dropbear/rev/34e6127ef02e
+
+CVE: CVE-2016-7407
+Signed-off-by: Sona Sarmadi <a class="moz-txt-link-rfc2396E" href="mailto:sona.sarmadi@enea.com">&lt;sona.sarmadi@enea.com&gt;</a>
+
+diff -r 6914eedb1072 -r 34e6127ef02e keyimport.c
+--- a/keyimport.c	Mon Jul 11 23:34:18 2016 +0800
++++ b/keyimport.c	Tue Jul 12 23:00:01 2016 +0800
+@@ -47,65 +47,67 @@
+   (cp)[0] = (unsigned char)((value) &gt;&gt; 24); } while (0)
+ 
+ #define GET_32BIT(cp) \
+-	(((unsigned long)(unsigned char)(cp)[0] &lt;&lt; 24) | \
+-	((unsigned long)(unsigned char)(cp)[1] &lt;&lt; 16) | \
+-	((unsigned long)(unsigned char)(cp)[2] &lt;&lt; 8) | \
+-	((unsigned long)(unsigned char)(cp)[3]))
++    (((unsigned long)(unsigned char)(cp)[0] &lt;&lt; 24) | \
++    ((unsigned long)(unsigned char)(cp)[1] &lt;&lt; 16) | \
++    ((unsigned long)(unsigned char)(cp)[2] &lt;&lt; 8) | \
++    ((unsigned long)(unsigned char)(cp)[3]))
+ 
+ static int openssh_encrypted(const char *filename);
+ static sign_key *openssh_read(const char *filename, char *passphrase);
+ static int openssh_write(const char *filename, sign_key *key,
+-				  char *passphrase);
++		  char *passphrase);
+ 
+ static int dropbear_write(const char*filename, sign_key * key);
+ static sign_key *dropbear_read(const char* filename);
+ 
++static int toint(unsigned u);
++
+ #if 0
+ static int sshcom_encrypted(const char *filename, char **comment);
+ static struct ssh2_userkey *sshcom_read(const char *filename, char *passphrase);
+ static int sshcom_write(const char *filename, struct ssh2_userkey *key,
+-				 char *passphrase);
++		 char *passphrase);
+ #endif
+ 
+ int import_encrypted(const char* filename, int filetype) {
+ 
+ 	if (filetype == KEYFILE_OPENSSH) {
+-		return openssh_encrypted(filename);
++	return openssh_encrypted(filename);
+ #if 0
+ 	} else if (filetype == KEYFILE_SSHCOM) {
+ 		return sshcom_encrypted(filename, NULL);
+ #endif
+-	}
+-	return 0;
++    }
++    return 0;
+ }
+ 
+ sign_key *import_read(const char *filename, char *passphrase, int filetype) {
+ 
+ 	if (filetype == KEYFILE_OPENSSH) {
+-		return openssh_read(filename, passphrase);
++	return openssh_read(filename, passphrase);
+ 	} else if (filetype == KEYFILE_DROPBEAR) {
+ 		return dropbear_read(filename);
+ #if 0
+ 	} else if (filetype == KEYFILE_SSHCOM) {
+-		return sshcom_read(filename, passphrase);
++	return sshcom_read(filename, passphrase);
+ #endif
+ 	}
+-	return NULL;
++    return NULL;
+ }
+ 
+ int import_write(const char *filename, sign_key *key, char *passphrase,
+ 		int filetype) {
+ 
+ 	if (filetype == KEYFILE_OPENSSH) {
+-		return openssh_write(filename, key, passphrase);
++	return openssh_write(filename, key, passphrase);
+ 	} else if (filetype == KEYFILE_DROPBEAR) {
+ 		return dropbear_write(filename, key);
+ #if 0
+ 	} else if (filetype == KEYFILE_SSHCOM) {
+-		return sshcom_write(filename, key, passphrase);
++	return sshcom_write(filename, key, passphrase);
+ #endif
+ 	}
+-	return 0;
++    return 0;
+ }
+ 
+ static sign_key *dropbear_read(const char* filename) {
+@@ -183,11 +185,11 @@
+  * Helper routines. (The base64 ones are defined in sshpubk.c.)
+  */
+ 
+-#define isbase64(c) (	((c) &gt;= 'A' &amp;&amp; (c) &lt;= 'Z') || \
+-						 ((c) &gt;= 'a' &amp;&amp; (c) &lt;= 'z') || \
+-						 ((c) &gt;= '0' &amp;&amp; (c) &lt;= '9') || \
+-						 (c) == '+' || (c) == '/' || (c) == '=' \
+-						 )
++#define isbase64(c) (    ((c) &gt;= 'A' &amp;&amp; (c) &lt;= 'Z') || \
++                         ((c) &gt;= 'a' &amp;&amp; (c) &lt;= 'z') || \
++                         ((c) &gt;= '0' &amp;&amp; (c) &lt;= '9') || \
++                         (c) == '+' || (c) == '/' || (c) == '=' \
++                         )
+ 
+ /* cpl has to be less than 100 */
+ static void base64_encode_fp(FILE * fp, unsigned char *data,
+@@ -220,57 +222,58 @@
+  */
+ 
+ /* ASN.1 tag classes. */
+-#define ASN1_CLASS_UNIVERSAL		(0 &lt;&lt; 6)
+-#define ASN1_CLASS_APPLICATION	  (1 &lt;&lt; 6)
++#define ASN1_CLASS_UNIVERSAL        (0 &lt;&lt; 6)
++#define ASN1_CLASS_APPLICATION      (1 &lt;&lt; 6)
+ #define ASN1_CLASS_CONTEXT_SPECIFIC (2 &lt;&lt; 6)
+-#define ASN1_CLASS_PRIVATE		  (3 &lt;&lt; 6)
+-#define ASN1_CLASS_MASK			 (3 &lt;&lt; 6)
++#define ASN1_CLASS_PRIVATE          (3 &lt;&lt; 6)
++#define ASN1_CLASS_MASK             (3 &lt;&lt; 6)
+ 
+ /* Primitive versus constructed bit. */
+-#define ASN1_CONSTRUCTED			(1 &lt;&lt; 5)
++#define ASN1_CONSTRUCTED            (1 &lt;&lt; 5)
+ 
+ static int ber_read_id_len(void *source, int sourcelen,
+-						   int *id, int *length, int *flags)
++			   int *id, int *length, int *flags)
+ {
+-	unsigned char *p = (unsigned char *) source;
++    unsigned char *p = (unsigned char *) source;
+ 
+-	if (sourcelen == 0)
++    if (sourcelen == 0)
++	return -1;
++
++    *flags = (*p &amp; 0xE0);
++    if ((*p &amp; 0x1F) == 0x1F) {
++	*id = 0;
++	while (*p &amp; 0x80) {
++	    p++, sourcelen--;
++	    if (sourcelen == 0)
+ 		return -1;
++	    *id = (*id &lt;&lt; 7) | (*p &amp; 0x7F);
++	}
++	p++, sourcelen--;
++    } else {
++	*id = *p &amp; 0x1F;
++	p++, sourcelen--;
++    }
+ 
+-	*flags = (*p &amp; 0xE0);
+-	if ((*p &amp; 0x1F) == 0x1F) {
+-		*id = 0;
+-		while (*p &amp; 0x80) {
+-			*id = (*id &lt;&lt; 7) | (*p &amp; 0x7F);
+-			p++, sourcelen--;
+-			if (sourcelen == 0)
+-				return -1;
+-		}
+-		*id = (*id &lt;&lt; 7) | (*p &amp; 0x7F);
+-		p++, sourcelen--;
+-	} else {
+-		*id = *p &amp; 0x1F;
+-		p++, sourcelen--;
+-	}
++    if (sourcelen == 0)
++	return -1;
+ 
+-	if (sourcelen == 0)
+-		return -1;
++    if (*p &amp; 0x80) {
++        unsigned len;
++	int n = *p &amp; 0x7F;
++	p++, sourcelen--;
++	if (sourcelen &lt; n)
++	    return -1;
++	len = 0;
++	while (n--)
++	    len = (len &lt;&lt; 8) | (*p++);
++	sourcelen -= n;
++        *length = toint(len);
++    } else {
++	*length = *p;
++	p++, sourcelen--;
++    }
+ 
+-	if (*p &amp; 0x80) {
+-		int n = *p &amp; 0x7F;
+-		p++, sourcelen--;
+-		if (sourcelen &lt; n)
+-			return -1;
+-		*length = 0;
+-		while (n--)
+-			*length = (*length &lt;&lt; 8) | (*p++);
+-		sourcelen -= n;
+-	} else {
+-		*length = *p;
+-		p++, sourcelen--;
+-	}
+-
+-	return p - (unsigned char *) source;
++    return p - (unsigned char *) source;
+ }
+ 
+ /*
+@@ -281,57 +284,57 @@
+  */
+ static int ber_write_id_len(void *dest, int id, int length, int flags)
+ {
+-	unsigned char *d = (unsigned char *)dest;
+-	int len = 0;
++    unsigned char *d = (unsigned char *)dest;
++    int len = 0;
+ 
+-	if (id &lt;= 30) {
+-		/*
+-		 * Identifier is one byte.
+-		 */
+-		len++;
+-		if (d) *d++ = id | flags;
+-	} else {
+-		int n;
+-		/*
+-		 * Identifier is multiple bytes: the first byte is 11111
+-		 * plus the flags, and subsequent bytes encode the value of
+-		 * the identifier, 7 bits at a time, with the top bit of
+-		 * each byte 1 except the last one which is 0.
+-		 */
+-		len++;
+-		if (d) *d++ = 0x1F | flags;
+-		for (n = 1; (id &gt;&gt; (7*n)) &gt; 0; n++)
+-			continue;					   /* count the bytes */
+-		while (n--) {
+-			len++;
+-			if (d) *d++ = (n ? 0x80 : 0) | ((id &gt;&gt; (7*n)) &amp; 0x7F);
+-		}
++    if (id &lt;= 30) {
++	/*
++	 * Identifier is one byte.
++	 */
++	len++;
++	if (d) *d++ = id | flags;
++    } else {
++	int n;
++	/*
++	 * Identifier is multiple bytes: the first byte is 11111
++	 * plus the flags, and subsequent bytes encode the value of
++	 * the identifier, 7 bits at a time, with the top bit of
++	 * each byte 1 except the last one which is 0.
++	 */
++	len++;
++	if (d) *d++ = 0x1F | flags;
++	for (n = 1; (id &gt;&gt; (7*n)) &gt; 0; n++)
++	    continue;		       /* count the bytes */
++	while (n--) {
++	    len++;
++	    if (d) *d++ = (n ? 0x80 : 0) | ((id &gt;&gt; (7*n)) &amp; 0x7F);
+ 	}
++    }
+ 
+-	if (length &lt; 128) {
+-		/*
+-		 * Length is one byte.
+-		 */
+-		len++;
+-		if (d) *d++ = length;
+-	} else {
+-		int n;
+-		/*
+-		 * Length is multiple bytes. The first is 0x80 plus the
+-		 * number of subsequent bytes, and the subsequent bytes
+-		 * encode the actual length.
+-		 */
+-		for (n = 1; (length &gt;&gt; (8*n)) &gt; 0; n++)
+-			continue;					   /* count the bytes */
+-		len++;
+-		if (d) *d++ = 0x80 | n;
+-		while (n--) {
+-			len++;
+-			if (d) *d++ = (length &gt;&gt; (8*n)) &amp; 0xFF;
+-		}
++    if (length &lt; 128) {
++	/*
++	 * Length is one byte.
++	 */
++	len++;
++	if (d) *d++ = length;
++    } else {
++	int n;
++	/*
++	 * Length is multiple bytes. The first is 0x80 plus the
++	 * number of subsequent bytes, and the subsequent bytes
++	 * encode the actual length.
++	 */
++	for (n = 1; (length &gt;&gt; (8*n)) &gt; 0; n++)
++	    continue;		       /* count the bytes */
++	len++;
++	if (d) *d++ = 0x80 | n;
++	while (n--) {
++	    len++;
++	    if (d) *d++ = (length &gt;&gt; (8*n)) &amp; 0xFF;
+ 	}
++    }
+ 
+-	return len;
++    return len;
+ }
+ 
+ 
+@@ -344,99 +347,99 @@
+ 
+ enum { OSSH_DSA, OSSH_RSA, OSSH_EC };
+ struct openssh_key {
+-	int type;
+-	int encrypted;
+-	char iv[32];
+-	unsigned char *keyblob;
++    int type;
++    int encrypted;
++    char iv[32];
++    unsigned char *keyblob;
+ 	unsigned int keyblob_len, keyblob_size;
+ };
+ 
+ static struct openssh_key *load_openssh_key(const char *filename)
+ {
+-	struct openssh_key *ret;
++    struct openssh_key *ret;
+ 	FILE *fp = NULL;
+-	char buffer[256];
++    char buffer[256];
+ 	char *errmsg = NULL, *p = NULL;
+-	int headers_done;
++    int headers_done;
+ 	unsigned long len, outlen;
+ 
+ 	ret = (struct openssh_key*)m_malloc(sizeof(struct openssh_key));
+-	ret-&gt;keyblob = NULL;
+-	ret-&gt;keyblob_len = ret-&gt;keyblob_size = 0;
+-	ret-&gt;encrypted = 0;
+-	memset(ret-&gt;iv, 0, sizeof(ret-&gt;iv));
++    ret-&gt;keyblob = NULL;
++    ret-&gt;keyblob_len = ret-&gt;keyblob_size = 0;
++    ret-&gt;encrypted = 0;
++    memset(ret-&gt;iv, 0, sizeof(ret-&gt;iv));
+ 
+ 	if (strlen(filename) == 1 &amp;&amp; filename[0] == '-') {
+ 		fp = stdin;
+ 	} else {
+ 		fp = fopen(filename, "r");
+ 	}
+-	if (!fp) {
+-		errmsg = "Unable to open key file";
+-		goto error;
+-	}
+-	if (!fgets(buffer, sizeof(buffer), fp) ||
+-		0 != strncmp(buffer, "-----BEGIN ", 11) ||
+-		0 != strcmp(buffer+strlen(buffer)-17, "PRIVATE KEY-----\n")) {
+-		errmsg = "File does not begin with OpenSSH key header";
+-		goto error;
+-	}
+-	if (!strcmp(buffer, "-----BEGIN RSA PRIVATE KEY-----\n"))
+-		ret-&gt;type = OSSH_RSA;
+-	else if (!strcmp(buffer, "-----BEGIN DSA PRIVATE KEY-----\n"))
+-		ret-&gt;type = OSSH_DSA;
++    if (!fp) {
++	errmsg = "Unable to open key file";
++	goto error;
++    }
++    if (!fgets(buffer, sizeof(buffer), fp) ||
++	0 != strncmp(buffer, "-----BEGIN ", 11) ||
++	0 != strcmp(buffer+strlen(buffer)-17, "PRIVATE KEY-----\n")) {
++	errmsg = "File does not begin with OpenSSH key header";
++	goto error;
++    }
++    if (!strcmp(buffer, "-----BEGIN RSA PRIVATE KEY-----\n"))
++	ret-&gt;type = OSSH_RSA;
++    else if (!strcmp(buffer, "-----BEGIN DSA PRIVATE KEY-----\n"))
++	ret-&gt;type = OSSH_DSA;
+ 	else if (!strcmp(buffer, "-----BEGIN EC PRIVATE KEY-----\n"))
+ 		ret-&gt;type = OSSH_EC;
+-	else {
+-		errmsg = "Unrecognised key type";
++    else {
++	errmsg = "Unrecognised key type";
++	goto error;
++    }
++
++    headers_done = 0;
++    while (1) {
++	if (!fgets(buffer, sizeof(buffer), fp)) {
++	    errmsg = "Unexpected end of file";
++	    goto error;
++	}
++	if (0 == strncmp(buffer, "-----END ", 9) &amp;&amp;
++	    0 == strcmp(buffer+strlen(buffer)-17, "PRIVATE KEY-----\n"))
++	    break;		       /* done */
++	if ((p = strchr(buffer, ':')) != NULL) {
++	    if (headers_done) {
++		errmsg = "Header found in body of key data";
+ 		goto error;
+-	}
++	    }
++	    *p++ = '\0';
++	    while (*p &amp;&amp; isspace((unsigned char)*p)) p++;
++	    if (!strcmp(buffer, "Proc-Type")) {
++		if (p[0] != '4' || p[1] != ',') {
++		    errmsg = "Proc-Type is not 4 (only 4 is supported)";
++		    goto error;
++		}
++		p += 2;
++		if (!strcmp(p, "ENCRYPTED\n"))
++		    ret-&gt;encrypted = 1;
++	    } else if (!strcmp(buffer, "DEK-Info")) {
++		int i, j;
+ 
+-	headers_done = 0;
+-	while (1) {
+-		if (!fgets(buffer, sizeof(buffer), fp)) {
+-			errmsg = "Unexpected end of file";
+-			goto error;
++		if (strncmp(p, "DES-EDE3-CBC,", 13)) {
++		    errmsg = "Ciphers other than DES-EDE3-CBC not supported";
++		    goto error;
+ 		}
+-		if (0 == strncmp(buffer, "-----END ", 9) &amp;&amp;
+-			0 == strcmp(buffer+strlen(buffer)-17, "PRIVATE KEY-----\n"))
+-			break;					   /* done */
+-		if ((p = strchr(buffer, ':')) != NULL) {
+-			if (headers_done) {
+-				errmsg = "Header found in body of key data";
+-				goto error;
+-			}
+-			*p++ = '\0';
+-			while (*p &amp;&amp; isspace((unsigned char)*p)) p++;
+-			if (!strcmp(buffer, "Proc-Type")) {
+-				if (p[0] != '4' || p[1] != ',') {
+-					errmsg = "Proc-Type is not 4 (only 4 is supported)";
+-					goto error;
+-				}
+-				p += 2;
+-				if (!strcmp(p, "ENCRYPTED\n"))
+-					ret-&gt;encrypted = 1;
+-			} else if (!strcmp(buffer, "DEK-Info")) {
+-				int i, j;
+-
+-				if (strncmp(p, "DES-EDE3-CBC,", 13)) {
+-					errmsg = "Ciphers other than DES-EDE3-CBC not supported";
+-					goto error;
+-				}
+-				p += 13;
+-				for (i = 0; i &lt; 8; i++) {
+-					if (1 != sscanf(p, "%2x", &amp;j))
+-						break;
+-					ret-&gt;iv[i] = j;
+-					p += 2;
+-				}
+-				if (i &lt; 8) {
+-					errmsg = "Expected 16-digit iv in DEK-Info";
+-					goto error;
+-				}
+-			}
+-		} else {
+-			headers_done = 1;
++		p += 13;
++		for (i = 0; i &lt; 8; i++) {
++		    if (1 != sscanf(p, "%2x", &amp;j))
++			break;
++		    ret-&gt;iv[i] = j;
++		    p += 2;
++		}
++		if (i &lt; 8) {
++		    errmsg = "Expected 16-digit iv in DEK-Info";
++		    goto error;
++		}
++	    }
++	} else {
++	    headers_done = 1;
+ 			len = strlen(buffer);
+ 			outlen = len*4/3;
+ 			if (ret-&gt;keyblob_len + outlen &gt; ret-&gt;keyblob_size) {
+@@ -448,65 +451,65 @@
+ 			if (base64_decode((const unsigned char *)buffer, len,
+ 						ret-&gt;keyblob + ret-&gt;keyblob_len, &amp;outlen) != CRYPT_OK){
+ 				errmsg = "Error decoding base64";
+-				goto error;
+-			}
++                        goto error;
++                    }
+ 			ret-&gt;keyblob_len += outlen;
+-		}
++                }
+ 	}
+ 
+-	if (ret-&gt;keyblob_len == 0 || !ret-&gt;keyblob) {
+-		errmsg = "Key body not present";
+-		goto error;
+-	}
++    if (ret-&gt;keyblob_len == 0 || !ret-&gt;keyblob) {
++	errmsg = "Key body not present";
++	goto error;
++    }
+ 
+-	if (ret-&gt;encrypted &amp;&amp; ret-&gt;keyblob_len % 8 != 0) {
+-		errmsg = "Encrypted key blob is not a multiple of cipher block size";
+-		goto error;
+-	}
++    if (ret-&gt;encrypted &amp;&amp; ret-&gt;keyblob_len % 8 != 0) {
++	errmsg = "Encrypted key blob is not a multiple of cipher block size";
++	goto error;
++    }
+ 
+ 	m_burn(buffer, sizeof(buffer));
+-	return ret;
++    return ret;
+ 
+-	error:
++    error:
+ 	m_burn(buffer, sizeof(buffer));
+-	if (ret) {
+-		if (ret-&gt;keyblob) {
++    if (ret) {
++	if (ret-&gt;keyblob) {
+ 			m_burn(ret-&gt;keyblob, ret-&gt;keyblob_size);
+ 			m_free(ret-&gt;keyblob);
+-		}
++        }
+ 		m_free(ret);
+ 	}
+ 	if (fp) {
+ 		fclose(fp);
+-	}
++    }
+ 	if (errmsg) {
+ 		fprintf(stderr, "Error: %s\n", errmsg);
+ 	}
+-	return NULL;
++    return NULL;
+ }
+ 
+ static int openssh_encrypted(const char *filename)
+ {
+-	struct openssh_key *key = load_openssh_key(filename);
+-	int ret;
++    struct openssh_key *key = load_openssh_key(filename);
++    int ret;
+ 
+-	if (!key)
+-		return 0;
+-	ret = key-&gt;encrypted;
++    if (!key)
++	return 0;
++    ret = key-&gt;encrypted;
+ 	m_burn(key-&gt;keyblob, key-&gt;keyblob_size);
+ 	m_free(key-&gt;keyblob);
+ 	m_free(key);
+-	return ret;
++    return ret;
+ }
+ 
+ static sign_key *openssh_read(const char *filename, char * UNUSED(passphrase))
+ {
+ 	struct openssh_key *key;
+-	unsigned char *p;
+-	int ret, id, len, flags;
++    unsigned char *p;
++    int ret, id, len, flags;
+ 	int i, num_integers = 0;
+ 	sign_key *retval = NULL;
+-	char *errmsg;
++    char *errmsg;
+ 	unsigned char *modptr = NULL;
+ 	int modlen = -9999;
+ 	enum signkey_type type;
+@@ -518,86 +521,87 @@
+ 
+ 	key = load_openssh_key(filename);
+ 
+-	if (!key)
+-		return NULL;
++    if (!key)
++	return NULL;
+ 
+-	if (key-&gt;encrypted) {
++    if (key-&gt;encrypted) {
+ 		errmsg = "encrypted keys not supported currently";
+ 		goto error;
+ #if 0
+ 		/* matt TODO */
+-		/*
+-		 * Derive encryption key from passphrase and iv/salt:
+-		 * 
+-		 *  - let block A equal MD5(passphrase || iv)
+-		 *  - let block B equal MD5(A || passphrase || iv)
+-		 *  - block C would be MD5(B || passphrase || iv) and so on
+-		 *  - encryption key is the first N bytes of A || B
+-		 */
+-		struct MD5Context md5c;
+-		unsigned char keybuf[32];
++	/*
++	 * Derive encryption key from passphrase and iv/salt:
++	 * 
++	 *  - let block A equal MD5(passphrase || iv)
++	 *  - let block B equal MD5(A || passphrase || iv)
++	 *  - block C would be MD5(B || passphrase || iv) and so on
++	 *  - encryption key is the first N bytes of A || B
++	 */
++	struct MD5Context md5c;
++	unsigned char keybuf[32];
+ 
+-		MD5Init(&amp;md5c);
+-		MD5Update(&amp;md5c, (unsigned char *)passphrase, strlen(passphrase));
+-		MD5Update(&amp;md5c, (unsigned char *)key-&gt;iv, 8);
+-		MD5Final(keybuf, &amp;md5c);
++	MD5Init(&amp;md5c);
++	MD5Update(&amp;md5c, (unsigned char *)passphrase, strlen(passphrase));
++	MD5Update(&amp;md5c, (unsigned char *)key-&gt;iv, 8);
++	MD5Final(keybuf, &amp;md5c);
+ 
+-		MD5Init(&amp;md5c);
+-		MD5Update(&amp;md5c, keybuf, 16);
+-		MD5Update(&amp;md5c, (unsigned char *)passphrase, strlen(passphrase));
+-		MD5Update(&amp;md5c, (unsigned char *)key-&gt;iv, 8);
+-		MD5Final(keybuf+16, &amp;md5c);
+-
+-		/*
+-		 * Now decrypt the key blob.
+-		 */
+-		des3_decrypt_pubkey_ossh(keybuf, (unsigned char *)key-&gt;iv,
+-								 key-&gt;keyblob, key-&gt;keyblob_len);
+-
+-		memset(&amp;md5c, 0, sizeof(md5c));
+-		memset(keybuf, 0, sizeof(keybuf));
+-#endif 
+-	}
++	MD5Init(&amp;md5c);
++	MD5Update(&amp;md5c, keybuf, 16);
++	MD5Update(&amp;md5c, (unsigned char *)passphrase, strlen(passphrase));
++	MD5Update(&amp;md5c, (unsigned char *)key-&gt;iv, 8);
++	MD5Final(keybuf+16, &amp;md5c);
+ 
+ 	/*
+-	 * Now we have a decrypted key blob, which contains an ASN.1
+-	 * encoded private key. We must now untangle the ASN.1.
+-	 *
+-	 * We expect the whole key blob to be formatted as a SEQUENCE
+-	 * (0x30 followed by a length code indicating that the rest of
+-	 * the blob is part of the sequence). Within that SEQUENCE we
+-	 * expect to see a bunch of INTEGERs. What those integers mean
+-	 * depends on the key type:
+-	 *
+-	 *  - For RSA, we expect the integers to be 0, n, e, d, p, q,
+-	 *	dmp1, dmq1, iqmp in that order. (The last three are d mod
+-	 *	(p-1), d mod (q-1), inverse of q mod p respectively.)
+-	 *
+-	 *  - For DSA, we expect them to be 0, p, q, g, y, x in that
+-	 *	order.
++	 * Now decrypt the key blob.
+ 	 */
+-	
+-	p = key-&gt;keyblob;
++	des3_decrypt_pubkey_ossh(keybuf, (unsigned char *)key-&gt;iv,
++				 key-&gt;keyblob, key-&gt;keyblob_len);
+ 
+-	/* Expect the SEQUENCE header. Take its absence as a failure to decrypt. */
+-	ret = ber_read_id_len(p, key-&gt;keyblob_len, &amp;id, &amp;len, &amp;flags);
+-	p += ret;
+-	if (ret &lt; 0 || id != 16) {
++        memset(&amp;md5c, 0, sizeof(md5c));
++        memset(keybuf, 0, sizeof(keybuf));
++#endif 
++    }
++
++    /*
++     * Now we have a decrypted key blob, which contains an ASN.1
++     * encoded private key. We must now untangle the ASN.1.
++     *
++     * We expect the whole key blob to be formatted as a SEQUENCE
++     * (0x30 followed by a length code indicating that the rest of
++     * the blob is part of the sequence). Within that SEQUENCE we
++     * expect to see a bunch of INTEGERs. What those integers mean
++     * depends on the key type:
++     *
++     *  - For RSA, we expect the integers to be 0, n, e, d, p, q,
++     *    dmp1, dmq1, iqmp in that order. (The last three are d mod
++     *    (p-1), d mod (q-1), inverse of q mod p respectively.)
++     *
++     *  - For DSA, we expect them to be 0, p, q, g, y, x in that
++     *    order.
++     */
++    
++    p = key-&gt;keyblob;
++
++    /* Expect the SEQUENCE header. Take its absence as a failure to decrypt. */
++    ret = ber_read_id_len(p, key-&gt;keyblob_len, &amp;id, &amp;len, &amp;flags);
++    p += ret;
++    if (ret &lt; 0 || id != 16 || len &lt; 0 ||
++        key-&gt;keyblob+key-&gt;keyblob_len-p &lt; len) {
+ 		errmsg = "ASN.1 decoding failure - wrong password?";
+-		goto error;
+-	}
++	goto error;
++    }
+ 
+-	/* Expect a load of INTEGERs. */
+-	if (key-&gt;type == OSSH_RSA)
+-		num_integers = 9;
+-	else if (key-&gt;type == OSSH_DSA)
+-		num_integers = 6;
++    /* Expect a load of INTEGERs. */
++    if (key-&gt;type == OSSH_RSA)
++	num_integers = 9;
++    else if (key-&gt;type == OSSH_DSA)
++	num_integers = 6;
+ 	else if (key-&gt;type == OSSH_EC)
+ 		num_integers = 1;
+ 
+-	/*
+-	 * Space to create key blob in.
+-	 */
++    /*
++     * Space to create key blob in.
++     */
+ 	blobbuf = buf_new(3000);
+ 
+ #ifdef DROPBEAR_DSS
+@@ -613,17 +617,17 @@
+ 	}
+ #endif
+ 
+-	for (i = 0; i &lt; num_integers; i++) {
+-		ret = ber_read_id_len(p, key-&gt;keyblob+key-&gt;keyblob_len-p,
+-							  &amp;id, &amp;len, &amp;flags);
+-		p += ret;
+-		if (ret &lt; 0 || id != 2 ||
+-			key-&gt;keyblob+key-&gt;keyblob_len-p &lt; len) {
+-			errmsg = "ASN.1 decoding failure";
+-			goto error;
+-		}
++    for (i = 0; i &lt; num_integers; i++) {
++	ret = ber_read_id_len(p, key-&gt;keyblob+key-&gt;keyblob_len-p,
++			      &amp;id, &amp;len, &amp;flags);
++	p += ret;
++	if (ret &lt; 0 || id != 2 || len &lt; 0 ||
++	    key-&gt;keyblob+key-&gt;keyblob_len-p &lt; len) {
++	    errmsg = "ASN.1 decoding failure";
++	    goto error;
++	}
+ 
+-		if (i == 0) {
++	if (i == 0) {
+ 			/* First integer is a version indicator */
+ 			int expected = -1;
+ 			switch (key-&gt;type) {
+@@ -636,35 +640,35 @@
+ 					break;
+ 			}
+ 			if (len != 1 || p[0] != expected) {
+-				errmsg = "Version number mismatch";
+-				goto error;
+-			}
+-		} else if (key-&gt;type == OSSH_RSA) {
+-			/*
++		errmsg = "Version number mismatch";
++		goto error;
++	    }
++	} else if (key-&gt;type == OSSH_RSA) {
++	    /*
+ 			 * OpenSSH key order is n, e, d, p, q, dmp1, dmq1, iqmp
+ 			 * but we want e, n, d, p, q
+-			 */
+-			if (i == 1) {
+-				/* Save the details for after we deal with number 2. */
++	     */
++	    if (i == 1) {
++		/* Save the details for after we deal with number 2. */
+ 				modptr = p;
+-				modlen = len;
++		modlen = len;
+ 			} else if (i &gt;= 2 &amp;&amp; i &lt;= 5) {
+ 				buf_putstring(blobbuf, (const char*)p, len);
+-				if (i == 2) {
++		if (i == 2) {
+ 					buf_putstring(blobbuf, (const char*)modptr, modlen);
+-				}
+-			}
+-		} else if (key-&gt;type == OSSH_DSA) {
+-			/*
++		}
++	    }
++	} else if (key-&gt;type == OSSH_DSA) {
++	    /*
+ 			 * OpenSSH key order is p, q, g, y, x,
+ 			 * we want the same.
+-			 */
++	     */
+ 			buf_putstring(blobbuf, (const char*)p, len);
+-		}
++	}
+ 
+-		/* Skip past the number. */
+-		p += len;
+-	}
++	/* Skip past the number. */
++	p += len;
++    }
+ 
+ #ifdef DROPBEAR_ECDSA
+ 	if (key-&gt;type == OSSH_EC) {
+@@ -780,12 +784,12 @@
+ 	}
+ #endif /* DROPBEAR_ECDSA */
+ 
+-	/*
+-	 * Now put together the actual key. Simplest way to do this is
+-	 * to assemble our own key blobs and feed them to the createkey
+-	 * functions; this is a bit faffy but it does mean we get all
+-	 * the sanity checks for free.
+-	 */
++    /*
++     * Now put together the actual key. Simplest way to do this is
++     * to assemble our own key blobs and feed them to the createkey
++     * functions; this is a bit faffy but it does mean we get all
++     * the sanity checks for free.
++     */
+ 	if (key-&gt;type == OSSH_RSA || key-&gt;type == OSSH_DSA) {
+ 		buf_setpos(blobbuf, 0);
+ 		type = DROPBEAR_SIGNKEY_ANY;
+@@ -794,18 +798,18 @@
+ 			errmsg = "unable to create key structure";
+ 			sign_key_free(retkey);
+ 			retkey = NULL;
+-			goto error;
+-		}
++	goto error;
++    }
+ 	}
+ 
+-	errmsg = NULL;					 /* no error */
+-	retval = retkey;
++    errmsg = NULL;                     /* no error */
++    retval = retkey;
+ 
+-	error:
++    error:
+ 	if (blobbuf) {
+ 		buf_burn(blobbuf);
+ 		buf_free(blobbuf);
+-	}
++    }
+ 	m_burn(key-&gt;keyblob, key-&gt;keyblob_size);
+ 	m_free(key-&gt;keyblob);
+ 	m_burn(key, sizeof(*key));
+@@ -813,22 +817,22 @@
+ 	if (errmsg) {
+ 		fprintf(stderr, "Error: %s\n", errmsg);
+ 	}
+-	return retval;
++    return retval;
+ }
+ 
+ static int openssh_write(const char *filename, sign_key *key,
+-				  char *passphrase)
++		  char *passphrase)
+ {
+ 	buffer * keyblob = NULL;
+ 	buffer * extrablob = NULL; /* used for calculated values to write */
+ 	unsigned char *outblob = NULL;
+ 	int outlen = -9999;
+-	struct mpint_pos numbers[9];
++    struct mpint_pos numbers[9];
+ 	int nnumbers = -1, pos = 0, len = 0, seqlen, i;
+ 	char *header = NULL, *footer = NULL;
+-	char zero[1];
+-	int ret = 0;
+-	FILE *fp;
++    char zero[1];
++    int ret = 0;
++    FILE *fp;
+ 
+ #ifdef DROPBEAR_RSA
+ 	mp_int dmp1, dmq1, iqmp, tmpval; /* for rsa */
+@@ -843,9 +847,9 @@
+ #endif
+ 			0)
+ 	{
+-		/*
+-		 * Fetch the key blobs.
+-		 */
++    /*
++     * Fetch the key blobs.
++     */
+ 		keyblob = buf_new(3000);
+ 		buf_put_priv_key(keyblob, key, key-&gt;type);
+ 
+@@ -853,10 +857,10 @@
+ 		/* skip the "ssh-rsa" or "ssh-dss" header */
+ 		buf_incrpos(keyblob, buf_getint(keyblob));
+ 
+-		/*
+-		 * Find the sequence of integers to be encoded into the OpenSSH
+-		 * key blob, and also decide on the header line.
+-		 */
++    /*
++     * Find the sequence of integers to be encoded into the OpenSSH
++     * key blob, and also decide on the header line.
++     */
+ 		numbers[0].start = zero; numbers[0].bytes = 1; zero[0] = '\0';
+ 
+ 	#ifdef DROPBEAR_RSA
+@@ -871,17 +875,17 @@
+ 			numbers[2].bytes = buf_getint(keyblob);
+ 			numbers[2].start = buf_getptr(keyblob, numbers[2].bytes);
+ 			buf_incrpos(keyblob, numbers[2].bytes);
+-			
++
+ 			/* n */
+ 			numbers[1].bytes = buf_getint(keyblob);
+ 			numbers[1].start = buf_getptr(keyblob, numbers[1].bytes);
+ 			buf_incrpos(keyblob, numbers[1].bytes);
+-			
++
+ 			/* d */
+ 			numbers[3].bytes = buf_getint(keyblob);
+ 			numbers[3].start = buf_getptr(keyblob, numbers[3].bytes);
+ 			buf_incrpos(keyblob, numbers[3].bytes);
+-			
++
+ 			/* p */
+ 			numbers[4].bytes = buf_getint(keyblob);
+ 			numbers[4].start = buf_getptr(keyblob, numbers[4].bytes);
+@@ -949,9 +953,9 @@
+ 			numbers[8].start = buf_getptr(extrablob, numbers[8].bytes);
+ 			buf_incrpos(extrablob, numbers[8].bytes);
+ 
+-			nnumbers = 9;
+-			header = "-----BEGIN RSA PRIVATE KEY-----\n";
+-			footer = "-----END RSA PRIVATE KEY-----\n";
++        nnumbers = 9;
++        header = "-----BEGIN RSA PRIVATE KEY-----\n";
++        footer = "-----END RSA PRIVATE KEY-----\n";
+ 		}
+ 	#endif /* DROPBEAR_RSA */
+ 
+@@ -983,45 +987,45 @@
+ 			numbers[5].start = buf_getptr(keyblob, numbers[5].bytes);
+ 			buf_incrpos(keyblob, numbers[5].bytes);
+ 
+-			nnumbers = 6;
+-			header = "-----BEGIN DSA PRIVATE KEY-----\n";
+-			footer = "-----END DSA PRIVATE KEY-----\n";
+-		}
++        nnumbers = 6;
++        header = "-----BEGIN DSA PRIVATE KEY-----\n";
++        footer = "-----END DSA PRIVATE KEY-----\n";
++    }
+ 	#endif /* DROPBEAR_DSS */
+ 
+-		/*
+-		 * Now count up the total size of the ASN.1 encoded integers,
+-		 * so as to determine the length of the containing SEQUENCE.
+-		 */
+-		len = 0;
+-		for (i = 0; i &lt; nnumbers; i++) {
+-			len += ber_write_id_len(NULL, 2, numbers[i].bytes, 0);
+-			len += numbers[i].bytes;
+-		}
+-		seqlen = len;
+-		/* Now add on the SEQUENCE header. */
+-		len += ber_write_id_len(NULL, 16, seqlen, ASN1_CONSTRUCTED);
+-		/* Round up to the cipher block size, ensuring we have at least one
+-		 * byte of padding (see below). */
+-		outlen = len;
+-		if (passphrase)
+-			outlen = (outlen+8) &amp;~ 7;
++    /*
++     * Now count up the total size of the ASN.1 encoded integers,
++     * so as to determine the length of the containing SEQUENCE.
++     */
++    len = 0;
++    for (i = 0; i &lt; nnumbers; i++) {
++	len += ber_write_id_len(NULL, 2, numbers[i].bytes, 0);
++	len += numbers[i].bytes;
++    }
++    seqlen = len;
++    /* Now add on the SEQUENCE header. */
++    len += ber_write_id_len(NULL, 16, seqlen, ASN1_CONSTRUCTED);
++    /* Round up to the cipher block size, ensuring we have at least one
++     * byte of padding (see below). */
++    outlen = len;
++    if (passphrase)
++	outlen = (outlen+8) &amp;~ 7;
+ 
+-		/*
+-		 * Now we know how big outblob needs to be. Allocate it.
+-		 */
++    /*
++     * Now we know how big outblob needs to be. Allocate it.
++     */
+ 		outblob = (unsigned char*)m_malloc(outlen);
+ 
+-		/*
+-		 * And write the data into it.
+-		 */
+-		pos = 0;
+-		pos += ber_write_id_len(outblob+pos, 16, seqlen, ASN1_CONSTRUCTED);
+-		for (i = 0; i &lt; nnumbers; i++) {
+-			pos += ber_write_id_len(outblob+pos, 2, numbers[i].bytes, 0);
+-			memcpy(outblob+pos, numbers[i].start, numbers[i].bytes);
+-			pos += numbers[i].bytes;
+-		}
++    /*
++     * And write the data into it.
++     */
++    pos = 0;
++    pos += ber_write_id_len(outblob+pos, 16, seqlen, ASN1_CONSTRUCTED);
++    for (i = 0; i &lt; nnumbers; i++) {
++	pos += ber_write_id_len(outblob+pos, 2, numbers[i].bytes, 0);
++	memcpy(outblob+pos, numbers[i].start, numbers[i].bytes);
++	pos += numbers[i].bytes;
++    }
+ 	} /* end RSA and DSS handling */
+ 
+ #ifdef DROPBEAR_ECDSA
+@@ -1116,40 +1120,40 @@
+ 	}
+ #endif
+ 
+-	/*
+-	 * Padding on OpenSSH keys is deterministic. The number of
+-	 * padding bytes is always more than zero, and always at most
+-	 * the cipher block length. The value of each padding byte is
+-	 * equal to the number of padding bytes. So a plaintext that's
+-	 * an exact multiple of the block size will be padded with 08
+-	 * 08 08 08 08 08 08 08 (assuming a 64-bit block cipher); a
+-	 * plaintext one byte less than a multiple of the block size
+-	 * will be padded with just 01.
+-	 * 
+-	 * This enables the OpenSSL key decryption function to strip
+-	 * off the padding algorithmically and return the unpadded
+-	 * plaintext to the next layer: it looks at the final byte, and
+-	 * then expects to find that many bytes at the end of the data
+-	 * with the same value. Those are all removed and the rest is
+-	 * returned.
+-	 */
++    /*
++     * Padding on OpenSSH keys is deterministic. The number of
++     * padding bytes is always more than zero, and always at most
++     * the cipher block length. The value of each padding byte is
++     * equal to the number of padding bytes. So a plaintext that's
++     * an exact multiple of the block size will be padded with 08
++     * 08 08 08 08 08 08 08 (assuming a 64-bit block cipher); a
++     * plaintext one byte less than a multiple of the block size
++     * will be padded with just 01.
++     * 
++     * This enables the OpenSSL key decryption function to strip
++     * off the padding algorithmically and return the unpadded
++     * plaintext to the next layer: it looks at the final byte, and
++     * then expects to find that many bytes at the end of the data
++     * with the same value. Those are all removed and the rest is
++     * returned.
++     */
+ 	dropbear_assert(pos == len);
+-	while (pos &lt; outlen) {
+-		outblob[pos++] = outlen - len;
+-	}
++    while (pos &lt; outlen) {
++        outblob[pos++] = outlen - len;
++    }
+ 
+-	/*
+-	 * Encrypt the key.
+-	 */
+-	if (passphrase) {
++    /*
++     * Encrypt the key.
++     */
++    if (passphrase) {
+ 		fprintf(stderr, "Encrypted keys aren't supported currently\n");
+ 		goto error;
+-	}
++    }
+ 
+-	/*
+-	 * And save it. We'll use Unix line endings just in case it's
+-	 * subsequently transferred in binary mode.
+-	 */
++    /*
++     * And save it. We'll use Unix line endings just in case it's
++     * subsequently transferred in binary mode.
++     */
+ 	if (strlen(filename) == 1 &amp;&amp; filename[0] == '-') {
+ 		fp = stdout;
+ 	} else {
+@@ -1157,28 +1161,28 @@
+ 	}
+ 	if (!fp) {
+ 		fprintf(stderr, "Failed opening output file\n");
+-		goto error;
++	goto error;
+ 	}
+-	fputs(header, fp);
++    fputs(header, fp);
+ 	base64_encode_fp(fp, outblob, outlen, 64);
+-	fputs(footer, fp);
+-	fclose(fp);
+-	ret = 1;
++    fputs(footer, fp);
++    fclose(fp);
++    ret = 1;
+ 
+-	error:
+-	if (outblob) {
+-		memset(outblob, 0, outlen);
++    error:
++    if (outblob) {
++        memset(outblob, 0, outlen);
+ 		m_free(outblob);
+-	}
++    }
+ 	if (keyblob) {
+ 		buf_burn(keyblob);
+ 		buf_free(keyblob);
+-	}
++    }
+ 	if (extrablob) {
+ 		buf_burn(extrablob);
+ 		buf_free(extrablob);
+-	}
+-	return ret;
++    }
++    return ret;
+ }
+ 
+ #if 0
+@@ -1196,10 +1200,10 @@
+  * 
+  * So. The blob contains:
+  * 
+- *  - uint32 0x3f6ff9eb	   (magic number)
+- *  - uint32 size			 (total blob size)
+- *  - string key-type		 (see below)
+- *  - string cipher-type	  (tells you if key is encrypted)
++ *  - uint32 0x3f6ff9eb       (magic number)
++ *  - uint32 size             (total blob size)
++ *  - string key-type         (see below)
++ *  - string cipher-type      (tells you if key is encrypted)
+  *  - string encrypted-blob
+  * 
+  * (The first size field includes the size field itself and the
+@@ -1255,654 +1259,679 @@
+  *  - first 16 bytes are MD5(passphrase)
+  *  - next 16 bytes are MD5(passphrase || first 16 bytes)
+  *  - if there were more, they'd be MD5(passphrase || first 32),
+- *	and so on.
++ *    and so on.
+  */
+ 
+ #define SSHCOM_MAGIC_NUMBER 0x3f6ff9eb
+ 
+ struct sshcom_key {
+-	char comment[256];				 /* allowing any length is overkill */
+-	unsigned char *keyblob;
+-	int keyblob_len, keyblob_size;
++    char comment[256];                 /* allowing any length is overkill */
++    unsigned char *keyblob;
++    int keyblob_len, keyblob_size;
+ };
+ 
+ static struct sshcom_key *load_sshcom_key(const char *filename)
+ {
+-	struct sshcom_key *ret;
+-	FILE *fp;
+-	char buffer[256];
+-	int len;
+-	char *errmsg, *p;
+-	int headers_done;
+-	char base64_bit[4];
+-	int base64_chars = 0;
++    struct sshcom_key *ret;
++    FILE *fp;
++    char buffer[256];
++    int len;
++    char *errmsg, *p;
++    int headers_done;
++    char base64_bit[4];
++    int base64_chars = 0;
+ 
+-	ret = snew(struct sshcom_key);
+-	ret-&gt;comment[0] = '\0';
+-	ret-&gt;keyblob = NULL;
+-	ret-&gt;keyblob_len = ret-&gt;keyblob_size = 0;
++    ret = snew(struct sshcom_key);
++    ret-&gt;comment[0] = '\0';
++    ret-&gt;keyblob = NULL;
++    ret-&gt;keyblob_len = ret-&gt;keyblob_size = 0;
+ 
+ 	fp = fopen(filename, "r");
+-	if (!fp) {
+-		errmsg = "Unable to open key file";
++    if (!fp) {
++	errmsg = "Unable to open key file";
++	goto error;
++    }
++    if (!fgets(buffer, sizeof(buffer), fp) ||
++	0 != strcmp(buffer, "---- BEGIN SSH2 ENCRYPTED PRIVATE KEY ----\n")) {
++	errmsg = "File does not begin with ssh.com key header";
++	goto error;
++    }
++
++    headers_done = 0;
++    while (1) {
++	if (!fgets(buffer, sizeof(buffer), fp)) {
++	    errmsg = "Unexpected end of file";
++	    goto error;
++	}
++        if (!strcmp(buffer, "---- END SSH2 ENCRYPTED PRIVATE KEY ----\n"))
++            break;                     /* done */
++	if ((p = strchr(buffer, ':')) != NULL) {
++	    if (headers_done) {
++		errmsg = "Header found in body of key data";
+ 		goto error;
++	    }
++	    *p++ = '\0';
++	    while (*p &amp;&amp; isspace((unsigned char)*p)) p++;
++            /*
++             * Header lines can end in a trailing backslash for
++             * continuation.
++             */
++            while ((len = strlen(p)) &gt; (int)(sizeof(buffer) - (p-buffer) -1) ||
++                   p[len-1] != '\n' || p[len-2] == '\\') {
++                if (len &gt; (int)((p-buffer) + sizeof(buffer)-2)) {
++                    errmsg = "Header line too long to deal with";
++                    goto error;
++                }
++                if (!fgets(p+len-2, sizeof(buffer)-(p-buffer)-(len-2), fp)) {
++                    errmsg = "Unexpected end of file";
++                    goto error;
++                }
++            }
++            p[strcspn(p, "\n")] = '\0';
++            if (!strcmp(buffer, "Comment")) {
++                /* Strip quotes in comment if present. */
++                if (p[0] == '"' &amp;&amp; p[strlen(p)-1] == '"') {
++                    p++;
++                    p[strlen(p)-1] = '\0';
++                }
++                strncpy(ret-&gt;comment, p, sizeof(ret-&gt;comment));
++                ret-&gt;comment[sizeof(ret-&gt;comment)-1] = '\0';
++            }
++	} else {
++	    headers_done = 1;
++
++	    p = buffer;
++	    while (isbase64(*p)) {
++                base64_bit[base64_chars++] = *p;
++                if (base64_chars == 4) {
++                    unsigned char out[3];
++
++                    base64_chars = 0;
++
++                    len = base64_decode_atom(base64_bit, out);
++
++                    if (len &lt;= 0) {
++                        errmsg = "Invalid base64 encoding";
++                        goto error;
++                    }
++
++                    if (ret-&gt;keyblob_len + len &gt; ret-&gt;keyblob_size) {
++                        ret-&gt;keyblob_size = ret-&gt;keyblob_len + len + 256;
++                        ret-&gt;keyblob = sresize(ret-&gt;keyblob, ret-&gt;keyblob_size,
++					       unsigned char);
++                    }
++
++                    memcpy(ret-&gt;keyblob + ret-&gt;keyblob_len, out, len);
++                    ret-&gt;keyblob_len += len;
++                }
++
++		p++;
++	    }
+ 	}
+-	if (!fgets(buffer, sizeof(buffer), fp) ||
+-		0 != strcmp(buffer, "---- BEGIN SSH2 ENCRYPTED PRIVATE KEY ----\n")) {
+-		errmsg = "File does not begin with ssh.com key header";
+-		goto error;
+-	}
++    }
+ 
+-	headers_done = 0;
+-	while (1) {
+-		if (!fgets(buffer, sizeof(buffer), fp)) {
+-			errmsg = "Unexpected end of file";
+-			goto error;
+-		}
+-		if (!strcmp(buffer, "---- END SSH2 ENCRYPTED PRIVATE KEY ----\n"))
+-			break;					 /* done */
+-		if ((p = strchr(buffer, ':')) != NULL) {
+-			if (headers_done) {
+-				errmsg = "Header found in body of key data";
+-				goto error;
+-			}
+-			*p++ = '\0';
+-			while (*p &amp;&amp; isspace((unsigned char)*p)) p++;
+-			/*
+-			 * Header lines can end in a trailing backslash for
+-			 * continuation.
+-			 */
+-			while ((len = strlen(p)) &gt; (int)(sizeof(buffer) - (p-buffer) -1) ||
+-				   p[len-1] != '\n' || p[len-2] == '\\') {
+-				if (len &gt; (int)((p-buffer) + sizeof(buffer)-2)) {
+-					errmsg = "Header line too long to deal with";
+-					goto error;
+-				}
+-				if (!fgets(p+len-2, sizeof(buffer)-(p-buffer)-(len-2), fp)) {
+-					errmsg = "Unexpected end of file";
+-					goto error;
+-				}
+-			}
+-			p[strcspn(p, "\n")] = '\0';
+-			if (!strcmp(buffer, "Comment")) {
+-				/* Strip quotes in comment if present. */
+-				if (p[0] == '"' &amp;&amp; p[strlen(p)-1] == '"') {
+-					p++;
+-					p[strlen(p)-1] = '\0';
+-				}
+-				strncpy(ret-&gt;comment, p, sizeof(ret-&gt;comment));
+-				ret-&gt;comment[sizeof(ret-&gt;comment)-1] = '\0';
+-			}
+-		} else {
+-			headers_done = 1;
++    if (ret-&gt;keyblob_len == 0 || !ret-&gt;keyblob) {
++	errmsg = "Key body not present";
++	goto error;
++    }
+ 
+-			p = buffer;
+-			while (isbase64(*p)) {
+-				base64_bit[base64_chars++] = *p;
+-				if (base64_chars == 4) {
+-					unsigned char out[3];
++    return ret;
+ 
+-					base64_chars = 0;
+-
+-					len = base64_decode_atom(base64_bit, out);
+-
+-					if (len &lt;= 0) {
+-						errmsg = "Invalid base64 encoding";
+-						goto error;
+-					}
+-
+-					if (ret-&gt;keyblob_len + len &gt; ret-&gt;keyblob_size) {
+-						ret-&gt;keyblob_size = ret-&gt;keyblob_len + len + 256;
+-						ret-&gt;keyblob = sresize(ret-&gt;keyblob, ret-&gt;keyblob_size,
+-											   unsigned char);
+-					}
+-
+-					memcpy(ret-&gt;keyblob + ret-&gt;keyblob_len, out, len);
+-					ret-&gt;keyblob_len += len;
+-				}
+-
+-				p++;
+-			}
+-		}
+-	}
+-
+-	if (ret-&gt;keyblob_len == 0 || !ret-&gt;keyblob) {
+-		errmsg = "Key body not present";
+-		goto error;
+-	}
+-
+-	return ret;
+-
+-	error:
+-	if (ret) {
+-		if (ret-&gt;keyblob) {
+-			memset(ret-&gt;keyblob, 0, ret-&gt;keyblob_size);
++    error:
++    if (ret) {
++	if (ret-&gt;keyblob) {
++            memset(ret-&gt;keyblob, 0, ret-&gt;keyblob_size);
+ 			m_free(ret-&gt;keyblob);
+-		}
+-		memset(&amp;ret, 0, sizeof(ret));
++        }
++        memset(ret, 0, sizeof(*ret));
+ 		m_free(ret);
+-	}
+-	return NULL;
++    }
++    return NULL;
+ }
+ 
+ int sshcom_encrypted(const char *filename, char **comment)
+ {
+-	struct sshcom_key *key = load_sshcom_key(filename);
+-	int pos, len, answer;
++    struct sshcom_key *key = load_sshcom_key(filename);
++    int pos, len, answer;
+ 
+-	*comment = NULL;
+-	if (!key)
+-		return 0;
++    *comment = NULL;
++    if (!key)
++        return 0;
+ 
+-	/*
+-	 * Check magic number.
+-	 */
+-	if (GET_32BIT(key-&gt;keyblob) != 0x3f6ff9eb)
+-		return 0;					  /* key is invalid */
++    /*
++     * Check magic number.
++     */
++    if (GET_32BIT(key-&gt;keyblob) != 0x3f6ff9eb)
++        return 0;                      /* key is invalid */
+ 
+-	/*
+-	 * Find the cipher-type string.
+-	 */
+-	answer = 0;
+-	pos = 8;
+-	if (key-&gt;keyblob_len &lt; pos+4)
+-		goto done;					 /* key is far too short */
+-	pos += 4 + GET_32BIT(key-&gt;keyblob + pos);   /* skip key type */
+-	if (key-&gt;keyblob_len &lt; pos+4)
+-		goto done;					 /* key is far too short */
+-	len = GET_32BIT(key-&gt;keyblob + pos);   /* find cipher-type length */
+-	if (key-&gt;keyblob_len &lt; pos+4+len)
+-		goto done;					 /* cipher type string is incomplete */
+-	if (len != 4 || 0 != memcmp(key-&gt;keyblob + pos + 4, "none", 4))
+-		answer = 1;
++    /*
++     * Find the cipher-type string.
++     */
++    answer = 0;
++    pos = 8;
++    if (key-&gt;keyblob_len &lt; pos+4)
++        goto done;                     /* key is far too short */
++    len = toint(GET_32BIT(key-&gt;keyblob + pos));
++    if (len &lt; 0 || len &gt; key-&gt;keyblob_len - pos - 4)
++        goto done;                     /* key is far too short */
++    pos += 4 + len;                    /* skip key type */
++    len = toint(GET_32BIT(key-&gt;keyblob + pos)); /* find cipher-type length */
++    if (len &lt; 0 || len &gt; key-&gt;keyblob_len - pos - 4)
++        goto done;                     /* cipher type string is incomplete */
++    if (len != 4 || 0 != memcmp(key-&gt;keyblob + pos + 4, "none", 4))
++        answer = 1;
+ 
+-	done:
+-	*comment = dupstr(key-&gt;comment);
+-	memset(key-&gt;keyblob, 0, key-&gt;keyblob_size);
++    done:
++    *comment = dupstr(key-&gt;comment);
++    memset(key-&gt;keyblob, 0, key-&gt;keyblob_size);
+ 	m_free(key-&gt;keyblob);
+-	memset(&amp;key, 0, sizeof(key));
++    memset(key, 0, sizeof(*key));
+ 	m_free(key);
+-	return answer;
++    return answer;
+ }
+ 
+ static int sshcom_read_mpint(void *data, int len, struct mpint_pos *ret)
+ {
+-	int bits;
+-	int bytes;
+-	unsigned char *d = (unsigned char *) data;
++    unsigned bits, bytes;
++    unsigned char *d = (unsigned char *) data;
+ 
+-	if (len &lt; 4)
+-		goto error;
+-	bits = GET_32BIT(d);
++    if (len &lt; 4)
++        goto error;
++    bits = GET_32BIT(d);
+ 
+-	bytes = (bits + 7) / 8;
+-	if (len &lt; 4+bytes)
+-		goto error;
++    bytes = (bits + 7) / 8;
++    if (len &lt; 4+bytes)
++        goto error;
+ 
+-	ret-&gt;start = d + 4;
+-	ret-&gt;bytes = bytes;
+-	return bytes+4;
++    ret-&gt;start = d + 4;
++    ret-&gt;bytes = bytes;
++    return bytes+4;
+ 
+-	error:
+-	ret-&gt;start = NULL;
+-	ret-&gt;bytes = -1;
+-	return len;						/* ensure further calls fail as well */
++    error:
++    ret-&gt;start = NULL;
++    ret-&gt;bytes = -1;
++    return len;                        /* ensure further calls fail as well */
+ }
+ 
+ static int sshcom_put_mpint(void *target, void *data, int len)
+ {
+-	unsigned char *d = (unsigned char *)target;
+-	unsigned char *i = (unsigned char *)data;
+-	int bits = len * 8 - 1;
++    unsigned char *d = (unsigned char *)target;
++    unsigned char *i = (unsigned char *)data;
++    int bits = len * 8 - 1;
+ 
+-	while (bits &gt; 0) {
+-		if (*i &amp; (1 &lt;&lt; (bits &amp; 7)))
+-			break;
+-		if (!(bits-- &amp; 7))
+-			i++, len--;
+-	}
++    while (bits &gt; 0) {
++	if (*i &amp; (1 &lt;&lt; (bits &amp; 7)))
++	    break;
++	if (!(bits-- &amp; 7))
++	    i++, len--;
++    }
+ 
+-	PUT_32BIT(d, bits+1);
+-	memcpy(d+4, i, len);
+-	return len+4;
++    PUT_32BIT(d, bits+1);
++    memcpy(d+4, i, len);
++    return len+4;
+ }
+ 
+ sign_key *sshcom_read(const char *filename, char *passphrase)
+ {
+-	struct sshcom_key *key = load_sshcom_key(filename);
+-	char *errmsg;
+-	int pos, len;
+-	const char prefix_rsa[] = "if-modn{sign{rsa";
+-	const char prefix_dsa[] = "dl-modp{sign{dsa";
+-	enum { RSA, DSA } type;
+-	int encrypted;
+-	char *ciphertext;
+-	int cipherlen;
+-	struct ssh2_userkey *ret = NULL, *retkey;
+-	const struct ssh_signkey *alg;
+-	unsigned char *blob = NULL;
+-	int blobsize, publen, privlen;
++    struct sshcom_key *key = load_sshcom_key(filename);
++    char *errmsg;
++    int pos, len;
++    const char prefix_rsa[] = "if-modn{sign{rsa";
++    const char prefix_dsa[] = "dl-modp{sign{dsa";
++    enum { RSA, DSA } type;
++    int encrypted;
++    char *ciphertext;
++    int cipherlen;
++    struct ssh2_userkey *ret = NULL, *retkey;
++    const struct ssh_signkey *alg;
++    unsigned char *blob = NULL;
++    int blobsize = 0, publen, privlen;
+ 
+-	if (!key)
+-		return NULL;
++    if (!key)
++        return NULL;
++
++    /*
++     * Check magic number.
++     */
++    if (GET_32BIT(key-&gt;keyblob) != SSHCOM_MAGIC_NUMBER) {
++        errmsg = "Key does not begin with magic number";
++        goto error;
++    }
++
++    /*
++     * Determine the key type.
++     */
++    pos = 8;
++    if (key-&gt;keyblob_len &lt; pos+4 ||
++        (len = GET_32BIT(key-&gt;keyblob + pos)) &gt; key-&gt;keyblob_len - pos - 4) {
++        errmsg = "Key blob does not contain a key type string";
++        goto error;
++    }
++    if (len &gt; sizeof(prefix_rsa) - 1 &amp;&amp;
++        !memcmp(key-&gt;keyblob+pos+4, prefix_rsa, sizeof(prefix_rsa) - 1)) {
++        type = RSA;
++    } else if (len &gt; sizeof(prefix_dsa) - 1 &amp;&amp;
++        !memcmp(key-&gt;keyblob+pos+4, prefix_dsa, sizeof(prefix_dsa) - 1)) {
++        type = DSA;
++    } else {
++        errmsg = "Key is of unknown type";
++        goto error;
++    }
++    pos += 4+len;
++
++    /*
++     * Determine the cipher type.
++     */
++    if (key-&gt;keyblob_len &lt; pos+4 ||
++        (len = GET_32BIT(key-&gt;keyblob + pos)) &gt; key-&gt;keyblob_len - pos - 4) {
++        errmsg = "Key blob does not contain a cipher type string";
++        goto error;
++    }
++    if (len == 4 &amp;&amp; !memcmp(key-&gt;keyblob+pos+4, "none", 4))
++        encrypted = 0;
++    else if (len == 8 &amp;&amp; !memcmp(key-&gt;keyblob+pos+4, "3des-cbc", 8))
++        encrypted = 1;
++    else {
++        errmsg = "Key encryption is of unknown type";
++        goto error;
++    }
++    pos += 4+len;
++
++    /*
++     * Get hold of the encrypted part of the key.
++     */
++    if (key-&gt;keyblob_len &lt; pos+4 ||
++        (len = GET_32BIT(key-&gt;keyblob + pos)) &gt; key-&gt;keyblob_len - pos - 4) {
++        errmsg = "Key blob does not contain actual key data";
++        goto error;
++    }
++    ciphertext = (char *)key-&gt;keyblob + pos + 4;
++    cipherlen = len;
++    if (cipherlen == 0) {
++        errmsg = "Length of key data is zero";
++        goto error;
++    }
++
++    /*
++     * Decrypt it if necessary.
++     */
++    if (encrypted) {
++	/*
++	 * Derive encryption key from passphrase and iv/salt:
++	 * 
++	 *  - let block A equal MD5(passphrase)
++	 *  - let block B equal MD5(passphrase || A)
++	 *  - block C would be MD5(passphrase || A || B) and so on
++	 *  - encryption key is the first N bytes of A || B
++	 */
++	struct MD5Context md5c;
++	unsigned char keybuf[32], iv[8];
++
++        if (cipherlen % 8 != 0) {
++            errmsg = "Encrypted part of key is not a multiple of cipher block"
++                " size";
++            goto error;
++        }
++
++	MD5Init(&amp;md5c);
++	MD5Update(&amp;md5c, (unsigned char *)passphrase, strlen(passphrase));
++	MD5Final(keybuf, &amp;md5c);
++
++	MD5Init(&amp;md5c);
++	MD5Update(&amp;md5c, (unsigned char *)passphrase, strlen(passphrase));
++	MD5Update(&amp;md5c, keybuf, 16);
++	MD5Final(keybuf+16, &amp;md5c);
+ 
+ 	/*
+-	 * Check magic number.
++	 * Now decrypt the key blob.
+ 	 */
+-	if (GET_32BIT(key-&gt;keyblob) != SSHCOM_MAGIC_NUMBER) {
+-		errmsg = "Key does not begin with magic number";
+-		goto error;
+-	}
++        memset(iv, 0, sizeof(iv));
++	des3_decrypt_pubkey_ossh(keybuf, iv, (unsigned char *)ciphertext,
++				 cipherlen);
+ 
+-	/*
+-	 * Determine the key type.
+-	 */
+-	pos = 8;
+-	if (key-&gt;keyblob_len &lt; pos+4 ||
+-		(len = GET_32BIT(key-&gt;keyblob + pos)) &gt; key-&gt;keyblob_len - pos - 4) {
+-		errmsg = "Key blob does not contain a key type string";
+-		goto error;
+-	}
+-	if (len &gt; sizeof(prefix_rsa) - 1 &amp;&amp;
+-		!memcmp(key-&gt;keyblob+pos+4, prefix_rsa, sizeof(prefix_rsa) - 1)) {
+-		type = RSA;
+-	} else if (len &gt; sizeof(prefix_dsa) - 1 &amp;&amp;
+-		!memcmp(key-&gt;keyblob+pos+4, prefix_dsa, sizeof(prefix_dsa) - 1)) {
+-		type = DSA;
+-	} else {
+-		errmsg = "Key is of unknown type";
+-		goto error;
+-	}
+-	pos += 4+len;
++        memset(&amp;md5c, 0, sizeof(md5c));
++        memset(keybuf, 0, sizeof(keybuf));
+ 
+-	/*
+-	 * Determine the cipher type.
+-	 */
+-	if (key-&gt;keyblob_len &lt; pos+4 ||
+-		(len = GET_32BIT(key-&gt;keyblob + pos)) &gt; key-&gt;keyblob_len - pos - 4) {
+-		errmsg = "Key blob does not contain a cipher type string";
+-		goto error;
+-	}
+-	if (len == 4 &amp;&amp; !memcmp(key-&gt;keyblob+pos+4, "none", 4))
+-		encrypted = 0;
+-	else if (len == 8 &amp;&amp; !memcmp(key-&gt;keyblob+pos+4, "3des-cbc", 8))
+-		encrypted = 1;
+-	else {
+-		errmsg = "Key encryption is of unknown type";
+-		goto error;
+-	}
+-	pos += 4+len;
++        /*
++         * Hereafter we return WRONG_PASSPHRASE for any parsing
++         * error. (But only if we've just tried to decrypt it!
++         * Returning WRONG_PASSPHRASE for an unencrypted key is
++         * automatic doom.)
++         */
++        if (encrypted)
++            ret = SSH2_WRONG_PASSPHRASE;
++    }
+ 
+-	/*
+-	 * Get hold of the encrypted part of the key.
+-	 */
+-	if (key-&gt;keyblob_len &lt; pos+4 ||
+-		(len = GET_32BIT(key-&gt;keyblob + pos)) &gt; key-&gt;keyblob_len - pos - 4) {
+-		errmsg = "Key blob does not contain actual key data";
+-		goto error;
+-	}
+-	ciphertext = (char *)key-&gt;keyblob + pos + 4;
+-	cipherlen = len;
+-	if (cipherlen == 0) {
+-		errmsg = "Length of key data is zero";
+-		goto error;
+-	}
++    /*
++     * Strip away the containing string to get to the real meat.
++     */
++    len = toint(GET_32BIT(ciphertext));
++    if (len &lt; 0 || len &gt; cipherlen-4) {
++        errmsg = "containing string was ill-formed";
++        goto error;
++    }
++    ciphertext += 4;
++    cipherlen = len;
+ 
+-	/*
+-	 * Decrypt it if necessary.
+-	 */
+-	if (encrypted) {
+-		/*
+-		 * Derive encryption key from passphrase and iv/salt:
+-		 * 
+-		 *  - let block A equal MD5(passphrase)
+-		 *  - let block B equal MD5(passphrase || A)
+-		 *  - block C would be MD5(passphrase || A || B) and so on
+-		 *  - encryption key is the first N bytes of A || B
+-		 */
+-		struct MD5Context md5c;
+-		unsigned char keybuf[32], iv[8];
++    /*
++     * Now we break down into RSA versus DSA. In either case we'll
++     * construct public and private blobs in our own format, and
++     * end up feeding them to alg-&gt;createkey().
++     */
++    blobsize = cipherlen + 256;
++    blob = snewn(blobsize, unsigned char);
++    privlen = 0;
++    if (type == RSA) {
++        struct mpint_pos n, e, d, u, p, q;
++        int pos = 0;
++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;e);
++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;d);
++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;n);
++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;u);
++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;p);
++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;q);
++        if (!q.start) {
++            errmsg = "key data did not contain six integers";
++            goto error;
++        }
+ 
+-		if (cipherlen % 8 != 0) {
+-			errmsg = "Encrypted part of key is not a multiple of cipher block"
+-				" size";
+-			goto error;
+-		}
++        alg = &amp;ssh_rsa;
++        pos = 0;
++        pos += put_string(blob+pos, "ssh-rsa", 7);
++        pos += put_mp(blob+pos, e.start, e.bytes);
++        pos += put_mp(blob+pos, n.start, n.bytes);
++        publen = pos;
++        pos += put_string(blob+pos, d.start, d.bytes);
++        pos += put_mp(blob+pos, q.start, q.bytes);
++        pos += put_mp(blob+pos, p.start, p.bytes);
++        pos += put_mp(blob+pos, u.start, u.bytes);
++        privlen = pos - publen;
++    } else if (type == DSA) {
++        struct mpint_pos p, q, g, x, y;
++        int pos = 4;
++        if (GET_32BIT(ciphertext) != 0) {
++            errmsg = "predefined DSA parameters not supported";
++            goto error;
++        }
++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;p);
++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;g);
++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;q);
++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;y);
++        pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;x);
++        if (!x.start) {
++            errmsg = "key data did not contain five integers";
++            goto error;
++        }
+ 
+-		MD5Init(&amp;md5c);
+-		MD5Update(&amp;md5c, (unsigned char *)passphrase, strlen(passphrase));
+-		MD5Final(keybuf, &amp;md5c);
+-
+-		MD5Init(&amp;md5c);
+-		MD5Update(&amp;md5c, (unsigned char *)passphrase, strlen(passphrase));
+-		MD5Update(&amp;md5c, keybuf, 16);
+-		MD5Final(keybuf+16, &amp;md5c);
+-
+-		/*
+-		 * Now decrypt the key blob.
+-		 */
+-		memset(iv, 0, sizeof(iv));
+-		des3_decrypt_pubkey_ossh(keybuf, iv, (unsigned char *)ciphertext,
+-								 cipherlen);
+-
+-		memset(&amp;md5c, 0, sizeof(md5c));
+-		memset(keybuf, 0, sizeof(keybuf));
+-
+-		/*
+-		 * Hereafter we return WRONG_PASSPHRASE for any parsing
+-		 * error. (But only if we've just tried to decrypt it!
+-		 * Returning WRONG_PASSPHRASE for an unencrypted key is
+-		 * automatic doom.)
+-		 */
+-		if (encrypted)
+-			ret = SSH2_WRONG_PASSPHRASE;
+-	}
+-
+-	/*
+-	 * Strip away the containing string to get to the real meat.
+-	 */
+-	len = GET_32BIT(ciphertext);
+-	if (len &gt; cipherlen-4) {
+-		errmsg = "containing string was ill-formed";
+-		goto error;
+-	}
+-	ciphertext += 4;
+-	cipherlen = len;
+-
+-	/*
+-	 * Now we break down into RSA versus DSA. In either case we'll
+-	 * construct public and private blobs in our own format, and
+-	 * end up feeding them to alg-&gt;createkey().
+-	 */
+-	blobsize = cipherlen + 256;
+-	blob = snewn(blobsize, unsigned char);
+-	privlen = 0;
+-	if (type == RSA) {
+-		struct mpint_pos n, e, d, u, p, q;
+-		int pos = 0;
+-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;e);
+-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;d);
+-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;n);
+-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;u);
+-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;p);
+-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;q);
+-		if (!q.start) {
+-			errmsg = "key data did not contain six integers";
+-			goto error;
+-		}
+-
+-		alg = &amp;ssh_rsa;
+-		pos = 0;
+-		pos += put_string(blob+pos, "ssh-rsa", 7);
+-		pos += put_mp(blob+pos, e.start, e.bytes);
+-		pos += put_mp(blob+pos, n.start, n.bytes);
+-		publen = pos;
+-		pos += put_string(blob+pos, d.start, d.bytes);
+-		pos += put_mp(blob+pos, q.start, q.bytes);
+-		pos += put_mp(blob+pos, p.start, p.bytes);
+-		pos += put_mp(blob+pos, u.start, u.bytes);
+-		privlen = pos - publen;
+-	} else if (type == DSA) {
+-		struct mpint_pos p, q, g, x, y;
+-		int pos = 4;
+-		if (GET_32BIT(ciphertext) != 0) {
+-			errmsg = "predefined DSA parameters not supported";
+-			goto error;
+-		}
+-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;p);
+-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;g);
+-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;q);
+-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;y);
+-		pos += sshcom_read_mpint(ciphertext+pos, cipherlen-pos, &amp;x);
+-		if (!x.start) {
+-			errmsg = "key data did not contain five integers";
+-			goto error;
+-		}
+-
+-		alg = &amp;ssh_dss;
+-		pos = 0;
+-		pos += put_string(blob+pos, "ssh-dss", 7);
+-		pos += put_mp(blob+pos, p.start, p.bytes);
+-		pos += put_mp(blob+pos, q.start, q.bytes);
+-		pos += put_mp(blob+pos, g.start, g.bytes);
+-		pos += put_mp(blob+pos, y.start, y.bytes);
+-		publen = pos;
+-		pos += put_mp(blob+pos, x.start, x.bytes);
+-		privlen = pos - publen;
+-	}
++        alg = &amp;ssh_dss;
++        pos = 0;
++        pos += put_string(blob+pos, "ssh-dss", 7);
++        pos += put_mp(blob+pos, p.start, p.bytes);
++        pos += put_mp(blob+pos, q.start, q.bytes);
++        pos += put_mp(blob+pos, g.start, g.bytes);
++        pos += put_mp(blob+pos, y.start, y.bytes);
++        publen = pos;
++        pos += put_mp(blob+pos, x.start, x.bytes);
++        privlen = pos - publen;
++    } else
++	return NULL;
+ 
+ 	dropbear_assert(privlen &gt; 0);			   /* should have bombed by now if not */
+ 
+-	retkey = snew(struct ssh2_userkey);
+-	retkey-&gt;alg = alg;
+-	retkey-&gt;data = alg-&gt;createkey(blob, publen, blob+publen, privlen);
+-	if (!retkey-&gt;data) {
++    retkey = snew(struct ssh2_userkey);
++    retkey-&gt;alg = alg;
++    retkey-&gt;data = alg-&gt;createkey(blob, publen, blob+publen, privlen);
++    if (!retkey-&gt;data) {
+ 		m_free(retkey);
+-		errmsg = "unable to create key data structure";
+-		goto error;
+-	}
+-	retkey-&gt;comment = dupstr(key-&gt;comment);
++	errmsg = "unable to create key data structure";
++	goto error;
++    }
++    retkey-&gt;comment = dupstr(key-&gt;comment);
+ 
+-	errmsg = NULL; /* no error */
+-	ret = retkey;
++    errmsg = NULL; /* no error */
++    ret = retkey;
+ 
+-	error:
+-	if (blob) {
+-		memset(blob, 0, blobsize);
++    error:
++    if (blob) {
++        memset(blob, 0, blobsize);
+ 		m_free(blob);
+-	}
+-	memset(key-&gt;keyblob, 0, key-&gt;keyblob_size);
++    }
++    memset(key-&gt;keyblob, 0, key-&gt;keyblob_size);
+ 	m_free(key-&gt;keyblob);
+-	memset(&amp;key, 0, sizeof(key));
++    memset(key, 0, sizeof(*key));
+ 	m_free(key);
+-	return ret;
++    return ret;
+ }
+ 
+ int sshcom_write(const char *filename, sign_key *key,
+-				 char *passphrase)
++		 char *passphrase)
+ {
+-	unsigned char *pubblob, *privblob;
+-	int publen, privlen;
+-	unsigned char *outblob;
+-	int outlen;
+-	struct mpint_pos numbers[6];
+-	int nnumbers, initial_zero, pos, lenpos, i;
+-	char *type;
+-	char *ciphertext;
+-	int cipherlen;
+-	int ret = 0;
+-	FILE *fp;
++    unsigned char *pubblob, *privblob;
++    int publen, privlen;
++    unsigned char *outblob;
++    int outlen;
++    struct mpint_pos numbers[6];
++    int nnumbers, initial_zero, pos, lenpos, i;
++    char *type;
++    char *ciphertext;
++    int cipherlen;
++    int ret = 0;
++    FILE *fp;
+ 
+-	/*
+-	 * Fetch the key blobs.
+-	 */
+-	pubblob = key-&gt;alg-&gt;public_blob(key-&gt;data, &amp;publen);
+-	privblob = key-&gt;alg-&gt;private_blob(key-&gt;data, &amp;privlen);
+-	outblob = NULL;
++    /*
++     * Fetch the key blobs.
++     */
++    pubblob = key-&gt;alg-&gt;public_blob(key-&gt;data, &amp;publen);
++    privblob = key-&gt;alg-&gt;private_blob(key-&gt;data, &amp;privlen);
++    outblob = NULL;
+ 
+-	/*
+-	 * Find the sequence of integers to be encoded into the OpenSSH
+-	 * key blob, and also decide on the header line.
+-	 */
+-	if (key-&gt;alg == &amp;ssh_rsa) {
+-		int pos;
+-		struct mpint_pos n, e, d, p, q, iqmp;
++    /*
++     * Find the sequence of integers to be encoded into the OpenSSH
++     * key blob, and also decide on the header line.
++     */
++    if (key-&gt;alg == &amp;ssh_rsa) {
++        int pos;
++        struct mpint_pos n, e, d, p, q, iqmp;
+ 
+-		pos = 4 + GET_32BIT(pubblob);
+-		pos += ssh2_read_mpint(pubblob+pos, publen-pos, &amp;e);
+-		pos += ssh2_read_mpint(pubblob+pos, publen-pos, &amp;n);
+-		pos = 0;
+-		pos += ssh2_read_mpint(privblob+pos, privlen-pos, &amp;d);
+-		pos += ssh2_read_mpint(privblob+pos, privlen-pos, &amp;p);
+-		pos += ssh2_read_mpint(privblob+pos, privlen-pos, &amp;q);
+-		pos += ssh2_read_mpint(privblob+pos, privlen-pos, &amp;iqmp);
++        pos = 4 + GET_32BIT(pubblob);
++        pos += ssh2_read_mpint(pubblob+pos, publen-pos, &amp;e);
++        pos += ssh2_read_mpint(pubblob+pos, publen-pos, &amp;n);
++        pos = 0;
++        pos += ssh2_read_mpint(privblob+pos, privlen-pos, &amp;d);
++        pos += ssh2_read_mpint(privblob+pos, privlen-pos, &amp;p);
++        pos += ssh2_read_mpint(privblob+pos, privlen-pos, &amp;q);
++        pos += ssh2_read_mpint(privblob+pos, privlen-pos, &amp;iqmp);
+ 
+ 		dropbear_assert(e.start &amp;&amp; iqmp.start); /* can't go wrong */
+ 
+-		numbers[0] = e;
+-		numbers[1] = d;
+-		numbers[2] = n;
+-		numbers[3] = iqmp;
+-		numbers[4] = q;
+-		numbers[5] = p;
++        numbers[0] = e;
++        numbers[1] = d;
++        numbers[2] = n;
++        numbers[3] = iqmp;
++        numbers[4] = q;
++        numbers[5] = p;
+ 
+-		nnumbers = 6;
+-		initial_zero = 0;
+-		type = "if-modn{sign{rsa-pkcs1-sha1},encrypt{rsa-pkcs1v2-oaep}}";
+-	} else if (key-&gt;alg == &amp;ssh_dss) {
+-		int pos;
+-		struct mpint_pos p, q, g, y, x;
++        nnumbers = 6;
++	initial_zero = 0;
++	type = "if-modn{sign{rsa-pkcs1-sha1},encrypt{rsa-pkcs1v2-oaep}}";
++    } else if (key-&gt;alg == &amp;ssh_dss) {
++        int pos;
++        struct mpint_pos p, q, g, y, x;
+ 
+-		pos = 4 + GET_32BIT(pubblob);
+-		pos += ssh2_read_mpint(pubblob+pos, publen-pos, &amp;p);
+-		pos += ssh2_read_mpint(pubblob+pos, publen-pos, &amp;q);
+-		pos += ssh2_read_mpint(pubblob+pos, publen-pos, &amp;g);
+-		pos += ssh2_read_mpint(pubblob+pos, publen-pos, &amp;y);
+-		pos = 0;
+-		pos += ssh2_read_mpint(privblob+pos, privlen-pos, &amp;x);
++        pos = 4 + GET_32BIT(pubblob);
++        pos += ssh2_read_mpint(pubblob+pos, publen-pos, &amp;p);
++        pos += ssh2_read_mpint(pubblob+pos, publen-pos, &amp;q);
++        pos += ssh2_read_mpint(pubblob+pos, publen-pos, &amp;g);
++        pos += ssh2_read_mpint(pubblob+pos, publen-pos, &amp;y);
++        pos = 0;
++        pos += ssh2_read_mpint(privblob+pos, privlen-pos, &amp;x);
+ 
+ 		dropbear_assert(y.start &amp;&amp; x.start); /* can't go wrong */
+ 
+-		numbers[0] = p;
+-		numbers[1] = g;
+-		numbers[2] = q;
+-		numbers[3] = y;
+-		numbers[4] = x;
++        numbers[0] = p;
++        numbers[1] = g;
++        numbers[2] = q;
++        numbers[3] = y;
++        numbers[4] = x;
+ 
+-		nnumbers = 5;
+-		initial_zero = 1;
+-		type = "dl-modp{sign{dsa-nist-sha1},dh{plain}}";
+-	} else {
++        nnumbers = 5;
++	initial_zero = 1;
++	type = "dl-modp{sign{dsa-nist-sha1},dh{plain}}";
++    } else {
+ 		dropbear_assert(0);					 /* zoinks! */
+-	}
++    }
+ 
+-	/*
+-	 * Total size of key blob will be somewhere under 512 plus
+-	 * combined length of integers. We'll calculate the more
+-	 * precise size as we construct the blob.
+-	 */
+-	outlen = 512;
+-	for (i = 0; i &lt; nnumbers; i++)
+-		outlen += 4 + numbers[i].bytes;
+-	outblob = snewn(outlen, unsigned char);
++    /*
++     * Total size of key blob will be somewhere under 512 plus
++     * combined length of integers. We'll calculate the more
++     * precise size as we construct the blob.
++     */
++    outlen = 512;
++    for (i = 0; i &lt; nnumbers; i++)
++	outlen += 4 + numbers[i].bytes;
++    outblob = snewn(outlen, unsigned char);
+ 
+-	/*
+-	 * Create the unencrypted key blob.
+-	 */
+-	pos = 0;
+-	PUT_32BIT(outblob+pos, SSHCOM_MAGIC_NUMBER); pos += 4;
+-	pos += 4;							   /* length field, fill in later */
+-	pos += put_string(outblob+pos, type, strlen(type));
+-	{
+-		char *ciphertype = passphrase ? "3des-cbc" : "none";
+-		pos += put_string(outblob+pos, ciphertype, strlen(ciphertype));
+-	}
+-	lenpos = pos;					   /* remember this position */
+-	pos += 4;							   /* encrypted-blob size */
+-	pos += 4;							   /* encrypted-payload size */
+-	if (initial_zero) {
+-		PUT_32BIT(outblob+pos, 0);
+-		pos += 4;
+-	}
+-	for (i = 0; i &lt; nnumbers; i++)
+-		pos += sshcom_put_mpint(outblob+pos,
+-								numbers[i].start, numbers[i].bytes);
+-	/* Now wrap up the encrypted payload. */
+-	PUT_32BIT(outblob+lenpos+4, pos - (lenpos+8));
+-	/* Pad encrypted blob to a multiple of cipher block size. */
+-	if (passphrase) {
+-		int padding = -(pos - (lenpos+4)) &amp; 7;
+-		while (padding--)
+-			outblob[pos++] = random_byte();
+-	}
+-	ciphertext = (char *)outblob+lenpos+4;
+-	cipherlen = pos - (lenpos+4);
++    /*
++     * Create the unencrypted key blob.
++     */
++    pos = 0;
++    PUT_32BIT(outblob+pos, SSHCOM_MAGIC_NUMBER); pos += 4;
++    pos += 4;			       /* length field, fill in later */
++    pos += put_string(outblob+pos, type, strlen(type));
++    {
++	char *ciphertype = passphrase ? "3des-cbc" : "none";
++	pos += put_string(outblob+pos, ciphertype, strlen(ciphertype));
++    }
++    lenpos = pos;		       /* remember this position */
++    pos += 4;			       /* encrypted-blob size */
++    pos += 4;			       /* encrypted-payload size */
++    if (initial_zero) {
++	PUT_32BIT(outblob+pos, 0);
++	pos += 4;
++    }
++    for (i = 0; i &lt; nnumbers; i++)
++	pos += sshcom_put_mpint(outblob+pos,
++				numbers[i].start, numbers[i].bytes);
++    /* Now wrap up the encrypted payload. */
++    PUT_32BIT(outblob+lenpos+4, pos - (lenpos+8));
++    /* Pad encrypted blob to a multiple of cipher block size. */
++    if (passphrase) {
++	int padding = -(pos - (lenpos+4)) &amp; 7;
++	while (padding--)
++	    outblob[pos++] = random_byte();
++    }
++    ciphertext = (char *)outblob+lenpos+4;
++    cipherlen = pos - (lenpos+4);
+ 	dropbear_assert(!passphrase || cipherlen % 8 == 0);
+-	/* Wrap up the encrypted blob string. */
+-	PUT_32BIT(outblob+lenpos, cipherlen);
+-	/* And finally fill in the total length field. */
+-	PUT_32BIT(outblob+4, pos);
++    /* Wrap up the encrypted blob string. */
++    PUT_32BIT(outblob+lenpos, cipherlen);
++    /* And finally fill in the total length field. */
++    PUT_32BIT(outblob+4, pos);
+ 
+ 	dropbear_assert(pos &lt; outlen);
+ 
++    /*
++     * Encrypt the key.
++     */
++    if (passphrase) {
+ 	/*
+-	 * Encrypt the key.
++	 * Derive encryption key from passphrase and iv/salt:
++	 * 
++	 *  - let block A equal MD5(passphrase)
++	 *  - let block B equal MD5(passphrase || A)
++	 *  - block C would be MD5(passphrase || A || B) and so on
++	 *  - encryption key is the first N bytes of A || B
+ 	 */
+-	if (passphrase) {
+-		/*
+-		 * Derive encryption key from passphrase and iv/salt:
+-		 * 
+-		 *  - let block A equal MD5(passphrase)
+-		 *  - let block B equal MD5(passphrase || A)
+-		 *  - block C would be MD5(passphrase || A || B) and so on
+-		 *  - encryption key is the first N bytes of A || B
+-		 */
+-		struct MD5Context md5c;
+-		unsigned char keybuf[32], iv[8];
++	struct MD5Context md5c;
++	unsigned char keybuf[32], iv[8];
+ 
+-		MD5Init(&amp;md5c);
+-		MD5Update(&amp;md5c, (unsigned char *)passphrase, strlen(passphrase));
+-		MD5Final(keybuf, &amp;md5c);
++	MD5Init(&amp;md5c);
++	MD5Update(&amp;md5c, (unsigned char *)passphrase, strlen(passphrase));
++	MD5Final(keybuf, &amp;md5c);
+ 
+-		MD5Init(&amp;md5c);
+-		MD5Update(&amp;md5c, (unsigned char *)passphrase, strlen(passphrase));
+-		MD5Update(&amp;md5c, keybuf, 16);
+-		MD5Final(keybuf+16, &amp;md5c);
+-
+-		/*
+-		 * Now decrypt the key blob.
+-		 */
+-		memset(iv, 0, sizeof(iv));
+-		des3_encrypt_pubkey_ossh(keybuf, iv, (unsigned char *)ciphertext,
+-								 cipherlen);
+-
+-		memset(&amp;md5c, 0, sizeof(md5c));
+-		memset(keybuf, 0, sizeof(keybuf));
+-	}
++	MD5Init(&amp;md5c);
++	MD5Update(&amp;md5c, (unsigned char *)passphrase, strlen(passphrase));
++	MD5Update(&amp;md5c, keybuf, 16);
++	MD5Final(keybuf+16, &amp;md5c);
+ 
+ 	/*
+-	 * And save it. We'll use Unix line endings just in case it's
+-	 * subsequently transferred in binary mode.
++	 * Now decrypt the key blob.
+ 	 */
++        memset(iv, 0, sizeof(iv));
++	des3_encrypt_pubkey_ossh(keybuf, iv, (unsigned char *)ciphertext,
++				 cipherlen);
++
++        memset(&amp;md5c, 0, sizeof(md5c));
++        memset(keybuf, 0, sizeof(keybuf));
++    }
++
++    /*
++     * And save it. We'll use Unix line endings just in case it's
++     * subsequently transferred in binary mode.
++     */
+ 	fp = fopen(filename, "wb");	  /* ensure Unix line endings */
+-	if (!fp)
+-		goto error;
+-	fputs("---- BEGIN SSH2 ENCRYPTED PRIVATE KEY ----\n", fp);
+-	fprintf(fp, "Comment: \"");
+-	/*
+-	 * Comment header is broken with backslash-newline if it goes
+-	 * over 70 chars. Although it's surrounded by quotes, it
+-	 * _doesn't_ escape backslashes or quotes within the string.
+-	 * Don't ask me, I didn't design it.
+-	 */
+-	{
+-		int slen = 60;					   /* starts at 60 due to "Comment: " */
+-		char *c = key-&gt;comment;
+-		while ((int)strlen(c) &gt; slen) {
+-			fprintf(fp, "%.*s\\\n", slen, c);
+-			c += slen;
+-			slen = 70;					   /* allow 70 chars on subsequent lines */
+-		}
+-		fprintf(fp, "%s\"\n", c);
++    if (!fp)
++	goto error;
++    fputs("---- BEGIN SSH2 ENCRYPTED PRIVATE KEY ----\n", fp);
++    fprintf(fp, "Comment: \"");
++    /*
++     * Comment header is broken with backslash-newline if it goes
++     * over 70 chars. Although it's surrounded by quotes, it
++     * _doesn't_ escape backslashes or quotes within the string.
++     * Don't ask me, I didn't design it.
++     */
++    {
++	int slen = 60;		       /* starts at 60 due to "Comment: " */
++	char *c = key-&gt;comment;
++	while ((int)strlen(c) &gt; slen) {
++	    fprintf(fp, "%.*s\\\n", slen, c);
++	    c += slen;
++	    slen = 70;		       /* allow 70 chars on subsequent lines */
+ 	}
++	fprintf(fp, "%s\"\n", c);
++    }
+ 	base64_encode_fp(fp, outblob, pos, 70);
+-	fputs("---- END SSH2 ENCRYPTED PRIVATE KEY ----\n", fp);
+-	fclose(fp);
+-	ret = 1;
++    fputs("---- END SSH2 ENCRYPTED PRIVATE KEY ----\n", fp);
++    fclose(fp);
++    ret = 1;
+ 
+-	error:
+-	if (outblob) {
+-		memset(outblob, 0, outlen);
++    error:
++    if (outblob) {
++        memset(outblob, 0, outlen);
+ 		m_free(outblob);
+-	}
+-	if (privblob) {
+-		memset(privblob, 0, privlen);
++    }
++    if (privblob) {
++        memset(privblob, 0, privlen);
+ 		m_free(privblob);
+-	}
+-	if (pubblob) {
+-		memset(pubblob, 0, publen);
++    }
++    if (pubblob) {
++        memset(pubblob, 0, publen);
+ 		m_free(pubblob);
+-	}
+-	return ret;
++    }
++    return ret;
+ }
+ #endif /* ssh.com stuff disabled */
++
++/* From PuTTY misc.c */
++static int toint(unsigned u)
++{
++    /*
++     * Convert an unsigned to an int, without running into the
++     * undefined behaviour which happens by the strict C standard if
++     * the value overflows. You'd hope that sensible compilers would
++     * do the sensible thing in response to a cast, but actually I
++     * don't trust modern compilers not to do silly things like
++     * assuming that _obviously_ you wouldn't have caused an overflow
++     * and so they can elide an 'if (i &lt; 0)' test immediately after
++     * the cast.
++     *
++     * Sensible compilers ought of course to optimise this entire
++     * function into 'just return the input value'!
++     */
++    if (u &lt;= (unsigned)INT_MAX)
++        return (int)u;
++    else if (u &gt;= (unsigned)INT_MIN)   /* wrap in cast _to_ unsigned is OK */
++        return INT_MIN + (int)(u - (unsigned)INT_MIN);
++    else
++        return INT_MIN; /* fallback; should never occur on binary machines */
++}
+
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2016-7408.patch b/meta/recipes-core/dropbear/dropbear/CVE-2016-7408.patch
new file mode 100644
index 0000000..995eec5
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2016-7408.patch
@@ -0,0 +1,101 @@
+
+# HG changeset patch
+# User Matt Johnston <a class="moz-txt-link-rfc2396E" href="mailto:matt@ucc.asn.au">&lt;matt@ucc.asn.au&gt;</a>
+# Date 1468248038 -28800
+# Node ID eed9376a4ad68e3ae7f17d154dbf126ee66c54bc
+# Parent  6a14b1f6dc04e70933c49ea335184e68c1deeb94
+improve algorithm list parsing
+
+Patch is backported from:
+https://secure.ucc.asn.au/hg/dropbear/rev/eed9376a4ad6
+
+CVE: CVE-2016-7408
+Signed-off-by: Sona Sarmadi <a class="moz-txt-link-rfc2396E" href="mailto:sona.sarmadi@enea.com">&lt;sona.sarmadi@enea.com&gt;</a>
+
+diff -r 6a14b1f6dc04 -r eed9376a4ad6 common-algo.c
+--- a/common-algo.c	Mon Jul 11 21:51:25 2016 +0800
++++ b/common-algo.c	Mon Jul 11 22:40:38 2016 +0800
+@@ -531,21 +531,6 @@
+ 	return NULL;
+ }
+ 
+-static void
+-try_add_algo(const char *algo_name, algo_type *algos, 
+-		const char *algo_desc, algo_type * new_algos, int *num_ret)
+-{
+-	algo_type *match_algo = check_algo(algo_name, algos);
+-	if (!match_algo)
+-	{
+-		dropbear_log(LOG_WARNING, "This Dropbear program does not support '%s' %s algorithm", algo_name, algo_desc);
+-		return;
+-	}
+-
+-	new_algos[*num_ret] = *match_algo;
+-	(*num_ret)++;
+-}
+-
+ /* Checks a user provided comma-separated algorithm list for available
+  * options. Any that are not acceptable are removed in-place. Returns the
+  * number of valid algorithms. */
+@@ -553,30 +538,43 @@
+ check_user_algos(const char* user_algo_list, algo_type * algos, 
+ 		const char *algo_desc)
+ {
+-	algo_type new_algos[MAX_PROPOSED_ALGO];
+-	/* this has two passes. first we sweep through the given list of
+-	 * algorithms and mark them as usable=2 in the algo_type[] array... */
+-	int num_ret = 0;
++	algo_type new_algos[MAX_PROPOSED_ALGO+1];
+ 	char *work_list = m_strdup(user_algo_list);
+-	char *last_name = work_list;
++	char *start = work_list;
+ 	char *c;
+-	for (c = work_list; *c; c++)
++	int n;
++	/* So we can iterate and look for null terminator */
++	memset(new_algos, 0x0, sizeof(new_algos));
++	for (c = work_list, n = 0; ; c++)
+ 	{
+-		if (*c == ',')
+-		{
++		char oc = *c;
++		if (n &gt;= MAX_PROPOSED_ALGO) {
++			dropbear_exit("Too many algorithms '%s'", user_algo_list);
++		}
++		if (*c == ',' || *c == '\0') {
++			algo_type *match_algo = NULL;
+ 			*c = '\0';
+-			try_add_algo(last_name, algos, algo_desc, new_algos, &amp;num_ret);
++			match_algo = check_algo(start, algos);
++			if (match_algo) {
++				if (check_algo(start, new_algos)) {
++					TRACE(("Skip repeated algorithm '%s'", start))
++				} else {
++					new_algos[n] = *match_algo;
++					n++;
++				}
++			} else {
++				dropbear_log(LOG_WARNING, "This Dropbear program does not support '%s' %s algorithm", start, algo_desc);
++			}
+ 			c++;
+-			last_name = c;
++			start = c;
++		}
++		if (oc == '\0') {
++			break;
+ 		}
+ 	}
+-	try_add_algo(last_name, algos, algo_desc, new_algos, &amp;num_ret);
+ 	m_free(work_list);
+-
+-	new_algos[num_ret].name = NULL;
+-
+-	/* Copy one more as a blank delimiter */
+-	memcpy(algos, new_algos, sizeof(*new_algos) * (num_ret+1));
+-	return num_ret;
++	/* n+1 to include a null terminator */
++	memcpy(algos, new_algos, sizeof(*new_algos) * (n+1));
++	return n;
+ }
+ #endif /* ENABLE_USER_ALGO_LIST */
+
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2016-7409.patch b/meta/recipes-core/dropbear/dropbear/CVE-2016-7409.patch
new file mode 100644
index 0000000..fc4762d
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2016-7409.patch
@@ -0,0 +1,26 @@
+# HG changeset patch
+# User Matt Johnston <a class="moz-txt-link-rfc2396E" href="mailto:matt@ucc.asn.au">&lt;matt@ucc.asn.au&gt;</a>
+# Date 1468245085 -28800
+# Node ID 6a14b1f6dc04e70933c49ea335184e68c1deeb94
+# Parent  309e1c4a87682b6ca7d80b8555a1db416c3cb7ac
+better TRACE of failed remote ident
+
+Patch is backported from:
+https://secure.ucc.asn.au/hg/dropbear/rev/6a14b1f6dc04
+
+CVE: CVE-2016-7409
+Signed-off-by: Sona Sarmadi <a class="moz-txt-link-rfc2396E" href="mailto:sona.sarmadi@enea.com">&lt;sona.sarmadi@enea.com&gt;</a>
+
+diff -r 309e1c4a8768 -r 6a14b1f6dc04 common-session.c
+--- a/common-session.c	Fri Mar 18 22:44:36 2016 +0800
++++ b/common-session.c	Mon Jul 11 21:51:25 2016 +0800
+@@ -361,7 +361,7 @@
+ 	}
+ 
+ 	if (!done) {
+-		TRACE(("err: %s for '%s'\n", strerror(errno), linebuf))
++		TRACE(("error reading remote ident: %s\n", strerror(errno)))
+ 		ses.remoteclosed();
+ 	} else {
+ 		/* linebuf is already null terminated */
+
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------FB175B4B63BE079C5D7C88D9--
