Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id E76746E413
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 09:11:51 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BBEFDF811DC; Fri, 14 Mar 2014 03:11:52 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 05786F811DA;
	Fri, 14 Mar 2014 03:11:52 -0600 (MDT)
Message-ID: <5322C7DE.3070202@mlbassoc.com>
Date: Fri, 14 Mar 2014 03:11:58 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1394710133-18659-1-git-send-email-valentin.popa@intel.com>
	<5322B25F.7040301@linux.intel.com>
In-Reply-To: <5322B25F.7040301@linux.intel.com>
X-Enigmail-Version: 1.5.2
Subject: Re: [PATCH] Set ac_cv_sizeof_ssize_t
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
X-List-Received-Date: Fri, 14 Mar 2014 09:11:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2014-03-14 01:40, Saul Wold wrote:
> On 03/13/2014 04:28 AM, Valentin Popa wrote:
>> Set ac_cv_sizeof_ssize_t for mips64;
>> mips-common will not overwrite it.
>>
> 
> This really needed a little more about "why" this change is needed.

Also, the email subject is missing the 'mips64-linux: ' prefix which is the
preferred form.

>> [YOCTO #5935]
>>
>> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
>> ---
>>   meta/site/mips64-linux | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
>> index 4449c96..ed0fbbe 100644
>> --- a/meta/site/mips64-linux
>> +++ b/meta/site/mips64-linux
>> @@ -35,6 +35,7 @@ glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
>>   ac_cv_alignof_guint32=4
>>   ac_cv_alignof_guint64=8
>>   ac_cv_alignof_unsigned_long=8
>> +ac_cv_sizeof_ssize_t=8
>>
>>   # libpcap
>>   ac_cv_linux_vers=${ac_cv_linux_vers=2}
>>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

