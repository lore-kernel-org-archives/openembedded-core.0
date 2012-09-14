Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TCeqF-0006aX-Oj
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Sep 2012 00:58:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8EMjrCd023558
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Sep 2012 15:45:53 -0700 (PDT)
Received: from msp-dhcp28.wrs.com (172.25.34.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 14 Sep 2012 15:45:53 -0700
Message-ID: <5053B3A1.1030506@windriver.com>
Date: Fri, 14 Sep 2012 17:45:53 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1347643776-4028-1-git-send-email-paul.eggleton@linux.intel.com>
	<1347659456.4444.1.camel@x121e.pbcl.net>
	<5053A818.4070402@windriver.com>
	<1347660202.4444.10.camel@x121e.pbcl.net>
	<5053ABF3.8010708@windriver.com>
	<1347660965.4444.17.camel@x121e.pbcl.net>
	<5053AFAB.6000409@windriver.com>
	<1347662258.4444.34.camel@x121e.pbcl.net>
In-Reply-To: <1347662258.4444.34.camel@x121e.pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: remove broken RREPLACES
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
X-List-Received-Date: Fri, 14 Sep 2012 22:58:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/12 5:37 PM, Phil Blundell wrote:
> On Fri, 2012-09-14 at 17:28 -0500, Mark Hatle wrote:
>> Based on that, I'm not sure what RREPLACES is being used for:
>>
>> FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards
>> ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so
>> ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt
>> ${datadir}/X11/xorg.conf.d"
>>
>> Since under the packaging rules, that one file will only exist in the one
>> package, and it won't ever exist in both packages.
>>
>> So Replaces is wrong under either definition from what I can tell.
>
> The point is that it was in older versions of xserver-xorg.  It's indeed
> not in the current version, and in fact it can't be since (due to the
> way that FILES works) there is no way for a single file to end up in
> more than one of the PACKAGES for a given recipe.

Ahh, thats easy.. It conflicts or replaces an older version..

RCONFLICTS_... = ${PN} (<${PV})

or something like that.  Once updated to the current version of ${PN} no conflict.

> In the particular case at hand I think the problem is relatively minor,
> since folks who have an old xserver-xorg installed can upgrade by first
> installing the new xserver-xorg (which doesn't ship libexa.so) and then
> installing xserver-xorg-module-exa.  But, if the new xserver-xorg had
> depended on xserver-xorg-module-exa then this wouldn't have worked
> without the RREPLACES.
>
> p.
>
>



