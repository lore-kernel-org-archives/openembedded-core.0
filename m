Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RdO10-0004Sh-JL
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 16:23:34 +0100
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id ADCAC4B04B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 16:16:27 +0100 (CET)
Message-ID: <4EF1F84A.6060102@eukrea.com>
Date: Wed, 21 Dec 2011 16:16:26 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EF1F39E.60903@jhksoftware.com>
In-Reply-To: <4EF1F39E.60903@jhksoftware.com>
Subject: Re: meta-toolchain-qte and wrong paths to QT tools
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
X-List-Received-Date: Wed, 21 Dec 2011 15:23:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Juraj,

Le 21/12/2011 15:56, Juraj Hercek a =E9crit :
> I've two questions:
>
> 1) When I build meta-toolchain-qte (c2de8d4 metadata revision) and inst=
all the
> resulting sdk, I see two directories in /usr/local/: oecore-i686-arm an=
d
> oecore-i686-i686. What is a rationale behind having these two directori=
es
> instead of one i.e.: oecore-i686-arm?
>
> 2) The oecore-i686-arm/environment-setup-armv5te-oe-linux-gnueabi scrip=
t sets
> paths to the QT tools which should be installed in oecore-i686-arm dire=
ctory,
> but they are not. These tools are installed under oecore-i686-i686 dire=
ctory.
> Changing the path in environment-setup-armv5te-oe-linux-gnueabi after
> toolchain installation is easy, but I do not consider it to be a correc=
t fix
> (assuming that oecore-i686-{arm,i686} directories represents proper too=
lchain
> structure). What is a proper fix for this issue?
>
> Thank you in advance for your response(s).
>
did you build a i686 machine before building the arm one in the same tmp =
?

I have a similar problem reported here :
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/0144=
80.html

Eric


