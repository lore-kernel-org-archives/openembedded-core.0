Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QN1oc-0005up-IN
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 13:54:54 +0200
Received: by wwb17 with SMTP id 17so2317531wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 04:51:54 -0700 (PDT)
Received: by 10.227.37.197 with SMTP id y5mr3103127wbd.4.1305805914641;
	Thu, 19 May 2011 04:51:54 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id bd8sm1564847wbb.31.2011.05.19.04.51.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2011 04:51:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1305805104.3424.484.camel@rex>
Date: Thu, 19 May 2011 13:51:47 +0200
Message-Id: <7AA87FA4-77D9-4D52-9D91-1BB909F268A6@dominion.thruhere.net>
References: <cover.1305800693.git.lianhao.lu@intel.com>
	<53BCC7D4-31CB-43AA-A5DD-CC1730DDD0B2@dominion.thruhere.net>
	<1305805104.3424.484.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/5] network based PR service
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
X-List-Received-Date: Thu, 19 May 2011 11:54:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 mei 2011, om 13:38 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-05-19 at 12:54 +0200, Koen Kooi wrote:
>> Op 19 mei 2011, om 12:29 heeft Lianhao Lu het volgende geschreven:
>>=20
>>> From: Lianhao Lu <lianhao.lu@intel.com>
>>>=20
>>> This series of 5 patches implemented the network based PR service =
and enabled=20
>>> the poky to use it during the task do_package and =
do_package_write_xxx. By=20
>>> using the network based PR service and the basichash for =
BB_SIGNATURE_HANDLER,=20
>>> the poky user may not need to bump the PR manually everytime he/she =
changes=20
>>> the recipe. The package will get automatically rebuilt and new =
revision number=20
>>> reflecting the change will be included in the package feed.
>>=20
>> Does it have a public/private mode? In the angstrom case, we only =
want
>> developers to 'submit' PR bumps and users only retrieve them.
>=20
> It doesn't look like it but it wouldn't be hard to only submit PR
> changes if some kind of token was present.
>=20
> The big question would be, if a user tried building something for =
which
> PR no record was on the server and didn't have submit privileges, what
> should the server return and how should the build behave? Hard error?
>=20
> If its not a hard error, you are likely to run into local
> reproducibility issues and also conflicts with the server?

I would go for a warning on the client side and an error in the log in =
the server side. If the server people care enough they'll check the log =
for errors and add the missing info.

I think we need to give this a try and see what improvements we need.

regards,

Koen=


