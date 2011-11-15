Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RQKA9-0000Ry-KA
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 15:39:01 +0100
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 6A1394B017D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 15:32:37 +0100 (CET)
Message-ID: <4EC27804.7060902@eukrea.com>
Date: Tue, 15 Nov 2011 15:32:36 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EC24711.2010805@eukrea.com>
In-Reply-To: <4EC24711.2010805@eukrea.com>
Subject: Re: Reproducible build problem with BB_NUMBER_THREADS=8
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
X-List-Received-Date: Tue, 15 Nov 2011 14:39:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 15/11/2011 12:03, Eric B=E9nard a =E9crit :
> - log2.txt (plain oe-core + angstrom setup to remove the doubt of my ov=
erlay
> being the source of the problem) :
> directfb fails with
> mkdgifft.cpp:64:16: fatal error: list: No such file or directory
> the file exists :
> build/tmp-angstrom_2010_x-eglibc/sysroots/beagleboard/usr/include/c++/l=
ist
> here again, it seems that include/c++ is not in the header search path
> =3D> I reduced BB_NUMBER_THREADS to 1 and launched again bitbake (build=
 actually
> in progress).
>
this build also crashed a few hours later on gnutls with :
| ./includes/gnutls/gnutlsxx.h:4:21: fatal error: exception: No such file=
 or=20
directory

Here again the only solution is to remove tmp and start again with a redu=
ced=20
BB_NUMBER_THREADS.

Eric


