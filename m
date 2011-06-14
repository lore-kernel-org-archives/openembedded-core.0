Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWTCL-0005Cc-8g
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 14:58:25 +0200
Received: by wye20 with SMTP id 20so4437426wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 05:55:00 -0700 (PDT)
Received: by 10.216.230.132 with SMTP id j4mr773283weq.38.1308056100148;
	Tue, 14 Jun 2011 05:55:00 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z22sm3476059weq.2.2011.06.14.05.54.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 05:54:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308056023.25285.258.camel@phil-desktop>
Date: Tue, 14 Jun 2011 14:54:57 +0200
Message-Id: <A870FC63-6091-44CC-B1C1-FC5BF683B40C@dominion.thruhere.net>
References: <cover.1307947593.git.sgw@linux.intel.com>
	<42c945e9af04b3e9733253b1186abe13bc80bde7.1307947593.git.sgw@linux.intel.com>
	<1308056023.25285.258.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [*RFC CONSOLIDATED PULL RFC* 03/23] git: restore the dependency on perl-native
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
X-List-Received-Date: Tue, 14 Jun 2011 12:58:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 14 jun 2011, om 14:53 heeft Phil Blundell het volgende geschreven:

> On Sun, 2011-06-12 at 23:54 -0700, Saul Wold wrote:
>> -inherit autotools
>> +inherit autotools perlnative
> 
> This broke the tree for me.  Now I get:
> 
> NOTE: Out of date cache found, rebuilding...
> ERROR: Could not inherit file
> classes/perlnative.bbclass###########################################
> | ETA:  00:00:03
> ERROR: Command execution failed: Exited with 1
> 
> Am I meant to have perlnative.bbclass somewhere?  It isn't in
> meta/classes.

Same error here


