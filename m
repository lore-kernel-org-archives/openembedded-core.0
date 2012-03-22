Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAhB2-0005S1-7g
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 13:31:38 +0100
Received: by wgbdr12 with SMTP id dr12so1149511wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 05:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:subject:date:message-id:to:mime-version:x-mailer
	:x-gm-message-state:content-type:content-transfer-encoding;
	bh=deU8EyfAJsEBPpkW0R4vQmujH4ef/Y7DXE/3nvSi+CY=;
	b=gS4KFi5HKilom9OAAukP2RFG1Y7P9SQqnvPQnqWxiZIg+z0LAFN5aMZwEbAJTx8IXx
	xW+UxDn42oe2PLa+xNsrSV7aBXVEN22+aqre95Qi9KhEeE3ZBUNcHfbPiKJvQ2vgV4d0
	74jsAGZj/7gC816nlD78/8RyLmMKIo2rpXqj7zkD33GiACdbu6UiSNbfKcnwx5uMd/Eo
	ijh1Qsk3Rp0YKB1cRcLn0V8pX+DYEs5L6sI7XIgQRo+Vnr5Cll/FAhhE99AGG7jvW7oG
	3nkN5Gg0N7E2vzpATf3HTmbM3rUTwFtCTd6zPcbj7BjSqZmoVxHvvl04A+AQ3l4jk6OW
	wXFg==
Received: by 10.180.96.228 with SMTP id dv4mr4556828wib.14.1332418961178;
	Thu, 22 Mar 2012 05:22:41 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm8271567wib.4.2012.03.22.05.22.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 05:22:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Mar 2012 13:22:43 +0100
Message-Id: <2207E1AD-E06F-40D6-9FD7-1452805A4CF3@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1257)
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmxq0AKIJv66vsZzQCHVlrqSJgsKzcOsC5SGaN4MAkCxzAZx5+gZo/gN6AyqB546bpH+lFR
Subject: Syscall backporting and linux-libc-headers
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
X-List-Received-Date: Thu, 22 Mar 2012 12:31:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

In my never ending quest to get consolekit/polkit/etc working properly =
I've found that CONFIG_AUDITSYSCALL is really usefull (it's usefull in =
other contexts as well, but that's outside the oe-core set of recipes). =
It has the following problem:

config AUDITSYSCALL
        bool "Enable system-call auditing support"
        depends on AUDIT && (X86 || PPC || S390 || IA64 || UML || =
SPARC64 || SUPERH)

No MIPS or ARM support. There recently was a pull request from Al Viro =
to get at least ARM support into mainline, but I'm not sure what =
happened to that. Anyway, I backported the ARM patch to 3.0 and 3.2, but =
to make it usefull I'd need to patch linux-libc-headers and bump PR on =
virtual/libc.

What's the OE-core position on backporting syscalls to =
linux-libc-headers?=20

regards,

Koen=


