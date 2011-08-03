Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Qohhi-0008S1-JQ
	for openembedded-core@openembedded.org; Wed, 03 Aug 2011 22:06:10 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 536C1166050E; Wed,  3 Aug 2011 14:01:48 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4F962166050C;
	Wed,  3 Aug 2011 14:01:47 -0600 (MDT)
Message-ID: <4E39A92B.5040207@mlbassoc.com>
Date: Wed, 03 Aug 2011 14:01:47 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc15 Thunderbird/3.1.10
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>
References: <1312389206-15422-1-git-send-email-msm@freescale.com>
	<4E397AE8.5020707@mlbassoc.com>
	<CAEsOVNf5eZ6PLkqw_Ya8XEEzr1uQprGXOeqc4aS7BCcja7Bsmw@mail.gmail.com>
In-Reply-To: <CAEsOVNf5eZ6PLkqw_Ya8XEEzr1uQprGXOeqc4aS7BCcja7Bsmw@mail.gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
Subject: Re: [yocto] [PATCH] Update intltool to set perl shebang correctly for installed tools
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
X-List-Received-Date: Wed, 03 Aug 2011 20:06:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-08-03 13:52, McClintock Matthew-B29882 wrote:
> (Sorry if this get sent twice...)
>
> On Wed, Aug 3, 2011 at 11:44 AM, Gary Thomas<gary@mlbassoc.com>  wrote:
>> On 2011-08-03 10:33, Matthew McClintock wrote:
>>>
>>> Several installed scripts set the perl shebang that is too long
>>> which can cause failures on certian older bash versions.
>>
>> How does the change below correspond to this comment?  It's not
>> clear [at least to me] how changing that environment variable
>> affects shebang constructs.  Can you give a more thorough explanation?
>
> The scripts intltool-{update,etc} installed in sysroot end up having
> *really* long shebangs without this change. On older distros this
> causes the intltool scripts to just fail usually during the configure
> task. intltools recipe itself will
> build and install fine. However, when a package that requires
> intltool's is being configured they will all fail withing invoking
> intltools.

This much was already clear from your explanation - the "what happens and
why it needs fixing" part.

What I don't see is the "why" - why does defining PERL vs PERL_virtclass-native
have this effect?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


