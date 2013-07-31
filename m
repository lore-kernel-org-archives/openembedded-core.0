Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 05C856AE32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:24:29 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id pb11so732262veb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 06:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=U69DQLDtvXb2TbpXZbzBfFmVznZnsBYpNvcPV8GNPLE=;
	b=BOk59Tv8LUSCOhy0T9K7dsiUbtBSVHt2/i4BkqIfqoAYwxTrJYYEeKeFwmglh5vKWn
	xFPnFA+G/SaQXAM/EW25TgRNJd/ZpcA9QjZsFQwGiV7CIS9pdTcLH6Vq9IpqZMVR9A8d
	Hym+UgYcXJngIumQQELC5yTEJxryKIvzsLAXH79NCC2fQj0K9RFOvCG58USU88DDQaCJ
	z0eZ/ORyhTuNnMPCeJtq/NdwMB3ZuFMLQN2AMR/CpL09dKbFF3tPn2K/J0QHnwzCUfRH
	FS0lNdw2JXrixIxPAju7XkM1tTji9anxmcTrDuRQXnU2pOlYwzAcqinPYixLzMXEJOoC
	62yw==
X-Received: by 10.220.145.4 with SMTP id b4mr4587494vcv.94.1375277070123; Wed,
	31 Jul 2013 06:24:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 31 Jul 2013 06:24:09 -0700 (PDT)
In-Reply-To: <1375276614-24376-1-git-send-email-lpapp@kde.org>
References: <1375276614-24376-1-git-send-email-lpapp@kde.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Jul 2013 14:24:09 +0100
Message-ID: <CAJTo0LbmKQvDG4upqg+0F6XP8CE=Jp9H2NgsJsHnHTExuM=PFQ@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
X-Gm-Message-State: ALoCoQnoSIrXM2Ac4L44BuGGbym8cDP9Td9PDUghVStwmeesTEQ938CEIFEXXhqqP1Aeecb5zNF3
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Wed, 31 Jul 2013 13:24:30 -0000
Content-Type: text/plain; charset=UTF-8

On 31 July 2013 14:16, Laszlo Papp <lpapp@kde.org> wrote:
> Signed-off-by: Laszlo Papp <lpapp@kde.org>
> ---
>  meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb | 28 +++++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb  | 29 ++++++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot_2013.07.bb          | 26 +++++++++++++++++++
>  3 files changed, 83 insertions(+)
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb

Unless there's a good reason to keep the older version around please
delete the old files and use the -M option to send-email/format-patch
so that it detects the rename and sends a minimal diff that is easier
to review.

If there is a good reason to keep the old version around, please say what it is.

Ross

