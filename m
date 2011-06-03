Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jamesclinux@gmail.com>) id 1QSRRj-0004yb-KB
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 12:17:39 +0200
Received: by bwz5 with SMTP id 5so1924844bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jun 2011 03:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=fot+aqD/mSwqu3hON5afDnHmGMkYfxylUGsQV7gymYg=;
	b=ltP+rUhUgKgQpWb7N4v2oh9mar/SRRJIkBJSQhy7A10krrQGwj/UIUuIA/hlKKS88q
	22538+GTYn0WCBZ1fz7un8+9U05qgM9xZl6eNajDdXMnnn0s8nP5gAv4oskbm/6oA28e
	/OqWor0nqEEAS8wix1wP+4I+yyoASpn4oTtDY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=PcK7TEF50Qc56LPztmU7t4q0yVxqepw7c3UriAFw+qTmFBneWMmAEem8xF9U/Jrbao
	m597qhhAfo0U6QdrSyzPb3KyvBgtGQ17AroVSH6esL5mBN4PouvivwFEet2IqXx2UnaV
	uJkvOW4DkH6WTeQsZJArRAyKK8FmBHdN0EBDc=
MIME-Version: 1.0
Received: by 10.204.19.5 with SMTP id y5mr319049bka.194.1307096066352; Fri, 03
	Jun 2011 03:14:26 -0700 (PDT)
Received: by 10.204.141.68 with HTTP; Fri, 3 Jun 2011 03:14:26 -0700 (PDT)
Date: Fri, 3 Jun 2011 11:14:26 +0100
Message-ID: <BANLkTi=FUWMKwyVYuiFpV+QU8YXFySvnbQ@mail.gmail.com>
From: James Chapman <jamesclinux@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: problem using SDK built by meta-toolchain-qte: missing native libraries
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
X-List-Received-Date: Fri, 03 Jun 2011 10:17:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm having problems using the SDK built by meta-toolchain-qte. One or
more native libraries seem to be missing from the SDK install. My host
is x86_64, building for i586 target.

The native libdbus-1.so isn't being installed by the SDK. It is being
built though. I can workaround the problem by manually copying
libdbus-1.so from the meta-toolchain-qte build into the SDK install
tree. Is qt4-tools-nativesdk missing code to install this lib (and
possibly others)? Is this a known problem?

-james


