Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZRdL-0000We-Ni
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:54:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHp0kY000652
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:51:00 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 22 Jun 2011 10:51:00 -0700
Message-ID: <4E022B83.6030608@windriver.com>
Date: Wed, 22 Jun 2011 12:50:59 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308763995.git.mark.hatle@windriver.com>	<9b4ad047cdca6bcdc7fbb851e83bcb0440bb5b6f.1308763995.git.mark.hatle@windriver.com>
	<FAAA265A-D558-42D6-8F5B-82341F619274@dominion.thruhere.net>
In-Reply-To: <FAAA265A-D558-42D6-8F5B-82341F619274@dominion.thruhere.net>
Subject: Re: [PATCH 13/40] python: Switch to using the default	-dbg package
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
X-List-Received-Date: Wed, 22 Jun 2011 17:54:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Working on fixing this.  Until I do, skip this commit in any pull.  Thanks!

--Mark

On 6/22/11 12:38 PM, Koen Kooi wrote:
> 
> Op 22 jun 2011, om 19:36 heeft Mark Hatle het volgende geschreven:
> 
>> Python was missing a lot of debug information.  Switch to use the default
>> -dbg package.  Also add some additional debug information to the -dbg package.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>> .../python/python-2.6-manifest.inc                 |    8 ++------
>> meta/recipes-devtools/python/python.inc            |    2 +-
>> meta/recipes-devtools/python/python_2.6.6.bb       |    4 ++--
>> 3 files changed, 5 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/python/python-2.6-manifest.inc b/meta/recipes-devtools/python/python-2.6-manifest.inc
>> index e4e503c..e3ebe41 100644
>> --- a/meta/recipes-devtools/python/python-2.6-manifest.inc
>> +++ b/meta/recipes-devtools/python/python-2.6-manifest.inc
>> @@ -5,9 +5,9 @@
> 
> 
> The top of this file says:
> 
> # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



