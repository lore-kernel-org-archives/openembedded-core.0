Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QM7Nb-0000gv-EQ for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 01:39:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GNaLpc025368
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 00:36:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25172-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 00:36:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GNaEff025362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 00:36:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <3f105b122736772aa2cf11d4b346d764239b2a68.1305580484.git.sgw@linux.intel.com>
References: <cover.1305580484.git.sgw@linux.intel.com>
	<3f105b122736772aa2cf11d4b346d764239b2a68.1305580484.git.sgw@linux.intel.com>
Date: Tue, 17 May 2011 00:36:11 +0100
Message-ID: <1305588971.3424.142.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 04/14] xserver-kdrive: upgrade from 1.7.99.2 to 1.10.1
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
X-List-Received-Date: Mon, 16 May 2011 23:39:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-16 at 14:44 -0700, Saul Wold wrote:
> From: Yu Ke <ke.yu@intel.com>
> 
> - remove the patches
>   * xserver-kdrive-1.3.0.0/*: no longer used
>   * disable-xf86-dga-xorgcfg.patch: no longer used
>   * nodolt.patch: already in upstream
>   * enable-xcalibrate.patch: it is invalid now, because XCALIBRATE
>     extension has been removed since commit edcceedb

Er, has anyone actually tried touchscreens with these changes,
particularly trying to calibrate a touchscreen under X with xtscal? 

As far as I can tell, we can throw away xtscal, libxcalibrate, and
calibrateproto after that change since they need that X extension. Its a
good example of why changes need to get upstream as if the build fix was
there, they'd have had less reason to remove it. We probably are going
to need to rewrite xtscal to use XI2 at this point :/.

Cheers,

Richard




