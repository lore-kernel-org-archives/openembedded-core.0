Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RLmfb-0007qw-Vh
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 03:04:46 +0100
Received: (qmail 24040 invoked by uid 1003); 3 Nov 2011 01:58:29 -0000
Received: from unknown (HELO ?192.168.1.108?)
	(philip@opensdr.com@96.240.183.10)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	3 Nov 2011 01:58:29 -0000
Message-ID: <4EB1F545.6080006@balister.org>
Date: Wed, 02 Nov 2011 21:58:29 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110928 Fedora/3.1.15-1.fc14 Thunderbird/3.1.15
MIME-Version: 1.0
To: niqingliang@insigma.com.cn, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1319780499.10032.46.camel@localhost.localdomain>	<CAGiJk9eo4FvhLZ6o9qdb75YyuZ5om19GYRLR6gDFEN_r0VWeuw@mail.gmail.com>	<1319785517.10032.48.camel@localhost.localdomain>	<CAAQYJAtJsSRSN5jLzK65iKUJPorc8h+RjqcnQBw2pyK34+ejjQ@mail.gmail.com>	<4EAABF76.7080703@windriver.com>	<1320021891.10032.56.camel@localhost.localdomain>	<CAAQYJAt2ghQNxzw9EnpfChW0QrwepQLbSFcYD4AP+E32n4Wc5g@mail.gmail.com>	<4EB196D0.5010005@windriver.com>	<1320281261.1504.10.camel@localhost.localdomain>	<CAP9ODKooneOYO_b8Teg=VhukHQW27acQePiO5abKX_RV3TupEw@mail.gmail.com>
	<1320284129.1504.11.camel@localhost.localdomain>
In-Reply-To: <1320284129.1504.11.camel@localhost.localdomain>
X-Enigmail-Version: 1.1.2
Subject: Re: how to set time zone
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
X-List-Received-Date: Thu, 03 Nov 2011 02:04:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/02/2011 09:35 PM, Ni Qingliang wrote:
> what is "IMO"?

"In my opinion"

See http://www.internetslang.com/

I'm not suggesting reading the entire thing and using the slang in email
though :)

Philip


> 
> On Thu, 2011-11-03 at 09:19 +0800, Otavio Salvador wrote:
>> On Wed, Nov 2, 2011 at 22:47, Ni Qingliang <niqingliang@insigma.com.cn> wrote:
>>> maybe we can do the link in system booting, use the variable "TZ" to
>>> create the symlink /etc/localtime, just like archlinux.
>>> e.g. providing one script in /etc/rcS.d/ to create the symlink.
>>
>> This ought to be done by image IMO; so a kind of post rootfs
>> generation hook might be use allowing it to be set per-image.
>>
>> I personally have this exactly use-case here at work.
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
>> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
> 


