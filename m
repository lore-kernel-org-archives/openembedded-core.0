Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UbZTj-0004H5-Ov
	for openembedded-core@lists.openembedded.org;
	Sun, 12 May 2013 18:50:32 +0200
Received: by mail-da0-f48.google.com with SMTP id h32so1875747dak.35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=V6IXR49SbkWPYKYkEa2rMB/aK+JvB96dNfdhaPuE8Wg=;
	b=zrcXcdG7AYBlFPkUXDJ10s1LaMF90Wov9wBmkrNv0AgnjYdNivBrx6N3yeNVMlw0nP
	+DkxYB08nBhU4vM6JH/7UN7wg/KfDLdDvl3SDTR0LCdFKdsXEFhftOn3wbRW7FGi6Pjm
	jcGJXWBFEVGqCaGsIWwrsL3qrAvDX2ISrVXd5eOwDJ2qKvgQoILafaweMeaIL1PnKyOn
	OkQU4rByPZ2ncd0IAn8LvWOBmvfXfyPfnMmktzkzbXf5Htnxt5CgwCgUaPoMacOQRCfo
	TrmX5Zl2ayaUi6SFtP7nhNRSrXL9UbdDqgZeYls/5Fp4rHQOnv51kbRmqQNXf1e+Ehhq
	2gSg==
X-Received: by 10.66.246.131 with SMTP id xw3mr25934596pac.114.1368376342685; 
	Sun, 12 May 2013 09:32:22 -0700 (PDT)
Received: from stafford-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	nt2sm10641140pbc.17.2013.05.12.09.32.21 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 09:32:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <518FB7F9.2020102@linux.intel.com>
Date: Sun, 12 May 2013 09:32:21 -0700
Message-Id: <5E905940-DBCA-46B5-A011-3160D6CAAF26@gmail.com>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518D7326.1030901@linux.intel.com> <518E4EAB.8050502@balister.org>
	<CAP9ODKoB_KzEPvRwDkZxLgq4d5A5DiPZ+gfko5XgF3qp9fP_xQ@mail.gmail.com>
	<518FB7F9.2020102@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Sun, 12 May 2013 16:50:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 12, 2013, at 8:40 AM, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/12/2013 06:27 AM, Otavio Salvador wrote:
>> On Sat, May 11, 2013 at 10:59 AM, Philip Balister =
<philip@balister.org> wrote:
>>> On 05/10/2013 06:22 PM, Saul Wold wrote:
>>>> On 05/10/2013 05:33 AM, Jukka Rissanen wrote:
>>>>> The VPN support is activated if DISTRO_FEATURES contains
>>>>> vpn string.
>>>>>=20
>>>>=20
>>>> This also create a dependency on the meta-openembedded layer, I am =
not
>>>> sure we want to do that.
>>>=20
>>> If the default setting does not add the dependency it should be OK? =
What
>>> packages in meta-oe are needed? Does this suggest they should move =
to
>>> oe-core?
>>=20
>> I think so, it'd be good to have it in oe-core and allow use of vpn =
:)
>>=20


why not in meta-networking ? these seems apt for that layer. You do not =
need VPN packages to test oe-core functionality=20
OE core should get thinner not thicker.

> I would like to see what the full dependency set looks like for these, =
clearly there is the vpnc, openvpn, l2tp and pptp recipes, but what else =
and what licenses are they under.
>=20
> Sau!
>=20
>> --
>> Otavio Salvador                             O.S. Systems
>> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
>> Mobile: +55 53 9981-7854              =
http://projetos.ossystems.com.br
>>=20
>>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



