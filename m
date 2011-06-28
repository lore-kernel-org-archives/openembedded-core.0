Received: from slimlogic.co.uk ([89.16.172.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gg@slimlogic.co.uk>) id 1QbiJR-0005Tv-Va
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 02:07:26 +0200
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by slimlogic.co.uk (Postfix) with ESMTPSA id D007513003B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 00:53:57 +0100 (BST)
Message-ID: <4E0A6995.1040006@slimlogic.co.uk>
Date: Wed, 29 Jun 2011 00:53:57 +0100
From: Graeme Gregory <gg@slimlogic.co.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc15
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>	<4E0A5AE5.7000509@intel.com>
	<256EDA37-7406-4E12-B095-12F7FFBA7C7F@gmail.com>
In-Reply-To: <256EDA37-7406-4E12-B095-12F7FFBA7C7F@gmail.com>
Subject: Re: Conflicting providers for ssh/sshd (dropbear and	openssh)
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
X-List-Received-Date: Wed, 29 Jun 2011 00:07:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/29/2011 12:50 AM, Khem Raj wrote:
>
> On Jun 28, 2011, at 3:51 PM, Scott Garman <scott.a.garman@intel.com> wrote:
>
>> On 06/28/2011 03:41 PM, Khem Raj wrote:
>>> ERROR: Multiple .bb files are due to be built which each provide ssh
>>> (/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.52.bb
>>> /home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-connectivity/openssh/openssh_5.8p2.bb).
>>>  This usually means one provides something the other doesn't and should.
>>> ERROR: Multiple .bb files are due to be built which each provide sshd
>>> (/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.52.bb
>>> /home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-connectivity/openssh/openssh_5.8p2.bb).
>>>  This usually means one provides something the other doesn't and should.
>>>
>>> reason is that dropbear only provides ssh and sshd packages openssh
>>> provides a few more e.g. openssh-sftp-server which is demanded by
>>> some images and at same time wants dropbear to provide sshd and ssh
>>>
>>> Now both recipes are to be built but are in contention for providing
>>> ssh and sshd
>>>
>>> How to solve this problem. ? Are other packages that openssh provides
>>> strictly depending on ssh/sshd from openssh ? or will they work on
>>> any ssh/sshd ?
>>>
>>> If they are independent then may be the openssh recipe should be
>>> divided into openssh-ssh and openssh-rest so one can use openssh
>>> provided daemon or dropbear provided as they wish
>> I've run into that and have been wondering how to resolve it as well.
>>
>> If there are currently existing images which are pulling in dropbear's ssh and sshd while using openssh's sftp-server, then that would imply they can work independently, even though that combo seems like an aggressive space optimization that I would tend to avoid.
> yes if you build console-image with angstrom you will see it wanting sftp-server and dr bear for rest of ssh needs
>
sftp-server is just a really small ftp like program that gets run as the
shell when sftp connects instead of ssh. It has no dependency on any
openssh code or even openssl. This is the reason why the dropbear
developer decided to just use it instead of writing his own exact work
alike.

I was the one that added it to Angstrom images as I really like to sftp
out of the box.

Graeme



