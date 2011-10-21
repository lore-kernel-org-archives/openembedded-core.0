Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RHDwn-0008RX-4N
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 14:11:37 +0200
Received: by eyd9 with SMTP id 9so3949842eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 05:05:44 -0700 (PDT)
Received: by 10.14.4.167 with SMTP id 39mr1789797eej.13.1319198743894;
	Fri, 21 Oct 2011 05:05:43 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z58sm34393497eea.3.2011.10.21.05.05.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 05:05:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKqFfswQ4Y6fJBJMTjrvnu0syiS3rAWxZjhdtwyx_Z_SWQ@mail.gmail.com>
Date: Fri, 21 Oct 2011 14:05:35 +0200
Message-Id: <3968D33D-7086-4E22-9CA1-9B44BE0DBEBF@dominion.thruhere.net>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
	<CADkTA4NxfSaEinraLQMsLT4ZWQKOPAZ76uNujFXg0zSrRvVnFA@mail.gmail.com>
	<0E901391-C9FC-48AE-88A4-C1064E57376E@dominion.thruhere.net>
	<1317221697.12332.13.camel@ted>
	<89CD0BCB-1457-4C76-87BA-5ED03454C343@dominion.thruhere.net>
	<1317239461.12332.55.camel@ted>
	<CAP9ODKopjm-bJY3WJriMiQDtwZcsOWeqZkqnm7F2PwiZvWY0bg@mail.gmail.com>
	<67E90C92-F94E-4FF2-ADA5-A5295C4F1279@dominion.thruhere.net>
	<1319109715.16061.4.camel@ted>
	<46567209-1B97-42F5-B5DF-E34B823F6BF7@dominion.thruhere.net>
	<1319114339.2410.5.camel@ted>
	<7D5D6BF3-6F21-4CE5-8A30-F9154CDB9449@dominion.thruhere.net>
	<CAP9ODKqFfswQ4Y6fJBJMTjrvnu0syiS3rAWxZjhdtwyx_Z_SWQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/5] kernel.bbclass: respect MACHINE_KERNEL_PR
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
X-List-Received-Date: Fri, 21 Oct 2011 12:11:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 20 okt. 2011, om 15:02 heeft Otavio Salvador het volgende geschreven:

> On Thu, Oct 20, 2011 at 10:54, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
> ...
>>> Also, the idea never was to have everyone using bleeding edge for
>>> shipping products. This is what stable releases are for?
>>=20
>> That's what stable releases are for, but I don't see a release for =
OE-core, do you? I see a poky release, but not an OE-core release.
>=20
> People, let's calm down.
>=20
> I think since Richard disagree about pushing this patch and more then
> one person disagree with Richard, TSC is the way to go.

Executive summary of the TSC meeting:

1) This patch gets applied, but no more PR helpers will be allowed, =
INC_PR and MACHINE_KERNEL_PR are the only ones tolerated for the time =
being.
2) kernel.bbclass gets dropped from meta-oe
3) basic-hash will get turned on in master-next
4) super-duper PR automation work will land in master-next and get =
merged into master when it's deemed "good enough"

The intermediate merge step into master-next is only done if enough =
people test master-next. If people don't want to test it, the merge and =
associated breakage will go straight into master.

regards,

Koen=


