Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qvylv-0003Bk-VG
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 23:44:36 +0200
Received: by wyf19 with SMTP id 19so464519wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2011 14:39:50 -0700 (PDT)
Received: by 10.227.32.145 with SMTP id c17mr725564wbd.111.1314135590478;
	Tue, 23 Aug 2011 14:39:50 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n20sm312683wbh.33.2011.08.23.14.39.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Aug 2011 14:39:49 -0700 (PDT)
References: <cover.1313606178.git.paul.eggleton@linux.intel.com>
	<201108191127.48228.paul.eggleton@linux.intel.com>
	<4E53FA98.1060909@linux.intel.com>
	<201108232107.11656.paul.eggleton@linux.intel.com>
In-Reply-To: <201108232107.11656.paul.eggleton@linux.intel.com>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <223738B4-4BEF-4391-822D-096B132C3A49@dominion.thruhere.net>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 23 Aug 2011 23:39:41 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Darren Hart <dvhart@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/2] image.bbclass, kernel.bbclass: create warning file about deleting deploydir files
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
X-List-Received-Date: Tue, 23 Aug 2011 21:44:36 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 23 aug. 2011 om 22:07 heeft Paul Eggleton <paul.eggleton@linux.intel.com>=
 het volgende geschreven:

> On Tuesday 23 August 2011 20:08:08 you wrote:
>> On 08/19/2011 03:27 AM, Paul Eggleton wrote:
>>> I guess it would, but I'm not sure we really want to be encouraging user=
s
>>> to use -f.
>>=20
>> I don't see it as having the same negative conotation as the force
>> options to things like rpm and dpkg. Here it just means "I really want
>> to run this specific task again, even if you already ran it, likely
>> because I know I did something to undo what you just did." :-)
>=20
> My concern is that not all tasks are repeatable;

I consider that a bug :)


>  could run into all=20
> sorts of trouble using this option under the wrong circumstances and it mi=
ght=20
> be difficult to debug after the fact.
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


