Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id E34CF7866B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 18:02:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2018 11:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,336,1517904000"; d="scan'208";a="43753397"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2018 11:02:15 -0700
To: "Burton, Ross" <ross.burton@intel.com>,
	Martin Jansa <martin.jansa@gmail.com>
References: <43d5b925-755b-3dbc-63b0-0df6e89396db@linux.intel.com>
	<20180320121017.943-1-Martin.Jansa@gmail.com>
	<CAJTo0LY26Yp5tgyc3CJLGbeNioRB0Bu_SRd0o3CgAeHzvO8+=w@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <580eec70-ffc4-fa12-b52d-28717c0c21a5@linux.intel.com>
Date: Tue, 20 Mar 2018 19:55:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY26Yp5tgyc3CJLGbeNioRB0Bu_SRd0o3CgAeHzvO8+=w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gio-module-cache.bbclass: disable update_gio_module_cache postinst script for nativesdk
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
X-List-Received-Date: Tue, 20 Mar 2018 18:02:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/20/2018 06:07 PM, Burton, Ross wrote:
> Can you file a bug for this? Probably best to fix instead of working 
> around, as this leaves gio modules broken.

I also wonder if the shadow recipe's postinst needs to be fixed properly 
(instead of removing it altogether for nativesdk). On the other hand 
these two have been broken for a long time, and no one noticed, so maybe 
they don't need working nativesdk postinst at all.

Alex

