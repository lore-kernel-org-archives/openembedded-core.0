Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 264FB7317E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 14:50:17 +0000 (UTC)
Received: (qmail 25495 invoked by uid 1003); 9 Feb 2016 14:50:17 -0000
Received: from unknown (HELO ?192.168.11.140?)
	(philip@opensdr.com@108.44.110.59)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	9 Feb 2016 14:50:17 -0000
To: Joshua G Lock <joshua.g.lock@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1454270130-11287-1-git-send-email-akuster808@gmail.com>
	<1454885003.27087.344.camel@linuxfoundation.org>
	<1454944971.3396.8.camel@linux.intel.com>
From: Philip Balister <philip@balister.org>
Message-ID: <56B9FCA8.7010303@balister.org>
Date: Tue, 9 Feb 2016 09:50:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1454944971.3396.8.camel@linux.intel.com>
Subject: Re: Stable branch rules [Was: Re: [PATCH][jethro] glibc-locale: fix QA warning]
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
X-List-Received-Date: Tue, 09 Feb 2016 14:50:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 02/08/2016 10:22 AM, Joshua G Lock wrote:
> On Sun, 2016-02-07 at 22:43 +0000, Richard Purdie wrote:
>> On Sun, 2016-01-31 at 11:55 -0800, Armin Kuster wrote:
>>> From: Armin Kuster <akuster@mvista.com>
>>>
>>> WARNING: QA Issue: glibc-locale: /glibc-binary-localedata-sd
>>> -in/usr/lib/locale/sd_IN/LC_CTYPE is owned by uid 1000, which is
>>> the
>>> same as the user running bitbake. This may be due to host
>>> contamination [host-user-contaminated]
>>>
>>> fix type
>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>> ---
>>>  meta/recipes-core/glibc/glibc-locale.inc | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Enough is enough.
>>
>> I cannot tell whether these patches are in master or not or whether
>> master needs them or not. Master needs this one, its not in master,
>> its
>> only being proposed for jethro. Its a mess.
>>
>> I am therefore not taking any more stable branch patches at all until
>> we amend the stable branch rules to state that pull requests and
>> patches clearly state which branches need a fix, or clearly state why
>> they don't.
> 
> I made an attempt at starting to documenting that requirement:
> https://wiki.yoctoproject.org/wiki/index.php?title=Stable_branch_mainte
> nance&diff=17480&oldid=17028
> 
> 'Patches' welcome.

Does this belong on the Yocto Project or OpenEmbedded wikis? Hunting
both is getting annoying.

Philip

> 
> Regards,
> 
> Joshua
> 

