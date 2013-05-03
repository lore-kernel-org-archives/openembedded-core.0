Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UYIDz-0003IQ-48 for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 17:48:43 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r43FWZT5006378; Fri, 3 May 2013 16:32:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GXnKs3cEG3c1; Fri,  3 May 2013 16:32:35 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r43FWTtY006369
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 3 May 2013 16:32:30 +0100
Message-ID: <1367595027.5379.159.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
Date: Fri, 03 May 2013 16:30:27 +0100
In-Reply-To: <1367504436-9048-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1367504436-9048-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] neard: Split recipe to two parts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2013 15:48:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-02 at 17:20 +0300, Jukka Rissanen wrote:
> This way it is easier to override settings if needed.
> 
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>

This doesn't just split the recipe, it changes PV to use SRCREV instead
of SRCPV. That is plain wrong, it needs to use SRCPV if anything at all
(we could remove the line and pull 0.10 from the recipe name).

Cheers,

Richard



