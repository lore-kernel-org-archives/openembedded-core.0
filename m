Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 74A4E60E9E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 09:20:45 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t17so1636535ilm.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 01:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=kprOy3DHpD8iK2WQw4Iu1Y5zL2D7w8yPPByCxAuwT1Q=;
	b=SJXOqwQv8MfcOAuERirjnNwI8jjuwE6Restobp6dLRiIuYVsxZxjR14M3od8M2+5bS
	LuTtXDpcxO0vdOY+7AwSg5QvbjqiXr2IGWUTrLP0mREYCiGXGTAeyutN+Qlilr+XJTlj
	y3qQGvdZXTC3RnZdk3jNrxkMFE5e5OgSesCIwLYzq4kH2iRXVkU/JBNEhxVczUhxdHmw
	6IONBWceDFy1svqtexcg9U2dsv/OJyzGWAPRc6zWxPeh1vqV+EK6+YM+IBY7aFr0RMKx
	uirjVKwLLDDMnpF6zrgg0A3VISZXtREb738UXNB3YT/UI7dHEyUBv0oZYot/3L8jLZs7
	Yieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=kprOy3DHpD8iK2WQw4Iu1Y5zL2D7w8yPPByCxAuwT1Q=;
	b=Hrn+NiAFVl6xdX3vCnz4lvNnJFGgmS5p0RVx/8KAbkofpLLiUGznNYIFX82jSq5vPX
	V+N2/jfbKJ30UBSFeb6EPLPiWO3KdGxKrFMh5edOkhxa4kKyIQauM8SSaEhgVNB91UGu
	Zs+4L9E5dpTS7SwgxcxaP/acurDYfgwKfx5Scw1GC2BQrWlSmKoqr49k6cmLKWqsnhB8
	X/N+nuvx5JJnc9blGJMfht4japIufos8HqGK03wmloPVK2K/en32vE8YxKNZ1aR0AH39
	8lr7uSjuUPbux6u4FhDl7dMgNEmFfLnVontO+ebuCfF52+SHPMXz/gNqY3DaGLe6Dcdg
	WtKg==
X-Gm-Message-State: APjAAAWyz26p06igUh5/b3EEckAuU3GQid2HanidCRvb3f1/i3jiEDkk
	ckU1I7McdYr2SPSiDZLis/vHbcdivFza5uvLw6pKzQ==
X-Google-Smtp-Source: APXvYqy+XfB3TRtqa7to7dIUX3AqVLEuWCjvkktAPyf7+o1glzoxjYndFuiPrPneOtpdg4HGmNb+VZ4E1xPUwqLaXx0=
X-Received: by 2002:a92:5c8f:: with SMTP id d15mr3813234ilg.102.1581153646210; 
	Sat, 08 Feb 2020 01:20:46 -0800 (PST)
MIME-Version: 1.0
References: <20200130045446.44017-1-alex.kiernan@gmail.com>
In-Reply-To: <20200130045446.44017-1-alex.kiernan@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 8 Feb 2020 09:20:35 +0000
Message-ID: <CAO5Uq5RcDacqi51E_+gegh7Mv1B8h18DC7roAet9ADBywTtVoA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH] rootfs-postcommands: Remove spaces before ; in -ROOTFS_..._COMMAND
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
X-List-Received-Date: Sat, 08 Feb 2020 09:20:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 30, 2020 at 4:54 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> With spaces in ROOTFS_POSTPROCESS_COMMAND attempts to remove elements
> using ROOTFS_POSTPROCESS_COMMAND_remove causes parse failures of the
> form:
>
>   bb.pysh.sherrors.ShellSyntaxError: LexToken(COMMA,';',0,0)
>   followed by:
>     LexToken(TOKEN,'write_image_test_data',0,0)
>     LexToken(COMMA,';',0,0)
>     LexToken(TOKEN,'set_systemd_default_target',0,0)
>     LexToken(COMMA,';',0,0)
>     LexToken(TOKEN,'systemd_create_users',0,0)
>
> Removing the spaces between the function name and semicolon allows the
> list to parse correctly.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  meta/classes/rootfs-postcommands.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> index a7f33fbf9e77..ebf96be7e85f 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -1,6 +1,6 @@
>
>  # Zap the root password if debug-tweaks feature is not enabled
> -ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password ; ",d)}'
> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password; ",d)}'
>
>  # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks or allow-empty-password is enabled
>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-empty-password' ], "ssh_allow_empty_password; ", "",d)}'
> @@ -12,7 +12,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
>
>  # Create /etc/timestamp during image construction to give a reasonably sane default time setting
> -ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
> +ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp; "
>
>  # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
>  ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
> @@ -26,11 +26,11 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only
>  APPEND_append = '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", " ro", "", d)}'
>
>  # Generates test data file with data store variables expanded in json format
> -ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data ; "
> +ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data; "
>
>  # Write manifest
>  IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"
> -ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
> +ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest; "
>  # Set default postinst log file
>  POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
>  # Set default target for systemd images

Ping?

-- 
Alex Kiernan

