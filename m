Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC8D77C05
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 05:02:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2017 22:02:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,193,1488873600"; d="scan'208";a="1134780150"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2017 22:02:50 -0700
To: openembedded-core@lists.openembedded.org, zhixiong.chi@windriver.com
References: <1491994341-28659-1-git-send-email-zhixiong.chi@windriver.com>
	<CAHiDW_E2xCAED+8kCde3w3sNyFZa5w-96VfN-+kbd0+4HjmiEQ@mail.gmail.com>
	<58EEE028.5000606@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a274ed9b-010d-f890-2c3c-064e6e1bbcc2@linux.intel.com>
Date: Thu, 13 Apr 2017 08:02:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <58EEE028.5000606@windriver.com>
Subject: Re: [PATCH] gnome-common: add EXTRA_OECONF "--with-autoconf-archive"
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
X-List-Received-Date: Thu, 13 Apr 2017 05:02:50 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/13/2017 05:19 AM, Zhixiong Chi wrote:
>> autoconf-archive is not in oe-core, is it?
>>
>
> Yes,it is.
> As Alex said, it shouldn't depend the recipe from the other layers.
> I will try to move autoconf-archive into oe-core next step.

First research other ways to fix the issue please; we try to avoid 
unnecessary bloat in oe-core.

For example, how about deleting the conflicting macros from 
autoconf-archive, and making it depend on gnome-common? Or researching 
if we can get rid of gnome-common altogether in oe-core.

Alex

