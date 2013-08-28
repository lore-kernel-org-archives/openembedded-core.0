Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4233D6BC26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 16:08:40 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so6459077pbb.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=dacN+Cwt089MAF2870gKh8fPk2f9y4ZL3VyD6rP4hV8=;
	b=WYqfx5JhnXZi8BFWnNpJjf+pJkkez2+j69dxAL67dkd1Y0kUD3A3bpsLL5XXo8oObk
	OKCs4E70vcbUVUZHFlmvL2+W7ighRHqZlmstDNEE4i97obA6CjukPM4SAH3QqSyBCPO7
	uvwoFe8aOEiqqjEgUKNcAxbPaNilXupQKBLQu1BOE1ITCBFasUhrG4foqQbcJtYmQ8+c
	UNM8QOdpk3bwcDNvc56qiCF4EXWqvIEt0tVEdTP0p7p6NymsiGBgzcmgKfz03AwPAyHm
	OdEhsrAHZe5C+g5schF/dcMiKPzVHd6t/hNc9W9Hq1smnp20udot5VO3Uq1QmE89hIvB
	gvwA==
X-Received: by 10.67.1.203 with SMTP id bi11mr16705328pad.137.1377706121066;
	Wed, 28 Aug 2013 09:08:41 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	uw6sm32154498pbc.8.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 09:08:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1377704359-5104-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Wed, 28 Aug 2013 09:08:44 -0700
Message-Id: <3C7D2661-E6F6-48A4-AEAD-73EAD536AB61@gmail.com>
References: <1377704359-5104-1-git-send-email-paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: set default log buffer size to 64 at compile time
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
X-List-Received-Date: Wed, 28 Aug 2013 16:08:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 28, 2013, at 8:39 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> This provides a more reasonable log buffer size to avoid losing =
earlier
> events, and 64K is not a problem for modern systems. When the buffer =
is
> used on sysvinit-based systems, which it isn't by default, 64K is =
already
> the runtime default size unless /etc/syslog-startup.conf is modified =
or
> deleted, so this only really affects systems using systemd. This
> completely removes the need for the busybox bbappend in meta-oe.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Looks good.
Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> meta/recipes-core/busybox/busybox-1.21.1/defconfig | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/busybox/busybox-1.21.1/defconfig =
b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
> index bdfdadf..e287a0d 100644
> --- a/meta/recipes-core/busybox/busybox-1.21.1/defconfig
> +++ b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
> @@ -1012,7 +1012,7 @@ CONFIG_FEATURE_SYSLOGD_DUP=3Dy
> CONFIG_FEATURE_SYSLOGD_CFG=3Dy
> CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=3D256
> CONFIG_FEATURE_IPC_SYSLOG=3Dy
> -CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=3D16
> +CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=3D64
> CONFIG_LOGREAD=3Dy
> CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=3Dy
> CONFIG_KLOGD=3Dy
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


