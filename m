Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QlhsF-0004cT-Cy
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 15:40:39 +0200
Received: by wwi14 with SMTP id 14so2192503wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 06:36:26 -0700 (PDT)
Received: by 10.216.170.149 with SMTP id p21mr1633120wel.51.1311687386211;
	Tue, 26 Jul 2011 06:36:26 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fn12sm442678wbb.4.2011.07.26.06.36.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jul 2011 06:36:25 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1311686782.2344.236.camel@rex>
Date: Tue, 26 Jul 2011 15:36:18 +0200
Message-Id: <BA49C311-EAD0-4BED-B560-8671C4858422@dominion.thruhere.net>
References: <cover.1311682779.git.edwin.zhai@intel.com>
	<73ea8ff94e4bda213df1a5a39615f4cd39899589.1311682779.git.edwin.zhai@intel.com>
	<C36AA1E0-9A00-4761-9912-A3AC81367446@dominion.thruhere.net>
	<1311686782.2344.236.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 2/3] xinput-calibrator: Add 0.7.5 as new recipe
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
X-List-Received-Date: Tue, 26 Jul 2011 13:40:39 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Op 26 jul. 2011, om 15:26 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-07-26 at 14:53 +0200, Koen Kooi wrote:
>> This one looks suspicously like the one in meta-oe. Apart from that,
>> is it really needed in oe-core?
>=20
> Given that the xcalibrate extension has been removed from the xserver =
I
> think we're going to either need to migrate the tools like xtscal or
> adopt other tools. Certainly OE-Core should have a consistent story =
for
> touchscreens=85

If you're going to copy over the meta-oe recipes 1:1 it makes sense to =
merge the remaining x differences as well. It would make meta-oe a lot =
smaller :)=


