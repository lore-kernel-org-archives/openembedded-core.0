Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 26B4777DFF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:22:29 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q125so12544437wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 06:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=qOdYZgMG8fmMnsaFPXlgcrOTPlHuIVE2HKeXFBuvTzc=;
	b=0KfhntgEO/evoLGGCn2vfBBEdiVhsAnB+koE8dIlPBM2tjjyJh+Wj6SpvHruzfjgjU
	F+InkbBIrh68yd0jWW52Rkd/pzH0iK3IpIgFzuUxQpgtBa9abm0iQVXmgYUoIHe9aKnU
	ypV28LFFCO/exFqwHJSDvQyXOyQcbcATGz/IVeyz0zfFcAiunl0KC/H1I6jwJpe1MfXW
	ScppKsACUN5V5SKqKwkmQWv7LOinNyzXZlg0YQP7tUqCe6AMaa30cA0RnHxORUDieTqa
	1r6P1KQn9dPcN23RwgqDX91lHDFg+crTBDklQGO9EdINTrxs72a14uHh0bwDxpRjAwrl
	Z6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=qOdYZgMG8fmMnsaFPXlgcrOTPlHuIVE2HKeXFBuvTzc=;
	b=VTXQ2vOouro2bsVD/YeP7CmYCAajY9qCwvFU3BgQAJdHiK7HWyicx/nFrdJR4sPNNP
	7eQKNP/cq75saBxbfCm0QNIIVbJ5JDjw8Sc1tfXMNAtbx1MPqpja5t8BvIl4FDc/hl9G
	StLzuQohh4u4XDEy9vb4mI96q2mLb8K9xhXu1CPqZAVPLzq4a/9GXACL98afgOX2ieaX
	XKpKUNXxnYQJtfVL1KslQtyjzFCOM5PnaX1G2IUBSZTxYWivZiZJpyV+Tor9heqQMCgg
	+JJJMmqCVjLwSjJbd4K8E61LWxARTCaSZZcwa+O/wtHh4h37/2NPbivdYZ5/7K+HaiCL
	1YOg==
X-Gm-Message-State: AN3rC/4C+QZDeWwzTskkWQ4p820as330WEzO0WbvYvSc1o2rpikiv+1G
	za1TTd9sUPVld+ZPpwM=
X-Received: by 10.28.100.195 with SMTP id y186mr9764005wmb.68.1492089749391;
	Thu, 13 Apr 2017 06:22:29 -0700 (PDT)
Received: from [10.55.10.149] ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id
	u189sm10572679wmg.18.2017.04.13.06.22.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 06:22:28 -0700 (PDT)
To: Marc Ferland <ferlandm@amotus.ca>, openembedded-core@lists.openembedded.org
References: <1491850956-12248-1-git-send-email-ferlandm@amotus.ca>
From: Felipe Ferreri Tonello <eu@felipetonello.com>
Message-ID: <f5feaa9b-6105-1f9a-6758-05a1fbac0746@felipetonello.com>
Date: Thu, 13 Apr 2017 14:22:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1491850956-12248-1-git-send-email-ferlandm@amotus.ca>
Subject: Re: [PATCH] bluez5: Upgrade 5.43 -> 5.44
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
X-List-Received-Date: Thu, 13 Apr 2017 13:22:30 -0000
X-Groupsio-MsgNum: 96276
Content-Type: multipart/mixed; boundary="------------5D9F23125BC91786F8136A18"
Content-Language: en-US

--------------5D9F23125BC91786F8136A18
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Marc,

On 10/04/17 20:02, Marc Ferland wrote:
> Mostly fixes to BLE.
> 
> Also in this commit:
> 
> - Experimental tools are no longer experimental and are part of the
>   official tools.
> - Experimental was renamed to "testing" (hence the addition of the
>   "testing" pacakge config option).
> - Classic command line tools like hciattach, hciconfig are now enabled
>   by the "--enable-deprecated" configure option (enabled by default for
>   backward compatibility).

You could enable the new MIDI functionality as well, or at least allow
easy bbappends to it, perhaps a new PACKAGECONFIG[midi] since it adds
alsa-lib dependency to it.

> 
> Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc        |  9 ++++++---
>  .../bluez5/{bluez5_5.43.bb => bluez5_5.44.bb}      | 23 +++++++++++++++++-----
>  2 files changed, 24 insertions(+), 8 deletions(-)
>  rename meta/recipes-connectivity/bluez5/{bluez5_5.43.bb => bluez5_5.44.bb} (64%)
> 
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index ed75db2..76b87a2 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -14,8 +14,8 @@ RCONFLICTS_${PN} = "bluez4"
>  
>  PACKAGECONFIG ??= "obex-profiles readline"
>  PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
> -PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
>  PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
> +PACKAGECONFIG[testing] = "--enable-testing,--disable-testing,,"
>  
>  SRC_URI = "\
>      ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
> @@ -31,6 +31,7 @@ inherit autotools pkgconfig systemd update-rc.d distro_features_check ptest
>  
>  EXTRA_OECONF = "\
>    --enable-tools \
> +  --enable-deprecated \
>    --disable-cups \
>    --enable-test \
>    --enable-datafiles \
> @@ -41,10 +42,12 @@ EXTRA_OECONF = "\
>  # bluez5 builds a large number of useful utilities but does not
>  # install them.  Specify which ones we want put into ${PN}-noinst-tools.
>  NOINST_TOOLS_READLINE ??= ""
> -NOINST_TOOLS_EXPERIMENTAL ??= ""
> +NOINST_TOOLS_TESTING ??= ""
> +NOINST_TOOLS_BT ??= ""
>  NOINST_TOOLS = " \
>      ${@bb.utils.contains('PACKAGECONFIG', 'readline', '${NOINST_TOOLS_READLINE}', '', d)} \
> -    ${@bb.utils.contains('PACKAGECONFIG', 'experimental', '${NOINST_TOOLS_EXPERIMENTAL}', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'testing', '${NOINST_TOOLS_TESTING}', '', d)} \
> +    ${NOINST_TOOLS_BT} \
>  "
>  
>  do_install_append() {
> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.43.bb b/meta/recipes-connectivity/bluez5/bluez5_5.44.bb
> similarity index 64%
> rename from meta/recipes-connectivity/bluez5/bluez5_5.43.bb
> rename to meta/recipes-connectivity/bluez5/bluez5_5.44.bb
> index e10b82d..1095f88 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5_5.43.bb
> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.44.bb
> @@ -2,8 +2,8 @@ require bluez5.inc
>  
>  REQUIRED_DISTRO_FEATURES = "bluez5"
>  
> -SRC_URI[md5sum] = "698def88df96840dfbb0858bb6d73350"
> -SRC_URI[sha256sum] = "16c9c05d2a1da644ce3570d975ada3643d2e60c007a955bac09c0a0efeb58d15"
> +SRC_URI[md5sum] = "94273617129ced06612fcb9f5273d14c"
> +SRC_URI[sha256sum] = "0c321e291f8b45e6a78e379dfe80592b65955a0f0ab191f1cca0edd8ec356c85"
>  
>  # noinst programs in Makefile.tools that are conditional on READLINE
>  # support
> @@ -16,12 +16,13 @@ NOINST_TOOLS_READLINE ?= " \
>      tools/btmgmt \
>  "
>  
> -# noinst programs in Makefile.tools that are conditional on EXPERIMENTAL
> +# noinst programs in Makefile.tools that are conditional on TESTING
>  # support
> -NOINST_TOOLS_EXPERIMENTAL ?= " \
> +NOINST_TOOLS_TESTING ?= " \
>      emulator/btvirt \
>      emulator/b1ee \
>      emulator/hfp \
> +    peripheral/btsensor \
>      tools/3dsp \
>      tools/mgmt-tester \
>      tools/gap-tester \
> @@ -30,6 +31,13 @@ NOINST_TOOLS_EXPERIMENTAL ?= " \
>      tools/smp-tester \
>      tools/hci-tester \
>      tools/rfcomm-tester \
> +    tools/bnep-tester \
> +    tools/userchan-tester \
> +"
> +
> +# noinst programs in Makefile.tools that are conditional on TOOLS
> +# support
> +NOINST_TOOLS_BT ?= " \
>      tools/bdaddr \
>      tools/avinfo \
>      tools/avtest \
> @@ -39,17 +47,22 @@ NOINST_TOOLS_EXPERIMENTAL ?= " \
>      tools/hcieventmask \
>      tools/hcisecfilter \
>      tools/btinfo \
> -    tools/btattach \
>      tools/btsnoop \
>      tools/btproxy \
>      tools/btiotest \
> +    tools/bneptest \
>      tools/mcaptest \
>      tools/cltest \
>      tools/oobtest \
>      tools/seq2bseq \
> +    tools/nokfw \
> +    tools/create-image \
> +    tools/eddystone \
>      tools/ibeacon \
>      tools/btgatt-client \
>      tools/btgatt-server \
> +    tools/test-runner \
> +    tools/check-selftest \
>      tools/gatt-service \
>      profiles/iap/iapd \
>  "
> 

-- 
Felipe

--------------5D9F23125BC91786F8136A18
Content-Type: application/pgp-keys;
 name="0x92698E6A.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0x92698E6A.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
SkAyCfQaSw==
=JwBB
-----END PGP PUBLIC KEY BLOCK-----

--------------5D9F23125BC91786F8136A18--
