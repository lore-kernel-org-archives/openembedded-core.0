Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id C74A47857D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 18:21:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jan 2018 10:21:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,364,1511856000"; d="scan'208";a="195769599"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 15 Jan 2018 10:21:39 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
References: <20180115172530.D4C50440002@auh.yoctoproject.org>
	<52a32ba3-ed28-976f-f7a1-f296ba86918b@linux.intel.com>
Message-ID: <ec3a3f09-6047-b703-287b-f8e837ffccc2@linux.intel.com>
Date: Mon, 15 Jan 2018 20:21:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <52a32ba3-ed28-976f-f7a1-f296ba86918b@linux.intel.com>
Subject: Re: [AUH] Upgrade status: 2018-01-15
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
X-List-Received-Date: Mon, 15 Jan 2018 18:21:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/15/2018 07:38 PM, Alexander Kanavin wrote:
> On 01/15/2018 07:25 PM, alexander.kanavin@linux.intel.com wrote:
>> Recipe upgrade statistics:
>>
>>      * Succeeded: 1
>>          iso-codes, 3.77, Alexander Kanavin <alexander.kanavin@intel.com>
> 
> Yay!
> 
> Dear all, please bear with these emails, there'll be a few more. I'm now 
> setting up AUH to run in an automated, unattended fashion; it's gonna be 
> awesome.

Alright. In about 10 minutes, a cron job will start that will attempt 
upgrading *all* of oe-core recipes, and results (both successful, with 
patches, and failures, with error messages) will be mailed to respective 
maintainers. This will be repeated on the 15th of every odd-numbered 
month (so six times a year).

Please take those emails not as irritating noise, but as a polite 
reminder to keep oe-core up-to-date. Suggestions for improvements also 
appreciated.

(I've done my best to test this, but it may of course also fail in 
various spectacular ways).

Alex

