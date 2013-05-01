Received: from mail-ee0-f46.google.com ([74.125.83.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UXVe1-0002i6-Eq
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 13:56:30 +0200
Received: by mail-ee0-f46.google.com with SMTP id c13so647581eek.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2013 04:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=uW1naMDG81ivyairWFjYK2FekHO4jeAEThyrHiXZ31w=;
	b=NpLO8TeZMtPhPfvdN+ScM0n0F96Hm0x8HU/NHtvKV4/liWGZJ6uCJj6GeZ2nKTZEzP
	r9MpFlPV4b5sWD98n+UCIEVDPDN6yuLGYmwyjXNRTUsPKUq2Ou3BMja6QJEIo0VZFtj0
	lx6vqAt5k9hpvf3sFR2rGzzA8SFHKuv8OVwd5H3H1GaYBZeLPB4dqOPMy8B85GcZBnj3
	Zby0qjNOFBgmyPYCR2LIR1x+TrDZ7fgw6sm/sAhzc9WcMnbpFHCw+J4BYC82xT1Wq9iC
	nnOLX2xz5c8X1lXNm11MXcg8PHB53UQLPid9oMW4B9kgupi76hcYlKdvn/ORg3WKCl8S
	lUPg==
X-Received: by 10.15.43.73 with SMTP id w49mr7218008eev.12.1367408309391;
	Wed, 01 May 2013 04:38:29 -0700 (PDT)
Received: from ?IPv6:2001:610:612::6401:2390:53c2:ab85?
	([2001:610:612:0:6401:2390:53c2:ab85])
	by mx.google.com with ESMTPSA id bj12sm3233152eeb.8.2013.05.01.04.38.27
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 01 May 2013 04:38:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <06a1154d758be0744da68717b31077cc02ec657e.1367403369.git.ross.burton@intel.com>
Date: Wed, 1 May 2013 13:38:28 +0200
Message-Id: <2F6BFA0E-EB8F-4335-9BF8-852D7F056696@dominion.thruhere.net>
References: <cover.1367403369.git.ross.burton@intel.com>
	<06a1154d758be0744da68717b31077cc02ec657e.1367403369.git.ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlH9dHjwARUuyGwTJSczW3MNvevrm/EJZKBWcoFnksZKRgnLrhWqb+NgP/Ha1fXazGxwN7J
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] libsoup: upgrade to 2.42.1
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
X-List-Received-Date: Wed, 01 May 2013 11:56:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 mei 2013, om 12:19 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> Upgrade to the latest stable release, and fix the dependencies.
>=20
> gnome-keyring use has been removed from libsoup, and sqlite3 is now a =
hard
> dependency.  The optional libsoup-gnome library is now a small stub, =
so enable
> it by default but allow it to be disabled via PACKAGECONFIG.

Sweet, that drops a load of dependencies for gstreamer http sources!=


