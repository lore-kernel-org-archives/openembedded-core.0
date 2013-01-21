Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TxL9V-0002Sv-0F
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 18:27:21 +0100
Message-ID: <50FD76D7.1090209@communistcode.co.uk>
Date: Mon, 21 Jan 2013 17:11:51 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <50FD5CDC.6080604@communistcode.co.uk> <50FD7553.50602@intel.com>
In-Reply-To: <50FD7553.50602@intel.com>
Subject: Re: SSH Login Delay
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 17:27:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 21/01/13 17:05, Scott Garman wrote:
> On 01/21/2013 07:21 AM, Jack Mitchell wrote:
>> I have recently noticed that when SSH'ing to my BeagleBone it has a 3-5
>> second delay before the bash prompt shows. I have looked in
>> /var/log/messages and noticed:
>>
>> Jan 18 15:47:12 beaglebone auth.info sshd[12389]: Accepted none for root
>> from 192.168.0.51 port 37905 ssh2
>> Jan 18 15:47:12 beaglebone auth.info sshd[12399]: lastlog_openseek:
>> Couldn't stat /var/log/lastlog: No such file or directory
>> Jan 18 15:47:12 beaglebone auth.info sshd[12399]: lastlog_openseek:
>> Couldn't stat /var/log/lastlog: No such file or directory
>>
>> I was wondering if these stat commands had a timeout on them and
>> therefore causing the delay. If so, why do these logs not exist?
>>
>> I have also noticed that avahi has crept into my image recently and if
>> it was possibly something to do with dns resolution or similar?
>
> In my experience this is most likely due to DNS resolution timing out 
> trying to resolve a LAN IP address.
>
> Try editing the sshd_config on your BeagleBone's filesystem and set 
> UseDNS to no. See if that helps.
>
> Scott
>

Perfect, fixed it straight away, thanks!

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



