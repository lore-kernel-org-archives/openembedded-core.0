Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Sm5CG-000863-Jm
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 17:39:24 +0200
Received: (qmail 166 invoked by uid 1003); 3 Jul 2012 15:28:21 -0000
Received: from unknown (HELO ?192.168.1.105?)
	(philip@opensdr.com@96.240.162.243)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	3 Jul 2012 15:28:21 -0000
Message-ID: <4FF30F93.6030706@balister.org>
Date: Tue, 03 Jul 2012 11:28:19 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341257063.git.mark.hatle@windriver.com>
	<ce879400de83074f4c24961787ec36aad372fb80.1341257063.git.mark.hatle@windriver.com>
	<1341259602.2886.27.camel@x121e.pbcl.net>
	<CAMKF1sp2RfBJEggBUzkR9xdQ9L5Q_ik3Za2hCFf=3cJDCkqrEg@mail.gmail.com>
In-Reply-To: <CAMKF1sp2RfBJEggBUzkR9xdQ9L5Q_ik3Za2hCFf=3cJDCkqrEg@mail.gmail.com>
Subject: Re: [PATCH 1/1] oprofile: Change /root to /home/root
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
X-List-Received-Date: Tue, 03 Jul 2012 15:39:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2012 07:44 PM, Khem Raj wrote:
> On Mon, Jul 2, 2012 at 1:06 PM, Phil Blundell <philb@gnu.org> wrote:
>>
>> Why is it putting "daemon setup information" in /root in the first
>> place?  Surely that should go in /etc or some such place.
>>
>> Also, the choice of where root's home directory goes is a distro
>> decision and, in the general case, it is not correct to say that "OE
>> uses /home/root".  Changing the hardcoded value from one thing to
>> another is probably not that much of an improvement overall.
>
> yes having ROOTHOME configurable is desirable but probably nothing as such
> exists AFAICT

Why do we use /home/root instead of /root? If we are having to patch 
multiple recipes to account for this, maybe we should default to /root?

Philip



