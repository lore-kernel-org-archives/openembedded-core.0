Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 99359607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 03:23:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 May 2018 20:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,353,1520924400"; d="scan'208";a="225025757"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.22.30])
	([10.221.22.30])
	by fmsmga006.fm.intel.com with ESMTP; 01 May 2018 20:23:52 -0700
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1524640773.git.kai.kang@windriver.com>
	<2931b5c5c155c41854915e850647c150382cef44.1524640773.git.kai.kang@windriver.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <d05ee794-58f8-4d6e-4a57-f1d6d738d01a@intel.com>
Date: Wed, 2 May 2018 11:23:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <2931b5c5c155c41854915e850647c150382cef44.1524640773.git.kai.kang@windriver.com>
Subject: Re: [PATCH v2 3/8] gstreamer1.0-plugins-bad: 1.12.4 -> 1.14.0
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
X-List-Received-Date: Wed, 02 May 2018 03:23:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/25/2018 03:23 PM, kai.kang@windriver.com wrote:
> -PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols libdrm"

wayland is still a dependency and shouldn't probably be removed.

https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/tree/gst-libs/gst/wayland?h=1.14

Also, libpng should probably be removed from DEPENDS since it's no
longer required.

I had this:

https://github.com/anujm1/poky/commit/2cbe5cadbd9e53b244ca1ca03d3edd6da8be1f41

