Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 613C27FF4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 12:42:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2019 04:42:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,329,1571727600"; d="scan'208";a="212694507"
Received: from kdobros-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.33.194])
	by fmsmga007.fm.intel.com with ESMTP; 18 Dec 2019 04:42:14 -0800
To: openembedded-core@lists.openembedded.org
References: <1576663070-30914-1-git-send-email-yamane07ynct@gmail.com>
	<1576663070-30914-3-git-send-email-yamane07ynct@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <43a4e3e6-6304-da8d-2e2b-c6114ed4d4fe@intel.com>
Date: Wed, 18 Dec 2019 12:42:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1576663070-30914-3-git-send-email-yamane07ynct@gmail.com>
Subject: Re: [PATCH v3 3/3] u-boot: Move B from u-boot.inc to u-boot-common.inc
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
X-List-Received-Date: Wed, 18 Dec 2019 12:42:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 18/12/2019 09:57, Daisuke Yamane wrote:
> Use the same value of B between u-boot, u-boot-fw-utils and u-boot-tools.
> This patch also enable the out-of-tree builds of u-boot-fw-utils and
> u-boot-tools actually.

If you're doing out of tree builds you need to ensure that ${B} is empty.

After setting ${B}, add:

do_configure[cleandirs] = "${B}"

Ross

