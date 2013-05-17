Received: from mail-qe0-f41.google.com ([209.85.128.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1Ud8V8-0007N3-UV
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 02:26:27 +0200
Received: by mail-qe0-f41.google.com with SMTP id b10so2370390qen.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 17:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=A5yvH5pcWTLCSB4PErq/jShugu4f6nMcJ6RPiySq3PY=;
	b=fsgW2KNqPiNfzdwKiE1ae228LGTopfeYx77yYnhysYiK3bL9ciw8unXBO3R5NwQT4M
	aajTs7dI7vHP0Br26vUYl5y52kMEyJ1f3xy5fzvOh4LSVvFNZ0LP9QGB/0rwzZyjnH5X
	Bp4mtHgAob/Di7Ub0GL8oYd/h2pd1LhQYkq1VkLXNA4HbM02pcuao8jpj/7PtR3NrNm4
	/gBj7Rf0tOaOS/GBn17VrLoO0pCNue4tBVYOg9Y8WeMmBsY20EQXzlwp2ieiimi9eeCy
	Gel7ILgU9CeNAnONyV66pytfdxjXQDF018ObvP/Grl48gwOk3h6YSGnLYnZaIMrQz5yJ
	BZ7A==
MIME-Version: 1.0
X-Received: by 10.224.7.195 with SMTP id e3mr34622283qae.5.1368749291341; Thu,
	16 May 2013 17:08:11 -0700 (PDT)
Received: by 10.49.86.33 with HTTP; Thu, 16 May 2013 17:08:11 -0700 (PDT)
Date: Fri, 17 May 2013 03:08:11 +0300
Message-ID: <CADV-EXGo-3gRBOx5yoZhuqn6MWxfrRhsjBOs2CGLd8YV6=-Seg@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Redefine variable in bbappend
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
X-List-Received-Date: Fri, 17 May 2013 00:26:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi!

I'm using "base-files" recipe but I don't want that /var/log be a
symlink to temp directory.
Therefore in my custom layer I created base-files bbappend file with
following content:

PRINC := "${@int(PRINC) + 1}"

dirs755_append += "${localstatedir}/log"
volatiles = "run lock tmp"

In this recipe I removed "log" from volatiles but it doesn't work.
I'm getting error:
ERROR: Fixup Perms: Unable to correct directory link, target already
exists: /var/log -> /var/volatile/log

How to properly redefine the variable in bbappend file?

Best regards,
Yevhen


