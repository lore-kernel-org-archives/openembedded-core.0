Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id C571E7CFF6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 15:50:22 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id a190so938918ite.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 08:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=F94bdzSPDQSuAbev4OkvHHBG8B3Xf74MkMC1vtp6/iE=;
	b=H39uDkyHDpInojfhEaBqW2ml7bYFMgJqVUlKqDX+S8NsFIr6FAXHGSByTPC6Cat3sQ
	uwbFWoCnTuvy+1WndxX2vAdX2zwCOu8+cyS5pxJP/ngM1QItigO+IDbuksxIkxUD+kf/
	3QFMAD2AyBgcd19IsgvJYGXQn91h7ITKO9NnCm6tJ+oAJIFVOoKNsznem16kieEEgZAL
	U4rgWkxCRkqiHbeRTCODFPh17Jwfk3WPPesyiYqAo7s5sgs2iug6oOnzfEPsl/UeM8Qe
	9Z3OS9fPJ7ToFRVI63HOc0kvKBJlkX3IRx685QkuvNRe2TR65fXaEHHawlbrnyAVejW9
	Myhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F94bdzSPDQSuAbev4OkvHHBG8B3Xf74MkMC1vtp6/iE=;
	b=easJ9F/p+z7n3QhZ8H5eVWSuLSbplHGCxpb5FFH3feNPT3B69xblzzBnZZUIGI54CT
	vT8N9v/+ohF3AansIgY66IdwQtiUfSpVX8S/Das4fZEMqMscLfb7ssCnGuity+homzZg
	oIm7DwsGUZm+l3K2T/9/eL5R7w5xUXnkOyu/h0cXO0sXEgnpvvd93xcjwpB3u8yPeTbH
	zhSEVPIav6VvfRm9d/Yv7Iqvjl9lWbf/NkcB/xdFmQCzA1zPZozBbdnrmHIaEw+7O5gm
	3FxqqnWmaoErGkwTODMo+AJNVww0o7OP+JQie7qjKWeHUdDif5FMuNvufMQL0n9D5hA6
	2t4A==
X-Gm-Message-State: APjAAAX+OTBPpBOm7ztUULPibsfLfyRTlRjTuX14FGI4ftdbJLVHPmK6
	DUPzH5vfIKT8sqK+LcdxfL4daCyxHg4zKbY+SE+FqAs6
X-Google-Smtp-Source: APXvYqxBELZzNYzks6wEHFt0YO57lZvQszNOOa6hFWDt/0SROUWypZ61vVnuLaphCErmuiqqD+ez6JNOs+zDJTwKgpA=
X-Received: by 2002:a05:660c:111:: with SMTP id
	w17mr2490563itj.62.1556034623488; 
	Tue, 23 Apr 2019 08:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <1555666691-6043-1-git-send-email-Haiqing.Bai@windriver.com>
In-Reply-To: <1555666691-6043-1-git-send-email-Haiqing.Bai@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2019 16:50:11 +0100
Message-ID: <CAJTo0LZ26dmhPjX0D0iprJc6u0APv-jB9-wt0Fkbk+MkwSt9pw@mail.gmail.com>
To: Haiqing Bai <Haiqing.Bai@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] sysstat:Add PACKAGECONFIG for '--enable-install-cron' configure
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
X-List-Received-Date: Tue, 23 Apr 2019 15:50:23 -0000
Content-Type: text/plain; charset="UTF-8"

Looks a lot like setting COPY_ONLY=y is what you want to do, instead
of patching the makefile?

Ross

On Fri, 19 Apr 2019 at 10:56, Haiqing Bai <Haiqing.Bai@windriver.com> wrote:
>
> Add PACKAGECONFIG[cron] for configure option: '--enable-install-cron'
> and remove the code of enable/disable sysstat.service in Makefile.in
> which is not available for embedded cross compiling.
>
> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ---
>  meta/recipes-extended/sysstat/sysstat.inc          |  4 +-
>  ...code-of-handling-enable-disable-self-star.patch | 55 ++++++++++++++++++++++
>  meta/recipes-extended/sysstat/sysstat_11.7.1.bb    |  3 +-
>  3 files changed, 59 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-extended/sysstat/sysstat/0001-Remove-the-code-of-handling-enable-disable-self-star.patch
>
> diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
> index 0bc7e14..83a9202 100644
> --- a/meta/recipes-extended/sysstat/sysstat.inc
> +++ b/meta/recipes-extended/sysstat/sysstat.inc
> @@ -17,8 +17,8 @@ DEPENDS += "base-passwd"
>  # autotools-brokensep as this package doesn't use automake
>  inherit autotools-brokensep gettext systemd
>
> -PACKAGECONFIG ??= ""
>  PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
> +PACKAGECONFIG[cron] = "--enable-install-cron,--disable-install-cron"
>
>  EXTRA_OECONF += "--disable-stripping"
>
> @@ -60,6 +60,6 @@ pkg_postinst_${PN} () {
>  }
>
>
> -FILES_${PN} += "${libdir}/sa"
> +FILES_${PN} += "${libdir}/sa ${systemd_unitdir}/system/*"
>
>  TARGET_CC_ARCH += "${LDFLAGS}"
> diff --git a/meta/recipes-extended/sysstat/sysstat/0001-Remove-the-code-of-handling-enable-disable-self-star.patch b/meta/recipes-extended/sysstat/sysstat/0001-Remove-the-code-of-handling-enable-disable-self-star.patch
> new file mode 100644
> index 0000000..1d099c9
> --- /dev/null
> +++ b/meta/recipes-extended/sysstat/sysstat/0001-Remove-the-code-of-handling-enable-disable-self-star.patch
> @@ -0,0 +1,55 @@
> +From 85813d1648b03ba0497635c45e90d7edf4dc204c Mon Sep 17 00:00:00 2001
> +From: Haiqing Bai <Haiqing.Bai@windriver.com>
> +Date: Fri, 29 Mar 2019 11:00:09 +0800
> +Subject: [PATCH] Remove the code of handling enable/disable self-start service
> + in Makefile.in
> +
> +Remove the handling of enable/disable sysstat.service self-start in Makefile.in.
> +The code will trigger below error when cross compiling with
> +'--enable-install-cron':
> +| if [ -x "/path/to/sysstat/11.7.1-r0/recipe-sysroot-native/usr/bin/systemctl" ]; then \
> +|       /path/to/sysstat/11.7.1-r0/recipe-sysroot-native/usr/bin/systemctl enable sysstat.service; \
> +| fi
> +| Started /path/to/sysstat/11.7.1-r0/recipe-sysroot-native/usr/bin/systemctl enable sysstat.service
> +| Try to find location of sysstat.service...
> +| 'sysstat.service' couldn't be found; exiting with error
> +
> +It's better for user to enable/disable the service with
> +'systemctl enable/disable sysstat.service'
> +
> +Upstream-Status: Inappropriate [ embedded specific ]
> +
> +Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> +---
> + Makefile.in | 8 --------
> + 1 file changed, 8 deletions(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index edaea3f..2186155 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -454,11 +454,6 @@ endif
> +                       fi \
> +               fi \
> +       fi
> +-ifeq ($(COPY_ONLY),n)
> +-      if [ -x "$(SYSTEMCTL)" ]; then \
> +-              $(SYSTEMCTL) enable sysstat.service; \
> +-      fi
> +-endif
> +
> + uninstall_man:
> + ifeq ($(INSTALL_DOC),y)
> +@@ -541,9 +536,6 @@ ifeq ($(COPY_ONLY),n)
> +               @echo "USER'S CRONTAB SAVED IN CURRENT DIRECTORY (USING .old SUFFIX)." ; \
> +               -su $(CRON_OWNER) -c "crontab -r" ; \
> +       fi
> +-      if [ -x $(SYSTEMCTL) ]; then \
> +-              $(SYSTEMCTL) disable sysstat.service; \
> +-      fi
> + endif
> +       if [ -n "$(SYSTEMD_UNIT_DIR)" -a -d $(DESTDIR)$(SYSTEMD_UNIT_DIR) ]; then \
> +               rm -f $(DESTDIR)$(SYSTEMD_UNIT_DIR)/sysstat.service; \
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-extended/sysstat/sysstat_11.7.1.bb b/meta/recipes-extended/sysstat/sysstat_11.7.1.bb
> index 86738e7..26be619 100644
> --- a/meta/recipes-extended/sysstat/sysstat_11.7.1.bb
> +++ b/meta/recipes-extended/sysstat/sysstat_11.7.1.bb
> @@ -2,7 +2,8 @@ require sysstat.inc
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
>
> -SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
> +SRC_URI += "file://0001-Include-needed-headers-explicitly.patch \
> +       file://0001-Remove-the-code-of-handling-enable-disable-self-star.patch"
>
>  SRC_URI[md5sum] = "bdcda7c9048c7c22fb1f30f75285d13d"
>  SRC_URI[sha256sum] = "303a595b1af0330b183a0f1febfccf89f183b9575ae0562b91fdb876f3ef1feb"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

