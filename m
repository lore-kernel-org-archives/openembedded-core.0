Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-01.prod.phx3.secureserver.net
	(p3plsmtpa09-01.prod.phx3.secureserver.net [173.201.193.230])
	by mail.openembedded.org (Postfix) with ESMTP id C803D60144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 11:35:42 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa09-01.prod.phx3.secureserver.net with 
	id vPbd1o00N0BVjqb01Pbero; Thu, 25 Sep 2014 04:35:41 -0700
Message-ID: <5423FE09.6020002@pabigot.com>
Date: Thu, 25 Sep 2014 06:35:37 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1411148655-5500-1-git-send-email-pab@pabigot.com>
	<CAJTo0LY0a9_Rb5Eyq3b20ML89YcVkNS0N=NnXL-zkUQescGu3Q@mail.gmail.com>
	<5423F97B.6020705@pabigot.com>
	<1761684.on3aH1HNt7@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1761684.on3aH1HNt7@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] git: add Git perl module to perltools package
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
X-List-Received-Date: Thu, 25 Sep 2014 11:35:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2014 06:17 AM, Paul Eggleton wrote:
> On Thursday 25 September 2014 06:16:11 Peter A. Bigot wrote:
>> I'm at a loss here. The probable fix is clear and I can send it as 
>> V2, but I can't test it: no matter what I do, "bitbake git-nativesdk" 
>> succeeds after attemping 0 tasks of which 0 were required. This with 
>> a completely clean build environment, no shared state enabled, 
>> uninstalling git from the development machine, and removing 
>> git-native from meta's ASSUME_PROVIDED (which allowed git-native to 
>> build, but then said nothing PROVIDES git-nativesdk). 
> Try: bitbake nativesdk-git

Thanks; that appears to be more productive.

Shouldn't I have gotten the nothing PROVIDES warning for git-nativesdk 
even with git-native in ASSUME_PROVIDED?  I'm smelling a missing 
end-of-line anchor in a regex somewhere.

Peter

