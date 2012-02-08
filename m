Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RvAdZ-0002on-70
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 17:44:53 +0100
Received: by bke17 with SMTP id 17so700792bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 08:36:49 -0800 (PST)
Received: by 10.204.133.201 with SMTP id g9mr12892684bkt.137.1328719009561;
	Wed, 08 Feb 2012 08:36:49 -0800 (PST)
Received: from [128.224.170.202] ([89.121.200.106])
	by mx.google.com with ESMTPS id w15sm6138195bku.0.2012.02.08.08.36.48
	(version=SSLv3 cipher=OTHER); Wed, 08 Feb 2012 08:36:48 -0800 (PST)
Message-ID: <4F32A4A4.4030409@gherzan.ro>
Date: Wed, 08 Feb 2012 18:36:52 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1328717200-13689-1-git-send-email-andrei@gherzan.ro>
	<1328717410.14363.46.camel@phil-desktop>
	<4F32A354.4030107@windriver.com>
In-Reply-To: <4F32A354.4030107@windriver.com>
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
X-List-Received-Date: Wed, 08 Feb 2012 16:44:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2012 06:31 PM, Mark Hatle wrote:
> On 2/8/12 11:10 AM, Phil Blundell wrote:
>> On Wed, 2012-02-08 at 18:06 +0200, Andrei Gherzan wrote:
>>> 1. Update to 4.2.3-P2
>>> 2. From 4.2.0 final release, -lcrypto check was removed and we 
>>> compile static libraries
>>> from bind that are linked to libcrypto. This is why i added a patch 
>>> in order to add
>>> -lcrypto to LIBS.
>>>
>>> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
>>
>> [...]
>>
>>> @@ -66,7 +61,7 @@ FILES_dhcp-server-config = 
>>> "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp
>>>
>>>   FILES_dhcp-relay = "${sbindir}/dhcrelay 
>>> ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
>>>
>>> -FILES_dhcp-client = "${base_sbindir}/dhclient 
>>> ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
>>> +FILES_dhcp-client = "${sbindir}/dhclient 
>>> ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
>>>   RDEPENDS_dhcp-client = "bash"
>>>
>>>   FILES_dhcp-omshell = "${bindir}/omshell"
>>
>> This isn't just a straightforward update, you seem to be moving dhclient
>> from ${base_sbindir} to ${sbindir}.  If that's a good thing (which
>> doesn't seem totally obvious to me) then it ought at least to be
>> mentioned in the commit message.
>
> I believe that dhcp-client was in the base_sbindir specifically to 
> enable early boot/network setup before /usr is potentially available.  
> I think this is still desired. 

In this case we will have to move -lcrypto as it is in ${libdir}. 
Change-log will be edited after this will be cleared (sorry).
But still we need to conclude on a solution about this.

@g


