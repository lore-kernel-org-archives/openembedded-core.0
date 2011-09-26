Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8KMZ-00017G-C0
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 01:13:27 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Sep 2011 16:08:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,447,1312182000"; d="scan'208";a="67699329"
Received: from unknown (HELO [10.255.14.215]) ([10.255.14.215])
	by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2011 16:08:01 -0700
Message-ID: <4E8105D1.70409@linux.intel.com>
Date: Mon, 26 Sep 2011 16:08:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317068664.26109.95.camel@ted> <1317073889.26109.97.camel@ted>
In-Reply-To: <1317073889.26109.97.camel@ted>
Subject: Re: [PATCH] insane: Promote most warnings into QA errors by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Sep 2011 23:13:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2011 02:51 PM, Richard Purdie wrote:
> On Mon, 2011-09-26 at 21:24 +0100, Richard Purdie wrote:
>> We agreed a while back that we'd start ERRORing on QA issues, not just
>> WARNING about them. This patch changes the default QA levels to error
>> on everything except ldflag and useless rpath issues.
>>
>> It also stops giving out QA warnings about desktop files since it
>> adds noise to the build and until someone plans to seriously tackle
>> that problem, its pointless.
>>
>> We can promote the ldflag and rpath warnings too, when the issues
>> in OE-Core are resolved (they're mostly there now, jsut a few more
>> to go).
>>
>> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>> ---
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index addb9ac..62935c3 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -99,9 +99,9 @@ def package_qa_get_machine_dict():
>>          }
>>
>>
>> -WARN_QA ?= "dev-so rpaths debug-deps dev-deps debug-files arch la2 pkgconfig desktop la ldflags perms useless-rpaths"
>> -ERROR_QA ?= ""
>> -#ERROR_QA ?= "rpaths debug-deps dev-deps debug-files arch pkgconfig perms"
>> +# Currently not being used by default "desktop"
>> +WARN_QA ?= "ldflags useless-rpaths"
>> +ERROR_QA ?= "dev-so rpaths debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
>>
>
> Further testing shows we may not be ready to move rpath to ERROR_QA
> quite yet but the rest of the proposal still stands...
>
How bad is the breakage in a world build?

I will probably attempt this later or tomorrow.

Sau!
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


