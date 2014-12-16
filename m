Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id BF27B72598
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 15:12:27 +0000 (UTC)
Received: (qmail 18833 invoked by uid 1003); 16 Dec 2014 15:12:27 -0000
Received: from unknown (HELO ?192.168.1.109?) (philip@opensdr.com@71.171.45.99)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	16 Dec 2014 15:12:27 -0000
Message-ID: <54904BDA.1080005@balister.org>
Date: Tue, 16 Dec 2014 10:12:26 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Setting a a fixed resolv.conf file in OE built image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Dec 2014 15:12:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Any tips on how to do this the right way? It seems like fixed
resolv.conf's are no longer fashionable and the volatile.cache script
goes to great lengths to reset it.

Adding a dns-nameserver entry in the interfaces file never makes it to
resolv.conf. I tried installing the resolvconf package and played with
it, but no joy. This package also appears to have some issues with
missing pieces.

I'll file bugs, but until I can figure out how it is suposed to work,
any bug I file is going to be pretty vague.

This really should be easier.

Philip

