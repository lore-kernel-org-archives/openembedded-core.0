Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RnWiU-0004Y2-K9
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 15:42:22 +0100
Received: (qmail 28714 invoked by uid 1003); 18 Jan 2012 14:34:43 -0000
Received: from unknown (HELO ?192.168.1.104?)
	(philip@opensdr.com@96.240.160.175)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	18 Jan 2012 14:34:43 -0000
Message-ID: <4F16D882.8080701@balister.org>
Date: Wed, 18 Jan 2012 09:34:42 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F16C61C.4020304@ts.fujitsu.com>	<20120118134322.GB5443@deadlock.dhs.org>
	<F2C23BA4-EF14-44A5-A4B3-B50848CD0844@dominion.thruhere.net>
In-Reply-To: <F2C23BA4-EF14-44A5-A4B3-B50848CD0844@dominion.thruhere.net>
X-Enigmail-Version: 1.1.2
Subject: Re: How do I get rid of systemd
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
X-List-Received-Date: Wed, 18 Jan 2012 14:42:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/18/2012 09:21 AM, Koen Kooi wrote:
> 
> Op 18 jan. 2012, om 14:43 heeft Sergey 'Jin' Bostandzhyan het volgende geschreven:
> 
>> Hi Rainer,
>>
>> On Wed, Jan 18, 2012 at 02:16:12PM +0100, Rainer Koenig wrote:
>>> built my first basic customized console image (based on angstrom's
>>> console-image.bb) and managed to get SystemV init pulled in by deleting
>>> the systemd entry for the init manager.
>>>
>>> But systemd is still pulled in via connman, dhcp, rsyslog and ntp. How
>>> can I get totally rid of systemd so that I don't need a kernel with CGROUPS?
>>
>> I also did not want systemd in my image, I had to create a layer and patch
>> out systemd from each package that was pulling it in, one by one.
>>
>> Surely not the nicest solution, but I did not find any other ways to solve this.
> 
> It's really easy, create your own image, no patching needed. The systemd dependencies are all in ${PN}-systemd, so just don't include those in your image. I you do include ${PN}-systemd in your image you shouldn't be surprised that systemd ends up in it.

I'm working through this now. The meta-oe task-basic is sucking in
rsyslog-systemd. I already made a renamed copy of this so I could use
openssh instead of dropbear, so this was an easy fix for me.

But it would be a good idea to keep references to systemd (or sysvinit)
out of core tasks to make life easier for people.

And, it would be really nice not to have the ssh daemon determined in
task-basic. I do not want to use a local var to override that setting,
since then my task-basic is different from everyone elses.

Philip


