Received: from mail-vb0-f49.google.com ([209.85.212.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UUyiO-0002df-9D
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 14:22:38 +0200
Received: by mail-vb0-f49.google.com with SMTP id 11so1573484vbf.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 05:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=lc10fStG5RgkNNlqRsjPuvbvgTyDIEIzLD9YobeLNQY=;
	b=ENTpgeZapBgXScs6LyQG2kJ0dJPdsGHwjMIhaxRMSUG1xs5VGmEB5Spft1SIhB+c3a
	kSUpni0m25kq4kpnjJ2mPjMXuJMP7GFJ16R4xF9uu1ueD2WTU9Xe4t3HJvppar6RQ9O7
	VNFiq9MRobhi4GweiVvh6cNLv13Jgafe0aChMxDmrC20yv7m9EHW9wyD361JED0MjCqc
	zW0rjIMlGScRDZ0zjFbO0wLdvmmhRooITKNTZS038o8TSyUGo6Krf1/LwDZHioI9r+41
	uegrrKUEDS4qec2txpDYToFrzYbayAa2K5xHOmrpPjLpcXDYiJregQ6WwHk0SMeoZnIp
	zvmA==
MIME-Version: 1.0
X-Received: by 10.52.68.51 with SMTP id s19mr21230564vdt.92.1366805080035;
	Wed, 24 Apr 2013 05:04:40 -0700 (PDT)
Received: by 10.52.183.36 with HTTP; Wed, 24 Apr 2013 05:04:39 -0700 (PDT)
Date: Wed, 24 Apr 2013 14:04:39 +0200
Message-ID: <CALbNGRQ4vS=kvgqNZyS5G9HRBE1ixrta_uF+PvzOPZvfjbhNkQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: postinst questions (was postinst does not finish)
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
X-List-Received-Date: Wed, 24 Apr 2013 12:22:45 -0000
Content-Type: text/plain; charset=UTF-8

Hi

as written before: an 'exit 1' within recipe's postinst causes
trouble. E.g meta-oe's lxdm does not run systemd.bbclass' code which
leaves lxdm in unprepared condition causing start too early and ending
in unfinished postinstall.

A simple workaround for this (we should think of something else later)
would be to prepend postinst code within systemd.bbclass (and maybe
others too) instead of appending. Hereby we ensure that the code is
executed independent of recipe's code. First question: Any objections?

In case of no objections: Second question: Is shebang in
post/pre/install/remove scripts (I saw many scripts without shebang)?

Andreas


