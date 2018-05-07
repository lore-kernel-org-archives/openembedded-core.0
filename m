Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 7091360190
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 10:20:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 May 2018 03:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,373,1520924400"; d="scan'208";a="53794101"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2018 03:20:17 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Anuj Mittal <anuj.mittal@intel.com>
References: <20180503081758.4661-1-anuj.mittal@intel.com>
	<20180503081758.4661-2-anuj.mittal@intel.com>
	<CAJTo0LZqqcDiMQE6-GjaLmYJWQoj_g_ttkz1JR8X25K6uUcHxw@mail.gmail.com>
	<0635df77-73be-ef9e-2952-b1c87743b4f7@intel.com>
	<CAJTo0LYxbra0DJDJO3xz8iehHJ23U86MbwFgBpD-CF4EuJNw2Q@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <dd06af0e-e283-d9d2-e81f-115a658e5821@linux.intel.com>
Date: Mon, 7 May 2018 13:14:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYxbra0DJDJO3xz8iehHJ23U86MbwFgBpD-CF4EuJNw2Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/12] gst-plugins-base: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Mon, 07 May 2018 10:20:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05/04/2018 04:09 PM, Burton, Ross wrote:
> Aha great.  I suspect that you have GStreamer headers on your host 
> already and it's picking those up?

Seems like there is a host contamination issue here, which should be 
fixed as well.

Alex

