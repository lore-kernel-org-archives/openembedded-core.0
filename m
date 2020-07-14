Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.1186.1594746642379941037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 10:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rdMTdlAo;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id cm21so1905412pjb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 10:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R63iqruQ48t0PZy9KJmcjqSIQDoWkJ61TcLfxX1Ufzg=;
        b=rdMTdlAoD4wNqqtHUGJzxHT5MEl37CLSvyKAY7ObPIJWkVtJ4sxwNTDwprrW5Thf12
         LWZ5Ik7g39DA1Hcec+C83Fhm01AhHuGPCNrBrpY0ImF8z1qzQe1+g7IBH+q5a4IqzvrE
         zq2+vLEnrcjLgQ+82szDeRU479IowlDmS/YP56GOymVo8zHyX406bER/0t6+sgU888pQ
         PKR//ntTHxpqnJZ/YqF1VIsYaIwjEQpsJKyCMfs1djR8OptxLnSvHh6ZWPe79mnQRL3Z
         aSXBNIh2DdP5FYAeS8DcNm25tUaTOPxpXPa6LxCI+4BRyXSeuV8Rk3bLMJcIVppIUZOW
         sPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R63iqruQ48t0PZy9KJmcjqSIQDoWkJ61TcLfxX1Ufzg=;
        b=Se2mnsP31sAJUVRh3jvXk83CPBEIwMAgrqF1tPNJfwOI3wCMn/lTCfbWG5Qoksk/zl
         FkGjbYEZS16XsgLdpwRwexbSZlF3gOv7GyrhsZ8rQcXVDdBs57x0lOUj4HfsAtd+eE2K
         ZA4wU/oZrWO6MQvOwhMgXxlwaZRnkUxxcimyQ2BeTJRFtjpm/sKnVknmSMyVfzXyi+hu
         Xjfy0JOvA4btHlbKCdsGyvkBh7xjKSxEWVQZMBjavDyFhXGZPhSAJKpPSzMGaRk/7VrL
         A25tAEFghRZ0lwzR6bzbp8JjqSTNM4DPGbypc7ILhATuLKoiE6NsxeX51icGieFBvb6n
         eRRQ==
X-Gm-Message-State: AOAM533NlRjKWT7opnvZpPyVSbFC+H8QoInL64OoPT6FwV4zize9WuDa
	oG6wmeRpqfL4tc2sRlJlCYmmEMqnIDA=
X-Google-Smtp-Source: ABdhPJx+J7YBea+rIrBdU6FGxBqKftAn1CLHCnGzNYMuyFDkCZmmWqFOcJmfopekK5Ik5Kp1TTCiNQ==
X-Received: by 2002:a17:90a:290e:: with SMTP id g14mr5867094pjd.85.1594746641291;
        Tue, 14 Jul 2020 10:10:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::ad4? ([2601:646:9200:4e0::ad4])
        by smtp.gmail.com with ESMTPSA id az13sm2989343pjb.34.2020.07.14.10.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 10:10:40 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v3] ppp: Allow arbitrary interface names to be specified in pppd config
To: Mark Deneen <mdeneen@saucontech.com>,
 openembedded-core@lists.openembedded.org
References: <20200714170833.2096002-1-mdeneen@saucontech.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <5d6b1fd8-ce09-ce16-d8ac-f513545d100a@gmail.com>
Date: Tue, 14 Jul 2020 10:10:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714170833.2096002-1-mdeneen@saucontech.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/14/20 10:08 AM, Mark Deneen wrote:
> pppd is patched in most Linux distributions to allow arbitrary naming
> of ppp interfaces, allowing users to create consistent firewall rules
> rather than having interfaces named "ppp0", "ppp1", etc.  Yocto is
> missing this option.
> 
> This patch, originally from SUSE, adds this option to pppd. It is not
> included upstream because there are some pppd-supported platforms which
> lack the ability to rename interfaces.
> 

are you aware of any of these platforms being supported by OE ?

> This is the same as the previous patch, but I messed up the subject line.
> 
> Upstream-Status: Inappropriate [not all platforms supported by pppd can rename interfaces]
> 
> Signed-off-by: Mark Deneen <mdeneen@saucontech.com>
> ---
>  .../ppp/ppp/0002-pppd-add-ifname-option.patch | 214 ++++++++++++++++++
>  meta/recipes-connectivity/ppp/ppp_2.4.8.bb    |   1 +
>  2 files changed, 215 insertions(+)
>  create mode 100644 meta/recipes-connectivity/ppp/ppp/0002-pppd-add-ifname-option.patch
> 
> diff --git a/meta/recipes-connectivity/ppp/ppp/0002-pppd-add-ifname-option.patch b/meta/recipes-connectivity/ppp/ppp/0002-pppd-add-ifname-option.patch
> new file mode 100644
> index 0000000000..8e54024d15
> --- /dev/null
> +++ b/meta/recipes-connectivity/ppp/ppp/0002-pppd-add-ifname-option.patch
> @@ -0,0 +1,214 @@
> +From bbcdc4366bbee6c3f4e1ddda31e4eec8c1b3ccc2 Mon Sep 17 00:00:00 2001
> +From: Paul Mackerras <paulus@samba.org>
> +Date: Tue, 23 Aug 2016 16:10:21 +1000
> +Subject: [PATCH 13/16] pppd: allow use of arbitrary interface names
> +
> +This is a modified version of a patch from openSUSE that enables PPP interfaces
> +to be called arbitrary names, rather than simply pppX where X is the unit
> +number.
> +
> +The modifications from the stock openSUSE patch are:
> +- refresh patch on top of 018_ip-up_option.diff
> +- fix a printf format-string vulnerability in pppd/main.c:set_ifunit()
> +- clarify the pppd.8 manpage additions
> +- patch pppstats/pppstats.c to query renamed interfaces without complaint
> +
> +Origin: SUSE
> +Bug-Debian: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=458646
> +Forwarded: no
> +Reviewed-by: Chris Boot <bootc@debian.org>
> +Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> +---
> + pppd/main.c         | 16 ++++++----------
> + pppd/options.c      |  5 +++++
> + pppd/pppd.8         |  8 +++++++-
> + pppd/pppd.h         | 11 +++++++++++
> + pppd/sys-linux.c    | 15 +++++++++++++++
> + pppstats/pppstats.c | 12 ++++++------
> + 6 files changed, 50 insertions(+), 17 deletions(-)
> +
> +diff --git a/pppd/main.c b/pppd/main.c
> +index 6d50d1bac1d9..f1986ed68d0b 100644
> +--- a/pppd/main.c
> ++++ b/pppd/main.c
> +@@ -124,7 +124,7 @@
> + static const char rcsid[] = RCSID;
> + 
> + /* interface vars */
> +-char ifname[32];		/* Interface name */
> ++char ifname[MAXIFNAMELEN];	/* Interface name */
> + int ifunit;			/* Interface unit number */
> + 
> + struct channel *the_channel;
> +@@ -298,13 +298,6 @@ struct protent *protocols[] = {
> +     NULL
> + };
> + 
> +-/*
> +- * If PPP_DRV_NAME is not defined, use the default "ppp" as the device name.
> +- */
> +-#if !defined(PPP_DRV_NAME)
> +-#define PPP_DRV_NAME	"ppp"
> +-#endif /* !defined(PPP_DRV_NAME) */
> +-
> + int
> + main(argc, argv)
> +     int argc;
> +@@ -737,8 +730,11 @@ void
> + set_ifunit(iskey)
> +     int iskey;
> + {
> +-    info("Using interface %s%d", PPP_DRV_NAME, ifunit);
> +-    slprintf(ifname, sizeof(ifname), "%s%d", PPP_DRV_NAME, ifunit);
> ++    if (req_ifname[0] != '\0')
> ++	slprintf(ifname, sizeof(ifname), "%s", req_ifname);
> ++    else
> ++	slprintf(ifname, sizeof(ifname), "%s%d", PPP_DRV_NAME, ifunit);
> ++    info("Using interface %s", ifname);
> +     script_setenv("IFNAME", ifname, iskey);
> +     if (iskey) {
> + 	create_pidfile(getpid());	/* write pid to file */
> +diff --git a/pppd/options.c b/pppd/options.c
> +index c06a2b4ad8ed..177488ca6813 100644
> +--- a/pppd/options.c
> ++++ b/pppd/options.c
> +@@ -114,6 +114,7 @@ char	linkname[MAXPATHLEN];	/* logical name for link */
> + bool	tune_kernel;		/* may alter kernel settings */
> + int	connect_delay = 1000;	/* wait this many ms after connect script */
> + int	req_unit = -1;		/* requested interface unit */
> ++char	req_ifname[MAXIFNAMELEN];	/* requested interface name */
> + bool	multilink = 0;		/* Enable multilink operation */
> + char	*bundle_name = NULL;	/* bundle name for multilink */
> + bool	dump_options;		/* print out option values */
> +@@ -284,6 +285,10 @@ option_t general_options[] = {
> +       "PPP interface unit number to use if possible",
> +       OPT_PRIO | OPT_LLIMIT, 0, 0 },
> + 
> ++    { "ifname", o_string, req_ifname,
> ++      "Set PPP interface name",
> ++      OPT_PRIO | OPT_PRIV | OPT_STATIC, NULL, MAXIFNAMELEN },
> ++
> +     { "dump", o_bool, &dump_options,
> +       "Print out option values after parsing all options", 1 },
> +     { "dryrun", o_bool, &dryrun,
> +diff --git a/pppd/pppd.8 b/pppd/pppd.8
> +index c508d277df3a..06e945fce998 100644
> +--- a/pppd/pppd.8
> ++++ b/pppd/pppd.8
> +@@ -1079,7 +1079,13 @@ under Linux and FreeBSD 2.2.8 and later.
> + .TP
> + .B unit \fInum
> + Sets the ppp unit number (for a ppp0 or ppp1 etc interface name) for outbound
> +-connections.
> ++connections.  If the unit is already in use a dynamically allocated number will
> ++be used.
> ++.TP
> ++.B ifname \fIstring
> ++Set the ppp interface name for outbound connections.  If the interface name is
> ++already in use, or if the name cannot be used for any other reason, pppd will
> ++terminate.
> + .TP
> + .B unset \fIname
> + Remove a variable from the environment variable for scripts that are
> +diff --git a/pppd/pppd.h b/pppd/pppd.h
> +index 247fa153739b..1a1bf0b99582 100644
> +--- a/pppd/pppd.h
> ++++ b/pppd/pppd.h
> +@@ -80,6 +80,16 @@
> + #define MAXARGS		1	/* max # args to a command */
> + #define MAXNAMELEN	256	/* max length of hostname or name for auth */
> + #define MAXSECRETLEN	256	/* max length of password or secret */
> ++#define MAXIFNAMELEN	32	/* max length of interface name; or use IFNAMSIZ, can we
> ++				   always include net/if.h? */
> ++
> ++/*
> ++ * If PPP_DRV_NAME is not defined, use the default "ppp" as the device name.
> ++ * Where should PPP_DRV_NAME come from? Do we include it here?
> ++ */
> ++#if !defined(PPP_DRV_NAME)
> ++#define PPP_DRV_NAME	"ppp"
> ++#endif /* !defined(PPP_DRV_NAME) */
> + 
> + /*
> +  * Option descriptor structure.
> +@@ -318,6 +328,7 @@ extern bool	tune_kernel;	/* May alter kernel settings as necessary */
> + extern int	connect_delay;	/* Time to delay after connect script */
> + extern int	max_data_rate;	/* max bytes/sec through charshunt */
> + extern int	req_unit;	/* interface unit number to use */
> ++extern char	req_ifname[MAXIFNAMELEN]; /* interface name to use */
> + extern bool	multilink;	/* enable multilink operation */
> + extern bool	noendpoint;	/* don't send or accept endpt. discrim. */
> + extern char	*bundle_name;	/* bundle name for multilink */
> +diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
> +index b4a435d2a993..b832031f7e26 100644
> +--- a/pppd/sys-linux.c
> ++++ b/pppd/sys-linux.c
> +@@ -643,6 +643,21 @@ static int make_ppp_unit()
> + 	}
> + 	if (x < 0)
> + 		error("Couldn't create new ppp unit: %m");
> ++
> ++	if (x == 0 && req_ifname[0] != '\0') {
> ++		struct ifreq ifr;
> ++		char t[MAXIFNAMELEN];
> ++		memset(&ifr, 0, sizeof(struct ifreq));
> ++		slprintf(t, sizeof(t), "%s%d", PPP_DRV_NAME, ifunit);
> ++		strncpy(ifr.ifr_name, t, IF_NAMESIZE);
> ++		strncpy(ifr.ifr_newname, req_ifname, IF_NAMESIZE);
> ++		x = ioctl(sock_fd, SIOCSIFNAME, &ifr);
> ++		if (x < 0)
> ++		    error("Couldn't rename interface %s to %s: %m", t, req_ifname);
> ++		else
> ++		    info("Renamed interface %s to %s", t, req_ifname);
> ++	}
> ++
> + 	return x;
> + }
> + 
> +diff --git a/pppstats/pppstats.c b/pppstats/pppstats.c
> +index 6367988eb96b..46cb9c24942b 100644
> +--- a/pppstats/pppstats.c
> ++++ b/pppstats/pppstats.c
> +@@ -88,7 +88,6 @@ int	aflag;			/* print absolute values, not deltas */
> + int	dflag;			/* print data rates, not bytes */
> + int	interval, count;
> + int	infinite;
> +-int	unit;
> + int	s;			/* socket or /dev/ppp file descriptor */
> + int	signalled;		/* set if alarm goes off "early" */
> + char	*progname;
> +@@ -449,6 +448,7 @@ main(argc, argv)
> + {
> +     int c;
> + #ifdef STREAMS
> ++    int unit;
> +     char *dev;
> + #endif
> + 
> +@@ -506,11 +506,6 @@ main(argc, argv)
> +     if (argc > 0)
> + 	interface = argv[0];
> + 
> +-    if (sscanf(interface, PPP_DRV_NAME "%d", &unit) != 1) {
> +-	fprintf(stderr, "%s: invalid interface '%s' specified\n",
> +-		progname, interface);
> +-    }
> +-
> + #ifndef STREAMS
> +     {
> + 	struct ifreq ifr;
> +@@ -535,6 +530,11 @@ main(argc, argv)
> +     }
> + 
> + #else	/* STREAMS */
> ++    if (sscanf(interface, PPP_DRV_NAME "%d", &unit) != 1) {
> ++	fprintf(stderr, "%s: invalid interface '%s' specified\n",
> ++		progname, interface);
> ++    }
> ++
> + #ifdef __osf__
> +     dev = "/dev/streams/ppp";
> + #else
> +-- 
> +2.15.1
> +
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.8.bb b/meta/recipes-connectivity/ppp/ppp_2.4.8.bb
> index f9c60d6bad..231c40f6ca 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.4.8.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.4.8.bb
> @@ -30,6 +30,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
>             file://fix-CVE-2015-3310.patch \
>             file://0001-ppp-Remove-unneeded-include.patch \
>             file://0001-pppd-Fix-bounds-check-in-EAP-code.patch \
> +           file://0002-pppd-add-ifname-option.patch \
>             "
>  
>  SRC_URI_append_libc-musl = "\
> 
> 
> 
> 
