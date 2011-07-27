Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Qm6fI-0004sO-CR
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 18:08:56 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 048091660172; Wed, 27 Jul 2011 10:04:41 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 0783E166012C;
	Wed, 27 Jul 2011 10:04:41 -0600 (MDT)
Message-ID: <4E303718.7050706@mlbassoc.com>
Date: Wed, 27 Jul 2011 10:04:40 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc15 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311708150-24226-1-git-send-email-msm@freescale.com>	<1311708150-24226-2-git-send-email-msm@freescale.com>
	<1311778995.2193.1.camel@scimitar>
In-Reply-To: <1311778995.2193.1.camel@scimitar>
Subject: Re: [PATCH] Update TERMCMD message to align with previous change
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
X-List-Received-Date: Wed, 27 Jul 2011 16:08:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-07-27 09:03, Joshua Lock wrote:
> On Tue, 2011-07-26 at 14:22 -0500, Matthew McClintock wrote:
>> A previous patch changed the default TERM to use xterm. This updates
>> local.conf.sample to match the change
>>
>> Signed-off-by: Matthew McClintock<msm@freescale.com>
>
> Signed-off-by: Joshua Lock<josh@linux.intel.com>
>
> We should probably change the suggested / commented TERMCMD to be
> something other than KONSOLE too, as that doesn't work so well for
> KDE4...

or remotely via SSH tunnel

xterm does work fine via SSH, so I've changed to that.

>> ---
>>   meta-yocto/conf/local.conf.sample |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
>> index 499c48e..7a0fc89 100644
>> --- a/meta-yocto/conf/local.conf.sample
>> +++ b/meta-yocto/conf/local.conf.sample
>> @@ -205,7 +205,7 @@ ENABLE_BINARY_LOCALE_GENERATION = "1"
>>   # out if that is desired
>>   NO32LIBS = "1"
>>
>> -# If you do not use (or have installed) gnome-terminal you will need to
>> +# If you do not use (or have installed) xterm you will need to
>>   # uncomment these variables and set them to the terminal you wish to use
>>   # when resolving patches which cannot be applied
>>   # Supported shell prefixes for *_TERMCMD and *_TERMCMDRUN ARE:
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


