Return-Path: <roman@khimov.ru>
Received: from roman.khimov.ru (roman.khimov.ru [82.146.54.17])
	by mail.openembedded.org (Postfix) with ESMTP id BBCE86011C;
	Tue, 24 Nov 2015 18:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=khimov.ru;
	s=mail; 
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:Reply-To:To:From;
	bh=WzrbswO7mWOAv1y+PXjfGWfED0iBUs7Y56M20Mgg2xw=; 
	b=nyErRZq12g9SOe9Tx42ijchHIPBfctfYJtueTxBmQsdRC6XGaSP4mx7so3y4GS7qRLCKZIDTFcEJtt2qax7Nh6nlYaKUbhlbweBS9WOQwEgw1ZWY86tKrkeaU3pmFpYHHbT7P73MjoLRjcPjYEi1n7fIFrWbqXv2B5HBx6/d3sxdO1/s1MXe1bUdmgl6iVvVuyin0IMLolWmUYZQbjXiYcN30W1p2PlDQX42fjfFbtyArMqrgh7gC+7LW19udMLHEg9QaZKnT4sYK/OmPq1t5UapPAZdvpL9zhGnGaZ6oMzEWm7mVr5iY6XQF8/sQJr9938VObmNUYS1owry7E/6TQ==;
Received: from [93.100.16.104] (helo=masala.hex)
	by roman.khimov.ru with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.84) (envelope-from <roman@khimov.ru>)
	id 1a1Id6-0002RY-U1; Tue, 24 Nov 2015 21:47:54 +0300
From: Roman Khimov <roman@khimov.ru>
To: Mark Hatle <mark.hatle@windriver.com>
Reply-To: roman@khimov.ru
Date: Tue, 24 Nov 2015 21:47:52 +0300
Message-ID: <11874234.lUveKP5eiY@masala.hex>
User-Agent: KMail/4.14.10 (Linux/4.1.12-1-default; KDE/4.14.10; x86_64; ; )
In-Reply-To: <5654AC12.9060808@windriver.com>
References: <56538808.5050606@linux.intel.com> <90526450.BhUWnDVvgQ@masala.hex>
	<5654AC12.9060808@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: Reference updater filesystem
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
X-List-Received-Date: Tue, 24 Nov 2015 18:47:57 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 24 =D0=BD=D0=BE=
=D1=8F=D0=B1=D1=80=D1=8F 2015 12:27:30 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=
=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Mark Hatle =D0=BD=D0=B0=D0=BF=D0=
=B8=D1=81=D0=B0=D0=BB:
> On 11/24/15 12:05 PM, Roman Khimov wrote:
> > =D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 24 =D0=BD=D0=
=BE=D1=8F=D0=B1=D1=80=D1=8F 2015 07:47:38 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=
=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Mark Hatle =D0=BD=D0=B0=D0=BF=
=D0=B8=D1=81=D0=B0=D0=BB:
> >> On 11/24/15 4:39 AM, Roman Khimov wrote:
> >>> =D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 23 =D0=BD=
=D0=BE=D1=8F=D0=B1=D1=80=D1=8F 2015 15:41:28 =D0=BF=D0=BE=D0=BB=D1=8C=D0=
=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Mariano Lopez =D0=BD=D0=B0=
=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> >>>> 1. Use a separate partition for the configuration.
> >>>>=20
> >>>>    a. The pro of this method is the partition is not touched dur=
ing the
> >>>>=20
> >>>> update.
> >>>>=20
> >>>>    b. The con of this method is the configuration is not directl=
y in
> >>>>=20
> >>>> rootfs (example: /etc).
> >>>=20
> >>> That's the right solution, although to do it really right (at lea=
st IMO)
> >>> you need to implement the /usr merge [1] (and that's orthogonal t=
o using
> >>> or not using systemd), which can also help you make your /usr rea=
d-only
> >>> (because that's just code and static data) with read-write / for =
user
> >>> data of various sorts.
> >>=20
> >> Why does merging /usr have anything to do with this?  I've read th=
e case
> >> for merging /usr and / and still don't understand why it "helps". =
 The
> >> key is that if you have separate partitions for /usr and /, then y=
ou
> >> need to update both of them in sequence.  Merging these two just s=
eems
> >> like a lazy solution to people not wanting to deal with early boot=
 being
> >> self-contained.
> >=20
> > It helps in that you can achieve a clear separation of your softwar=
e and
> > users data (whatever that is, even if that's just some configuratio=
n
> > files) and only update your part (which is /usr).
>=20
> This can easily be archived using different partitions like /opt as w=
ell.

Usually it leads to more complicated partitioning and more complicated =
startup=20
(as well as update) procedure. Of course it can vary from system to sys=
tem,=20
but in my experience /usr merge was exactly the thing needed to clearly=
=20
separate and simplify things. One way or another you want to have your =
code=20
and users data to be separated, /usr merge makes it quite simple.

> Bandwidth is a big deal in areas that are not serviced by anything bu=
t very
> GPRS or worse.  So 100 MB is even too big in some cases.  Cost is a f=
actor
> as is overall bandwidth.
>=20
> Again, it depends on the product and what you are building if this ma=
tters.
>=20
> The point is we don't want to make some assumptions that preclude
> alternative implementations.

Sure.

--=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

