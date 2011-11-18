Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RRPd4-0002yd-Tm for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 15:41:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAIEYnj7030799
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 14:34:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30490-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 14:34:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAIEYgbO030791
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 14:34:43 GMT
Message-ID: <1321626887.16309.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 Nov 2011 14:34:47 +0000
In-Reply-To: <CACW_hTYXNDBFWtxOK86fz5P55Va700rQYWpO6thrUH9OQsA+8Q@mail.gmail.com>
References: <1321625613-30146-1-git-send-email-koen@dominion.thruhere.net>
	<CACW_hTYXNDBFWtxOK86fz5P55Va700rQYWpO6thrUH9OQsA+8Q@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] shared-mime-info: fix ordering of PACKAGES
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
X-List-Received-Date: Fri, 18 Nov 2011 14:41:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-18 at 15:28 +0100, Frans Meulenbroeks wrote:
> 
> 
> 2011/11/18 Koen Kooi <koen@dominion.thruhere.net>
>         Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>         ---
>          .../shared-mime-info/shared-mime-info.inc          |    2 +-
>          .../shared-mime-info/shared-mime-info_0.91.bb      |    2 +-
>          2 files changed, 2 insertions(+), 2 deletions(-)
>         
>         diff --git
>         a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
>         b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
>         index 57e829c..d7fa67c 100644
>         ---
>         a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
>         +++
>         b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
>         @@ -19,7 +19,7 @@ FILES_${PN}-dev +=
>         "${datadir}/pkgconfig/shared-mime-info.pc"
>         
>          # freedesktop.org.xml is only required when updating the mime
>         database,
>          # package it separately
>         -PACKAGES += "shared-mime-info-data"
>         +PACKAGES =+ "shared-mime-info-data"
>          FILES_shared-mime-info-data =
>         "${datadir}/mime/packages/freedesktop.org.xml"
>          RDEPENDS_shared-mime-info-data = "shared-mime-info"
>         
>         diff --git
>         a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
>         index bc4a8f7..7ae6e10 100644
>         ---
>         a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
>         +++
>         b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
>         @@ -1,5 +1,5 @@
>          require shared-mime-info.inc
>         -PR = "r2"
>         +PR = "r3"
>         
>          SRC_URI[md5sum] = "982a211560ba4c47dc791ccff34e8fbc"
>          SRC_URI[sha256sum] =
>         "98cfebe1d809afb24934e634373821e2a1dfa86fc6462cab230589a1c80988bd"
>         --
>         1.7.2.5
> 
> For my education:
> Is ordering of PACKAGES relevant? If so, please enlighten me why. If
> not why this patch?

Just to cut the story short here, I agree the commit message could have
had more information. There are bug reports on the list related to this
and its clear there is a problem.

I've therefore taken the patch since I'd rather fix this than let more
people fall over the problem over the weekend. In other circumstances I
might have held out for more of a commit message.

Cheers,

Richard




