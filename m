Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RjCWS-0001zg-Lc
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 17:20:05 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q06GCdPL017183
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 08:12:40 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 6 Jan 2012 08:12:39 -0800
Message-ID: <4F071D76.3070803@windriver.com>
Date: Fri, 6 Jan 2012 10:12:38 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20120106100934.GA3879@jama.jama.net>
	<77ADD6E7-5632-4B1A-ABC3-6E4DAEEAE3B6@dominion.thruhere.net>
	<4F071A65.90708@windriver.com>
	<CABcZANk=sg=oj+KyVcBF=UoC460EV-QtiW4B=wKXPBSLrV4HOQ@mail.gmail.com>
In-Reply-To: <CABcZANk=sg=oj+KyVcBF=UoC460EV-QtiW4B=wKXPBSLrV4HOQ@mail.gmail.com>
Subject: Re: libs transition /usr/lib -> /lib questions
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
X-List-Received-Date: Fri, 06 Jan 2012 16:20:05 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/12 10:04 AM, Chris Larson wrote:
> On Fri, Jan 6, 2012 at 8:59 AM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>> On 1/6/12 4:34 AM, Koen Kooi wrote:
>>>
>>>
>>> Op 6 jan. 2012, om 11:09 heeft Martin Jansa het volgende geschreven:
>>>
>>>> FWIW today I've noticed that systemd is going other way around
>>>> http://www.freedesktop.org/wiki/Software/systemd/separate-usr-is-broken
>>>
>>>
>>> And http://fedoraproject.org/wiki/Features/UsrMove
>>>
>>> I guess it's time to publish my angstrom branch doing that after the
>>> holidays :)
>>
>>
>> I respectfully disagree with both of the above URLs.
>>
>> The root partition is still very useful as a "small" set of applications and
>> libraries required for booting.
>>
>> Most systems these days contain a combined root and usr partition, which is
>> fine.  However, there are a lot of systems that I've worked on in the past
>> and I expect in the future that, root being a small R/O system is necessary.
>>
>> initramfs can solve some problems, but introduces other issues.  Many of the
>> systems I've worked on simple don't have enough flash to be able to store
>> the bootloader, kernel and an initramfs [as well as other system items
>> required by the devices].  In this case a base rootfs makes the most sense.
>
> In my opinion, what's proposed in the two links is a good thing even
> for embedded. Not that we'd use that structure necessarily, but
> removing the usr vs non-usr separation for binaries and libs is a good
> thing regardless. Putting /usr in the rootfs still would still work
> fine, or you could drop usr entirely and move everything to / the way
> micro does.

I'd prefer if someone wants to flatten the filesystem that they move everything 
to '/'.  This will still work in the case where we move libraries and binaries 
between '/' and '/usr' in the generic case.

This would support both the traditional filesystem split case as well as a more 
modern single filesystem case.  (We even have the ability, even though I doubt 
it's been tested, to change the base_bindir, base_sbindir, base_libdir to be 
/usr/bin, /usr/sbin, and /usr/lib* to automatically move the things into /usr if 
that is the system someone wants.)

--Mark


