Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C6335782A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 12:46:55 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Oct 2017 05:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; d="scan'208";a="168389414"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 27 Oct 2017 05:46:55 -0700
To: Philip Balister <philip@balister.org>, Fan Xin <fan.xin@jp.fujitsu.com>,
	openembedded-core@lists.openembedded.org,
	Michael Halstead <michael@yoctoproject.org>
References: <1509069613-5005-1-git-send-email-fan.xin@jp.fujitsu.com>
	<59d43cd3-d34e-ac77-5016-34d1dd3f35f5@balister.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ef6661a5-5910-41a3-1240-9f898d294e40@linux.intel.com>
Date: Fri, 27 Oct 2017 15:46:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <59d43cd3-d34e-ac77-5016-34d1dd3f35f5@balister.org>
Subject: Re: [PATCH] curl: update to 7.56.1
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
X-List-Received-Date: Fri, 27 Oct 2017 12:46:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/27/2017 01:16 PM, Philip Balister wrote:
> Can you also update the commit message to show the CVE entries in a
> standard format? We are trying to collect commits that resolve CVE's on
> the yocto-security list.
> 
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Example:_CVE_patch_header
> 
> For this mentioning the CVE without the .patch might help. cc'ing
> Michael in case he his suggesting to help the hook.

For this to work, recipe maintainers need to do this manual work 
consistently and reliably across all version updates, and I simply can't 
see it happening.

You should make the tooling work so that it looks at versions in 
addition to cve tags. So that this curl 7.54->7.56.1 commit resolves to 
the list of CVEs fixed in 7.56 automatically, via some database lookup.

Alex

