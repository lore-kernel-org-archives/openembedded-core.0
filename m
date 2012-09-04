Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T8viH-0005DI-AJ
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 18:10:53 +0200
Received: from localhost ([127.0.0.1]:42379 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T8vWJ-0007WI-Ck
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 15:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=Dr0BTw9NUkTaFDAoGAqzmV
	1/q/o=; b=q7SzEocByxE6QSPAlYlJfHaK08dmqJ6/njjTk3m0RRI7wsd0qLPw00
	X0ruhb8aGHplGig+ALUsNpr7xM+aNygh+SdKPt4iTVgxexD8CPlSas0xXR6omRhv
	VagUscSGaA25PY+V5NFIz4oVIQyQULW4L9/+itL6Z2YsAGSAsqDI4=
Received: from [195.171.99.130] (port=20114 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T8vWJ-0007WD-Ai
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 15:58:31 +0000
Message-ID: <50462570.4090703@communistcode.co.uk>
Date: Tue, 04 Sep 2012 16:59:44 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: cleanup-workdir script broken
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 16:10:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to use the cleanup-workdir script and it fails with the 
following message:

    [jack@archHP rasp-no-meta-oe]$ cleanup-workdir
    Updating bitbake caches...
    Execute command 'bitbake -e autoconf-nativesdk | grep
    ^IMAGE_ROOTFS=' failed.
    [jack@archHP rasp-no-meta-oe]$ bitbake -e autoconf-nativesdk | grep
    ^IMAGE_ROOTFS=
    [jack@archHP rasp-no-meta-oe]$


Has something vital changed in autoconf-nativesdk?

This fails on both my beaglebone build dir and my raspberrypi build dir.

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



