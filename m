Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qsy03-0001HV-Em for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 16:18:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FEE4OP017467
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:14:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16215-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:14:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FEE0CE017461
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:14:00 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1313402929.git.paul.eggleton@linux.intel.com>
References: <cover.1313402929.git.paul.eggleton@linux.intel.com>
Date: Mon, 15 Aug 2011 15:13:57 +0100
Message-ID: <1313417637.14274.580.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] qt4-native, Qt QA fixes
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
X-List-Received-Date: Mon, 15 Aug 2011 14:18:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-15 at 11:12 +0100, Paul Eggleton wrote:
> Bring over qt4-native from OE and tidy up some QA warnings.
> 
> The following changes since commit d126e22f6b3f27196144f87e22b36ebccd6dea65:
> 
>   rt-tests: use an explicit commit ID (2011-08-12 17:51:18 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/qt4-fixes4
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-fixes4
> 
> Paul Eggleton (4):
>   qt4: replace qt4-tools-native with qt4-native
>   qt4-native: restore build of uic3, qdbuscpp2xml and qdbusxml2cpp
>   qt4: package QML plugins and correct their install directory
>   qt4: delete unpackaged uic3 to avoid unpackaged file warning
> 

Merged to master, thanks.

Richard



