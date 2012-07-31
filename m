Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SwATj-0001BI-5Q for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 13:19:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VB7Ug5020150
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:07:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18223-10 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:07:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VB7LBC020143
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:07:23 +0100
Message-ID: <1343732842.9526.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2012 12:07:22 +0100
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/7] combo-layer improvements
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
X-List-Received-Date: Tue, 31 Jul 2012 11:19:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-31 at 01:06 +0100, Paul Eggleton wrote:
> The following changes since commit ab0187c13b2b0a041bf3d98c3a53bd3f45a624de:
> 
>   libxcb: Update for python-native changes (2012-07-30 16:53:49 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib paule/combo-layer-fixes7
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/combo-layer-fixes7
> 
> Paul Eggleton (7):
>   combo-layer: remove &> bashism
>   combo-layer: allow component pull to be done separately
>   combo-layer: ignore patch-* temp directories in dirty check
>   combo-layer: drop to a shell when apply fails during update
>   combo-layer: improve patch list handling and output
>   combo-layer: check that last_revision is valid
>   combo-layer: allow splitting out local config

Merged to master, thanks.

Richard



