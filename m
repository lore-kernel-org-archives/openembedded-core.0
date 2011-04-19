Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QC7qv-0006H9-Mo
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Apr 2011 12:08:13 +0200
Received: by wwb17 with SMTP id 17so5682287wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2011 03:05:51 -0700 (PDT)
Received: by 10.216.72.20 with SMTP id s20mr5754029wed.80.1303207551427;
	Tue, 19 Apr 2011 03:05:51 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	g32sm2998525wej.27.2011.04.19.03.05.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Apr 2011 03:05:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1303130678-975-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 19 Apr 2011 12:05:49 +0200
Message-Id: <DB1810A8-F63D-41D0-9E77-B008C3DEA5A8@dominion.thruhere.net>
References: <1303130678-975-1-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [RFC][PATCH] git: use DESTDIR=$D instead prefixing all variables by $D
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
X-List-Received-Date: Tue, 19 Apr 2011 10:08:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 apr 2011, om 14:44 heeft Martin Jansa het volgende geschreven:

> * with git-native and rm_work enabled I've noticed git fetcher errors =
like:
>  warning: templates not found =
/OE/shr-core/tmp/work/x86_64-linux/git-native-1.7.3.4-r0/image/OE/shr-core=
/tmp/sysroots/x86_64-linux/usr/share/git-core/templates
>  fatal: Unable to find remote helper for 'http'
>  for every recipe using http:// for git repo

I can confirm that git-native is broken when using rm_work.=


