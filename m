Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QhqqH-0006XT-0R
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 00:26:41 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QhqmP-0001KX-4C from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 15:22:41 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 15 Jul 2011 15:22:40 -0700
Received: from [172.30.80.62] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 15 Jul 2011 15:22:40 -0700
Message-ID: <4E20BDAE.60309@mentor.com>
Date: Fri, 15 Jul 2011 15:22:38 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1310758615.git.tom_rini@mentor.com>	<d481ce0f7896af7699864f9f5ca4410b2d5e39f0.1310758615.git.tom_rini@mentor.com>
	<CAMKF1sqYRFyjdBdQwWXfxtOytKQGpZP+ww569eR6DnkCCfpdtw@mail.gmail.com>
In-Reply-To: <CAMKF1sqYRFyjdBdQwWXfxtOytKQGpZP+ww569eR6DnkCCfpdtw@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 15 Jul 2011 22:22:40.0968 (UTC)
	FILETIME=[B5D62C80:01CC433D]
Subject: Re: [PATCH 1/5] mercurial-native: Add 1.9 version
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
X-List-Received-Date: Fri, 15 Jul 2011 22:26:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 07/15/2011 03:14 PM, Khem Raj wrote:
> On Fri, Jul 15, 2011 at 3:03 PM, Tom Rini <tom_rini@mentor.com> wrote:
>> This is based on 91c14caa8819b08def8ea99e02949e49604c2e86 from oe.dev
>> with an update to 1.9.
>>
>> Signed-off-by: Tom Rini <tom_rini@mentor.com>
>> ---
>>  .../mercurial/mercurial-native_1.9.bb              |   24 ++++++++++++++++++++
>>  1 files changed, 24 insertions(+), 0 deletions(-)
>>  create mode 100644 meta/recipes-devtools/mercurial/mercurial-native_1.9.bb
>>
>> diff --git a/meta/recipes-devtools/mercurial/mercurial-native_1.9.bb b/meta/recipes-devtools/mercurial/mercurial-native_1.9.bb
>> new file mode 100644
>> index 0000000..b4438a3
>> --- /dev/null
>> +++ b/meta/recipes-devtools/mercurial/mercurial-native_1.9.bb
>> @@ -0,0 +1,24 @@
>> +DESCRIPTION = "The Mercurial distributed SCM"
>> +HOMEPAGE = "http://mercurial.selenic.com/"
>> +SECTION = "console/utils"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +DEPENDS = "python-native"
>> +PR = "r1"
>> +
>> +SRC_URI = "http://mercurial.selenic.com/release/mercurial-${PV}.tar.gz"
>> +SRC_URI[md5sum] = "d4842129fa2732eb6ed1180467bc32e2"
>> +SRC_URI[sha256sum] = "711e4b1cd2924a7a88499d6c431a9122390183bf554d4e153edbb3b2f30123e0"
>> +
>> +S = "${WORKDIR}/mercurial-${PV}"
>> +
>> +inherit native
> 
> why not use BBCLASSEXTEND although I dont know why someone would want
> target package of hg

To avoid the "ok, now how do we split this up for the target" before
someone says they want it.  oe.dev is also just a native atm.

-- 
Tom Rini
Mentor Graphics Corporation


