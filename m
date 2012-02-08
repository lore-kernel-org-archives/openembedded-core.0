Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RvAYE-0002Wo-Pq
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 17:39:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q18GVHRT002462
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Feb 2012 08:31:17 -0800 (PST)
Received: from dhcp-144-215.ottawa.windriver.com (128.224.144.215) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 8 Feb 2012 08:31:17 -0800
Message-ID: <4F32A354.4030107@windriver.com>
Date: Wed, 8 Feb 2012 11:31:16 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1328717200-13689-1-git-send-email-andrei@gherzan.ro>
	<1328717410.14363.46.camel@phil-desktop>
In-Reply-To: <1328717410.14363.46.camel@phil-desktop>
Subject: Re: [PATCH] dhcp: Update to 4.2.3-P2
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
X-List-Received-Date: Wed, 08 Feb 2012 16:39:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/8/12 11:10 AM, Phil Blundell wrote:
> On Wed, 2012-02-08 at 18:06 +0200, Andrei Gherzan wrote:
>> 1. Update to 4.2.3-P2
>> 2. From 4.2.0 final release, -lcrypto check was removed and we compile static libraries
>> from bind that are linked to libcrypto. This is why i added a patch in order to add
>> -lcrypto to LIBS.
>>
>> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
>
> [...]
>
>> @@ -66,7 +61,7 @@ FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp
>>
>>   FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
>>
>> -FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
>> +FILES_dhcp-client = "${sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
>>   RDEPENDS_dhcp-client = "bash"
>>
>>   FILES_dhcp-omshell = "${bindir}/omshell"
>
> This isn't just a straightforward update, you seem to be moving dhclient
> from ${base_sbindir} to ${sbindir}.  If that's a good thing (which
> doesn't seem totally obvious to me) then it ought at least to be
> mentioned in the commit message.

I believe that dhcp-client was in the base_sbindir specifically to enable early 
boot/network setup before /usr is potentially available.  I think this is still 
desired.

--Mark

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



