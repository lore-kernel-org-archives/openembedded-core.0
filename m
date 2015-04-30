Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 703CD65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 13:16:05 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A2507F811E1; Thu, 30 Apr 2015 07:16:06 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 27289F81199;
	Thu, 30 Apr 2015 07:16:06 -0600 (MDT)
Message-ID: <55422B2C.6030300@mlbassoc.com>
Date: Thu, 30 Apr 2015 07:16:28 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1430391890-6083-1-git-send-email-ed.bartosh@linux.intel.com>
	<87egn12286.fsf@email.parenteses.org>
In-Reply-To: <87egn12286.fsf@email.parenteses.org>
Subject: Re: [PATCH] oeqa/utils: Allow ~ in bblayers
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
X-List-Received-Date: Thu, 30 Apr 2015 13:16:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-04-30 07:08, Mario Domenech Goulart wrote:
> Hi Ed,
>
> On Thu, 30 Apr 2015 14:04:50 +0300 Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
>
>> Bitbake can parse ~ in bblayer's paths.
>> Added this functionality to oeqa code.
>>
>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>> ---
>>   meta/lib/oeqa/utils/commands.py | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
>> index e8a467f..bc1dbb1 100644
>> --- a/meta/lib/oeqa/utils/commands.py
>> +++ b/meta/lib/oeqa/utils/commands.py
>> @@ -155,6 +155,8 @@ def get_test_layer():
>>       layers = get_bb_var("BBLAYERS").split()
>>       testlayer = None
>>       for l in layers:
>> +        if '~' in l:
>> +            l = os.path.expanduser(l)
>
> Is the "if '~' in l" test necessary?
>
> AFAIK, applying expanduser to a string that doesn't contain '~' will
> just return the string itself.

True, but why expand (create a new string, have to garbage-collect
the old one, etc) when it's not necessary?

>
>>           if "/meta-selftest" in l and os.path.isdir(l):
>>               testlayer = l
>>               break

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

