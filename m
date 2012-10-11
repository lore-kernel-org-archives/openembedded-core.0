Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TML1X-0006zE-BR
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Oct 2012 17:50:11 +0200
Received: by mail-ia0-f175.google.com with SMTP id b35so1341875iac.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 08:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=1yn4A1ikFEdXrc0AvCJbtzgq+C4RMKtaygEz82PD1ms=;
	b=UltAVzFOXjLc4IwTwzk9waxCsHDN8gBKEa+ZwBgPkNpyX6rX5XP0GmLE6O9cpex574
	b6Bt5csE35fzcaAHSyaE8DmuE+Kcl0GR50cQJjvnsXw712Y1iXWT/qtudEVmVlJuyNrY
	AUUUeYTh4I0fT8fjeIMZ7YgdUwtzVuNH12oCYZO4G6Dctovm6IwvG1VFtFoOhO2J7m0k
	EV+wMzYEI+FSA2xFLKMkM9eKekXpD82f6YVMSZ8to2A/1H1swG+Opp042vvBwcTv/q0q
	Uu71d5m5lEfsilIPt8xA4zOQEQ5gPXFKMecoM/9hNj0EgKm41PQ//BJDutJc14Lsx0eY
	YFJQ==
Received: by 10.50.100.137 with SMTP id ey9mr1216799igb.57.1349969820442; Thu,
	11 Oct 2012 08:37:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.52.8 with HTTP; Thu, 11 Oct 2012 08:36:37 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 11 Oct 2012 18:36:38 +0300
Message-ID: <CAK18fxGxttqXrLDFCQkB4_XAEuKFvf7_M1Yfie42k3mXkNqZCg@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmd4XBwxB8nwXWiOgMdQcSzhfhRq2jzn68qGpp63JwMoYzUjbcNyrI146Prmppfy1a5gX9D
Subject: meta-systemd base-files issue
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
X-List-Received-Date: Thu, 11 Oct 2012 15:50:11 -0000
Content-Type: multipart/alternative; boundary=e89a8f23532b9ae11904cbca573f

--e89a8f23532b9ae11904cbca573f
Content-Type: text/plain; charset=ISO-8859-1

I'm trying to get meta-systemd work with meta-oe and oe-core.
The problem seems to be with the fstab from oe-core where /var/volatile is
mounted as tmpfs and the directories inside never recreated. So services
like dbus or whatever needs /var/log or var/run etc which are all symlinks
to volatile/*, will fail. Is this a known issue? Is there any other fix
then using a custom fstab?

ag

--e89a8f23532b9ae11904cbca573f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I&#39;m trying to get meta-systemd work with meta-oe and oe-core.<div>The p=
roblem seems to be with the fstab from oe-core where /var/volatile is mount=
ed as tmpfs and the directories inside never recreated. So services like db=
us or whatever needs /var/log or var/run etc which are all symlinks to=A0vo=
latile/*, will fail. Is this a known issue? Is there any other fix then usi=
ng a custom fstab?<br clear=3D"all">

<div style=3D"text-align:center"></div><div style=3D"text-align:center"><di=
v align=3D"left"><font face=3D"Arial" color=3D"#333333" size=3D"-1" style=
=3D"font-family:&#39;Times New Roman&#39;;font-size:medium"><br></font><fon=
t color=3D"#333333" face=3D"Arial">ag</font></div>

</div><br>
</div>

--e89a8f23532b9ae11904cbca573f--
