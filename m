Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id C1B9074520
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 14:49:04 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g3-v6so3453175pfi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 07:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=1lrQbXV0VjH4oymjP1mpOcoonN2T6o4YqWTX2OIGfks=;
	b=uVa+weNc1YtfEGQhwu0Yrk5aGOhweQOmKapjCD1ehI8G0RWnk6oroyT+8S6EwU5q6z
	J75KKbgdYxVRm5TU98alUm5MdqQxtOqY5lh9v9uN519JeNoBtT60OlJshg5QkrHARba5
	dWXrh25bnrln/Gy8kjcpdQvuvkjhAVExBuiuUhOLfjSaZIIOH5ul1MDGJvNUSC1njN86
	xS+2mdwSOzjeCGQFBD/cHsKFm2I5gtUNNZrNjl7YPVHx2zDB2eb1XhY43xhKarGoNy+5
	xPJc5qrUJf8klwH+IMpUToHJu2IsN8yPcCq8BbFItaDlzaH5oXz1FRlG71mFsb7SSndP
	Yxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=1lrQbXV0VjH4oymjP1mpOcoonN2T6o4YqWTX2OIGfks=;
	b=T5YOhOvSOiY7piLBYxPWwApKs3Ikn1bhn4Q9tb/m7DNK24TRxXcFUdmBk8rbv9Ud82
	UVf9930A9K1pecuanhGBg26xJKhcW3Lu2r/e+ZhPyNJ5MMBzO2CZXj0DXFMSDbnJHiVX
	XI5EuVLQOtc/EhMLqZxRyLw2N3ovUb+I3g/pNChxgr9YWBpRZVamwEp8Tm8BLfbjsgET
	0OJWornJKIGK/ciMWy+9SMycvOqKCUXBOH0dpnXPMG30bClTqiWClyHrt65Cz8j4i4sd
	WKXGtp81NKla56/j+8oJys6vFQEWJ8Opuhk4ew7szZ+PMllSIgPu76athOdlnPhCe9pU
	x+og==
X-Gm-Message-State: APt69E3xsMshrxGLsM5UuRmVH7gmuZuZUZ1LuEZdK5Fz6J/ulEqr/ZW7
	Awq74bYWbwQf9t+qazBbcejrLw==
X-Google-Smtp-Source: AAOMgpdIGpi9/bwZw/9I52joRgty71fkf0RgEA8GjQAGftVSnYS8RQJ79MId339BnYhv4DTOk11wYg==
X-Received: by 2002:a62:d345:: with SMTP id
	q66-v6mr1895958pfg.158.1530024545541; 
	Tue, 26 Jun 2018 07:49:05 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:ed11:f63c:b4bf:cefa?
	([2601:202:4000:1184:ed11:f63c:b4bf:cefa])
	by smtp.gmail.com with ESMTPSA id
	o72-v6sm3432814pfk.76.2018.06.26.07.49.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 07:49:04 -0700 (PDT)
To: Hong Liu <hongl.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <20180626073531.12935-1-hongl.fnst@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <f5e3af09-3fdd-40f0-b39e-19f42ebf176b@gmail.com>
Date: Tue, 26 Jun 2018 07:49:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180626073531.12935-1-hongl.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] procps:Fix CVE-2018-1122&CVE-2018-1123
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
X-List-Received-Date: Tue, 26 Jun 2018 14:49:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 06/26/2018 12:35 AM, Hong Liu wrote:
> 1.0001-top-Do-not-default-to-the-cwd-in-configs_read.patch fixed CVE-2018-1122
>
> 2.0001-ps-output.c-Fix-outbuf-overflows-in-pr_args-etc.patch fixed CVE-2018-1123
> ---
>  ...put.c-Fix-outbuf-overflows-in-pr_args-etc.patch |  84 +++++++++++++++++
>  ...Do-not-default-to-the-cwd-in-configs_read.patch | 101 +++++++++++++++++++++
>  meta/recipes-extended/procps/procps_3.3.14.bb      |   2 +
>  3 files changed, 187 insertions(+)
>  create mode 100644 meta/recipes-extended/procps/procps/0001-ps-output.c-Fix-outbuf-overflows-in-pr_args-etc.patch
>  create mode 100644 meta/recipes-extended/procps/procps/0001-top-Do-not-default-to-the-cwd-in-configs_read.patch
>
> diff --git a/meta/recipes-extended/procps/procps/0001-ps-output.c-Fix-outbuf-overflows-in-pr_args-etc.patch b/meta/recipes-extended/procps/procps/0001-ps-output.c-Fix-outbuf-overflows-in-pr_args-etc.patch
> new file mode 100644
> index 0000000..ab4fc23
> --- /dev/null
> +++ b/meta/recipes-extended/procps/procps/0001-ps-output.c-Fix-outbuf-overflows-in-pr_args-etc.patch
> @@ -0,0 +1,84 @@
> +From 136e3724952827bbae8887a42d9d2b6f658a48ab Mon Sep 17 00:00:00 2001
> +From: Qualys Security Advisory <qsa@qualys.com>
> +Date: Thu, 1 Jan 1970 00:00:00 +0000
> +Subject: [PATCH] ps/output.c: Fix outbuf overflows in pr_args() etc.
> +
> +Because there is usually less than OUTBUF_SIZE available at endp.
> +
> +Upstream-Status: Backport
Patch missing signed-off-by


> +---
> + ps/output.c | 23 ++++++++++++++---------
> + 1 file changed, 14 insertions(+), 9 deletions(-)
> +
> +diff --git a/ps/output.c b/ps/output.c
> +index 0c63bb6..4456f28 100644
> +--- a/ps/output.c
> ++++ b/ps/output.c
> +@@ -389,6 +389,9 @@ Modifications to the arguments are not shown.
> + 
> + // FIXME: some of these may hit the guard page in forest mode
> + 
> ++#define OUTBUF_SIZE_AT(endp) \
> ++  (((endp) >= outbuf && (endp) < outbuf + OUTBUF_SIZE) ? (outbuf + OUTBUF_SIZE) - (endp) : 0)
> ++
> + /*
> +  * "args", "cmd", "command" are all the same:  long  unless  c
> +  * "comm", "ucmd", "ucomm"  are all the same:  short unless -f
> +@@ -402,15 +405,15 @@ static int pr_args(char *restrict const outbuf, const proc_t *restrict const pp)
> +   rightward -= fh;
> + 
> +   if(pp->cmdline && !bsd_c_option)
> +-    endp += escaped_copy(endp, *pp->cmdline, OUTBUF_SIZE, &rightward);
> ++    endp += escaped_copy(endp, *pp->cmdline, OUTBUF_SIZE_AT(endp), &rightward);
> +   else
> +-    endp += escape_command(endp, pp, OUTBUF_SIZE, &rightward, ESC_DEFUNCT);
> ++    endp += escape_command(endp, pp, OUTBUF_SIZE_AT(endp), &rightward, ESC_DEFUNCT);
> + 
> +-  if(bsd_e_option && rightward>1) {
> ++  if(bsd_e_option && rightward>1 && OUTBUF_SIZE_AT(endp)>1) {
> +     if(pp->environ && *pp->environ) {
> +       *endp++ = ' ';
> +       rightward--;
> +-      endp += escape_strlist(endp, pp->environ, OUTBUF_SIZE, &rightward);
> ++      endp += escape_strlist(endp, pp->environ, OUTBUF_SIZE_AT(endp), &rightward);
> +     }
> +   }
> +   return max_rightward-rightward;
> +@@ -429,15 +432,15 @@ static int pr_comm(char *restrict const outbuf, const proc_t *restrict const pp)
> +   rightward -= fh;
> + 
> +   if(pp->cmdline && unix_f_option)
> +-    endp += escaped_copy(endp, *pp->cmdline, OUTBUF_SIZE, &rightward);
> ++    endp += escaped_copy(endp, *pp->cmdline, OUTBUF_SIZE_AT(endp), &rightward);
> +   else
> +-    endp += escape_command(endp, pp, OUTBUF_SIZE, &rightward, ESC_DEFUNCT);
> ++    endp += escape_command(endp, pp, OUTBUF_SIZE_AT(endp), &rightward, ESC_DEFUNCT);
> + 
> +-  if(bsd_e_option && rightward>1) {
> ++  if(bsd_e_option && rightward>1 && OUTBUF_SIZE_AT(endp)>1) {
> +     if(pp->environ && *pp->environ) {
> +       *endp++ = ' ';
> +       rightward--;
> +-      endp += escape_strlist(endp, pp->environ, OUTBUF_SIZE, &rightward);
> ++      endp += escape_strlist(endp, pp->environ, OUTBUF_SIZE_AT(endp), &rightward);
> +     }
> +   }
> +   return max_rightward-rightward;
> +@@ -469,11 +472,13 @@ static int pr_fname(char *restrict const outbuf, const proc_t *restrict const pp
> +   if (rightward>8)  /* 8=default, but forest maybe feeds more */
> +     rightward = 8;
> + 
> +-  endp += escape_str(endp, pp->cmd, OUTBUF_SIZE, &rightward);
> ++  endp += escape_str(endp, pp->cmd, OUTBUF_SIZE_AT(endp), &rightward);
> +   //return endp - outbuf;
> +   return max_rightward-rightward;
> + }
> + 
> ++#undef OUTBUF_SIZE_AT
> ++
> + /* elapsed wall clock time, [[dd-]hh:]mm:ss format (not same as "time") */
> + static int pr_etime(char *restrict const outbuf, const proc_t *restrict const pp){
> +   unsigned long t;
> +-- 
> +2.14.3
> +
> diff --git a/meta/recipes-extended/procps/procps/0001-top-Do-not-default-to-the-cwd-in-configs_read.patch b/meta/recipes-extended/procps/procps/0001-top-Do-not-default-to-the-cwd-in-configs_read.patch
> new file mode 100644
> index 0000000..8b1b904
> --- /dev/null
> +++ b/meta/recipes-extended/procps/procps/0001-top-Do-not-default-to-the-cwd-in-configs_read.patch
> @@ -0,0 +1,101 @@
> +From b45c4803dd176f4e3f9d3d47421ddec9bbbe66cd Mon Sep 17 00:00:00 2001
> +From: Qualys Security Advisory <qsa@qualys.com>
> +Date: Thu, 1 Jan 1970 00:00:00 +0000
> +Subject: [PATCH] top: Do not default to the cwd in configs_read().
> +
> +If the HOME environment variable is not set, or not absolute, use the
> +home directory returned by getpwuid(getuid()), if set and absolute
> +(instead of the cwd "."); otherwise, set p_home to NULL.
> +
> +To keep the changes to a minimum, we rely on POSIX, which requires that
> +fopen() fails with ENOENT if the pathname (Rc_name) is an empty string.
> +This integrates well into the existing code, and makes write_rcfile()
> +work without a change.
> +
> +Also, it makes the code in configs_read() easier to follow: only set and
> +use p_home if safe, and only set Rc_name if safe (in all the other cases
> +it is the empty string, and the fopen() calls fail). Plus, check for
> +snprintf() truncation (and if it happens, reset Rc_name to the empty
> +string).
> +
> +Important note: top.1 should probably be updated, since it mentions the
> +fallback to the current working directory.
> +
> +Upstream-Status: Backport
> +---
> + top/top.c | 33 ++++++++++++++++++++++++++++-----
> + 1 file changed, 28 insertions(+), 5 deletions(-)
> +
> +diff --git a/top/top.c b/top/top.c
> +index bc609aa..1b5afee 100644
> +--- a/top/top.c
> ++++ b/top/top.c
> +@@ -3810,6 +3810,20 @@ error Hey, fix the above fscanf 'PFLAGSSIZ' dependency !
> + } // end: config_file
> + 
> + 
> ++static int snprintf_Rc_name (const char *const format, ...) __attribute__((format(printf,1,2)));
> ++static int snprintf_Rc_name (const char *const format, ...) {
> ++   int len;
> ++   va_list ap;
> ++   va_start(ap, format);
> ++   len = vsnprintf(Rc_name, sizeof(Rc_name), format, ap);
> ++   va_end(ap);
> ++   if (len <= 0 || (size_t)len >= sizeof(Rc_name)) {
> ++      Rc_name[0] = '\0';
> ++      return 0;
> ++   }
> ++   return len;
> ++}
> ++
> +         /*
> +          * Try reading up to 3 rcfiles
> +          * 1. 'SYS_RCRESTRICT' contains two lines consisting of the secure
> +@@ -3842,23 +3856,31 @@ static void configs_read (void) {
> +       fclose(fp);
> +    }
> + 
> ++   Rc_name[0] = '\0'; // "fopen() shall fail if pathname is an empty string."
> +    // attempt to use the legacy file first, if we cannot access that file, use
> +    // the new XDG basedir locations (XDG_CONFIG_HOME or HOME/.config) instead.
> +    p_home = getenv("HOME");
> +-   if (!p_home || p_home[0] == '\0')
> +-      p_home = ".";
> +-   snprintf(Rc_name, sizeof(Rc_name), "%s/.%src", p_home, Myname);
> ++   if (!p_home || p_home[0] != '/') {
> ++      const struct passwd *const pwd = getpwuid(getuid());
> ++      if (!pwd || !(p_home = pwd->pw_dir) || p_home[0] != '/') {
> ++         p_home = NULL;
> ++      }
> ++   }
> ++   if (p_home) {
> ++      snprintf_Rc_name("%s/.%src", p_home, Myname);
> ++   }
> + 
> +    if (!(fp = fopen(Rc_name, "r"))) {
> +       p = getenv("XDG_CONFIG_HOME");
> +       // ensure the path we get is absolute, fallback otherwise.
> +       if (!p || p[0] != '/') {
> ++         if (!p_home) goto system_default;
> +          p = fmtmk("%s/.config", p_home);
> +          (void)mkdir(p, 0700);
> +       }
> +-      snprintf(Rc_name, sizeof(Rc_name), "%s/procps", p);
> ++      if (!snprintf_Rc_name("%s/procps", p)) goto system_default;
> +       (void)mkdir(Rc_name, 0700);
> +-      snprintf(Rc_name, sizeof(Rc_name), "%s/procps/%src", p, Myname);
> ++      if (!snprintf_Rc_name("%s/procps/%src", p, Myname)) goto system_default;
> +       fp = fopen(Rc_name, "r");
> +    }
> + 
> +@@ -3867,6 +3889,7 @@ static void configs_read (void) {
> +       fclose(fp);
> +       if (p) goto default_or_error;
> +    } else {
> ++system_default:
> +       fp = fopen(SYS_RCDEFAULTS, "r");
> +       if (fp) {
> +          p = config_file(fp, SYS_RCDEFAULTS, &tmp_delay);
> +-- 
> +2.14.3
> +
> diff --git a/meta/recipes-extended/procps/procps_3.3.14.bb b/meta/recipes-extended/procps/procps_3.3.14.bb
> index 1aba511..b7b6b6b 100644
> --- a/meta/recipes-extended/procps/procps_3.3.14.bb
> +++ b/meta/recipes-extended/procps/procps_3.3.14.bb
> @@ -15,6 +15,8 @@ inherit autotools gettext pkgconfig update-alternatives
>  SRC_URI = "http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${PV}.tar.xz \
>             file://sysctl.conf \
>             file://0001-Fix-out-of-tree-builds.patch \
> +           file://0001-top-Do-not-default-to-the-cwd-in-configs_read.patch \
> +           file://0001-ps-output.c-Fix-outbuf-overflows-in-pr_args-etc.patch \
>             "
>  
>  SRC_URI[md5sum] = "fce371ccc1c15a67af9d85e4057e559d"


