Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3BBB07824F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 09:01:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jan 2018 01:01:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,334,1511856000"; 
   d="scan'208";a="9286210"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 09 Jan 2018 01:01:39 -0800
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180108160021.4715-1-ross.burton@intel.com>
	<20180108160021.4715-7-ross.burton@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d4370891-2188-4ad0-5abe-1aec68beeed0@linux.intel.com>
Date: Tue, 9 Jan 2018 11:01:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180108160021.4715-7-ross.burton@intel.com>
Subject: Re: [PATCH 7/9] avahi: remove explicit avahi-dev RDEPENDS
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
X-List-Received-Date: Tue, 09 Jan 2018 09:01:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/08/2018 06:00 PM, Ross Burton wrote:

> -RRECOMMENDS_avahi-dev = "expat-dev libcap-dev libdaemon-dev dbus-dev glib-2.0-dev update-rc.d-dev"
> -RRECOMMENDS_avahi-dev_append_libc-glibc = " gettext-dev"
> -
> -RRECOMMENDS_avahi-dev[nodeprrecs] = "1"
> -

Cool, I was wondering about the necessity of this stuff.

Thanks for cleaning up, we can also perhaps look into splitting 
gettext-native recipe into a sane set of parts, and use them in a 
carefully targeted way, rather than the current -minimal-native 
approach, which is hackish.


Alex

