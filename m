Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R1Bqu-0004sS-1N
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 08:43:26 +0200
Received: from [192.168.2.12] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id EE801A6231
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2011 08:38:06 +0200 (CEST)
Message-ID: <4E67114D.80507@eukrea.com>
Date: Wed, 07 Sep 2011 08:38:05 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1315371835.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315371835.git.sgw@linux.intel.com>
Subject: Re: [PATCH 0/1] Fix MakeMaker's finding of perl.real
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
X-List-Received-Date: Wed, 07 Sep 2011 06:43:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Le 07/09/2011 07:09, Saul Wold a =E9crit :
> When configuring cpan packages, the directories passed to MakeMaker are=
 the
> target directories. There was a patch that was applied to the native pe=
rl
> to find perl.real and convert that to perl.  This does not apply for th=
e
> target perl modules and therefore MakeMaker find perl.real.
>
> This patch to cpan configure modifies the Makefile after configure and
> changes the perl.real to just straight perl so we have the correct path=
s
> and shared state info in usable.
>
when sending 1 patch, is it possible to not use cover letter in order to =
have
the explanation in the patch commit ?
That's easier to understand what the patch is doing when browsing log.

Eric


