Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0y0d-0005FE-2p for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 17:28:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OGKG9e008475
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:20:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08112-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:20:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OGK89S008469
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:20:10 GMT
Message-ID: <1330100410.5477.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2012 16:20:10 +0000
In-Reply-To: <0c86983a495510f1fec576591e2f5d5e70cb4aa5.1330053959.git.raj.khem@gmail.com>
References: <cover.1330053959.git.raj.khem@gmail.com>
	<0c86983a495510f1fec576591e2f5d5e70cb4aa5.1330053959.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/4] classes: Add recipe class to overrides
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
X-List-Received-Date: Fri, 24 Feb 2012 16:28:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-23 at 19:33 -0800, Khem Raj wrote:
> We have currently no override to detect a recipe
> being build cross, crosssdk or for target
> at times we can use virtclass-native and virtclass-nativesdk to
> override stuff in recipes but we dont have way to modify a variables
> based on recipe type always.
> 
> With this patch we attempt to have recipe class override always
> so we can use it in recipes which use BBCLASSEXTEND as well as
> others which inherit the classes directly.
> 
> I am not too fond of names that I have used so any suggestions are
> welcome I would have liked to drop virtclass- from the existing
> overrides but that would mean a lot of changes so I left them
> alone.
> 
> With this change now we can say
> 
> EXTRA_OECONF_class-target = "...."
> EXTRA_OECONF_virtclass-native = "..."
> EXTRA_OECONF_virtclass-nativesdk = "..."
> EXTRA_OECONF_virtclass-crosssdk= "..."

I think we need to drop the "virt" here and make this consistent since
they are no longer specific to the virtual BBCLASSEXTEND code...

Cheers,

Richard




