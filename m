Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SHbSy-00047z-2V
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 15:50:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 8F8C6315AFF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 15:41:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id AY9TkaCuiHc4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 15:41:13 +0200 (CEST)
Received: from [172.22.22.61] (drms-590ed64d.pool.mediaWays.net [89.14.214.77])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 592FE315AFF1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 15:41:13 +0200 (CEST)
Message-ID: <4F843878.2060705@opendreambox.org>
Date: Tue, 10 Apr 2012 15:41:12 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: libpython2
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
X-List-Received-Date: Tue, 10 Apr 2012 13:50:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

bitbake complains:

"NOTE: multiple providers are available for runtime libpython2 (python,
python-nativesdk)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libpython2"

That's because I'm building a recipe for a binary that RDEPENDS_${PN} on
libpython2. So I added PREFERRED_PROVIDER_libpython2 = "python" to my
disto.conf, but the warning cited above persists.

python_2.7.2.bb contains:

PACKAGES =+ "lib${BPN}2"
...
BBCLASSEXTEND = "nativesdk"

Shouldn't it rather create libpython2 and libpython2-nativesdk or
something similar?

What could be the reason for the warning to persist?

Regards,
Andreas



