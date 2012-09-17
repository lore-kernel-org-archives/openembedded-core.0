Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TDeeE-0005Lo-2I
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 18:58:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8HGjXwZ003376
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 09:45:33 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 17 Sep 2012 09:45:33 -0700
Message-ID: <505753AC.1090809@windriver.com>
Date: Mon, 17 Sep 2012 11:45:32 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1347898621-24929-1-git-send-email-sgw@linux.intel.com>
	<50575042.3090405@mlbassoc.com>
In-Reply-To: <50575042.3090405@mlbassoc.com>
Subject: Re: [PATCH] xserver-xorg: Modify RREPLACES for RCONFLICTS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 16:58:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/12 11:30 AM, Gary Thomas wrote:
> On 2012-09-17 10:17, Saul Wold wrote:
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>    .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
>>    .../xorg-xserver/xserver-xorg-common.inc           |    2 +-
>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
>> index b4a348c..c71896a 100644
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
>> @@ -8,4 +8,4 @@ SRC_URI += "file://crosscompile.patch \
>>    SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
>>    SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
>>
>> -PR = "r6"
>> +PR = "r7"
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
>> index 6133344..98fe534 100644
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
>> @@ -66,7 +66,7 @@ PACKAGES =+ "${PN}-security-policy \
>>
>>    RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
>>    RDEPENDS_${PN}-xvfb += "xkeyboard-config"
>> -RREPLACES_${PN}-module-exa = "${PN}"
>> +RCONFLICTS_${PN}-module-exa = "${PN} (<${PV})"
>
> Can you please explain what this means (the syntax is unknown to me)?

This is deb/opkg style syntax..

<package> (<comparison> <version>)

So it means ${PN}-module-exa will conflict with any version of ${PN} older then 
the current version.

--Mark

>>
>>    FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
>>    FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
>>
>



