Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0iKD-0006kx-Vp
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 00:43:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 4F837315946E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:35:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id cOdfOp2Ws847
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:35:23 +0100 (CET)
Received: from [172.22.22.61] (drms-590ed8a0.pool.mediaWays.net
	[89.14.216.160])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 8B030315946A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:35:23 +0100 (CET)
Message-ID: <4F46CD3A.9030603@opendreambox.org>
Date: Fri, 24 Feb 2012 00:35:22 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: package version went backwards
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
X-List-Received-Date: Thu, 23 Feb 2012 23:43:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

the following message just appeared after adding a bbappend:

ERROR: Package version for package sysvinit-inittab went backwards which
would break package feeds from (0:2.88dsf-r6 to 0:2.88dsf-r6-dream1)

Is this really true? I thought that anything appended to X would be a
higher version than X. If it's true, for example because the dash has a
special meaning, does anybody have a list of valid or invalid characters
for PR? I guess I could simply omit the dash.

I'm using abbreviated layer names as suffix in my bbappends, because it
makes it easier to see whether the package was modified by my layer(s)
than with PRINC.

Regards,
Andreas


