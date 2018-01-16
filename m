Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E0A6660102
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 13:28:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jan 2018 05:29:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,368,1511856000"; d="scan'208";a="166494332"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 16 Jan 2018 05:28:59 -0800
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180116132559.27794-1-ross.burton@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ebe30555-9aa7-b578-b63d-f507dbabe30b@linux.intel.com>
Date: Tue, 16 Jan 2018 15:29:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180116132559.27794-1-ross.burton@intel.com>
Subject: Re: [RFC PATCH] cmake: use Ninja backend instead of Make
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
X-List-Received-Date: Tue, 16 Jan 2018 13:28:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/16/2018 03:25 PM, Ross Burton wrote:
> The Ninja backend is faster than Make for large projects (takes three minutes
> off webkitgtk:do_compile for me), so use it by default.

You do know why Ninja was invented in the first place, right? :)

http://neugierig.org/software/chromium/notes/2011/02/ninja.html

Alex

