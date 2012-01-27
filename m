Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RqgrN-0006vs-Ls
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 09:08:37 +0100
Received: by werc1 with SMTP id c1so1107043wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 00:00:49 -0800 (PST)
Received: by 10.216.133.71 with SMTP id p49mr3147416wei.8.1327651248917;
	Fri, 27 Jan 2012 00:00:48 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id df2sm9923071wib.4.2012.01.27.00.00.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 00:00:47 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKqEgTQ1aRLUU=Db9vc3PfR1L=hWsBnTcKKMuWUazrPSjg@mail.gmail.com>
Date: Fri, 27 Jan 2012 09:00:42 +0100
Message-Id: <E10B6388-7C66-4790-9666-A7C97D9EF238@dominion.thruhere.net>
References: <cover.1326481387.git.josh@linux.intel.com>
	<09C174D7-2741-4099-BBA1-861E3608EB98@dominion.thruhere.net>
	<4F1F3B95.4070105@linux.intel.com>
	<CAP9ODKqEgTQ1aRLUU=Db9vc3PfR1L=hWsBnTcKKMuWUazrPSjg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 0/4] Add alsa-state from OE Classic v3
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
X-List-Received-Date: Fri, 27 Jan 2012 08:08:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 27 jan. 2012, om 00:09 heeft Otavio Salvador het volgende geschreven:

> On Tue, Jan 24, 2012 at 21:15, Joshua Lock <josh@linux.intel.com> =
wrote:
> I can't see any initscript, so I think switching to what's provided by =
alsa-utils would mean losing state saving for non-systemd folk but =
systemd users can probably just set VIRTUAL-RUNTIME_alsa-state =3D =
"alsa-utils-alsactl".
>=20
> You still needs the state. So I think we'd need to have a specific =
-systemd version of it when the configs and the units.

I was thinking of splitting the existing recipe into alsa-state-conf for =
the conf files and keep the init stuff in ${PN}. As a follow on patch we =
can have alsa-utils-alsactl RRECOMMEND alsa-state-conf.

thoughts?

regards,

Koen=


