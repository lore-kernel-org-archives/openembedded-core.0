Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RYKtb-0003fa-8W
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 18:03:03 +0100
Received: (qmail 14729 invoked by uid 1003); 7 Dec 2011 16:49:34 -0000
Received: from unknown (HELO ?192.168.1.104?) (philip@opensdr.com@96.240.172.5)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	7 Dec 2011 16:49:34 -0000
Message-ID: <4EDF991D.1010601@balister.org>
Date: Wed, 07 Dec 2011 11:49:33 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323273568-31152-1-git-send-email-philip@balister.org>
	<1323276042.30601.42.camel@ted>
In-Reply-To: <1323276042.30601.42.camel@ted>
X-Enigmail-Version: 1.1.2
Subject: Re: [PATCH 1/2] boost : Add icu to DEPENDS to fix a build failure.
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
X-List-Received-Date: Wed, 07 Dec 2011 17:03:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/07/2011 11:40 AM, Richard Purdie wrote:
> On Wed, 2011-12-07 at 10:59 -0500, Philip Balister wrote:
>> Part of boost needs libraries from icu. Without this, either the build or
>> image construction fails. (I forget exactly which)
> 
> That is a fairly heavy dependency to add and we're not seeing builds or
> images fail due to this being missing as far as I can tell. Do you have
> any further information on this?

Googling gets me this page:

http://www.boost.org/doc/libs/1_41_0/libs/regex/doc/html/boost_regex/ref/non_std_strings/icu/intro.html

I'm no expert at this unicode stuff, maybe we need to nuild boost
without unicode?

Philip


> 
> Cheers,
> 
> Richard
> 
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>>  meta/recipes-support/boost/boost.inc |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
>> index fecdb97..a1499f6 100644
>> --- a/meta/recipes-support/boost/boost.inc
>> +++ b/meta/recipes-support/boost/boost.inc
>> @@ -6,7 +6,7 @@
>>  DESCRIPTION = "Free peer-reviewed portable C++ source libraries"
>>  HOMEPAGE = "http://www.boost.org/"
>>  SECTION = "libs"
>> -DEPENDS = "boost-native zlib"
>> +DEPENDS = "boost-native zlib icu"
>>  DEPENDS_virtclass-native = ""
>>  LICENSE = "Boost"
>>  
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


