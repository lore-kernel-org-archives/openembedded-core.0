Return-Path: <paul@betafive.co.uk>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 3693565CE9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 14:15:48 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 518B820BE3;
	Tue,  2 Apr 2019 10:15:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Tue, 02 Apr 2019 10:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id; s=fm1; bh=cBuaHuTg9cQ3Sy+
	L9UbT9oYap8IFQwdzyBO0sLBmLk4=; b=R22EfXpGxcpC9GOXQzjGmIgNfoRDPRx
	PwXlHzKIlMIWNkuPgvti3T81LgC13Vctz8gDA8yl3Se68U2R1i5aoz3h8teLOROf
	8gutUaRPInYimS4Xps0fWZYlYReVXuPJ+ZHSz2L1HU+dRvCHfPNvvsmCG2yWVVql
	HhNYL3VpqBFX14ZWW+/HKr+sV2/RecKGsuPx/Jk8v3NPlgW9C3WbnxLJOb9OqfhG
	hWEW95/aFxqYX4FE0/uHoxWMlW/LCbCXh5c/eHReFP6PL5N8ABRGkvbH6FNWgFQW
	T67RpJ/Tcyg74fELrRiFC9pM7pLOZyOlK6Jb3J/OuF1extSd8+G5cGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=cBuaHuTg9cQ3Sy+L9UbT9oYap8IFQwdzyBO0sLBmLk4=; b=ZgdTPtMY
	5U50DWkuPV1Iiyf3kngsAWNAttHnL6YaVn/LUTf/+1oxVCBxuakpv8K7c801EfGs
	+MCabOT278FWLgjplAmvswk4jvW7yEJJcTlrhEDEEIlOyJ3zBu8+nB3kWuoxhZT1
	5lkOVPZh1R4OSTbpQ2JbmW1ih164BGa4kWgOCxRAzZk6oVH/HRRf8ufwRuPNcD2W
	XjLuEZTs8NzCNhkN8VQiUXOVUj5cKQ5WYC9sVi1rvUdN7MHv/rVuhLMLbVwOPn4o
	L+qTOvnidyNjqSdJvCDAaj7YG+G3LNfxh72RlVjAPcrU0bBuZv2o0+eTL38MYpZz
	4ReV9b99WhEcfQ==
X-ME-Sender: <xms:lG6jXNia9n7OBmOPHc0SGKY3FEjzVXuyqMgh90fjWNTxdwLz7KEGRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrtddtgdehgeculddtuddrgedutddrtddtmd
	cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdp
	uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
	hnthhsucdlqddutddtmdenucfjughrpefhvffufffkofestddtredtredttdenucfhrhho
	mheprfgruhhluceurghrkhgvrhcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqe
	enucfkphepkedurddukeejrdefvddrudefkeenucfrrghrrghmpehmrghilhhfrhhomhep
	phgruhhlsegsvghtrghfihhvvgdrtghordhukhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:lG6jXGTzYk6RMeumhqAoCmRViIHNRPtSV0IhYH2h4dNbHS-yLj5sfw>
	<xmx:lG6jXIFmqCAauLQPyxrclqDsYWvhYEzGO2UkzQOzWftiRJyBqZ62Og>
	<xmx:lG6jXGmUtp-UwdcM690uCVm-G5TOGpkojMaUSTd_MhCZsQ2-6Ko8lg>
	<xmx:lW6jXJG8xFKuKHZHnXN4R_kdKOG-1e6b2LzgyglZatOZT7QQHCZ94g>
Received: from alpha.home.b5net.uk (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id E47C8E4841;
	Tue,  2 Apr 2019 10:15:47 -0400 (EDT)
From: Paul Barker <paul@betafive.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 15:15:37 +0100
Message-Id: <20190402141538.25146-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/1] tzdata: Install everything by default
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
X-List-Received-Date: Tue, 02 Apr 2019 14:15:48 -0000

This is a v2 of "tzdata: Add tzdata-all package" with a slightly different
approach.

I've took onboard what Ross said and now the "install everthing" package is
simply "tzdata" not "tzdata-all". A new "tzdata-core" package is created for
what used to be in "tzdata" itself.

Paul Barker (1):
  tzdata: Install everything by default

 meta/recipes-extended/timezone/tzdata.bb | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

-- 
2.17.1


