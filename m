Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S3Rjp-0007rl-LX
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 13:37:33 +0100
Received: by wgbdr12 with SMTP id dr12so1328015wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2012 04:29:02 -0800 (PST)
Received: by 10.180.7.231 with SMTP id m7mr4807817wia.3.1330691342668;
	Fri, 02 Mar 2012 04:29:02 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id cc3sm9194787wib.7.2012.03.02.04.29.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Mar 2012 04:29:01 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330690229.15224.7.camel@ted>
Date: Fri, 2 Mar 2012 13:29:01 +0100
Message-Id: <F32A162F-E406-4D75-8BE5-E742C27E2E95@dominion.thruhere.net>
References: <1330690229.15224.7.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlG3jAWoEXtS3ipNS+xXWlLaO3gE/FdpH863bN0PtOY0iwHOylpo7JNcFTWboKjJOJqGm/F
Subject: Re: [PATCH] base.bbclass: If unpacking again, wipe out ${S}/patches
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
X-List-Received-Date: Fri, 02 Mar 2012 12:37:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 mrt. 2012, om 13:10 heeft Richard Purdie het volgende geschreven:

> If we unpack again, its assumed the data in any patches directory is =
invalid
> since do_patch will run again. This ensures old patch data doesn't get
> reused in a confused way.
>=20
> Ideally we should probably wipe out ${S} here but that is probably a =
change
> for another time.
>=20
> [YOCTO #2043 partially]
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index a76fe55..39d3e78 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -94,6 +94,7 @@ python base_do_fetch() {
>=20
> addtask unpack after do_fetch
> do_unpack[dirs] =3D "${WORKDIR}"
> +do_unpack[cleandirs] =3D "${S}/patches"

This gets clean *before* do_unpack, right? I have a number of recipes =
that use sources with patches/ as a toplevel subdirectory.

regards,

Koen=


