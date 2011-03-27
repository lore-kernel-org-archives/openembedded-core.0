Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q3wGz-0008Ot-IS
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Mar 2011 22:09:18 +0200
Received: by pvc30 with SMTP id 30so392530pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Mar 2011 13:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=o+KIaCqTT8vV99w7Ev4DRawEjH1herY4HPV1rimCCRU=;
	b=OHRYqgrset5677PeEe+dz16X4KHhDHuD9N4X5l4p+QBcdswJxNo20fAHtXnNCadVWW
	Id+vHIfWXop3ONnenPbzcOIDpu7GI4ml6pG6QEDC9492T5P/PBJr+wjywLqPYJasMemZ
	HI7mJ0AMyemVlU/7DSZnrDMFpC1L0Uziirles=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=GBUVA00SKsUr1XML0XtXMZmTJu8EuZ069bsKhDDLBua3SbTJT86ul0TYAk1iZJY4qV
	jR2yCFqFI8GX+qnJfETdYmAU1OpUrluxZDxpRTyrTbyuumK6tUCNVQgmgWo9+CkbipFT
	SVzV9FuThtv1Y35vbIk1eI7Hg7f3QJD/lX4mw=
Received: by 10.142.44.12 with SMTP id r12mr2867709wfr.281.1301256436584;
	Sun, 27 Mar 2011 13:07:16 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w11sm4839917wfh.18.2011.03.27.13.07.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Mar 2011 13:07:15 -0700 (PDT)
Date: Sun, 27 Mar 2011 13:08:02 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110327200802.GA23980@sakrah.homelinux.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: DEPENDS tranlation with BBCLASSEXTEND
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
X-List-Received-Date: Sun, 27 Mar 2011 20:09:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I observed that if I have 
DEPENDS = "a b" in recipe.bb which has BBCLASSEXTEND = "native"
then dependecies for recipe-native shows a-native b-native so far so
good

Now if I want to add a dependency which only is needed for native recipe
I do

DEPENDS_virtclass-native += "c-native"

what this does is it will ignore a-native and b-native dependencies and
only adds "c-native" to depends of native recipe

DEPENDS_virtclass-native_append = " c-native"

This does what I wanted i.e. have deps on a-native b-native c-native

I think behavior of += or _append should be similar. Is my understanding
correct ?


p.s. Another niggle I see is that suppose in above scenario I want
native recipe to not depend upon on b-native but other deps are good.

It would be good to have a directive to exclude deps that should not be
converted into dep-native 

Thx

-- 
-Khem


