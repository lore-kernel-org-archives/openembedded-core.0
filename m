Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6SQ5-00036C-LU
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 21:25:21 +0200
Received: by eya25 with SMTP id 25so2022738eya.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 12:20:03 -0700 (PDT)
Received: by 10.223.50.21 with SMTP id x21mr1572824faf.24.1316632802813;
	Wed, 21 Sep 2011 12:20:02 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o22sm5114133fab.11.2011.09.21.12.19.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 12:20:01 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1316630404-10336-9-git-send-email-dbaryshkov@gmail.com>
Date: Wed, 21 Sep 2011 21:19:59 +0200
Message-Id: <87BDFF4B-3B1E-4245-BF80-7E784EFBB705@dominion.thruhere.net>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
	<1316630404-10336-9-git-send-email-dbaryshkov@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 09/17] dbus-glib: disable bash-completion
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
X-List-Received-Date: Wed, 21 Sep 2011 19:25:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 sep. 2011, om 20:39 heeft Dmitry Eremin-Solenikov het volgende =
geschreven:

> Bash completion stuff isn't packaged and used. Stop building it by
> passing --disable-bash-completion to configure

A better idea would be to package it=


