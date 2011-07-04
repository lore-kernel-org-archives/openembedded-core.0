Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QdgzC-0005Tw-J8
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 13:06:42 +0200
Received: by bwf20 with SMTP id 20so4567559bwf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jul 2011 04:02:54 -0700 (PDT)
Received: by 10.204.16.133 with SMTP id o5mr5555695bka.158.1309777374398;
	Mon, 04 Jul 2011 04:02:54 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id n3sm5466631bka.16.2011.07.04.04.02.53
	(version=SSLv3 cipher=OTHER); Mon, 04 Jul 2011 04:02:53 -0700 (PDT)
Message-ID: <4E119DDD.5090902@dresearch-fe.de>
Date: Mon, 04 Jul 2011 13:02:53 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1309544267-24186-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1309544267-24186-1-git-send-email-koen@dominion.thruhere.net>
X-Enigmail-Version: 1.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] ppp: sync packaging with OE .dev
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
X-List-Received-Date: Mon, 04 Jul 2011 11:06:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Can you please resync again.

Commit e05db51b7aea7a0359babd918d7efbb9cc213d83 introduces an own package for PPPoL2TP plugin.

Adding that package fixes the following error message.

      NOTE: package ppp-2.4.5-r1: task do_qa_staging: Started
      WARNING: the following files were installed but not shipped in any package:
      WARNING:   /usr/lib/pppd/2.4.5/pppol2tp.so
      WARNING:   /usr/lib/pppd/2.4.5/openl2tp.so

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


