Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1THRSP-0006x9-0D
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 05:41:41 +0200
Received: by padfa11 with SMTP id fa11so1898110pad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 20:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=B3rVOC/xWrfmG8Bbq4d/gKFVsvuqMQP7BdHY6xOYmd0=;
	b=nt6Z5VFw2qwAcpVCzgaDj2PbTpPwAj6fu1KotMkttMqig6mxTH7ElIj1bSsYldHKeU
	tl5GF+igJ4ItcDmIJ7jiesasuIaO10hh/HfO7lmCqzHNEG7MCWRLELBZCwEe/lNYcSUN
	U1+JTjQRuAv/2VuRTNfwT1IyhKk8X0akPrhgdCgwnCVJCHDTiPpUkiZG9a6lwl0Foi+C
	XhFtvU3Sv1Bfvza3N64rvuS9NBA5lOTUtXZ1D7++6jfH+bfIEgE1dMkS9V3rro5BUy9E
	UDC8siGynA6GfSJb0qKEEbkoKGvyem1BCWBmf5gFB3c2rOduwT/unzeUH8pUt1IR0Pfi
	Ax8g==
Received: by 10.68.225.68 with SMTP id ri4mr16553549pbc.115.1348802927585;
	Thu, 27 Sep 2012 20:28:47 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	bt7sm4761606pab.14.2012.09.27.20.28.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 20:28:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <9CAE2E57-84BE-44B7-A7BE-BCE8F728EFE8@gmail.com>
Date: Thu, 27 Sep 2012 20:28:45 -0700
Message-Id: <E416A48D-4E21-4353-BDDC-B3B15AA810C9@gmail.com>
References: <9CAE2E57-84BE-44B7-A7BE-BCE8F728EFE8@gmail.com>
To: "openembedded-core@lists.openembedded.org oe-core layer"
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1498)
Subject: Re: perl install error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 03:41:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Sep 27, 2012, at 8:22 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Hi
>=20
> On ppc64 I am getting=20
>=20
> | Warning: perl appears in your path in the following locations beyond =
where
> | we just installed it:
> |     =
/work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl
> |
> | make[1]: Nothing to be done for `install.man'.
> | make[1]: Leaving directory =
`/work/yocto/poky/build/tmp/work/ppc64e5500-poky-linux/perl-5.14.2-r10/per=
l-5.14.2'
> | ln: failed to create symbolic link =
`/work/yocto/poky/build/tmp/work/ppc64e5500-poky-linux/perl-5.14.2-r10/ima=
ge//usr/lib64/perl5': No such file or directory
> | ERROR: Function failed: do_install (see =
/work/yocto/poky/build/tmp/work/ppc64e5500-poky-linux/perl-5.14.2-r10/temp=
/log.do_install.6656 for further information)
> ERROR: Task 1679 =
(/work/yocto/poky/meta/recipes-devtools/perl/perl_5.14.2.bb, do_install) =
failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4082 tasks of which 4057 didn't need to =
be rerun and 1 failed.
>=20
>=20
> It was working fine yesterday
> anyone else seeing it ?


If I revert=20

perl: Fix nativesdk install path
Commit 38234f2e276356b1d77a87ceabc486107e336d19 tried to fix the sed
expressions by anchoring the left side of the search regexp to prevent
$prefix$prefix type expression in the perl config. For nativesdk this is
not enough. Adding anchors on both side fixes this.

Signed-off-by: Christian Glindkamp <christian.glindkamp@taskit.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>



It works again

Thanks
-Khem




