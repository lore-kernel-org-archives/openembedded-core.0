Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RVLv4-0007o3-On
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 12:32:15 +0100
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 3AA5B4B0506
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 12:25:33 +0100 (CET)
Message-ID: <4ED4C12C.8080400@eukrea.com>
Date: Tue, 29 Nov 2011 12:25:32 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED4A49D.7040806@eukrea.com> <1322559291.2140.2.camel@ted>
	<1322564934.2140.7.camel@ted>
In-Reply-To: <1322564934.2140.7.camel@ted>
Subject: Re: [PATCH] base-passwd: Fix race
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
X-List-Received-Date: Tue, 29 Nov 2011 11:32:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 29/11/2011 12:08, Richard Purdie a =E9crit :
> The do_package task this recipe injects depends on the output of
> do_populate_sysroot to be present. This introduces the correct
> dependency so that the package task works correctly.
>
my smtp server was to slow to deliver my patch but this works fine here ;=
-)

Eric


