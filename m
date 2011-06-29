Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qbq89-0001rz-SW
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 10:28:17 +0200
Received: by wwi18 with SMTP id 18so827895wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 01:24:32 -0700 (PDT)
Received: by 10.216.133.194 with SMTP id q44mr439167wei.56.1309335872467;
	Wed, 29 Jun 2011 01:24:32 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id s47sm503383weq.30.2011.06.29.01.24.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Jun 2011 01:24:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>
Date: Wed, 29 Jun 2011 10:24:25 +0200
Message-Id: <AFF7B511-46CF-4CDF-96CA-763678BF57C7@dominion.thruhere.net>
References: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Conflicting providers for ssh/sshd (dropbear and openssh)
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
X-List-Received-Date: Wed, 29 Jun 2011 08:28:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 jun 2011, om 00:41 heeft Khem Raj het volgende geschreven:
> If they are independent then may be the openssh recipe should be
> divided into openssh-ssh and openssh-rest so one can use openssh
> provided daemon or dropbear provided as they wish

Dividing the openssl recipe would gain us little and the gains would be =
only for the power companies since you'd have to build openssh twice to =
get both sftp and ssh. The decrease in build time for only sftp is =
neglible.

The real problem is the everything-is-a-distro-choice history we =
inherited from Poky.

regards,

Koen=


