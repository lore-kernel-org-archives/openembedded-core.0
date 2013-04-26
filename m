Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UVkD4-0000ZD-Ql
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 17:05:22 +0200
Received: by mail-ea0-f179.google.com with SMTP id h10so1684877eaj.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 07:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:content-type:content-transfer-encoding:subject
	:message-id:date:to:mime-version:x-mailer:x-gm-message-state;
	bh=C4Ec6eP9FH3m2xdIyoNh+kgXwHYnuyC6l+CGaYsLuu4=;
	b=QbJP/BBjCmk96zxq3rXQ2lpPP7zzF406R0TSWq9guxleNYP4LbV3jTiwB/Qv1uobHg
	k0ezmMWqcLrN3eUXfZckkGTpD2yNhlQX5TrGLb3yWfiQSUvmbo1KySM7K/jzGsaiaQsP
	2HVUa7ld4lxUZ5VSxMe57qqiQpec4f9d1GBGdI5rLeQdA8D6EV2r7VunU27I4ljspCeE
	zeGai9hakRBmTeKzsQYyCGD5EulVw2whQ+kQNwBNrOp/ElpgUcNmUGKPbed3WBj5uhsH
	MmDzV7xjJvCxSTNeDiFfX7D+9UFRrVdH2eA7rHzVbdVLxkiKBFdyKps9wRtfkpH0Kjwy
	lapw==
X-Received: by 10.14.182.72 with SMTP id n48mr88958560eem.3.1366987649782;
	Fri, 26 Apr 2013 07:47:29 -0700 (PDT)
Received: from ?IPv6:2001:610:612::b817:b58a:aa0f:78a?
	([2001:610:612:0:b817:b58a:aa0f:78a])
	by mx.google.com with ESMTPSA id n7sm16392030eeo.0.2013.04.26.07.47.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 07:47:28 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Message-Id: <5E6BBD57-21F8-4282-97F0-567ACFB008CD@dominion.thruhere.net>
Date: Fri, 26 Apr 2013 16:47:27 +0200
To: "openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmkdvBKurp35pesFmlqj08zSwgpxFD4Jm1l7/NEJSSNSH1RpcnCYr4lpv7MVgnDT51L6wVf
Subject: Annoyances with dylan
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
X-List-Received-Date: Fri, 26 Apr 2013 15:05:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I have 2 big annoyances with dylan:

1) Multimachine builds trigger spurious warnings:

WARNING: The recipe bonescript is trying to install files into a shared =
area when those files already exist. Those files and their manifest =
location are:
   /build/v2013.06/deploy/eglibc/licenses/bonescript/LICENSE
   /build/v2013.06/deploy/eglibc/licenses/bonescript/generic_MIT

I get that every time after switching machines for each recipe/license.

2) PRSERV makes things go backwards:

ERROR: Package version for package gadget-init-network went backwards =
which would break package feeds from (0:1.0-r19.3 to 0:1.0-r19.0)

To trigger 2) I updated meta-linaro and switches meta-minnow to the new =
rebased branch, delete $TMPDIR (prserv db is outside out TMPDIR) and =
started building images. I only happens for some recipes, not all. I =
can't deduce a pattern or easily reproduce it. Bug filed some months =
ago.

On the flip side: *ZERO* problems with sstate so far :)

regards,

Koen=


