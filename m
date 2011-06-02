Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QS8Nn-0007uF-Pl for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 15:56:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52Dr82R013403
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 14:53:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12816-04 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2011 14:53:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52DqxvB013395
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 14:52:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307008107.2529.175.camel@phil-desktop>
References: <1307008107.2529.175.camel@phil-desktop>
Date: Thu, 02 Jun 2011 14:52:39 +0100
Message-ID: <1307022759.27470.543.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] rpm: avoid dependency on perl and python for -native build
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
X-List-Received-Date: Thu, 02 Jun 2011 13:56:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 10:48 +0100, Phil Blundell wrote:
> Update override naming (_native -> _virtclass-native) to disable perl
> and python bindings when building native rpm, and adjust the DEPENDS to
> match.
> 
> Perl bindings were, in fact, already disabled for both native and target
> builds so it's only the python ones that have really changed.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---

Merged to master, thanks.

Richard



