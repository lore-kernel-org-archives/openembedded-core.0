Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RmfMv-00052L-2k
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 06:44:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Jan 2012 21:36:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96193556"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 15 Jan 2012 21:36:38 -0800
Message-ID: <4F13B766.9000802@linux.intel.com>
Date: Sun, 15 Jan 2012 21:36:38 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Steve Sakoman <sakoman@gmail.com>
References: <1325911915-16001-4-git-send-email-steve@sakoman.com>
	<20120107141410.3d35c503@eb-e6520>
	<CAGDS+nm7EhwZUxJBiTkGa3x5R71effKqH29J2RzO81ff_kE7Rg@mail.gmail.com>
	<4F0F46E4.1040208@linux.intel.com>
	<CAGDS+nmvBbqc-GN9j-TBBTvRCu_nX-bbhHSi+6Ghu1UNNDjWcA@mail.gmail.com>
In-Reply-To: <CAGDS+nmvBbqc-GN9j-TBBTvRCu_nX-bbhHSi+6Ghu1UNNDjWcA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 16 Jan 2012 05:44:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 01/12/2012 01:56 PM, Steve Sakoman wrote:
> On Thu, Jan 12, 2012 at 12:47 PM, Saul Wold<sgw@linux.intel.com>  wrote:
>> On 01/11/2012 11:00 AM, Steve Sakoman wrote:
>>>
>>> On Sat, Jan 7, 2012 at 5:14 AM, Eric Bénard<eric@eukrea.com>    wrote:
>>>>
>>>> Hi,
>>>>
>>>> Le Fri,  6 Jan 2012 20:51:54 -0800,
>>>> Steve Sakoman<steve@sakoman.com>    a écrit :
>>>>>
>>>>> -FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server
>>>>> ${localstatedir}/lib/dhcp/"
>>>>> +FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
>>>>
>>>>
>>>> isn't this directory necessary for dhcp-server ?
>>>
>>>
>>> Sorry for the delay in responding!  I missed seeing your comment.
>>>
>>> Yes, both packages need this directory.  But the dhcp-server package
>>> init already creates it if it doesn't exist:
>>>
>> You can still have it in the dhcp-server Package as long as the attributes
>> (ownership, perm, ...) are the same and it's not a symlink, so please
>> include it with the FILES-dhcp-server.
>
> In my experience you can't add an item to more than one FILES spec.
>
> I just did the experiment of including it in both client and server
> FILES, and the directory only shows up it the one that occurs first,
> server in this case.
>
> I added the directory to the client FILES in my patch because I saw
> that the server init creates the directory if it doesn't exist.
>
> I still believe that the original patch is the best way to handle this.
>
Fair enough, should I consider this RFC patch now the real patch or will 
you resend?

Sau!

> Steve
>


