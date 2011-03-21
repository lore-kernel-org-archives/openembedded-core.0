Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q1j2X-0006oA-AN for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 18:37:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LHZPFN025824
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 17:35:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25546-05 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 17:35:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LHZDhI025812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 17:35:13 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1300221086.30423.1839.camel@rex>
References: <1300221086.30423.1839.camel@rex>
Date: Mon, 21 Mar 2011 17:34:47 +0000
Message-ID: <1300728887.30423.3944.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: WARNING - PACKAGE_EXTRA_ARCHS change of behaviour
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
X-List-Received-Date: Mon, 21 Mar 2011 17:37:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-15 at 20:31 +0000, Richard Purdie wrote:
> There is a problem with the current PACKAGE_EXTRA_ARCHS implementation
> since its impossible to control which extra architectures sort higher
> than TARGET_ARCH and which sort lower. In the x86 case for example,
> TARGET_ARCH might be "i586", i486 should be lower than this and i686 should
> be higher. There are also complications where its easy to inject duplicate
> entries into the variable.
>     
> I tried various versions of this patch and concluded that it was simplest
> just to force the tune files to include TARGET_ARCH in the list in the
> right place if they're planning to customise it themselves. Other approaches
> with appends and prepends just complicated the code for no good reason.
>     
> The TARGET_ARCH definitions should also move to the tune files but I'll
> leave this for a separate patch.
>     
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Since there were no objections to this (and I chatted to some people
over jabber about it too), I'm going to merge this.

Cheers,

Richard



