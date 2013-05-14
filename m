Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UcMlj-0005dR-Hb
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 23:28:25 +0200
Received: by mail-pb0-f45.google.com with SMTP id mc8so766837pbc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 14:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=BLV9VaD6/c+8/9RXDgoSS9+hjOexT4PmSLr4tJxdOkk=;
	b=rSzms/e4ZDUCSlW7ItY3300To5L702plUmkiUg+MB1OYZRUrGRD99741e0nkGmb7oy
	ZOAUzWYA65gs+CeVuOub5yXOS2hUrzvikEk9kcqT5RKaK7P6mY901vn2JQgn4+ucrtWb
	VIXKqriU+BD1FLO5pyLLIRuAOffhKlfhAtEW3wQNmVYCCeP/Wi7PNWLUhrxNOqBEVQKZ
	Yh3UTrgkANTDGwxWDsw+iUUWjmEchrBFl5I0rhRCI9ZWSgqbBbBWkOphSB6Q866blhwb
	7uAmu2AlXY5jp9NPQeNkfbPrcHgkB3lqMZBQtgeDFDCcaAdYoXus4uEXHgSxU+GJaZM0
	mGLg==
X-Received: by 10.66.120.164 with SMTP id ld4mr36312764pab.187.1368565811006; 
	Tue, 14 May 2013 14:10:11 -0700 (PDT)
Received: from vjalali-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id lq4sm327765pab.19.2013.05.14.14.10.08
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 14 May 2013 14:10:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1368548693.6920.70.camel@phil-desktop.brightsign>
Date: Tue, 14 May 2013 14:10:10 -0700
Message-Id: <781A0583-A85B-42C2-BFC4-806465C424FC@gmail.com>
References: <1368513918-16448-1-git-send-email-raj.khem@gmail.com>
	<1368525912.25898.15.camel@ted>
	<CAMKF1srAGRK=9BP5VrqhH50VrtWb+PFL5G5P-EEBPefb16xxTA@mail.gmail.com>
	<1368548693.6920.70.camel@phil-desktop.brightsign>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.1503)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pam: Add libtirpc to build dependencies
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
X-List-Received-Date: Tue, 14 May 2013 21:28:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 14, 2013, at 9:24 AM, Phil Blundell <pb@pbcl.net> wrote:

> On Tue, 2013-05-14 at 07:33 -0700, Khem Raj wrote:
>>=20
>>=20
>> On Tuesday, May 14, 2013, RicharPurdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Mon, 2013-05-13 at 23:45 -0700, Khem Raj wrote:
>>>> libtirpc is looked for by configure and if found
>>>> its enabled. So lets make it consistent and enable
>>>> it always
>>>>=20
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>> meta/recipes-extended/pam/libpam_1.1.6.bb |    2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> What is the benefit of this dependency?
>>=20
>>=20
>> When building from sstate the build of libpam would fail during
>> configure if the machine who populated sstate had libtirpc staged
>> before building libpam and with high parallelism its quite often=20
>=20
> Does this mean that every image which uses pam will also drag in =
tirpc?

yes.=20


> What's the cost in space and time for that?
>=20

142K -  libtirpc.so.1.0.10

Time I can't quantify, depends on your build system e.g. on my system =
built from scratch with and without dependency
showed few (20+) seconds difference. It might vary for you.


> p.
>=20
>=20



