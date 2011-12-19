Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RclUh-0001Fp-LN
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 23:15:39 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Dec 2011 14:08:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="89249809"
Received: from rmoore1-desk5.amr.corp.intel.com (HELO [10.7.199.156])
	([10.7.199.156])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2011 14:08:35 -0800
Message-ID: <4EEFB5E1.7040204@linux.intel.com>
Date: Mon, 19 Dec 2011 14:08:33 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1323991540.git.josh@linux.intel.com>
	<35d3dfdcbc7291c8556e90d67a0f349c8f7caa03.1323991540.git.josh@linux.intel.com>
	<51B87129-E8A1-4358-BA5A-7090EA679925@dominion.thruhere.net>
In-Reply-To: <51B87129-E8A1-4358-BA5A-7090EA679925@dominion.thruhere.net>
Subject: Re: [PATCH 08/10] pango: clarify LICENSE is LGPL-2.0+
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
X-List-Received-Date: Mon, 19 Dec 2011 22:15:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 15/12/11 23:30, Koen Kooi wrote:
> 
> Op 16 dec. 2011, om 00:30 heeft Joshua Lock het volgende geschreven:
> 
>> Signed-off-by: Joshua Lock <josh@linux.intel.com>
>> ---
>> meta/recipes-graphics/pango/pango.inc |    2 +-
>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
>> index ff5a73a..922425c 100644
>> --- a/meta/recipes-graphics/pango/pango.inc
>> +++ b/meta/recipes-graphics/pango/pango.inc
>> @@ -7,7 +7,7 @@ core of text and font handling for GTK+-2.x."
>> HOMEPAGE = "http://www.pango.org/"
>> BUGTRACKER = "http://bugzilla.gnome.org"
>> SECTION = "libs"
>> -LICENSE = "LGPL"
>> +LICENSE = "LGPL-2.0+"
> 
> In the past we agreed to use LGLPv2+ for that, has that changed?

My bad, I saw the modified license handling code was mapping to SPDX
values and opted to just do that. You're right though, current
convention is the v notation.

I've respun the patch series.

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


