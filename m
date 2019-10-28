Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EEC057DF23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 16:44:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 09:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="193314545"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by orsmga008.jf.intel.com with ESMTP; 28 Oct 2019 09:44:18 -0700
To: openembedded-core@lists.openembedded.org
References: <f6132fd4-18d0-aba5-96d5-c259928a113d@mailbox.org>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <15b9c8e2-4ccc-1564-af19-fe60f049cf2e@intel.com>
Date: Mon, 28 Oct 2019 16:44:17 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f6132fd4-18d0-aba5-96d5-c259928a113d@mailbox.org>
Subject: Re: GStreamer 1.0 meson build transition
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
X-List-Received-Date: Mon, 28 Oct 2019 16:44:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 26/10/2019 11:57, Carlos Rafael Giani wrote:
> I think it would make sense to not try to get a meson based build done 
> for GStreamer 1.16, and instead target it for 1.18. Minor version 
> upgrades like 1.16.0 -> 1.16.1 aren't expected to bring major changes 
> with them, while major upgrades like 1.16 -> 1.18 are generally known to 
> potentially bring such changes. Also, there's a chance that new patches 
> might make their way into 1.18 before its release.

That's fine, but there is value in doing the migration separately to the 
1.16->1.18 upgrade: there should be no difference to the installed files 
which makes verification easier.

Basically I've no opinion on when the meson migration is merged, as you 
say it's not trivial, but please have it as a separate commit to an upgrade.

Thanks,
Ross

