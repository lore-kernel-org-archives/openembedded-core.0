Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PvVzD-0004d6-4q
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 15:28:07 +0100
Received: by wyb38 with SMTP id 38so2074091wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2011 06:26:34 -0800 (PST)
Received: by 10.216.144.205 with SMTP id n55mr652890wej.5.1299248794464;
	Fri, 04 Mar 2011 06:26:34 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n1sm1195927weq.7.2011.03.04.06.26.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 06:26:33 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1299247286.17567.1349.camel@rex>
Date: Fri, 4 Mar 2011 15:26:32 +0100
Message-Id: <75F3CD12-154B-44AC-8F3D-BE90C5D10153@dominion.thruhere.net>
References: <1299235247-5527-1-git-send-email-Martin.Jansa@gmail.com>
	<1299247286.17567.1349.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: [PATCH] bitbake.conf: point PERSISTENT_DIR outside TMPDIR
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
X-List-Received-Date: Fri, 04 Mar 2011 14:28:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 mrt 2011, om 15:01 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-03-04 at 11:40 +0100, Martin Jansa wrote:
>> * sanity check warning user that he still has peristent cache in old =
location
>> * similar patch was sent to OE, to keep PERSISTENT_DIR location =
consistent
>>  =
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/030623.=
html
>>=20
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>> meta/classes/sanity.bbclass |    8 ++++++++
>> meta/conf/bitbake.conf      |    2 +-
>> meta/conf/sanity.conf       |    1 +
>> 3 files changed, 10 insertions(+), 1 deletions(-)
>=20
> When I saw this on the OE list, I'd assumed you'd done what Poky had
> done, I've just realised you're moving this file to TOPDIR instead of
> TMPDIR.
>=20
> My big concern here is that we really shouldn't be writing to data to
> the conf directory as its not what the user expects.
>=20
> I say this knowing the raft of usability problems we've had every time
> we take something outside of TMPDIR as users have the expectation that
> deleting tmp wipes out all stored state and rebuilds. Having this file
> hidden in the conf directory breaks that expectation. Note there are
> only two things we place outside of TMPDIR, downloads and sstate data.

And pseudodone! That one nearly always trips me up :)=


