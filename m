Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8489477FEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 13:39:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2018 05:39:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,396,1511856000"; d="scan'208";a="21613295"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Jan 2018 05:39:33 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <151627986059.9023.14010623458474127186@git.openembedded.org>
	<20180118125101.2F92F235ED3@git.openembedded.org>
	<CA+chaQeG05c0KXRoFMrb_=rh3C+MMJuMFWvQjtuyedFXg-PdMQ@mail.gmail.com>
	<CAJTo0LYJrDXkSG3zhEowg2UbFyYvoAPKKDUKoGd8qQ_yfBwCCA@mail.gmail.com>
	<CA+chaQczyj5GwNbcPrWsUAeyGv6Lo3MCaanRNpc5dj0BD96+nA@mail.gmail.com>
	<ced1db99-56e4-584e-775a-a345197a00bf@linux.intel.com>
	<CA+chaQcum56vWjDunvXB-iWHV097SyLUiQusOVwgTkisPzQOTA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <61b45636-ba1a-92d4-1932-1084db0a54e0@linux.intel.com>
Date: Mon, 22 Jan 2018 15:33:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcum56vWjDunvXB-iWHV097SyLUiQusOVwgTkisPzQOTA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 08/08: json-glib: update to 1.4.2
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
X-List-Received-Date: Mon, 22 Jan 2018 13:39:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/19/2018 07:59 PM, Martin Jansa wrote:
> I have gobject-introspection-data in DISTRO_FEATURES_BACKFILL_CONSIDERED.
> 
> I am able to reproduce this with nodistro after adding:
> DISTRO_FEATURES_remove = "gobject-introspection-data"
> or the same to DISTRO_FEATURES_BACKFILL_CONSIDERED.
> 
> This one is with require conf/distro/include/security_flags.inc
> http://errors.yoctoproject.org/Errors/Details/164873/ 
> <http://errors.yoctoproject.org/Errors/Details/164873/>
> 
> this one is without security_flags.inc:
> http://errors.yoctoproject.org/Errors/Details/164874/
> 
> The older version was building fine with gobject-introspection disabled.

Upstream has renamed all the configuration options, and then renamed 
them again. At the same time, meson stays quiet about configuration 
options that don't exist, and so we don't have an automatic way to catch 
such regressions.

https://github.com/GNOME/json-glib/commits/master/meson_options.txt

I'll fix the recipe.


Alex


