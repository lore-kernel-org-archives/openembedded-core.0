Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1RTthh-0002EZ-UE
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 12:12:26 +0100
Received: by wwo1 with SMTP id 1so4758226wwo.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 03:05:48 -0800 (PST)
Received: by 10.180.3.37 with SMTP id 5mr32886717wiz.43.1322219148255;
	Fri, 25 Nov 2011 03:05:48 -0800 (PST)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id fi11sm27442979wbb.9.2011.11.25.03.05.47
	(version=SSLv3 cipher=OTHER); Fri, 25 Nov 2011 03:05:47 -0800 (PST)
Message-ID: <4ECF768A.4060108@dresearch-fe.de>
Date: Fri, 25 Nov 2011 12:05:46 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.3.3
Subject: Uncommon source deployment policy of live555
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
X-List-Received-Date: Fri, 25 Nov 2011 11:12:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The LIVE555 project has a really uncommon source deployment policy. :(

They publish *only* the latest tarball of their code [1]. And they don't make the code available under a source code repository [2].

I've asked to change this policy but they are not willing to do that [3].

How can we handle this?
Does OE provides a "mirror" server to provide the versions we're referencing? How can we upload versions there?
Which changes to the recipes are necessary to use it?

Regards,
Steffen

[1] <http://www.live555.com/liveMedia/faq.html#old-versions>
[2] <http://www.live555.com/liveMedia/faq.html#no-source-code-repository>
[3] see thread <http://lists.live555.com/pipermail/live-devel/2011-November/014127.html>

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


