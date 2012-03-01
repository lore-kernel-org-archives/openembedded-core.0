Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1S37n6-00085o-Jm
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 16:19:36 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 4ABB2F812EF; Thu,  1 Mar 2012 08:11:08 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 88096F812EE;
	Thu,  1 Mar 2012 08:11:07 -0700 (MST)
Message-ID: <4F4F918B.4010404@mlbassoc.com>
Date: Thu, 01 Mar 2012 08:11:07 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1330612994-26329-1-git-send-email-gary@mlbassoc.com>
	<1330613948.31767.12.camel@ted>
In-Reply-To: <1330613948.31767.12.camel@ted>
Subject: Re: [PATCH] initscripts: Properly handle new timestamp format
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
X-List-Received-Date: Thu, 01 Mar 2012 15:19:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-03-01 07:59, Richard Purdie wrote:
> On Thu, 2012-03-01 at 07:43 -0700, Gary Thomas wrote:
>> Recent changes have attempted to make consistant use of /etc/timestamp
>> In particular
>>    5aab665 initscripts: Make /etc/timestamp consistent again.
>>    173a48f image.bbclass: Ensure timestamp matches format used in initscripts after recent changes
>>
>> This new format can cause problems as the value is too large for
>> most [32 bit] machines.  Work around this by only comparing the
>> YYYYMMDD portion (which does fit in 32 bits).  Also, the new format
>> is not directly compatible with the 'date' command line, so it
>> must be reformatted for use.
>>
>> Signed-off-by: Gary Thomas<gary@mlbassoc.com>
>> ---
>>   .../initscripts/initscripts-1.0/bootmisc.sh        |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> I merged the changes to busybox in relation to this. Is this patch still
> needed?

Let me check - I didn't see the related busybox change.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


