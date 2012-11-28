Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TdkdB-0006Fz-Rg for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 17:37:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qASGMg8Q014935;
	Wed, 28 Nov 2012 16:22:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14232-05; Wed, 28 Nov 2012 16:22:37 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qASGMVGl014929
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 28 Nov 2012 16:22:33 GMT
Message-ID: <1354119751.15992.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: David =?ISO-8859-1?Q?Nystr=F6m?= <david.nystrom@enea.com>
Date: Wed, 28 Nov 2012 16:22:31 +0000
In-Reply-To: <50B63784.5050502@enea.com>
References: <50B63784.5050502@enea.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	qASGMg8Q014935
Cc: openembedded-core@lists.openembedded.org
Subject: Re: meta-cloud layer
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
X-List-Received-Date: Wed, 28 Nov 2012 16:37:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-11-28 at 17:10 +0100, David Nystr=C3=B6m wrote:
> Hello everyone,
>=20
> I'm working on getting a minimal Yocto/oe-core based OpenStack setup=20
> running with the meta-cloud layer, with bits and pieces "borrowed" from=
=20
> the meta-xen layer.

Great news!

It might be worth growing meta-xen into a meta-virtualisation layer
since kvm, openstack and xen all seem to be sharing a lot of pieces.
This depends on the maintainers but it would seem to be logical rather
than many small interdependent layers.

> Still in its infancy, and lots of stuff is still missing and/or not=20
> working properly.
>=20
> Have a look if your interested, not much to see yet though.
>=20
> https://github.com/nysan/meta-cloud.git
>=20
> Any thoughts on floating layer ML:s, i.e. an ML for so called=20
> "out-of-tree" layers ?  Or is the common thought that all new recipes
> should eventually go into oe-core ?

The Yocto Project has been using the Yocto list for that and
OpenEmbedded has openembedded-devel. Its not expected for everything to
end up in OE-Core, quite the opposite.

Cheers,

Richard




