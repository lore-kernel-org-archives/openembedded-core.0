Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id EA87860132
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jun 2015 13:33:24 +0000 (UTC)
Received: by pactm7 with SMTP id tm7so91281177pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jun 2015 06:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=h+pQpSiYMdD/Dz8dAVSfSm4kdXo1s6zqVtyDzv6vYcQ=;
	b=xYq6YDeRP3qbjSJ//lMOAXbW/NSzTsJK09pgG+u40trdA6At9LYA3/H3g+U5Bv43VS
	VCC1qne23NNy6QoxjWhqXSuY3eZKCXo49UK1ooVC03Yz1c/wYCRZYUyOafNB1rOiyOYy
	P3lzW5Sgz0J92NcdBsvUOesV7j9eOR8i3gaAYgAtZYidCslQvchhJ2Xj5qgbCcnsVzAu
	s55jLvufZEhvlhknxxUI/QWBgmIGO4a7iZKHrq4AzF8Pomvsa+Wr5t7EAC3rEv+aOa3d
	bI8PJFZ2sHhjMrxNjZXyr03EzezVI8oNmZS++KhR/PaLxdwYAUX9ILIwvKge7vPS3JhB
	1xQw==
X-Received: by 10.66.122.5 with SMTP id lo5mr22112627pab.141.1435498405008;
	Sun, 28 Jun 2015 06:33:25 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:3ce4:949d:70b:5e6c?
	([2601:202:4000:1239:3ce4:949d:70b:5e6c])
	by mx.google.com with ESMTPSA id i4sm4621139pdk.74.2015.06.28.06.33.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jun 2015 06:33:23 -0700 (PDT)
Message-ID: <558FF797.3040602@gmail.com>
Date: Sun, 28 Jun 2015 06:33:11 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Ng, Wei Tee" <wei.tee.ng@intel.com>, 
	"'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
References: <1434699981-8983-1-git-send-email-wei.tee.ng@intel.com>
	<5588BC3C.7020800@gmail.com>
	<B4FF7F2787593E4CA07131C98D4AD41A01C435C9@PGSMSX101.gar.corp.intel.com>
	<B4FF7F2787593E4CA07131C98D4AD41A01C43D12@PGSMSX101.gar.corp.intel.com>
In-Reply-To: <B4FF7F2787593E4CA07131C98D4AD41A01C43D12@PGSMSX101.gar.corp.intel.com>
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
X-List-Received-Date: Sun, 28 Jun 2015 13:33:25 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

merged to staging

- armin

On 06/24/2015 10:27 PM, Ng, Wei Tee wrote:
> Hi, are these included?
>
> Best Regards,
> Wei Tee
>
>> -----Original Message-----
>> From: Ng, Wei Tee
>> Sent: Tuesday, June 23, 2015 10:06 AM
>> To: akuster808; openembedded-core@lists.openembedded.org
>> Subject: RE: [OE-core] [PATCH 0/3] [dizzy] Enable Marvell 8897 Wifi feature
>>
>> Hi Armin,
>>
>> Thanks for accepting the linux-firmware changes in dizzy branch.
>>
>> Regarding to the two new recipes, is it possible to add the two new recipes in
>> master branch so that it can be backport to dizzy/fido branch? My target is to
>> enable hostapd and iw features in dizzy branch. Hope to get some advice from
>> you. Thank you
>>
>> Regards,
>> Wei Tee
>>
>>> -----Original Message-----
>>> From: akuster808 [mailto:akuster808@gmail.com]
>>> Sent: Tuesday, June 23, 2015 9:54 AM
>>> To: Ng, Wei Tee; openembedded-core@lists.openembedded.org
>>> Subject: Re: [OE-core] [PATCH 0/3] [dizzy] Enable Marvell 8897 Wifi
>>> feature
>>>
>>> Wei Tee,
>>>
>>> I am ok with the firmware change but not adding two new recipes. A
>>> better place may be in fido.
>>>
>>> regards,
>>> Armin
>>>
>>> On 06/19/2015 12:46 AM, wei.tee.ng@intel.com wrote:
>>>> From: Ng Wei Tee <wei.tee.ng@intel.com>
>>>>
>>>> Hi all,
>>>>
>>>> I would like to add hostapd and iw configuration for enabling
>>>> Marvell
>>>> 8897 Wifi feature. Hostapd and iw configuration were created in the
>>>> recipes-connectivity layer to enable Marvell 8897 module function in
>>>> AP Mode and STA mode.
>>>>
>>>> This also package the Marvell pci8897 and usb8897 in the
>>>> recipes-kernel/linux-firmware and intel iwlwifi firmware copyright
>>>> years changed. Please review and provide feedback if any.
>>>>
>>>> This patch is target to merge in openembedded-core dizzy branch.
>>>>
>>>> Regards,
>>>> Wei Tee
>>>>
>>>> Ng Shui Lei (2):
>>>>     recipes-connectivity: Add hostapd configuration for enabling Marvell
>>>>       8897 WiFi feature
>>>>     recipes-connectivity: Add iw configuration for enabling Marvell 8897
>>>>       WiFi feature
>>>>
>>>> Ng Wei Tee (1):
>>>>     linux-firmware: Package Marvell pci8897 and usb8897 firmware
>>>>
>>>>    .../hostapd/hostapd-2.2/defconfig                  |  145 ++++++++++++++++++++
>>>>    .../hostapd/hostapd-2.2/hostapd.service            |   11 ++
>>>>    meta/recipes-connectivity/hostapd/hostapd-2.2/init |   58 ++++++++
>>>>    meta/recipes-connectivity/hostapd/hostapd_2.2.bb   |   48 +++++++
>>>>    ....sh-don-t-use-git-describe-for-versioning.patch |   40 ++++++
>>>>    meta/recipes-connectivity/iw/iw_3.8.bb             |   27 ++++
>>>>    .../linux-firmware/linux-firmware_git.bb           |   19 ++-
>>>>    7 files changed, 345 insertions(+), 3 deletions(-)
>>>>    create mode 100644 meta/recipes-connectivity/hostapd/hostapd-
>>> 2.2/defconfig
>>>>    create mode 100644 meta/recipes-connectivity/hostapd/hostapd-
>>> 2.2/hostapd.service
>>>>    create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/init
>>>>    create mode 100644 meta/recipes-connectivity/hostapd/hostapd_2.2.bb
>>>>    create mode 100644 meta/recipes-connectivity/iw/iw-3.8/0001-iw-
>>> version.sh-don-t-use-git-describe-for-versioning.patch
>>>>    create mode 100644 meta/recipes-connectivity/iw/iw_3.8.bb
>>>>

