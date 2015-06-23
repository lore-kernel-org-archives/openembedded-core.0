Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 43BC06AC1E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 01:54:08 +0000 (UTC)
Received: by pdcu2 with SMTP id u2so23876430pdc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 18:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Kmuls3GqNTstzu14SNdngoTyxI/Y5O5XzJQBO8EOE5w=;
	b=JoyPx8A6DaEMxqmSQEOIvSmbtmO6m2ReBOhs7DMc4TyuCwpv0fLL0kU2+rrocgS1h4
	gKEtiv3kE1t9vTsw4r/c8hAQooW2qpvhq679sAvNwv1NQk8ljxo6TfCDG+rn0oSnsEjP
	Ofbu+ZWtlPCfAJFXPqgLDdlM6dgBZ3NAv29Ls5I2dhHys0xA1OzRLDRJtl15avqHQEtt
	t55LswaxNZKsia1c7ybv7TlMPpZodX4mX9ny/t30i67uPtwyHntQqWKsLfpUhxHV/P2v
	ulqNmi3ZtWwRxqdsOVgzZTFKR6wQaHhbaQN73Jme75qkywEs9CpW7xbs87RmhuFwBBbQ
	YFdw==
X-Received: by 10.66.66.202 with SMTP id h10mr63761162pat.145.1435024450451;
	Mon, 22 Jun 2015 18:54:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:eccd:4297:a72a:d01f?
	([2601:202:4000:1239:eccd:4297:a72a:d01f])
	by mx.google.com with ESMTPSA id
	fr2sm21254300pdb.22.2015.06.22.18.54.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jun 2015 18:54:09 -0700 (PDT)
Message-ID: <5588BC3C.7020800@gmail.com>
Date: Mon, 22 Jun 2015 18:54:04 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: wei.tee.ng@intel.com, openembedded-core@lists.openembedded.org
References: <1434699981-8983-1-git-send-email-wei.tee.ng@intel.com>
In-Reply-To: <1434699981-8983-1-git-send-email-wei.tee.ng@intel.com>
Subject: Re: [PATCH 0/3] [dizzy] Enable Marvell 8897 Wifi feature
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
X-List-Received-Date: Tue, 23 Jun 2015 01:54:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Wei Tee,

I am ok with the firmware change but not adding two new recipes. A 
better place may be in fido.

regards,
Armin

On 06/19/2015 12:46 AM, wei.tee.ng@intel.com wrote:
> From: Ng Wei Tee <wei.tee.ng@intel.com>
>
> Hi all,
>
> I would like to add hostapd and iw configuration for enabling
> Marvell 8897 Wifi feature. Hostapd and iw configuration were
> created in the recipes-connectivity layer to enable Marvell 8897
> module function in AP Mode and STA mode.
>
> This also package the Marvell pci8897 and usb8897 in the
> recipes-kernel/linux-firmware and intel iwlwifi firmware copyright
> years changed. Please review and provide feedback if any.
>
> This patch is target to merge in openembedded-core dizzy branch.
>
> Regards,
> Wei Tee
>
> Ng Shui Lei (2):
>    recipes-connectivity: Add hostapd configuration for enabling Marvell
>      8897 WiFi feature
>    recipes-connectivity: Add iw configuration for enabling Marvell 8897
>      WiFi feature
>
> Ng Wei Tee (1):
>    linux-firmware: Package Marvell pci8897 and usb8897 firmware
>
>   .../hostapd/hostapd-2.2/defconfig                  |  145 ++++++++++++++++++++
>   .../hostapd/hostapd-2.2/hostapd.service            |   11 ++
>   meta/recipes-connectivity/hostapd/hostapd-2.2/init |   58 ++++++++
>   meta/recipes-connectivity/hostapd/hostapd_2.2.bb   |   48 +++++++
>   ....sh-don-t-use-git-describe-for-versioning.patch |   40 ++++++
>   meta/recipes-connectivity/iw/iw_3.8.bb             |   27 ++++
>   .../linux-firmware/linux-firmware_git.bb           |   19 ++-
>   7 files changed, 345 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/defconfig
>   create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/hostapd.service
>   create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/init
>   create mode 100644 meta/recipes-connectivity/hostapd/hostapd_2.2.bb
>   create mode 100644 meta/recipes-connectivity/iw/iw-3.8/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
>   create mode 100644 meta/recipes-connectivity/iw/iw_3.8.bb
>

