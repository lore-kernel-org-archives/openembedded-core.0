Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UJITz-0001Pw-7k
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 08:03:16 +0100
Received: by mail-pb0-f46.google.com with SMTP id uo15so3391629pbc.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 23:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=LdpnBsSr8kP7bh/y/3HmuBNLOjpElN3Xwi8u/KeQQp8=;
	b=Jj8aP4GfU8yunBn4sb4nTa0vZoboyCM59s+fjqmbFsm4nmBP+WiN3I354CVEXiztmC
	M9eSvU+mOME7TGTfokp+v9u4Qc6zCUOsU25Ru8Kgw8Nk0HwTegiXQIRRLhA3yCCnHeAJ
	B3ACHMaoSUqIJVLI72uV4md27c4ZsVFTrLlxROGKXTQYsSDZT102YiTsiDnAhjkfBf/e
	DFG4+xnJPlPxX80mDgdGJTbf97YDx8myEYY2elZvZhdB2Bo3EYmj8sfip0K1Ogubhdp0
	WEOtAT6YZ4QYZFwSdEOI6IuDnuFaMA15VTFA97kgpvk/CaOHa0uAGlRRJK+S3/UJWDOl
	4rUw==
X-Received: by 10.68.242.65 with SMTP id wo1mr6612673pbc.62.1364021179762;
	Fri, 22 Mar 2013 23:46:19 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id zv3sm5959153pab.0.2013.03.22.23.46.18
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 23:46:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <C0277860-16B4-43E3-B8F7-3ABA51405BA5@gmail.com>
Date: Fri, 22 Mar 2013 23:46:17 -0700
Message-Id: <92506B71-85AD-48C6-94D0-0B54847F2C33@gmail.com>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAJTo0Lbo8zRjtsX1xYBgz6b00k2Up0wXscA5b2uycDHXF09PKQ@mail.gmail.com>
	<C0277860-16B4-43E3-B8F7-3ABA51405BA5@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/16] libuser: Fix case where ${B} != ${S}
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
X-List-Received-Date: Sat, 23 Mar 2013 07:03:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 22, 2013, at 7:58 PM, Khem Raj <raj.khem@gmail.com> wrote:

>=20
> On Mar 21, 2013, at 9:30 AM, "Burton, Ross" <ross.burton@intel.com> =
wrote:
>=20
>> On 21 March 2013 15:55, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> Fix out of tree builds and a parallel make race, see the patch =
header
>>> for details.
>>=20
>> As there's no cover letter, I'll reply to this.  =46rom a reading of =
the
>> patches (no build testing) it looks good, so Acked-by: Ross Burton
>> <ross.burton@intel.com>.
>=20
>=20
> on the contrary it broke my -j 20 build
>=20
> | LinuxdocTools::process_file: Cannot find ./sgml/libuser.sgml. =
Aborting ...
> | LinuxdocTools::process_file: Cannot find ./sgml/libuser.sgml. =
Aborting ...
> | Processing file ./sgml/libuser.sgml
> | Processing file ./sgml/libuser.sgml
> | make[2]: *** [sgml/libuser.txt] Error 2
> | make[2]: *** Waiting for unfinished jobs....
> | make[2]: *** [sgml/libuser.html] Error 2
>=20
>=20


posted a patch here

=
http://lists.linuxtogo.org/pipermail/openembedded-core/2013-March/037410.h=
tml

which should fix both cases of building in srctree and outside of =
srctree.


>>=20
>> Ross
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20



