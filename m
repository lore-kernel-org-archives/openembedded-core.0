Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlRft-0002gv-0f
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 21:55:05 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jan 2012 12:47:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106550858"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2012 12:47:32 -0800
Message-ID: <4F0F46E4.1040208@linux.intel.com>
Date: Thu, 12 Jan 2012 12:47:32 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325911915-16001-4-git-send-email-steve@sakoman.com>
	<20120107141410.3d35c503@eb-e6520>
	<CAGDS+nm7EhwZUxJBiTkGa3x5R71effKqH29J2RzO81ff_kE7Rg@mail.gmail.com>
In-Reply-To: <CAGDS+nm7EhwZUxJBiTkGa3x5R71effKqH29J2RzO81ff_kE7Rg@mail.gmail.com>
Subject: Re: [PATCH RFC v2] dhcp: package /var/lib/dhcp with dhcp-client rather than dhcp-server
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
X-List-Received-Date: Thu, 12 Jan 2012 20:55:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 01/11/2012 11:00 AM, Steve Sakoman wrote:
> On Sat, Jan 7, 2012 at 5:14 AM, Eric Bénard<eric@eukrea.com>  wrote:
>> Hi,
>>
>> Le Fri,  6 Jan 2012 20:51:54 -0800,
>> Steve Sakoman<steve@sakoman.com>  a écrit :
>>> -FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server ${localstatedir}/lib/dhcp/"
>>> +FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
>>
>> isn't this directory necessary for dhcp-server ?
>
> Sorry for the delay in responding!  I missed seeing your comment.
>
> Yes, both packages need this directory.  But the dhcp-server package
> init already creates it if it doesn't exist:
>
You can still have it in the dhcp-server Package as long as the 
attributes (ownership, perm, ...) are the same and it's not a symlink, 
so please include it with the FILES-dhcp-server.

Sau!

> case "$1" in
> 	start)
> 		echo -n "Starting DHCP server: "
> 		test -d /var/lib/dhcp/ || mkdir -p /var/lib/dhcp/
>
> So it should be no issue moving the /var/lib/dhcp FILE spec to the
> dhcp-client package.
>
> Steve
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


