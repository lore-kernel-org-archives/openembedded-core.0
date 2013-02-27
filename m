Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UAiSL-0004N1-4k
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 15:58:14 +0100
Received: by mail-oa0-f47.google.com with SMTP id o17so1251363oag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:41:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:subject:from:to:cc:date:in-reply-to
	:references:content-type:x-mailer:mime-version
	:content-transfer-encoding:x-gm-message-state;
	bh=NnNyP9WdxKMIaXbopfnvaVXGktVkykRf+/TvNpxztk0=;
	b=RtL+JmcwdvtwKnEfAZTj0161N5rIKSG7ptS4kvkNb+Kp1PNYpZJzAu/xkfsnpLS0Zj
	7WiSXGRlIVBHzCzrr9Bt1eHlQNiOJZMqhff9wX63IMb8Oc72bIpr4ZXgslxnih9gEUZC
	2s9P1nNJ4bvIJhvvj3tcmcSwiU9hJt3kyGYJKBzKOz8tw7hLs4zYLGw137Pfgr3XE4DR
	smLNnefDayd34iDlVMVSRr+lI8VXQ3ea6dkcGRPCyIb5O2neovTZ3Nem+bPls9YaATtX
	4XgfyPWCdC+n34ybqQcu3v0Tloy4Hw7eKRbxUf/juv1PpUgF0LBpZNsayBT+cBZdb3Ic
	79pg==
X-Received: by 10.182.164.8 with SMTP id ym8mr2287427obb.68.1361976103967;
	Wed, 27 Feb 2013 06:41:43 -0800 (PST)
Received: from [10.0.1.95] (adsl-68-88-197-100.dsl.rcsntx.swbell.net.
	[68.88.197.100])
	by mx.google.com with ESMTPS id v8sm8309037oea.4.2013.02.27.06.41.43
	(version=SSLv3 cipher=RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 06:41:43 -0800 (PST)
Message-ID: <1361976102.1809.5.camel@rrMBP>
From: Koen Kooi <koen@dominion.thruhere.net>
To: Ross Burton <ross.burton@intel.com>
Date: Wed, 27 Feb 2013 15:41:42 +0100
In-Reply-To: <6eb9f87bd871b294ec0bef6744bd71a651ff8d10.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
	<6eb9f87bd871b294ec0bef6744bd71a651ff8d10.1361974597.git.ross.burton@intel.com>
X-Mailer: Evolution 3.6.3 (3.6.3-2.fc18) 
Mime-Version: 1.0
X-Gm-Message-State: ALoCoQlvnnknhkC0SCAzzUdS9vsIVQ2TSY8nQN4BxBc9EiEkoOgxquKw4VMZrLBgHgf/QmvDMZ2m
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/7] systemd: make xz support (compressed journal) optional
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 14:58:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-02-27 at 14:17 +0000, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/systemd/systemd_197.bb |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
> index 7a11c8c..0e13d78 100644
> --- a/meta/recipes-core/systemd/systemd_197.bb
> +++ b/meta/recipes-core/systemd/systemd_197.bb
> @@ -11,7 +11,7 @@ PROVIDES = "udev"
>  PE = "1"
>  PR = "r4"
>  
> -DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
> +DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
>  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>  
>  SECTION = "base/shell"
> @@ -48,6 +48,8 @@ GTKDOC_DOCDIR = "${S}/docs/"
>  PACKAGECONFIG ??= ""
>  # Sign the journal for anti-tampering
>  PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
> +# Compress the journal
> +PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
>  
>  # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
>  EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \

Your commit fails to mention that you are changing the default to off,
it is on now.



