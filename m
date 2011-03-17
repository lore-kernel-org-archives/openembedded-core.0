Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q01v7-0005fM-ML
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 02:22:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2H1Kme4029100
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Mar 2011 18:20:48 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 16 Mar 2011 18:20:47 -0700
Message-ID: <4D8161EE.4050809@windriver.com>
Date: Wed, 16 Mar 2011 20:20:46 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1300309327.git.nitin.a.kamble@intel.com>
	<4D815D7F.3070304@mlbassoc.com>
In-Reply-To: <4D815D7F.3070304@mlbassoc.com>
X-Originating-IP: [172.25.36.231]
Cc: poky@yoctoproject.org
Subject: Re: [poky] [PATCH 0/2] GPLv2 versions of m4 & bison
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
X-List-Received-Date: Thu, 17 Mar 2011 01:22:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Yes, these are alternative versions purely for licensing.  There is a target
"poky-image-basic" that is our goal for allowing both (modern) licensing, and
non-(L)GPLv3 licensing.  Anything outside (above and beyond) that is not part of
the plan.

The goal is to allow people to be able to produce a "basic", command line
oriented system that does not require (L)GPLv3 components.

(X is not part of the basic image, but X should be fine as well, since it's the
MIT-X licensing...)

--Mark

On 3/16/11 8:01 PM, Gary Thomas wrote:
> On 03/16/2011 03:03 PM, Nitin A Kamble wrote:
>> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>>
>> These commits adds GPLv2 versions of m4&  bison recipes.
>>
>> Pull URL: git://git.pokylinux.org/poky-contrib.git
>>    Branch: nitin/misc
>>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
>>
>> Thanks,
>>      Nitin A Kamble<nitin.a.kamble@intel.com>
>> ---
>>
>>
>> Nitin A Kamble (2):
>>    bison: bring back GPLv2 version 2.3 of bison recipe
>>    m4: bring back GPLv2 version 1.4.9 of m4 recipe
>>
>>   .../bison/bison/bison-2.3_m4.patch                 |  590 ++++++++++++++++++++
>>   meta/recipes-devtools/bison/bison_2.3.bb           |   35 ++
>>   meta/recipes-devtools/m4/m4-native_1.4.9.bb        |   12 +
>>   .../m4/m4/fix_for_circular_dependency.patch        |   75 +++
>>   meta/recipes-devtools/m4/m4_1.4.9.bb               |   18 +
>>   5 files changed, 730 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/recipes-devtools/bison/bison/bison-2.3_m4.patch
>>   create mode 100644 meta/recipes-devtools/bison/bison_2.3.bb
>>   create mode 100644 meta/recipes-devtools/m4/m4-native_1.4.9.bb
>>   create mode 100644 meta/recipes-devtools/m4/m4/fix_for_circular_dependency.patch
>>   create mode 100644 meta/recipes-devtools/m4/m4_1.4.9.bb
>>
> 
> Was this purely for licensing reasons?  (just asking since there was no discussion on this list)
> 



