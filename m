Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QvbbH-0005Lh-4F
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 23:00:03 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 1BB6416601AB; Mon, 22 Aug 2011 14:55:18 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4424F16601AB;
	Mon, 22 Aug 2011 14:55:16 -0600 (MDT)
Message-ID: <4E52C234.6080400@mlbassoc.com>
Date: Mon, 22 Aug 2011 14:55:16 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1313993805.git.wenzong.fan@windriver.com>
	<1313999777.7620.13.camel@localhost.localdomain>
	<4E52399C.9020608@mlbassoc.com> <4E52BB9A.2060603@linux.intel.com>
In-Reply-To: <4E52BB9A.2060603@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: new feature? (for "DL_DIR")
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
X-List-Received-Date: Mon, 22 Aug 2011 21:00:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-08-22 14:27, Saul Wold wrote:
> On 08/22/2011 04:12 AM, Gary Thomas wrote:
>> On 2011-08-22 01:56, Ni Qingliang wrote:
>>> Do we can assign all package be downloaded from the same path?
>>>
>>> I want setup one internal server to store the files in upstreamsources,
>>> and all developer's PC use it but not the original package address.
>>>
>>
>> Just add these lines to your .conf (I put them in my ${DISTRO}.conf):
>> # Provide pre-staged sources
>> SOURCE_MIRROR_URL ?= "file:///opt/amltd/poky/sources/"
>> INHERIT += "own-mirrors"
>>
>> Simply point SOURCE_MIRROR_URL at your file cache.
>>
> You could also use PREMIRRORS in the developer's local.conf, point
> PREMIRRORS for packages to your internal server (could be ftp, http or file when mounted via NFS).

But then you end up typing all the patterns for the various file types, etc.

own-mirrors does all that for you by creating a PREMIRRORS variable based
on the single SOURCE_MIRROR_URL

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


