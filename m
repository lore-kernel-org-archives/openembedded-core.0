Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q3y0f-0001n0-DP
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 00:00:33 +0200
Received: by iwn10 with SMTP id 10so3258437iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Mar 2011 14:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=8AVe1HPg7mJ1DaxOJOU8DIbr2avnLGIT8l1CL7amg2Y=;
	b=aGSbNjGqGSFOaE7vrilmzkL7kLWYw6Dyf8akaBzLy7qKpbP2F3u4CpzSAzskD5Glv2
	P1Mn/jLj8yvd1yre8oaLeGKNiZS14hm4BpvdL6Ah5L2Oac8mK9083nq+074FgqH9JQoX
	Bd7Sqs1giAcBFElytO+6d/tno7zujozTUdRko=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=I+bTGI6yIA1dbEpVYJ+xx02AHYSlt3HONGnt52ms0Ac9K7Ibc298XgHo8gHpjy/sAe
	oEajLRoOcGC8aEFlECsvH26JH25R54H38on557mLBAsW33AjtDYI0bDpXasH1cDq/0oB
	Fq7/fVGScsvn5T6SpvoqQ4unbV5JSNe6ALpPE=
Received: by 10.43.58.148 with SMTP id wk20mr5622839icb.242.1301263116771;
	Sun, 27 Mar 2011 14:58:36 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i20sm2469405iby.14.2011.03.27.14.58.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Mar 2011 14:58:36 -0700 (PDT)
Date: Sun, 27 Mar 2011 14:59:23 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110327215923.GA24098@sakrah.homelinux.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: SRCREV in recipes or in a single file e.g. meta/conf/distro/include/poky-default-revisions.inc
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
X-List-Received-Date: Sun, 27 Mar 2011 22:00:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I have been using oe-core with angstrom and using qemu machines which
are defined in oe-core. Kernel started to fail in do_patch and while
looking at this the problem is that recipe is not locking SRCREV but
they are locked in poky-default-revisions.inc, In OE we have started
to let recipe define the stable srcrev what is oe-core's policy here ?

I would prefer recipes to lock the srcrev so they can be used identical
across layers. If someone wants to really use a different version
then they can override the default.

Thx

-- 
-Khem


