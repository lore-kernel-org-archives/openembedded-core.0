Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QfHX4-0007cp-Tw
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 22:20:15 +0200
Received: by yib18 with SMTP id 18so991855yib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 13:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=QgJplf5ME6wLc7I/AbpnHpxG4ErVuTbV8Wr88U1G22g=;
	b=Sua5X+018d1rrhAygjElLef6y6Km1dDVEXHd9IfLwWRveN+smgZjb0q+2KnyfGVsm0
	WzOQRn/6dPGQGVSEqQm2RZAnRGLBlQ97+NO6+wjEZkgRlpG78I554xX2Jpj4Q+ThmUfb
	wSs+IaUXDv7dUoKehItR8Ku1gp4fHDPy6GO1E=
MIME-Version: 1.0
Received: by 10.236.0.202 with SMTP id 50mr3065579yhb.486.1310156181340; Fri,
	08 Jul 2011 13:16:21 -0700 (PDT)
Received: by 10.236.208.168 with HTTP; Fri, 8 Jul 2011 13:16:21 -0700 (PDT)
Date: Fri, 8 Jul 2011 16:16:21 -0400
Message-ID: <CAOd_LFwKQHF7-wtHPALJhfDZTvWkpWBR_wmgLPAUCRh3Y8-RaA@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: libmatchbox fetch error
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
X-List-Received-Date: Fri, 08 Jul 2011 20:20:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm trying to get some basic oe-core builds going (core-image-sato)
and am running into:

ERROR: Logfile of failure stored in:
/scratch/oe/openembedded-core/build/tmp-eglibc/work/i586-oe-linux/libmatchbox-1.9-r8/temp/log.do_fetch.24235
Log data follows:
| NOTE: fetch http://projects.o-hand.com/matchbox/sources/libmatchbox/1.9/libmatchbox-1.9.tar.gz
| ERROR: Function 'Fetcher failure for URL:
'http://projects.o-hand.com/matchbox/sources/libmatchbox/1.9/libmatchbox-1.9.tar.gz'.
Unable to fetch URL
http://projects.o-hand.com/matchbox/sources/libmatchbox/1.9/libmatchbox-1.9.tar.gz
from any source.' failed
NOTE: package libmatchbox-1.9-r8: task do_fetch: Failed
ERROR: Task 1884
(/scratch/oe/openembedded-core/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb,
do_fetch) failed with exit code '1'

It seems like the matchbox site is in flux right now.  Is there a
stable place to get the download?

Thanks,
Cliff

-- 
=================
http://bec-systems.com


