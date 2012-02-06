Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RuUtI-0002am-19
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 21:10:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q16K2Gpg004441
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Feb 2012 12:02:17 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 6 Feb 2012 12:02:16 -0800
Message-ID: <4F3031C6.4010805@windriver.com>
Date: Mon, 6 Feb 2012 14:02:14 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAMKF1spO-FVweKU21EdHK-Rs5gc4qun=JRYnwMWc88SOSeQufg@mail.gmail.com>	<CAMKF1soq=EaZ4KMb7McFcEjNyTVT2sMHPHvEr11+kL603iCOUQ@mail.gmail.com>	<1408084.uBj8QddilE@helios>
	<1328543751.14363.11.camel@phil-desktop>
	<4F302D77.7030902@balister.org>
In-Reply-To: <4F302D77.7030902@balister.org>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q16K2Gpg004441
Subject: Re: Duplicate recipes in meta-oe
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
X-List-Received-Date: Mon, 06 Feb 2012 20:10:20 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2/6/12 1:43 PM, Philip Balister wrote:
> On 02/06/2012 10:55 AM, Phil Blundell wrote:
>> On Mon, 2012-02-06 at 15:39 +0000, Paul Eggleton wrote:
>>> I talked to Koen at FOSDEM and apparently he prefers having a symlink=
 rather
>>> than a copy for the timezone file. I can't express an opinion one way=
 or
>>> another but it sounds like this one aspect still needs to be resolved=
 - should
>>> this be selectable?
>>
>> I guess this is all bound up with the "/usr on a separate partition"
>> thing.  If your position is that the root filesystem is meant to work
>> without /usr mounted then having /etc/localtime be a symlink
>> into /usr/share is probably not going to fly.  Conversely, one were to
>> take the view that any reasonable system in the 21st century is going =
to
>> have / and=CC=A3 /usr on the same device, making it be a symlink would=
 be a
>> fine idea.
>>
>> I think probably the right answer is to make "1970s-usr" be a
>> DISTRO_FEATURE and then the timezone recipes (and others) can adapt
>> themselves accordingly.
>
> Does anyone use a system where /usr is on a separate partition?

Where I have seen it is on some carrier grade blade systems.  Each blade =
has a=20
small local boot partition, which a shared (read-only) /usr partition.  T=
he=20
small boot partition handles initial booting, setup and mounting.. while =
the=20
shared partition handles the majority of "unix infrastructure".

These systems do not use ramdisks, initrds, etc...

I'm also aware of some other systems that do this for boot performance re=
asons..=20
they do it for booting quickly to the main UI app, and in parallel mounti=
ng and=20
loading additional runtime apps from the /usr disk (RO) and a /var (RW) d=
isk.=20
As things are available the UI options are made available to the end user=
.  The=20
result is a -faster- perceived boot.  Again ramdisks/initrds are not used=
=20
because of various reasons.

--Mark

> Philip
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



