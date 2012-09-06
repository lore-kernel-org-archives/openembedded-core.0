Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <brandon@rascalmicro.com>) id 1T9fGS-0006WX-76
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 18:49:12 +0200
Received: by iebc11 with SMTP id c11so3503303ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 09:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=2cWPzVrTcgvCS5PNoA/jH1XM/LhEtRyC6RX4gTcfUXw=;
	b=EBYnf+Z6gqWgULVQPNDeBuGGAS0rv9W+pMzf4Xg3jpf5yLB1P5C5/bHji+K7Ntj1gl
	cbY0UkdTojYKnPI6j5wzqYTLK9vmGv49/4Q5xt+9oO9kw812WMAD91Wrrs3fgP6zY1Tf
	zDmNKCWmtof1VjANbnPj5hgKU2gkkyCDcF67dKG4CiJHD0YJeauz23wsTZXSNa+GXFWo
	yM6NQMvTYFEwDHQDLbt8IGhXQ/rKtKIXvl4QzcAI0VZamIlsVvoETQO2WLzBNPnd13jL
	izzqvJ0cBqvuuSPaFJ8NpmJgEy2cC1KE/hcySEZAtjxiHt5oNB8TzCdD0v/Pkx44PZsV
	M7Zw==
MIME-Version: 1.0
Received: by 10.50.94.195 with SMTP id de3mr3911526igb.68.1346949407061; Thu,
	06 Sep 2012 09:36:47 -0700 (PDT)
Received: by 10.64.92.36 with HTTP; Thu, 6 Sep 2012 09:36:47 -0700 (PDT)
X-Originating-IP: [146.115.15.122]
Date: Thu, 6 Sep 2012 12:36:47 -0400
Message-ID: <CA+b4E8xjg7ZWy3pMoGY_HRYpTCwhS95_c+o0ZL_JG58dU0iMdw@mail.gmail.com>
From: Brandon Stafford <brandon@rascalmicro.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm2oTHFdltws/uWXjIFltSN0uEqB2IBg4tjpwx4Pkav0rBPlmhTs9vsmcXrg7N1cSnxTLL7
Subject: Trying to compile Scipy, but stuck on native cc and ld
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 16:49:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I'm working on a recipe for Scipy, which is a Python library for
scientific computation. It contains chunks of code in C and Fortran.

I have seen this recent message from Phil Blundell (about an entirely
different recipe) that suggests that the problem may be the use of the
host's cc and ld, rather than the correct ARM cross-compilers:
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg27120.html

This looks like the problem to me, but I'm not sure how to tell the
Python build script that it should be cross-compiling. Based on Phil's
message, I'd expect it involves setting ${CC} and ${LD} and somehow
passing them to Python, but I'm not sure how.

Full error message: http://pastebin.com/pMvaLpcz
Recipe in broken state: http://pastebin.com/a5jm45vB

(The line export LDFLAGS = "-L${STAGING_LIBDIR}" is just there because
another mailing list suggestion:
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg24196.html.
It does not appear to affect the errors produced.)

Any suggestions?

Brandon

--
Brandon Stafford
Rascal Micro: small computers for art and science
Somerville, MA, USA


