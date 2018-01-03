Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1932077DE7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 08:52:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2018 00:52:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,500,1508828400"; 
   d="scan'208";a="7052164"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 03 Jan 2018 00:52:49 -0800
To: Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1514934973-80578-1-git-send-email-juro.bystricky@intel.com>
	<1514934973-80578-2-git-send-email-juro.bystricky@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <fc0ebed5-abd0-9926-3c57-6443d7f22241@linux.intel.com>
Date: Wed, 3 Jan 2018 10:47:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1514934973-80578-2-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: Re: [PATCH 1/1] rpm_4.14.0: clamp timestamps by default
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
X-List-Received-Date: Wed, 03 Jan 2018 08:52:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/03/2018 01:16 AM, Juro Bystricky wrote:
> Improve reproducibility by making sure that timestamps
> in built rpms are not later than the value of SOURCE_DATE_EPOCH as
> found in the environment.
> Timestamps as usual when SOURCE_DATE_EPOCH is not set.

I'm not sure I understand the necessity of this. What matters for 
reproducibility is that rpms install the same files; why is it important 
that the rpm file itself has exactly same build time and is otherwise 
identical bit by bit?

A technicality: do not patch mnacros.in, set the macro directly from 
package_rpm.bbclass.

Alex

