Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QhrJy-00072D-Bx
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 00:57:22 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QhrG6-0004zk-O4 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 15:53:22 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 15 Jul 2011 15:53:22 -0700
Received: from [172.30.80.62] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 15 Jul 2011 15:53:21 -0700
Message-ID: <4E20C4E0.2030908@mentor.com>
Date: Fri, 15 Jul 2011 15:53:20 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1310758615.git.tom_rini@mentor.com>	<c7276dd332ad9e38935443d679c0296a032a511c.1310758615.git.tom_rini@mentor.com>
	<1310770123.20015.1259.camel@rex>
In-Reply-To: <1310770123.20015.1259.camel@rex>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 15 Jul 2011 22:53:22.0581 (UTC)
	FILETIME=[FF860450:01CC4341]
Subject: Re: [PATCH 3/5] help2man-native: Add 1.36.4 (GPLv2) and 1.38.2 (GPLv3)
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
X-List-Received-Date: Fri, 15 Jul 2011 22:57:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/15/2011 03:48 PM, Richard Purdie wrote:
> On Fri, 2011-07-15 at 15:03 -0700, Tom Rini wrote:
>> These are 'side ports' of current oe.dev versions.  PR is kept in sync
>> but we drop out the target recipes in order to punt on potential perl
>> problems.
>>
>> Signed-off-by: Tom Rini <tom_rini@mentor.com>
>> ---
>>  .../help2man/help2man-native_1.36.4.bb             |   26 ++++++++++++++++++++
>>  .../help2man/help2man-native_1.38.2.bb             |   24 ++++++++++++++++++
>>  2 files changed, 50 insertions(+), 0 deletions(-)
>>  create mode 100644 meta/recipes-devtools/help2man/help2man-native_1.36.4.bb
>>  create mode 100644 meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
>>
> [...]
>> diff --git a/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb b/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
>> new file mode 100644
>> index 0000000..5612eda
>> --- /dev/null
>> +++ b/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
>> @@ -0,0 +1,24 @@
>> +DESCRIPTION = "Program to create simple man pages"
>> +SECTION = "devel"
>> +LICENSE = "GPLv3"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> +DEPENDS = "autoconf-native automake-native"
>> +PR = "r2"
>> +
>> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
>> +SRC_URI[md5sum] = "426671c6fe79e5ef2233303367eab5a6"
>> +SRC_URI[sha256sum] = "952c29561bce8b233aa10af7f0e0c79c8243712810bf8ddf01e6efd82ce250d1"
>> +
>> +inherit autotools native
>> +
>> +EXTRA_OECONF = "--disable-nls"
>> +
>> +# We don't want to reconfigure things
>> +do_configure() {
>> +	oe_runconf
>> +}
> 
> At the very least I'd like to know why we can't do this. Its a great way
> to hide bugs (such as libtool rpath injection issues, admittedly in the
> target case).

In oe.dev, chicken and egg problem wrt perl.  Here, I'll see if we can
drop this part too, as part of a v2 with the older help2man dropped and
per IRC, mercurial-native moved over to a meta-oe patch (but keeping the
sanity.bbclass/bitbake.conf change).

-- 
Tom Rini
Mentor Graphics Corporation


