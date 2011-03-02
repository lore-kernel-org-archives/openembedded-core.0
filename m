Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PuuLN-0006Me-Hc
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 23:16:29 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PuuJx-0007My-K9 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 14:15:01 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 2 Mar 2011 14:15:01 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Wed, 2 Mar 2011 14:15:00 -0800
Message-ID: <4D6EC150.8000208@mentor.com>
Date: Wed, 2 Mar 2011 15:14:40 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>	<1299055045-8096-2-git-send-email-raj.khem@gmail.com>
	<4D6E5425.5080107@windriver.com>
In-Reply-To: <4D6E5425.5080107@windriver.com>
X-OriginalArrivalTime: 02 Mar 2011 22:15:01.0464 (UTC)
	FILETIME=[462F2D80:01CBD927]
Subject: Re: [PATCH v2 1/7] sqlite3: Update version 3.7.3 -> 3.7.5
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
X-List-Received-Date: Wed, 02 Mar 2011 22:16:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2011 07:28 AM, Mark Hatle wrote:
> On 3/2/11 2:37 AM, Khem Raj wrote:
>> * Imported from OE commit a2c3af2d608b1b713018d688b00e03873a538993
>> * native version of 3.7.3 does not build
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>>   meta/recipes-support/sqlite/sqlite3.inc      |    7 ++++++-
>>   meta/recipes-support/sqlite/sqlite3_3.7.3.bb |    8 --------
>>   meta/recipes-support/sqlite/sqlite3_3.7.5.bb |   10 ++++++++++
>>   3 files changed, 16 insertions(+), 9 deletions(-)
>>   delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.3.bb
>>   create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.5.bb
>>
>> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
>> index 92c4930..a5e6782 100644
>> --- a/meta/recipes-support/sqlite/sqlite3.inc
>> +++ b/meta/recipes-support/sqlite/sqlite3.inc
>> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.sqlite.org"
>>   SECTION = "libs"
>>   PRIORITY = "optional"
>>   DEPENDS = "readline ncurses tcl-native"
>> -DEPENDS_virtclass-native = "tcl-native"
>> +DEPENDS_virtclass-native = "tcl-native ncurses-native"
>>   LICENSE = "PD"
>
> Sorry, I didn't notice this before either.  Is ncurses-native and tcl-native
> actually needed here?

tcl-native is required to build sqlite3 (target or native) as the build 
process itself uses tclsh to generate certain files.  I looked into this 
mid last month as part of a2c3af2d608b1b713018d688b00e03873a538993 in 
oe.dev (where I added readline/ncurses-native as they were in some but 
not all recipes).

-- 
Tom Rini
Mentor Graphics Corporation


