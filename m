Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id CBA7D607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 03:40:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 May 2018 20:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,353,1520924400"; d="scan'208";a="225028117"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.22.30])
	([10.221.22.30])
	by fmsmga006.fm.intel.com with ESMTP; 01 May 2018 20:40:37 -0700
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1524640773.git.kai.kang@windriver.com>
	<819c96b9c218ece95d000835d8574837450a0e06.1524640773.git.kai.kang@windriver.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <142b723d-9c7e-7661-5810-2f901b7acbe5@intel.com>
Date: Wed, 2 May 2018 11:40:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <819c96b9c218ece95d000835d8574837450a0e06.1524640773.git.kai.kang@windriver.com>
Subject: Re: [PATCH v2 2/8] gstreamer1.0-plugins-base: 1.12.4 -> 1.14.0
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
X-List-Received-Date: Wed, 02 May 2018 03:40:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/25/2018 03:23 PM, kai.kang@windriver.com wrote:
>  CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"

This can probably be removed too now. I remember trying it out and the
build worked for x86. Please check.

Thanks,
Anuj

