Return-Path: <paul@betafive.co.uk>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB7D7DDC2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 11:58:44 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id D52102312E;
	Wed,  8 May 2019 07:58:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Wed, 08 May 2019 07:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id; s=fm1; bh=tmPs2TitfUp2Pjz
	aKkN6H2py/wUtaAm4OxbxVD7gzTw=; b=CMu3uhBsf73NPD+oqi+EdxHYKGnqtY4
	fuJP5W71utr9mNkIbQD9/EKof7jhSxh2Fnv9rGLg5y/iCu5rz1QaSrOZ+TcIL6at
	sgFupmS6cJmuMCv+jvW+zAOmxWw3BFxuS/qqrH9xuK6L1pO9Rb6J7SvOc5cdBb0Q
	PRpn/LjSjqChH/uOxAM+8ESeBqaEVcAMo2oTJoFmPlptQVC9NQ7LS5ppH5Speh3w
	pMdxEHrv9eOZCc29E31QA8ziC3qOg+1vRujVu23W85VMh/JrWKw7oMo5mbShRKzs
	wIjbkFed37n6QaqyfjDudIUQR2XQL3j+9LloXBPH3qfc53TM85gTonA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=tmPs2TitfUp2PjzaKkN6H2py/wUtaAm4OxbxVD7gzTw=; b=7K5/F/7k
	lGkkowjSO8edTZPFcP9uj3t50b2OP79lDxJq/eXb1+ot0GRPEQCJUTEPGUuYh+8U
	TZoFZoRC6AyqOsfqbjXZLuZWJXB2+yRDfkDXpsLjBhHXibyFsCylV9dFyZbHMC/+
	jNTTS7rMq1733tmWWujchbptwQxkd1sTMrPUY+vactaYvRGDNepyQTJFtErjqRyr
	7cjzuPS5cDbc5C9OzgXw8mXTJgjYFK7bw3C31DA0okWp6jHzPf0GuQpHx84lFwV7
	TVz02/CQycZODcxKTDUU6VlSJECC6PmVSy2bKu07dYpioBcNSXrl7QdRGY+kbiqA
	8Dq9M0wE2YFOgQ==
X-ME-Sender: <xms:dcTSXKOoPIT_SDB732sx1VSfOrTTmf1_K3uRLcVCfR1b0rDE3YOj-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeefgdeghecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefhvffufffkofestddtredtredttdenucfhrhhomhepphgruhhlsegsvghtrghf
	ihhvvgdrtghordhukhenucfkphepkedurddukeejrdefvddrudefkeenucfrrghrrghmpe
	hmrghilhhfrhhomhepphgruhhlsegsvghtrghfihhvvgdrtghordhukhenucevlhhushht
	vghrufhiiigvpedt
X-ME-Proxy: <xmx:dcTSXKsnUl0knVsTMGq6WWC4z75UDwkxhH2IybnkwZ8ai9naPsXbdA>
	<xmx:dcTSXFx92liAj-FzjxPDaDxkrvCeLurmIp-n6mNE_FuFOF2-BWBykw>
	<xmx:dcTSXDXD44Nk3vka52lQNPgS-i-Qg57Hci4tDMMR2ZYGEPiWZ71RSw>
	<xmx:dcTSXDJjZd04g0JY2VxOG9jI6CFsKUf_VNR7E7yg5muyphuHuQmaOA>
Received: from alpha.home.b5net.uk (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id DF336103D0;
	Wed,  8 May 2019 07:58:44 -0400 (EDT)
From: paul@betafive.co.uk
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 11:58:34 +0000
Message-Id: <20190508115836.15758-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/2] Fix strace & gdb build on aarch64/musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2019 11:58:45 -0000

From: Paul Barker <paul@betafive.co.uk>

These patches should also apply cleanly to warrior after the commit
"gdb: fix CVE-2017-9778" is backported.

Paul Barker (2):
  gdb: Fix aarch64 build with musl
  strace: Fix aarch64 build with musl

 meta/recipes-devtools/gdb/gdb-8.2.1.inc       |  1 +
 ...h64-Fix-the-gdb-build-with-musl-libc.patch | 52 +++++++++++++++++++
 .../strace/strace/musl-fixes-armv8.patch      | 29 +++++++++++
 meta/recipes-devtools/strace/strace_4.26.bb   |  1 +
 4 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-AArch64-Fix-the-gdb-build-with-musl-libc.patch
 create mode 100644 meta/recipes-devtools/strace/strace/musl-fixes-armv8.patch

-- 
2.17.1


