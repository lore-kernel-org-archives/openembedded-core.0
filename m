Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 996B9600EA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 13:19:06 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v96DJ0UM022729
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 6 Oct 2017 15:19:01 +0200
Received: from [192.168.253.100] ([163.242.56.100])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id v96DIxoc008398
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 6 Oct 2017 15:19:00 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1504593353-7409-1-git-send-email-andrej.valek@siemens.com>
	<1507274867-26612-1-git-send-email-andrej.valek@siemens.com>
	<17970e95-8d1a-a79d-f02a-2e24accb49f1@linux.intel.com>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <53132579-3c1a-7adb-bb13-4518d9ba3543@siemens.com>
Date: Fri, 6 Oct 2017 15:19:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <17970e95-8d1a-a79d-f02a-2e24accb49f1@linux.intel.com>
Subject: Re: [PATCH v3] libxml2: 2.9.4 -> 2.9.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 13:19:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

It is continue in discussion from thread
(http://lists.openembedded.org/pipermail/openembedded-core/2017-September/142891.html).

For the explanation CVE-* fx-* patches have been removed due to
backports. Ptest patch has been modified to adapt new changes in sources.

I have also updated a PR.

Andrej

On 10/06/2017 02:11 PM, Alexander Kanavin wrote:
> On 10/06/2017 10:27 AM, Andrej Valek wrote:
>> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>> ---
>>   .../libxml/libxml2/libxml-m4-use-pkgconfig.patch   |   2 +-
>>   .../libxml/libxml2/libxml2-CVE-2016-4658.patch     | 269 ----------
>>   .../libxml/libxml2/libxml2-CVE-2016-5131.patch     | 180 -------
>>   .../libxml/libxml2/libxml2-CVE-2017-0663.patch     |  40 --
>>   .../libxml/libxml2/libxml2-CVE-2017-5969.patch     |  62 ---
>>   .../libxml/libxml2/libxml2-CVE-2017-8872.patch     |  37 --
>>   .../libxml2-CVE-2017-9047_CVE-2017-9048.patch      | 103 ----
>>   .../libxml2-CVE-2017-9049_CVE-2017-9050.patch      | 291 ----------
>>   .../libxml2/libxml2-fix_NULL_pointer_derefs.patch  |  45 --
>>   ...ibxml2-fix_and_simplify_xmlParseStartTag2.patch | 590 ---------------------
>>   .../libxml2/libxml2-fix_node_comparison.patch      |  67 ---
>>   meta/recipes-core/libxml/libxml2/runtest.patch     |  34 +-
>>   .../libxml/{libxml2_2.9.4.bb => libxml2_2.9.6.bb}  |  18 +-
> 
> You need to explain why patches are being removed or modified. CVE fixes 
> are likely backports, but this should not be guessed.
> 
> Alex
> 

