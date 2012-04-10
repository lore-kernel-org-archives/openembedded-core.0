Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SHZEr-0000UK-Tz
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 13:27:58 +0200
Received: by vcbfl13 with SMTP id fl13so2638534vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 04:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qbxhuN+sH62twtSfKfHvPvhm6B/az+LOvEG0ZWbSKzg=;
	b=pqfM3MvoPwJN3TIjjJC6OMKMYS/L69UarsKTehB6FW7R5e6gFaxNWL3YT9d1D76Z2i
	L0ALF/WDth2rgkx44iCA0/83z2+2BRmL5pxfqRw4ms5QKuLj84Ij8mEFJjiewp/Jtnpd
	0OhyuHPjQ1D4sK5ZWKHNPeTQh+hdwetJeWSCGqh8uKBOijbn+sNGZGbLHO9eveDVL2pv
	07uciDtgHAW2fKZFWlZxRa/8JgboiRjVTUsenZefebv0B4wXoygDhO9ncE5rUAaTaWdN
	R2p2lhQhLfVqVtl1A5jlwy1QLsM0HOm3cW+vb+EOJBJ64iw1Qvnt01CH6Wheur30p2bl
	6dHg==
MIME-Version: 1.0
Received: by 10.52.31.42 with SMTP id x10mr4423781vdh.33.1334056719878; Tue,
	10 Apr 2012 04:18:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.2.195 with HTTP; Tue, 10 Apr 2012 04:18:39 -0700 (PDT)
In-Reply-To: <637B72D9-1F2D-4CD3-8903-36E73E7CC465@dominion.thruhere.net>
References: <cover.1334027369.git.lianhao.lu@intel.com>
	<0953244152d03d27f6c60729c58484af81f95a1d.1334027369.git.lianhao.lu@intel.com>
	<637B72D9-1F2D-4CD3-8903-36E73E7CC465@dominion.thruhere.net>
Date: Tue, 10 Apr 2012 08:18:39 -0300
X-Google-Sender-Auth: mdp2JriUf8gt6XSvSnEbQAWijCE
Message-ID: <CAP9ODKrEiLo7DMkNBks8s8jHw=WgTQ3S_zf-QUYSseLqD5tMEQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] connman: optionally build ofono plugin.
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
X-List-Received-Date: Tue, 10 Apr 2012 11:27:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Koen,

On Tue, Apr 10, 2012 at 03:48, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> This changes the default behaviour, so it should not go in for 1.2

I don't see why this shouldn't be included. It does improve build time
and works for both OE-Core and Yocto setups.

Can you clarify what is your concerns?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


