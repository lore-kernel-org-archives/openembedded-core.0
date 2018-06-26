Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id D0444747CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 11:27:43 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id i17-v6so7745672otl.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 04:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=23xU71a16eNQ/PCzb/xbsqXVsbCr/duCV6Qq4g1ncCI=;
	b=RtYnc2EGmDCOg0E2USauhPrFhgANoeom4bnFZE4qKK4Ayf5Q/gml7AQW5CvhcF8CDd
	dCc5zIKdVccMXBwxum7tlGIiX6ebVVAfsAUq8Tkyvn25zTtjv2GMszgdPpbXnDMhD2lq
	5uwMweYUNI+fBPTLm0oKvRVwmJBZ3sm3wplYxV4EG9SG91PquyzVHq8ZhBim5MPaExV2
	FQ0ANd1ByXo4X02CKTnWo423K6oOMbAf3I9H1fHc2NwSxxJeQ2fqcUnWUVy/VyLC4dk1
	kh5gNohN2IP4Upq8rv2+sg921i7FF3qSogQUyFIt2b23vNeng3CRgCN7BaFDXXR6Jt9d
	BDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=23xU71a16eNQ/PCzb/xbsqXVsbCr/duCV6Qq4g1ncCI=;
	b=g3OZsUDEi0imCew+v7xvc/NOH2H+mpcQJVzfaEIUWCMjt0aKqAX/PyTNveSd77E28F
	V83ShFYEzZWG1f8oBHHqt5NLHTH4VRORP6hRGbf+o/Uu0ICacg54YDQLhrk/arXYAM9R
	/z4onknaPI2qAtY5nvyJatYR6GKICZI6DuTI8CaDVbzA/x2Abru5QTVIeDvj8l/AsdEO
	hxJAXKQEuLL050qX4O8PCQbsN99qOg/X1oV+GIGvCXSc4W6+dvIjDSsUL7Ru3d6rokVZ
	DmEA2zfeN1QZ/TaT22KabzaszNL66yACfbmiJD16/icGd5h5Y9KqRjf64b7VlczLFm3I
	+QsA==
X-Gm-Message-State: APt69E1aADN2osaVpcrgZZ9yUGx9Al7/Yn0ugyVfgGEkwTMC54aF2/du
	0I8emfkQqWkWGi9SXa6EZyg4/3+czQLQP2xYvIB1uQ==
X-Google-Smtp-Source: AAOMgpfh4XiV9bex192lGJdw/mb6YWINfv9pEOfV4S1wTxC6UDlikCgSduOnx+hDNgsfH5UDLucVIb44N9x6grIwbXY=
X-Received: by 2002:a9d:37f6:: with SMTP id
	x109-v6mr627654otb.152.1530012464739; 
	Tue, 26 Jun 2018 04:27:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Tue, 26 Jun 2018 04:27:24
	-0700 (PDT)
In-Reply-To: <20180626073531.12935-1-hongl.fnst@cn.fujitsu.com>
References: <20180626073531.12935-1-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Jun 2018 12:27:24 +0100
Message-ID: <CAJTo0LaxZK42CR7MM8rT880mDbChVMVihXaya4LvABixrCDZHA@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 26 Jun 2018 11:27:44 -0000
Content-Type: text/plain; charset="UTF-8"

It appears that these are fixed in 3.3.15, so let's just upgrade to
that and get all the other security fixes too.

Ross

On 26 June 2018 at 08:35, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
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
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

