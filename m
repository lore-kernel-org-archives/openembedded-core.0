Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id DABC76E688
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 21:43:31 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id j5so20564548pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 14:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=VtM8IIz1mKG+8TKweVTwJKmgA5KYp2eA+oqImP9Si7E=;
	b=X/t/DmoseJ0FFWclznohY6+7LCE8TzYLmhTinPTgYpacHAbrFlfOgv2p/Cf7mfS4e7
	WAO2z2y/WOnVlAGie19Yri9O6PdevImRRMx/tgM4tdKkJ7odeskYu+T50TfZG6OZAQF3
	i3/PzOfGG6NZfPb8OIvMIPdgpsvOkVNX1gIxVBH8f+cHYwttKZAdZ0GAdX/lqKvrFwfd
	hgsPi0LDa3SaRS5Nx4yl1kX5/A8vb2ixgvp4IL5u9C+I7oVxr8pfOVzPoe3iqPFB3mmO
	2CQ8Hv4hXsvedByP5NeYNkehifq1HpUyRLIRrZQuTUfxmip6v/GIzWjzH8ahxCsURy72
	rPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=VtM8IIz1mKG+8TKweVTwJKmgA5KYp2eA+oqImP9Si7E=;
	b=Hxaykt+DoGe7Yv0HqSL0jFaMT9sJJbT2MItEmQSRNBLiPJllO9Az9cSsllCly8hFam
	/kCszGBfOT91l3TCwhbdluOloiiW/PAq9IRCzrZPef4HPDceYyjAm1Z/SJuDlbiV3jPr
	itTY0Ch0E22mIsGPbV3MIQ6vIzN6iL2sqHvZPLc4Pinqnni3dmn8tDPyxntT+mKyq9Je
	Y4hn4Rd+q23OpJhM4EjYpklmDTQLm5J6AwFMHBjC7LuS5PfIcC9aLr4lledfx1zSLlJ4
	myUTEfAjqpbV/NlvaUYPyndeahSyM/T9ia0hYbCOkLk3vL6UfzUfEl6PvQ5E15yXCcui
	cWdA==
X-Gm-Message-State: AMke39kTe/0dTVKrNd1BaTCVz5fAHnZY+E3f3345MgKPJ2KboZXCOkjnpqdePVG8SCRLhA==
X-Received: by 10.84.224.131 with SMTP id s3mr58878663plj.162.1489527813328;
	Tue, 14 Mar 2017 14:43:33 -0700 (PDT)
Received: from [10.5.7.41] ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id
	x10sm40322935pff.72.2017.03.14.14.43.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Mar 2017 14:43:32 -0700 (PDT)
To: "John, Maxin" <maxin.john@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1484670034-4647-1-git-send-email-maxin.john@intel.com>
	<61C0517EAD808B429A1DE2DD9164D40030F5F53B@IRSMSX101.ger.corp.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <723e1945-4352-33a4-32f7-e3ec4cf600cb@gmail.com>
Date: Tue, 14 Mar 2017 14:43:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <61C0517EAD808B429A1DE2DD9164D40030F5F53B@IRSMSX101.ger.corp.intel.com>
Subject: Re: [morty][PATCH] busybox: refresh the flock patch
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
X-List-Received-Date: Tue, 14 Mar 2017 21:43:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2017 07:43 AM, John, Maxin wrote:
> Hi Armin,
>
> It looks like this fell through the cracks. Please consider this for morty.
seems reasonable.
thanks for the reminder.
Armin
>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Maxin B. John
> Sent: Tuesday, January 17, 2017 6:21 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [morty][PATCH] busybox: refresh the flock patch
>
> Upstream accepted the flock fix with some improvements. Backport those changes.
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>   ...e-the-behaviour-of-c-parameter-to-match-u.patch | 77 ++++++++++------------
>   1 file changed, 34 insertions(+), 43 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch b/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
> index 8bcbd73..78520f0 100644
> --- a/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
> +++ b/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-
> +++ of-c-parameter-to-match-u.patch
> @@ -1,35 +1,24 @@
> -From 198f18addf1d814c2fefcb492f3b9fbd221669bb Mon Sep 17 00:00:00 2001
> -From: "Maxin B. John" <maxin.john@intel.com>
> -Date: Wed, 20 Apr 2016 18:24:45 +0300
> -Subject: [PATCH] flock: update the behaviour of -c parameter to match upstream
> -
> -In upstream, -c 'PROG ARGS' means "run sh -c 'PROG ARGS'"
> +From e1d426fd65c00a6d01a10d85edf8a294ae8a2d2b Mon Sep 17 00:00:00 2001
> +From: Denys Vlasenko <vda.linux@googlemail.com>
> +Date: Sun, 24 Apr 2016 18:19:49 +0200
> +Subject: [PATCH] flock: fix -c; improve error handling of fork+exec
>   
>   function                                             old     new   delta
> -flock_main                                           286     377     +91
> -.rodata                                           155849  155890     +41
> +flock_main                                           254     334     +80
>   
> -Upstream-Status: Submitted
> -[ http://lists.busybox.net/pipermail/busybox/2016-April/084142.html ]
> +Upstream-Status: Backport
>   
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
>   Signed-off-by: Maxin B. John <maxin.john@intel.com>
>   ---
> - util-linux/flock.c | 20 ++++++++++++++------
> - 1 file changed, 14 insertions(+), 6 deletions(-)
> + util-linux/flock.c | 19 +++++++++++++++++--
> + 1 file changed, 17 insertions(+), 2 deletions(-)
>   
>   diff --git a/util-linux/flock.c b/util-linux/flock.c -index 05a747f..c85a25d 100644
> +index 05a747f..539a835 100644
>   --- a/util-linux/flock.c
>   +++ b/util-linux/flock.c
> -@@ -20,6 +20,7 @@ int flock_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
> - int flock_main(int argc UNUSED_PARAM, char **argv)
> - {
> - 	int mode, opt, fd;
> -+    char *cmd_args[4];
> - 	enum {
> - 		OPT_s = (1 << 0),
> - 		OPT_x = (1 << 1),
> -@@ -57,7 +58,6 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
> +@@ -57,7 +57,6 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
>    	/* If it is "flock FILE -c PROG", then -c isn't caught by getopt32:
>    	 * we use "+" in order to support "flock -opt FILE PROG -with-opts",
>    	 * we need to remove -c by hand.
> @@ -37,35 +26,37 @@ index 05a747f..c85a25d 100644
>    	 */
>    	if (argv[0]
>    	 && argv[0][0] == '-'
> -@@ -65,7 +65,10 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
> - 	    || (ENABLE_LONG_OPTS && strcmp(argv[0] + 1, "-command") == 0)
> +@@ -66,6 +65,9 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
>    	    )
>    	) {
> --		argv++;
> -+        if (argc != optind + 3)
> -+            bb_error_msg_and_die("-c requires exactly one command argument");
> -+        else
> -+            argv++;
> + 		argv++;
> ++		if (argv[1])
> ++			bb_error_msg_and_die("-c takes only one argument");
> ++		opt |= OPT_c;
>    	}
>    
>    	if (OPT_s == LOCK_SH && OPT_x == LOCK_EX && OPT_n == LOCK_NB && OPT_u == LOCK_UN) { -@@ -89,9 +92,14 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
> - 			return EXIT_FAILURE;
> +@@ -90,8 +92,21 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
>    		bb_perror_nomsg_and_die();
>    	}
> --
> +
>   -	if (argv[0])
> --		return spawn_and_wait(argv);
> --
> -+    if (argv[0]) {
> -+        cmd_args[0] = getenv("SHELL");
> -+        if (!cmd_args[0])
> -+            cmd_args[0] = (char*)DEFAULT_SHELL;
> -+        cmd_args[1] = (char*)"-c";
> -+        cmd_args[2] = argv[0];
> -+        cmd_args[3] = NULL;
> -+        return spawn_and_wait(cmd_args);
> -+    }
> ++	if (argv[0]) {
> ++		if (!(opt & OPT_c)) {
> ++			int rc = spawn_and_wait(argv);
> ++			if (rc < 0)
> ++				bb_simple_perror_msg(argv[0]);
> ++			return rc;
> ++		}
> ++		/* -c 'PROG ARGS' means "run sh -c 'PROG ARGS'" */
> ++		argv -= 2;
> ++		argv[0] = (char*)get_shell_name();
> ++		argv[1] = (char*)"-c";
> ++		/* argv[2] = "PROG ARGS"; */
> ++		/* argv[3] = NULL; */
> + 		return spawn_and_wait(argv);
> ++	}
> +
>    	return EXIT_SUCCESS;
>    }
>   --
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


