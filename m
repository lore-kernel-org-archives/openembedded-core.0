Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SZoEJ-0004pr-Gb
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 21:06:47 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 8B7F5F81246; Wed, 30 May 2012 12:56:29 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id CAA27F81243;
	Wed, 30 May 2012 12:56:27 -0600 (MDT)
Message-ID: <4FC66D5B.7090201@mlbassoc.com>
Date: Wed, 30 May 2012 12:56:27 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1338368508.git.edwin.zhai@intel.com>
	<2255c64e0eb4a2b5b7f063dbc5ff421e606458c8.1338368508.git.edwin.zhai@intel.com>
	<1338396045.20169.162.camel@ted>
In-Reply-To: <1338396045.20169.162.camel@ted>
Subject: Re: [PATCH 1/1] webkit-gtk: Use glib as unicode backend to avoid browser crash
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
X-List-Received-Date: Wed, 30 May 2012 19:06:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-05-30 10:40, Richard Purdie wrote:
> On Wed, 2012-05-30 at 17:08 +0800, edwin.zhai@intel.com wrote:
>> From: Zhai Edwin<edwin.zhai@intel.com>
>>
>> webkit-gtk depends on ICU for the unicode, but ICU is not safe when build and
>> target system owns different endian. ICU's community is not responsive to make
>> a patch for this, so glib is used as work around here.
>>
>> [YOCTO #1570] got fixed
>>
>> Signed-off-by: Zhai Edwin<edwin.zhai@intel.com>
>> ---
>>   meta/recipes-sato/webkit/webkit-gtk_svn.bb |   10 +++++++++-
>>   1 files changed, 9 insertions(+), 1 deletions(-)
>
> I've merged this however I'm not 100% happy with this as the final fix.
> I'd ask that:
>
> a) The bug remains open (re-prioritised appropriately) about the
> remaining issues that still exist in ICU
> b) We add something to the ICU recipe which stops it building when the
> endianess isn't correct (host matches target) so nobody can built it and
> have it not work.

Why not accept my patch that provides a working dataset?  I doubt
that you're ever going to get the ICU folks interested to the point
of fixing this correctly and this solves the problem without the
[IMO undesirable] side effect of using different libraries on
different architectures (for webkit-gtk).

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


