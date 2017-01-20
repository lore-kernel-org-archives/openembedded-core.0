Return-Path: <prvs=0193ebffb4=mike.looijmans@topicproducts.com>
Received: from mx6-09.smtp.antispamcloud.com (mx6-09.smtp.antispamcloud.com
	[95.211.2.200])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE8A719DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:25:45 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1cUSdp-0006kJ-05 for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2017 07:25:42 +0100
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Jan 2017 07:25:40 +0100
To: <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.20.1701191542230.6131@localhost.localdomain>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <38f99bff-e9e4-ef57-caef-a47573fc5362@topic.nl>
Date: Fri, 20 Jan 2017 07:25:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1701191542230.6131@localhost.localdomain>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.36)
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W/95+6ZE6dI+d
	FNTaLLKrTD4PkK8WOoKuw32u9iEtZmisSr42qUwvK7U11fJ5smF5bE7GwnNXTE7JFCR1ojdwNAuw
	Yq3FcmsAmnyw7RCKiQH1kW5MtGkkVO9ekePfYFBA6/4+32Jixy3a8RsV1KH+pWbjO41FyBEqIaDu
	dcVplPGNaieKxw/vh63RdlaW2Zj1hcQD6Dxo9kokFZNwiacNPxeTCKssqlJePCDBHWfCYUvWOATT
	vnG+QUCcfrSs6FZc7tZ3vKwSN7Mv0HNteAusUZ8BuYwGqmI8Tx/Ism0pnCcmlWACu0WC7nIKSPYV
	aBAAdpU0oUDqng6Dyy2mQeofiazRcrLcqLLVNe9BtpgnU3R1el35jO+WJBgrWGjAavfuifnL+9wg
	oTj4ygNPw1XfN1IUJ2+rCMPpQhII5VkEVC//8GRISD+lYCwA5l6/Q4nfg8y63jKKBrO1BroJmvb9
	eW6r2rlUSNsSKfXWKXbAnTtpwWXpE+sdjNmnXWjiNaLzU4EFnW2XgX+M1ZN6UZmlFVODLzPsd/iT
	v744WiqgNunTiEw2ui8TVPldBCj8jBATaV0f1JQTj5AK4Kl1rn2kX88E/p9BurLOIHTmW3gH2nZg
	/fwtBtXydNqayyyV7KOX2YI5PogHEGUWoL6eStEYApwKXoD4iJBsNfB/QPOzo3NC59y3EFXUwBcT
	DQ0nlghOTckC4oN5XN7BzTWQhrf/s2FXG+RlRk606220Tay5bvowkOgRglJOpXrCHulns4cnitzI
	/N0Yci5ag97FkmIyM9BqLkXGaznuCfaQ1w/JpOE=
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
X-Recommended-Action: accept
Subject: Re: still fighting to get an OE recipe for "libfilesys-smbclient-perl"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jan 2017 06:25:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 19-01-17 21:58, Robert P. J. Day wrote:
>
>   following up on the whining i did a while back to finish off a few
> perl recipes for OE, i have just a few left to resolve, and this is
> one of them. i managed to get several dozen perl recipes to work
> simply by throwing together recipes based on very little understanding
> of perl cpan mechanics and just mindlessly cribbing boilerplate from
> other recipes. if it worked, yee ha, move on.
>
>   here's my current recipe for this module (again, slapped together
> without really understanding what's going on under the hood):
>
> ///// start /////
>
> DESCRIPTION =3D "Filesys::SmbClient"
>
> SECTION =3D "libs"
> LICENSE =3D "Artisticv1 | GPLv1+"
> PR =3D "r0"
>
> MAINTAINER=3D	"rday"
> HOMEPAGE=3D	"https://metacpan.org/pod/Filesys::SmbClient"
>
> LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=3Dcda=
03bbdc3c1951996392b872397b798 \
> file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=3De9e36a9de734199567a4d769498f74=
3d"
>
> DEPENDS +=3D "samba"
>
> SRC_URI =3D "https://cpan.metacpan.org/authors/id/A/AL/ALIAN/Filesys-SmbC=
lient-3.2.tar.gz"
>
> SRC_URI[md5sum] =3D "8a4205fe748aac7f43fb2a0e8ef502b2"
> SRC_URI[sha256sum] =3D "a9f2f3d4675de76f9dcae2be40bda93495cd5fafb1bb6326d=
71833cea451bc6e"
>
> S =3D "${WORKDIR}/Filesys-SmbClient-${PV}"
>
> inherit cpan
>
> EXTRA_CPANFLAGS =3D "INC=3D'-I${STAGING_INCDIR}/samba-4.0' LIBS=3D'-L${ST=
AGING_LIBDIR}'"
>
> BBCLASSEXTEND =3D "native"
>
> ///// end /////
>
> and the error i get when i try to build makes it *clear* that the
> configuration is failing to set up properly for cross-compiling for my
> powerpc target:
>
> $ bitbake libfilesys-smbclient-perl
> ... snip ...
> | Where can I find libsmbclient.h ? []
> *************************************************************
> | ** WHAT !!!!
> | ** I Can't find /libsmbclient.h : No such file or directory.
> | *************************************************************
> ... snip ...
> | Where can I find libsmbclient.so ? []
> *************************************************************
> | ** WHAT !!!!
> | ** I Can't find libsmbclient.so : No such file or directory.
> ... snip ...
> | checking for C compiler default output... a.out
> | checking whether the C compiler works... configure: error: cannot
> run C compiled programs.
> | If you meant to cross compile, use `--host'.
> | See `config.log' for more details.
>
>
>   and sure enough, the config.log for this build contains:
>
> Target: powerpc-poky-linux
> Configured with:
> ../../../../../../work-shared/gcc-6.3.0-r0/gcc-6.3.0/configure
> --build=3Dx86_64-linux --host=3Dx86_64-linux --target=3Dpowerpc-poky-linu=
x
> ...

Quick observation: I think host and target are wrong. The "host" is where t=
he=20
software will run. The line above builds something that runs on x86_64 and=
=20
that compiles for a powerpc target (target only makes sense if you're=20
compiling a compiler). You probably wanted --host=3Dpowerpc-poky-linux and =
no=20
"--target" at all.


>
>   beyond this, i'm not sure how to use an OE patch to adjust this
> source the right way, given that dozens and dozens of other modules
> cross-compiled just fine.
>
>   thoughts? i am in now way a perl expert so i really have no idea
> where to go from here.
>
> rday
>



Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






