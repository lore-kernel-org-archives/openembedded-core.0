Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9yAi-0006d7-DE
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 13:28:16 +0100
Received: by wibhj13 with SMTP id hj13so4407951wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 05:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=yzbsiQq296E80fGWNa3mQfKAvjGt6zFdLbMYMnksWis=;
	b=KW0k1kd+t0nz1+UnI4O/d8Afe9YuQ3TCo/chFBuKjjgAA98NEp/wEM8YdDpBkh3R9E
	2yghe7XQXYxlJWCBarURY8Rl8YZEPDnFzJzBx5beT6ZgTWRf+LWncO1DQ0aUR5dgtjlB
	NycjcSdkXvuld1LZAD8/zMCxB4Hf0TTdZvNFcpf2nXsx/cOrXLQyvknb9HSvVFmJScjp
	zh1JgB6Taori+IBH2w9piUyX/DBRJUqH1NqeBg5+ddrSl2sJe16K3D+Y7V0G8+v110sp
	QgIxhIltf1FpvhAc9z8ECE5juVydxO75gPUE/6qHW/p5rEKtOInzQw3xdWf8d+ls/b6k
	38+A==
Received: by 10.216.132.140 with SMTP id o12mr9130487wei.67.1332245964019;
	Tue, 20 Mar 2012 05:19:24 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o2sm5920260wiv.11.2012.03.20.05.19.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 05:19:23 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F687274.5080608@windriver.com>
Date: Tue, 20 Mar 2012 13:19:21 +0100
Message-Id: <2CAE1B9A-090E-4FE2-BFBE-74ECE9646C3E@dominion.thruhere.net>
References: <4F684301.5060307@windriver.com> <1757423.DE0kMhjxZk@helios>
	<4F687274.5080608@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnIhAKAHdADRk+ROy5CBDhHVlCLq1XfrK92jEaA2y+VAfv24fUqPk/nQHLdDvw6GbVICeR+
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: Why qemu-config RDPENDS on distcc ?
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
X-List-Received-Date: Tue, 20 Mar 2012 12:28:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 mrt. 2012, om 13:05 heeft Robert Yang het volgende geschreven:

>=20
> On 03/20/2012 05:43 PM, Paul Eggleton wrote:
>> On Tuesday 20 March 2012 16:42:41 Robert Yang wrote:
>>> I'm just curious that qemu-config RDPENDS on distcc:
>>>=20
>>> meta/recipes-bsp/qemu-config/qemu-config.bb:RDEPENDS_${PN} =3D =
"distcc ..."
>>>=20
>>> And there are 4 processes named "distcc" running after boot the =
target
>>> with "runqemu qemux86".
>>>=20
>>> We have distcc on the target, but no gcc or g++, can we remove it =
from
>>> qemu-config's RDEPENDS?
>>=20
>> I think the idea was that if you wanted to do compilation on the =
emulated
>> target, having distcc would let you do it with much better =
performance. I
>> agree it seems that it's not particularly useful if you're never =
going to do
>> any compilation on the target though.
>>=20
>=20
> Thanks for your reply, so may I send a pull request to remove it from
> qemu-config's RDPENDS?

I'll argue that qemu-config should be an image choice, not a machine =
choice :)

regards,

Koen=


