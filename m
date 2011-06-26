Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QajvN-0000pl-BH
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Jun 2011 09:38:33 +0200
Received: by wwg12 with SMTP id 12so3259747wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jun 2011 00:34:54 -0700 (PDT)
Received: by 10.216.81.5 with SMTP id l5mr1277185wee.102.1309073694608;
	Sun, 26 Jun 2011 00:34:54 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h22sm2161309wes.32.2011.06.26.00.34.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Jun 2011 00:34:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <dc56d07c4a034568b8860d7bcd41b31acbdb3e89.1309059243.git.sgw@linux.intel.com>
Date: Sun, 26 Jun 2011 09:34:52 +0200
Message-Id: <B39BDB9E-CF2E-47CD-A195-BCEFD4B8B8C4@dominion.thruhere.net>
References: <cover.1309059243.git.sgw@linux.intel.com>
	<dc56d07c4a034568b8860d7bcd41b31acbdb3e89.1309059243.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [RFC - Staticdev 1/2] multiple recipes converted to -staticdev packages
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
X-List-Received-Date: Sun, 26 Jun 2011 07:38:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 26 jun 2011, om 06:36 heeft Saul Wold het volgende geschreven:

> This commit adds a new base package ${PN}-staticdev to
> bitbake.conf which pulls in the static *.a libraries as
> a seperate package, it filters out the nonshared.a
> libraries where appropriate.
> 
> Additional this commit adds a new libdev.bbclass which provides
> a set of macros and variables to convert ${PN} to lib${PN},
> which a number of recipes where then converted to use.

Can't that be merged into lib_package.bbclass?


