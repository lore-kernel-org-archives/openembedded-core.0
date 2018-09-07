Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id D11BB74C97
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 15:33:47 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 8-v6so28033414oip.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 08:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5OYHJIZhmC+FOmXexP7hg3ihPJ+J5fCuI3JF9v/5K94=;
	b=NKlwdlquPKq/x5otg3QzSUvd4IsNX62VlWr7GzSSCOjR3bQSASKvfK14+Q218K/UfZ
	6IukP9HgZHpwtw/HoWy6e4RXi4LDU38s2mg7mu5tiYMaJyMZ/mJt0LxJLiD5PtMyxfHy
	KcQbmapzgtI4qvoMFY28cU9Z8JEwc7IMYO7Lz6P1KJ7g2eI+J3hszu6xQ5F709MOwuMM
	xvrF7ra2XmEashhN5JcdqvSBbqYz1uDZfcRZOhdC+3kCtzBLjvH7KkPR9vYgDjMpoLYE
	oTiFyUJ4zE2eW04C7ferA8Bg8B3cH1MDKuyUeow1ipyn1W74ZD0NryBH5vLBXwVDxS8D
	njGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5OYHJIZhmC+FOmXexP7hg3ihPJ+J5fCuI3JF9v/5K94=;
	b=LKsgZ6zmjRE8iRCYCBjR7D+8FvypdYAhcgdrfA/hEclmfSokzVOrXv2qMCSYDYoKIY
	i3d8U7JY9AJ42+p+tJ0egEs5q7pz03NNGVxVmIG4L5Ia8kiNk7fTo2REfDn30J+ITAMP
	DhHsq4G1HhY3zUUNMAtGVL88GE1Ov+sqJ2YlKzzBpUwzxXahcm4LDg8x8Mas9VfvTazd
	L4pfcWGONF7YQnfxmSw0rJeSbMVCpu+HSsW1BnlWYgulcEdiIBIuFPWHXNNk+sLnt1Dx
	sJ6aJD9Kvygup9g/WY6Tt4AMWLXqz3I62dn/S/UhCGkSEuf4H/DKddW4GWt7bSQKNQjZ
	gryQ==
X-Gm-Message-State: APzg51Ax+PttPEwI6q5nKTy1BENNm5hH0ktAYvYzAIyadnT//2PZ3yJi
	OIenGJ5HTjPb9ryn+NADNDru2Rjjti9TInRkIsdAiw==
X-Google-Smtp-Source: ANB0VdZLg3gDnnF0R00v3/6nO9ZCLuxlIjGZFU+OzxrzsIRegvh/JyDFWi+W+b35Vd+YVXHNWuPKJQX2KPeWR8YezeQ=
X-Received: by 2002:aca:c74d:: with SMTP id
	x74-v6mr8045065oif.97.1536334428720; 
	Fri, 07 Sep 2018 08:33:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:385d:0:0:0:0:0 with HTTP;
	Fri, 7 Sep 2018 08:33:28 -0700 (PDT)
In-Reply-To: <1536282845-76662-1-git-send-email-changqing.li@windriver.com>
References: <1536282845-76662-1-git-send-email-changqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Sep 2018 16:33:28 +0100
Message-ID: <CAJTo0La8pK5zi8EthSEFiWpeUE=E1QHMdESicGC5wTgOioHxQg@mail.gmail.com>
To: changqing.li@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: patch for CVE-2018-15746
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
X-List-Received-Date: Fri, 07 Sep 2018 15:33:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You accidentally entered 'y' as the encoding (git-send-email is
hateful for this behaviour) so the encoding is a bit messed up and I
can't get this to apply.  Can you rebase and resend?

Ross

On 7 September 2018 at 02:14,  <changqing.li@windriver.com> wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../qemu/qemu/CVE-2018-15746.patch                 | 64 ++++++++++++++++=
++++++
>  meta/recipes-devtools/qemu/qemu_3.0.0.bb           |  1 +
>  2 files changed, 65 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-15746.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-15746.patch b/meta/=
recipes-devtools/qemu/qemu/CVE-2018-15746.patch
> new file mode 100644
> index 0000000..2f61ea0
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-15746.patch
> @@ -0,0 +1,64 @@
> +From 9acf4c64dd4560bd268006d7356c7455fab7e5b1 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 6 Sep 2018 14:52:12 +0800
> +Subject: [PATCH] seccomp: set the seccomp filter to all threads
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +When using "-seccomp on", the seccomp policy is only applied to the
> +main thread, the vcpu worker thread and other worker threads created
> +after seccomp policy is applied; the seccomp policy is not applied to
> +e.g. the RCU thread because it is created before the seccomp policy is
> +applied and SECCOMP_FILTER_FLAG_TSYNC isn't used.
> +
> +This can be verified with
> +for task in /proc/`pidof qemu`/task/*; do cat $task/status | grep Secc ;=
 done
> +Seccomp:       2
> +Seccomp:       0
> +Seccomp:       0
> +Seccomp:       2
> +Seccomp:       2
> +Seccomp:       2
> +
> +Starting with libseccomp 2.2.0 and kernel >=3D 3.17, we can use
> +seccomp_attr_set(ctx, > SCMP_FLTATR_CTL_TSYNC, 1) to update the policy
> +on all threads.
> +
> +libseccomp requirement was bumped to 2.2.0 in previous patch.
> +libseccomp should fail to set the filter if it can't honour
> +SCMP_FLTATR_CTL_TSYNC (untested), and thus -sandbox will now fail on
> +kernel < 3.17.
> +
> +Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> +Acked-by: Eduardo Otubo <otubo@redhat.com>
> +
> +Upstream-Status: Backport[https://github.com/qemu/qemu/commit/
> +70dfabeaa79ba4d7a3b699abe1a047c8012db114#diff-18106d3b47a2d249f9d41e772b=
7db22d]
> +
> +CVE: CVE-2018-15746
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + qemu-seccomp.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/qemu-seccomp.c b/qemu-seccomp.c
> +index 9cd8eb9..ba5500a 100644
> +--- a/qemu-seccomp.c
> ++++ b/qemu-seccomp.c
> +@@ -120,6 +120,11 @@ static int seccomp_start(uint32_t seccomp_opts)
> +         goto seccomp_return;
> +     }
> +
> ++    rc =3D seccomp_attr_set(ctx, SCMP_FLTATR_CTL_TSYNC, 1);
> ++    if (rc !=3D 0) {
> ++        goto seccomp_return;
> ++    }
> ++
> +     for (i =3D 0; i < ARRAY_SIZE(blacklist); i++) {
> +         if (!(seccomp_opts & blacklist[i].set)) {
> +             continue;
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devt=
ools/qemu/qemu_3.0.0.bb
> index 80da081..6b14786 100644
> --- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
>             file://0009-apic-fixup-fallthrough-to-PIC.patch \
>             file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-targ=
et.patch \
>             file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap=
-sh.patch \
> +           file://CVE-2018-15746.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+\..*)\.tar"
>
> --
> 2.7.4
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

