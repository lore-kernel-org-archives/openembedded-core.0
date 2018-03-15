Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 810B660069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 16:32:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2018 09:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,311,1517904000"; d="scan'208";a="35299754"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 15 Mar 2018 09:32:06 -0700
To: Derek Straka <derek@asterius.io>, openembedded-core@lists.openembedded.org
References: <1520806702-5879-1-git-send-email-derek@asterius.io>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0fbe649e-846b-0446-64c1-587fa1221a9f@linux.intel.com>
Date: Thu, 15 Mar 2018 18:25:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520806702-5879-1-git-send-email-derek@asterius.io>
Subject: Re: [PATCHv2] python3: update to version 3.5.5 to fix security issues
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
X-List-Received-Date: Thu, 15 Mar 2018 16:32:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/12/2018 12:18 AM, Derek Straka wrote:
> License-Update: checksum change is due to bump in copyright year
> 
> Resolves CVE-2017-1000158 and other potential security issues
> 
> See https://docs.python.org/3.5/whatsnew/changelog.html#python-3-5-5-final
> 
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>   meta/recipes-devtools/python/{python3_3.5.4.bb => python3_3.5.5.bb} | 6 +++---

python3-native should be updated at the same time, please do so.

Alex

