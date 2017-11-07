Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8434D78483
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 15:20:17 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Nov 2017 07:20:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,359,1505804400"; d="scan'208";a="173105630"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 07 Nov 2017 07:20:12 -0800
To: Paul Eggleton <paul.eggleton@intel.com>
References: <499138bd-32cc-1487-e36e-fc4e5aceb4b2@linux.intel.com>
	<14953303.KfuyF98Oh2@peggleto-mobl.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a01ffbee-b133-0481-9836-11239fad8294@linux.intel.com>
Date: Tue, 7 Nov 2017 17:20:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <14953303.KfuyF98Oh2@peggleto-mobl.ger.corp.intel.com>
Cc: Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: automatic recipe upgrades - making them better and sweeter
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
X-List-Received-Date: Tue, 07 Nov 2017 15:20:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/06/2017 10:04 PM, Paul Eggleton wrote:
>> 3) 'devtool finish' currently does not handle the recipe upgrade
>> situation well: the new recipe and patches are placed side by side with
>> the current recipe. The old stuff should be removed, and a tentative
>> commit should be created. So maybe add a 'devtool finish-upgrade'.
> 
> That's not what's supposed to happen - it should already be deleting the
> original files (it takes a record of the copied files when you run devtool
> upgrade, and then when you run devtool finish it deletes those and moves the
> new ones across from the workspace). If that's not working it's a bug and I
> would appreciate a reproducer. I'd certainly prefer that we keep to one finish
> command that does its best to "do the right thing" depending on the situation.

For me it happens every time. I run 'devtool finish <recipe> ../meta' 
and while the new files are placed into the correct dir in the layer, 
the old ones all remain (which is especially annoying if I then need to 
manually sort the added/deleted patch files).

Can you run a quick check to see if it happens on your side? Something 
trivial, like ffmpeg would do. I can then file a bug.

Also, there shouldn't be a need to specify the destination at all, if 
the recipe is modified or upgraded.


Alex


