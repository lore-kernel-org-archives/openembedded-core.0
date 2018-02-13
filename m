Return-Path: <anders.roxell@linaro.org>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id D41926093A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 11:20:23 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g12so1278777pgs.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 03:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n9iR8sjve+gTomLUU5oZUQsY2Op7M8poQzJQF96sysc=;
	b=cy3+WqgwXxRmEfPfY5DKj6Uw3hDYYuebDdz+wUr454D7bbeIbW1htBLPrmgU8+rKLa
	uKpDE8kJ1wK4h9codWDHovQgIw2EWeaFTs7kyejbOCq3g5YsNicX8dORUYbL1GrnkiJJ
	gYK2Bn9wXhw8KlW87m927wOAMgI+6W6k2Ovho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n9iR8sjve+gTomLUU5oZUQsY2Op7M8poQzJQF96sysc=;
	b=CkH9MdCnXkgO4rmnbLIHmB4DBkAD2dlR4DIaZUdmLaNeko6OdjJnJfTfnr8DMl4bMQ
	Wj7HyeKTQjnbXotClP8qk2FE3xz+gsf0PNHC4db3Iyag431xgoMQeTlyzxlzmW80m9Rn
	17/rHPHL+YuCcmrJOKRVt3ezUnmixLAk4QFEzw40aes5IpexFiUUfs8d3sg/VMvBr1gp
	U/aiPBTZN4YtIiOOfRBK62Wm5No0v0WO1pa2D4maCnY/idG1BD+U5ljgaQany1UOBV8t
	JumFMIrdUHdXTW/dwzE3D6uQKsfH41ULqbVfZ5Xogx6Ky0ou2i/s561y/Uj9IwRPlFMC
	/EPQ==
X-Gm-Message-State: APf1xPBLDclB8giYLkcHXIr3UiJUGTnSLgLv5Z71Tl0gUqjlW3Wwl5iD
	8t9E/rMo8eGb/H4wHyaCD2byV1CgQGyz/br/tXsm33AT
X-Google-Smtp-Source: AH8x227+Md63d53r3BRq4E999gGU6C57eGUh1eareR/OYbvIXLy91lq4X/lZc+JPuWfWDlUBRgGWYJwu7dKBYFgBeks=
X-Received: by 10.98.87.195 with SMTP id i64mr945245pfj.34.1518520824662; Tue,
	13 Feb 2018 03:20:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.236.166.12 with HTTP; Tue, 13 Feb 2018 03:20:24 -0800 (PST)
In-Reply-To: <20180212223808.9016-1-anders.roxell@linaro.org>
References: <20180212223808.9016-1-anders.roxell@linaro.org>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 13 Feb 2018 12:20:24 +0100
Message-ID: <CADYN=9+Cy9FLvC-i+At8d+jC9nNb_0E9cSWD5uYCyFQPNWbxcw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ltp: fix fanotify06 test
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
X-List-Received-Date: Tue, 13 Feb 2018 11:20:23 -0000
Content-Type: text/plain; charset="UTF-8"

please ignore this patch.

Cheers,
Anders

On 12 February 2018 at 23:38, Anders Roxell <anders.roxell@linaro.org> wrote:
> This patch fixes the fanotify06 test.
>
> http://lists.linux.it/pipermail/ltp/2018-January/006915.html
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  ...anotify-the-mount-fs_type-should-be-given.patch | 38 ++++++++++++++++++++++
>  meta/recipes-extended/ltp/ltp_20180118.bb          |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-extended/ltp/ltp/0040-fanotify-the-mount-fs_type-should-be-given.patch
>
> diff --git a/meta/recipes-extended/ltp/ltp/0040-fanotify-the-mount-fs_type-should-be-given.patch b/meta/recipes-extended/ltp/ltp/0040-fanotify-the-mount-fs_type-should-be-given.patch
> new file mode 100644
> index 0000000000..e57b6cd91e
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0040-fanotify-the-mount-fs_type-should-be-given.patch
> @@ -0,0 +1,38 @@
> +From c1b440c04d86adf77308fcd173d41dbfc6e66299 Mon Sep 17 00:00:00 2001
> +From: Li Wang <liwang@redhat.com>
> +Date: Tue, 23 Jan 2018 16:23:14 +0800
> +Subject: [PATCH 40/40] fanotify: the mount fs_type should be given
> +
> +This commmit 28507e514c(safe_mount: Do not try mount() syscall for FUSE fs)
> +involves FUSE fs check in safe_mount(), so we should give the "fs_type" when
> +calling that in case the system kill our program.
> +
> +  cmdline="fanotify06"
> +  contacts=""
> +  analysis=exit
> +  <<<test_output>>>
> +  tst_test.c:980: INFO: Timeout per run is 0h 10m 00s
> +  tst_test.c:1025: BROK: Test killed by SIGSEGV!
> +
> +Signed-off-by: Li Wang <liwang@redhat.com>
> +Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2018-January/006915.html]
> +---
> + testcases/kernel/syscalls/fanotify/fanotify06.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/testcases/kernel/syscalls/fanotify/fanotify06.c b/testcases/kernel/syscalls/fanotify/fanotify06.c
> +index e63e457a1..8cbe1adc6 100644
> +--- a/testcases/kernel/syscalls/fanotify/fanotify06.c
> ++++ b/testcases/kernel/syscalls/fanotify/fanotify06.c
> +@@ -221,7 +221,7 @@ void test01(void)
> + static void setup(void)
> + {
> +       SAFE_MKDIR(MOUNT_NAME, 0755);
> +-      SAFE_MOUNT(MOUNT_NAME, MOUNT_NAME, NULL, MS_BIND, NULL);
> ++      SAFE_MOUNT(MOUNT_NAME, MOUNT_NAME, "none", MS_BIND, NULL);
> +       mount_created = 1;
> +       SAFE_CHDIR(MOUNT_NAME);
> +
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-extended/ltp/ltp_20180118.bb b/meta/recipes-extended/ltp/ltp_20180118.bb
> index 369b98df9b..88f3bb4879 100644
> --- a/meta/recipes-extended/ltp/ltp_20180118.bb
> +++ b/meta/recipes-extended/ltp/ltp_20180118.bb
> @@ -43,6 +43,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
>             file://0035-fix-test_proc_kill-hang.patch \
>             file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
>             file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
> +           file://0040-fanotify-the-mount-fs_type-should-be-given.patch \
>             "
>
>  S = "${WORKDIR}/git"
> --
> 2.11.0
>

