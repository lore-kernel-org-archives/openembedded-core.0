Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RQQxg-0002hK-Dh
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 22:54:36 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Nov 2011 13:48:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="75808968"
Received: from unknown (HELO [10.255.12.41]) ([10.255.12.41])
	by orsmga002.jf.intel.com with ESMTP; 15 Nov 2011 13:48:12 -0800
Message-ID: <4EC2DE1B.3070904@linux.intel.com>
Date: Tue, 15 Nov 2011 13:48:11 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1320709417.git.josh@linux.intel.com>
	<1320761883.10843.40.camel@ted> <4EC2B797.4010503@linux.intel.com>
	<1321393116.26881.229.camel@ted>
In-Reply-To: <1321393116.26881.229.camel@ted>
Subject: Re: [PATCH 00/12] Recipe upgrades, fixes and additions
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
X-List-Received-Date: Tue, 15 Nov 2011 21:54:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 15/11/11 13:38, Richard Purdie wrote:
> On Tue, 2011-11-15 at 11:03 -0800, Saul Wold wrote:
>> On 11/08/2011 06:18 AM, Richard Purdie wrote:
>>> On Mon, 2011-11-07 at 16:10 -0800, Joshua Lock wrote:
>>>> All,
>>>>
>>>> Here's a series of patches I developed whilst trying to play around with some
>>>> Clutter based software.
>>>>
>>>> The interesting pieces may be:
>>>> Clutter 1.8 series recipes - do we want/need to keep clutter 1.6 around?
>>>> Are we OK with continuing to namespace the clutter recipes by clutter
>>>> version?
>>>
>>> Yes, I think this makes sense.
>>
>> Why do we want to continue the clutter the namespace with version 
>> numbers?  Was this not for a past issue with mis-matched API/ABI?
>>
>> If that problem is solved, then next remove that version info.
> 
> Clutter produces libraries with a very specific namespace so you can
> parallel install clutter 1.4, 1.6 and 1.8. Applications compile against
> a given version of the library.
> 
> Having the major lib version as part of the package name therefore makes
> sense. There aren't a lot of projects that do this but this one does and
> it continues to make sense to namespace it accordingly.

With this knowledge "in hand" I've just re-read the 1.8 release notes[1]
and, for better or for worse, this is no longer the case:

"
* This version is API and ABI compatible with the current stable release
of Clutter.
* Installing the contents of this release will overwrite the files from
the installation of the current release of Clutter.
"

For point 1 I'd added a patch to PROVIDES = "clutter-1.6" but I'm not
sure what makes sense in the context of point 2.

Cheers,
Joshua

1.
http://www.clutter-project.org/blogs/archive/2011-09/clutter-1.8.0-stable-release
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


