Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SB5KV-0004aR-Su
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 15:19:00 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 558D3F81240; Fri, 23 Mar 2012 08:10:05 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id EC29DF8123F;
	Fri, 23 Mar 2012 08:09:59 -0600 (MDT)
Message-ID: <4F6C8437.8020808@mlbassoc.com>
Date: Fri, 23 Mar 2012 08:09:59 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F6C7DF6.2060805@mlbassoc.com> <1332511592.9740.419.camel@ted>
In-Reply-To: <1332511592.9740.419.camel@ted>
Subject: Re: Python recipe
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
X-List-Received-Date: Fri, 23 Mar 2012 14:19:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-03-23 08:06, Richard Purdie wrote:
> On Fri, 2012-03-23 at 07:43 -0600, Gary Thomas wrote:
>> Just curious, what is this line doing in .../recipes-devtools/python/python_2.7.2.bb
>>     DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
>>
>> n.b. I know what it does, I just don't know why it's there in
>> a "core" recipe.
>
> Is the sharprom distro still active? I doubt it uses OE-Core? I think
> that can be removed.

Even if it is still active, this should go in a .bbappend, don't you think?

I have another change to this recipe - should I send them as two separate patches?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


