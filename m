Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RtayN-0003CF-17
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Feb 2012 09:27:51 +0100
Received: by ghbf19 with SMTP id f19so2000482ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Feb 2012 00:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=KqDA48aXjggcoxhsZy/1lbhOhiocC7H+HY5CqFdRJUY=;
	b=GAGYRFASncRIp1YB0fDE5vNcBCpVi+9Wvee74hDE9KhNwykDnKsp2jbYsCFO7bpdXp
	xVUJThmmP0xhkoQwy0yxfjcyfzR5kN3Ea+jT+MlYuEImTGe+PVszxcbg9IAH5ncXfd+Z
	42T5NZXrU9VMgfs5pKJEZYFXfYxLDnAWDY8rI=
MIME-Version: 1.0
Received: by 10.236.197.103 with SMTP id s67mr15929052yhn.5.1328343592126;
	Sat, 04 Feb 2012 00:19:52 -0800 (PST)
Received: by 10.236.165.104 with HTTP; Sat, 4 Feb 2012 00:19:52 -0800 (PST)
In-Reply-To: <805BB42F-FCF7-48BE-AB53-9DB7D5E99845@dominion.thruhere.net>
References: <cover.1328139407.git.nitin.a.kamble@intel.com>
	<1328284640.3895.118.camel@ted>
	<CAFZPMoZf-x5ff+n-1xFFC4wth=PO=Q6SizVnnWXd-tE_jZZc8Q@mail.gmail.com>
	<1328287801.16474.4.camel@ted>
	<805BB42F-FCF7-48BE-AB53-9DB7D5E99845@dominion.thruhere.net>
Date: Sat, 4 Feb 2012 09:19:52 +0100
Message-ID: <CA+chaQe98PRkjnRS3BG94Cnk1H=nQY5KkHbwPND44p4v=EuW2Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [patch-v2 0/7] Various recipe upgrades
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
X-List-Received-Date: Sat, 04 Feb 2012 08:27:51 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 3, 2012 at 5:58 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 3 feb. 2012, om 17:50 heeft Richard Purdie het volgende geschreven:
>
>> On Fri, 2012-02-03 at 19:30 +0300, Sergey Lapin wrote:
>>
>>> This breaks
>>> meta-openembedded/meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bbappend
>>
>> Sorry about that. Koen is aware of the issue now at least.
>
> Hotfix pushed, we need to double check after the weekend when we get back to our deskjobs.

even with 7.3.1 it wasn't working for me so in meta-oe-contrib/shr I
had to remove .bbappend anyway :/

in oe-core-contrib/shr I have Eric's previous patch to do it in
oe-core with extra patch fixing
variables to match what I get with distroless oe-core only and also
with normal layers I'm using with SHR.

More info:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-February/037652.html

Cheers,


