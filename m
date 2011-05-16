Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QM45n-0001ci-8Y
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 22:08:39 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id B942C166019E; Mon, 16 May 2011 14:05:46 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 460EC1660129;
	Mon, 16 May 2011 14:05:45 -0600 (MDT)
Message-ID: <4DD18399.2050506@mlbassoc.com>
Date: Mon, 16 May 2011 14:05:45 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1305563063.2429.65.camel@phil-desktop>
	<1305575842.3424.105.camel@rex>
In-Reply-To: <1305575842.3424.105.camel@rex>
Subject: Re: LIC_FILES_CHKSUM fatal?
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
X-List-Received-Date: Mon, 16 May 2011 20:08:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2011 01:57 PM, Richard Purdie wrote:
> On Mon, 2011-05-16 at 17:24 +0100, Phil Blundell wrote:
>> This change, from commit d2d5456cd3b3bd3e52a5dedccca4d46e3a7986d1:
>>
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index 225530a..71ed5b6 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -349,7 +349,7 @@ def package_qa_check_license(workdir, d):
>>           # just throw a warning now. Once licensing data in entered for enough of the recipes,
>>           # this will be converted into error and False will be returned.
>>           bb.error(pn + ": Recipe file does not have license file information (LIC_FILES_CHKSUM)")
>> -        return True
>> +        return False
>>
>> means that, contrary to what the comment says, lack of LIC_FILES_CHKSUM
>> is now a fatal error.  Was this a deliberate change or an oversight?
>>
>
> It was a deliberate change, the comment was missed in the change though.
>
> Yes, its annoying and we can have some way to turn it off but for at
> least the core, having them present is a good thing.

Even if this check doesn't treat this as fatal, my experience has
been that do_configure() fails if LIC_FILES_CHKSUM is missing.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


