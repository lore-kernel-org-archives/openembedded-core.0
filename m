Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RvYhU-0004mg-UQ
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 19:26:33 +0100
Received: by werc1 with SMTP id c1so1449952wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2012 10:18:28 -0800 (PST)
Received: by 10.216.132.91 with SMTP id n69mr9052734wei.7.1328811508279;
	Thu, 09 Feb 2012 10:18:28 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id da8sm8333935wib.6.2012.02.09.10.18.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 10:18:27 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <eb604fbfbe547c3a7a4505eeab54f11ee00c0874.1328809777.git.paul.eggleton@linux.intel.com>
Date: Thu, 9 Feb 2012 19:18:19 +0100
Message-Id: <8E1320A1-3A67-47DB-96FD-8A75155AFA12@dominion.thruhere.net>
References: <cover.1328809777.git.paul.eggleton@linux.intel.com>
	<eb604fbfbe547c3a7a4505eeab54f11ee00c0874.1328809777.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQlaFnj65SyC2E5jDhyF8u0HoI3HcLxlGLkUgdaOMwSO8GEcrZgmp2bNa9eESr+r3yahBei5
Subject: Re: [RFC PATCH 2/4] qt4: build qmake for the target
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
X-List-Received-Date: Thu, 09 Feb 2012 18:26:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 feb. 2012, om 18:57 heeft Paul Eggleton het volgende geschreven:

>=20
> +++ b/meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch
> @@ -0,0 +1,40 @@
> +qmake: fix source file references in qmake.pri
> +
> +Fix duplicate entries in SOURCES and HEADERS, and fix the source file
> +list for the split of qlocale.cpp.
> +
> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> +
> +Upstream-Status: Pending

Since qt upstream is git and you're including a SOB can you please add =
the git-am'able version of the patches? That will also give us some more =
info on how old the patch is since git is really bad at tracking =
renames.

regards,

Koen=


