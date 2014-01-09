Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 73C266D13C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 06:32:23 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id en1so3048036wid.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 22:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=ScZCUJ+KWspwltqiB7a9lB6NuANIk4ZwCnBVBwIXA3Y=;
	b=DSX5RZjn3Gqy95YK/ulyxJRN1P4JI5M3D2w28OUMjL0VrbO4wjMLGxLTC7OubXORWx
	4IgvgZ+csjpPMxYwwB65JB485ykmwLHMGKyQe0ILoiZ5/YvdB1Q+RRnRCjeqrp3JvnAc
	vE5iEDRkxlsK7KGWrF6POampKHdlbzJA0QKoa0F/YvMBAjfbdFDP19vIVivhmxlTKHM6
	BfStUS/jCtZ64daMalj4TjZUJg4effI3V0elRVw6bYhjOyc875FJaNptST3HcwLCq7IW
	UmoI3XUXHL74JPiyH+IimHtpDYKP0KqTsWDExcaySEfn3cPOXZ2sD+a1DVhXPNMIhPoP
	UR3Q==
X-Gm-Message-State: ALoCoQldYzae+/X8XGTYAIERxwzxrBywkh7jGWLrAGa0QRvyjYocnoy5xaGBldakbeDTnPc38q8E
X-Received: by 10.194.240.41 with SMTP id vx9mr1073162wjc.70.1389249143977;
	Wed, 08 Jan 2014 22:32:23 -0800 (PST)
Received: from ?IPv6:2001:610:612::a0ec:a622:a82a:3a79?
	([2001:610:612:0:a0ec:a622:a82a:3a79])
	by mx.google.com with ESMTPSA id pl7sm668531wjc.16.2014.01.08.22.32.22
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 Jan 2014 22:32:22 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20140109003251.GD3709@jama>
Date: Thu, 9 Jan 2014 07:32:23 +0100
Message-Id: <3A545C98-5FEA-4527-BA0D-767FEE35DCC5@dominion.thruhere.net>
References: <52CC470A.9030302@linaro.org> <1759035.6JVm74GdRW@helios>
	<52CD9CAB.5020501@linaro.org> <3583228.liS9SqzWlO@helios>
	<20140109003251.GD3709@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1827)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Qt in OE-core
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
X-List-Received-Date: Thu, 09 Jan 2014 06:32:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 jan. 2014, om 01:32 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:

> On Wed, Jan 08, 2014 at 11:21:08PM +0000, Paul Eggleton wrote:
>>> In my opinion...
>>>=20
>>> Personally I would be in favour of removing GTK+ and the GNOME UI =
from
>>> the core and putting them in their own layer for all the same =
reasons I
>>> think Qt should be in its own layer:
>>> - a "basic" image doesn't need them
>>> - we can have different layers to track separate major releases (as =
with
>>> qt3, qt4, and qt5)
>>=20
>> The trouble is, if you have no toolkit at all, how do you test that X =
still=20
>> works properly? The selection we have provides a single unit allowing =
us to=20
>> test the entire stack reasonably well without having to add anything =
else. I=20
>> think that's a valuable thing to have.
>=20
> By testing oe-core + layer with X.
>=20
> Everybody else is using oe-core + couple of other layers, why do we =
need
> to make oe-core testable with X _in single_ layer?

I have never seen a good explanation for that

> I'm not saying that oe-core should be tested with 30 layers like my
> world build, but why cannot AB have special build which builds
>=20
> oe-core + meta-xorg + meta-gnome
>=20
> and runs some runtime QA tests on that and then some other build with
>=20
> oe-core + meta-python
>=20
> for piglit tests?

And e.g. meta-xorg could live inside the oe-core git repo if additional =
git repos are too scary.=

