Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QJn5N-0002qU-Ts
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 15:34:50 +0200
Received: by wye20 with SMTP id 20so5235759wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 06:32:04 -0700 (PDT)
Received: by 10.216.254.194 with SMTP id h44mr3926076wes.90.1305034324148;
	Tue, 10 May 2011 06:32:04 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m2sm3544081wer.13.2011.05.10.06.32.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 06:32:01 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTi=j7VD6fDQ1SFbGCVV5n2qDSLEMUQ@mail.gmail.com>
Date: Tue, 10 May 2011 15:32:00 +0200
Message-Id: <DC43D879-92C7-44E6-825E-36B258C7B314@dominion.thruhere.net>
References: <cover.1305004776.git.sgw@linux.intel.com>
	<118af5382d7c13327de95c46e4976ed7863ba3d0.1305004776.git.sgw@linux.intel.com>
	<1305017031.30391.247.camel@rex>
	<733146FF-622B-4EB5-9EDD-40C79CB4FE3C@dominion.thruhere.net>
	<BANLkTi=j7VD6fDQ1SFbGCVV5n2qDSLEMUQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 26/30] qmake_base.bbclass: add generate_qt_config_file task
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
X-List-Received-Date: Tue, 10 May 2011 13:34:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 mei 2011, om 14:46 heeft Otavio Salvador het volgende geschreven:

> On Tue, May 10, 2011 at 06:20, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> And consider the case of building without MACHINE and distros having =
a different staging layout. I know angstrom has one to enable parallel =
builds of uclibc and eglibc.
>=20
> In this case what we ought to use?

Keep prefix empty and use STAGING_LIBDIR, etc as RP said.

>=20
> --=20
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



