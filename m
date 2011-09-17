Received: from mail-wy0-f169.google.com ([74.125.82.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R4qw4-00033q-5l
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Sep 2011 11:11:44 +0200
Received: by wyi11 with SMTP id 11so6478037wyi.28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2011 02:06:30 -0700 (PDT)
Received: by 10.216.11.20 with SMTP id 20mr387932wew.35.1316250390435;
	Sat, 17 Sep 2011 02:06:30 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fq9sm16125701wbb.15.2011.09.17.02.06.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Sep 2011 02:06:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CABcZANnuV39P8kgBY0=cy6nvVMKbDKZVg2NTOQAn8f_wij7+_g@mail.gmail.com>
Date: Sat, 17 Sep 2011 11:06:26 +0200
Message-Id: <BBD91366-D6E5-45DA-B6D3-FA23CCE35B16@dominion.thruhere.net>
References: <1316177653.20858.23.camel@ted>
	<201109161816.28057.paul.eggleton@linux.intel.com>
	<CAP9ODKoVOSsDOKtiv-LExuKbeGciGp4hfC=V5j-zCY8wDNwr3A@mail.gmail.com>
	<201109161849.52647.paul.eggleton@linux.intel.com>
	<CAP9ODKpqO4zN=gjOsod6UtTku6xZmRen63VBKs+_MOdjF1AAFA@mail.gmail.com>
	<4E73A769.9070903@windriver.com>
	<CABcZANnuV39P8kgBY0=cy6nvVMKbDKZVg2NTOQAn8f_wij7+_g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: OE-Core release process
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
X-List-Received-Date: Sat, 17 Sep 2011 09:11:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 sep. 2011, om 04:55 heeft Chris Larson het volgende geschreven:

> On Fri, Sep 16, 2011 at 12:45 PM, Mark Hatle =
<mark.hatle@windriver.com> wrote:
>>> Yes I know but wouldn't be better if you could base your work on
>>> oe-core and avoid doing this?
>>=20
>> For submitting to oe-core for pull requests, basing work off of =
oe-core is "best
>> practice".  However, forcing people who are working on a specific =
distribution
>> to do this isn't reasonable.  It can be requested of them, but IMHO =
thats as far
>> as it will go.
>>=20
>=20
> I don't see why it isn't reasonable. If they need a change done sooner
> than can be done by pushing it upstream, they can put it into a local
> layer until it makes it into oe-core. Seems simple enough to me.

Furthermore, poky is the only distro using this weird combo-layer =
arrangement, all the others I know off (angstrom, shr, micro, aurora) =
consume oe-core directly.=


