Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4042A77E93
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 13:12:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Dec 2017 05:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,435,1508828400"; 
   d="scan'208";a="4318744"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 21 Dec 2017 05:12:49 -0800
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1513353879.git.alexander.kanavin@linux.intel.com>
	<1e27d3ebba327635e2be0325e4e81934bbb31370.1513353879.git.alexander.kanavin@linux.intel.com>
	<8af60152-a9bc-f16c-9666-3b0bd8ef6b75@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8de24be3-b98a-ed71-67e5-e7528d0d1cd4@linux.intel.com>
Date: Thu, 21 Dec 2017 15:07:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <8af60152-a9bc-f16c-9666-3b0bd8ef6b75@windriver.com>
Subject: Re: [PATCH 6/8] sysprof: convert to meson build
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
X-List-Received-Date: Thu, 21 Dec 2017 13:12:49 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/21/2017 12:14 PM, ChenQi wrote:
> It should be '_' instead '-'.
> '-Denable_gtk=true,-Denable_gtk=false,gtk+3'.

Thanks for spotting, I just sent a fixed patchset. Meson does not mind 
setting non-existing options :(

> I'm also trying out meson these days, as new version of systemd uses meson.

They've dropped autotools, right? I can imagine gstreamer will be the 
next to do that.

> I only checked this recipe of this series.
> Your other recipes also use '-'. Could you please double check if that's 
> correct?

I checked; it's correct. Sysprof is the only one which is using _ rather 
than - in options.

Alex

