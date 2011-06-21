Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QYuXS-0007g3-I1
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 08:34:18 +0200
Received: by eye27 with SMTP id 27so511497eye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 23:30:45 -0700 (PDT)
Received: by 10.14.0.6 with SMTP id 6mr647907eea.93.1308637845360;
	Mon, 20 Jun 2011 23:30:45 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id a45sm5151273eec.23.2011.06.20.23.30.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2011 23:30:44 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cac953e344bf63b8e8b49d4d748427afbfcbd3ab.1308615886.git.scott.a.garman@intel.com>
Date: Tue, 21 Jun 2011 08:30:39 +0200
Message-Id: <10377FD6-4D99-467E-9755-A931F6C446E8@dominion.thruhere.net>
References: <cover.1308615886.git.scott.a.garman@intel.com>
	<cac953e344bf63b8e8b49d4d748427afbfcbd3ab.1308615886.git.scott.a.garman@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 1/2] shadow-sysroot: new recipe for useradd.bbclass support
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
X-List-Received-Date: Tue, 21 Jun 2011 06:34:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 21 jun 2011, om 02:29 heeft Scott Garman het volgende geschreven:

> Packaging login.defs with base-passwd causes problems due to the
> file being included in target package installs. Instead, this
> shadow-sysroot recipe can be used by useradd.bbclass to put
> login.defs into the target sysroot without disturbing packages
> intended for target devices.

So how does it end up on the target device after this?


