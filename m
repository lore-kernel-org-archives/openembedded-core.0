Return-Path: <paul@betafive.co.uk>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 616A27E951
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 09:14:25 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 7FF6021111;
	Tue, 24 Sep 2019 05:14:26 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Tue, 24 Sep 2019 05:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:date:from:to:subject:content-type; s=
	fm2; bh=3SfYi7BOx7h6WQsY6VluvRTVdbaxm1TDdeZJDWN5QJE=; b=PlZrWD9E
	5+ou9k1jxPP1vshQ13oqmfda8He+HtUNpqOOr/pF69AL3ZYj9tXyRKwbUefq+yz0
	lfZLkj/45OocGhAuNsHTa2vKrI2zKauOnjVkqJPd7zfnJCSKJZkZceeB9mtw7OQJ
	OTubGyjbw0Epslxw55KAq0TgwSJ9jJY3u/jIemgjLDaHMYw+uDd1PNmiHu+XDx5P
	npKCGqkZ63Slw5/FVV/2oFwPCIdUL9HceVg/YKYbA/MKc7e1At+P4f4w5YJIQlKa
	7eZPHrBUGPWhD/NJcypP4uR8xml6/Y7ljXszVVadT3wjc5H0gpCLhRqSuXM+fuVX
	0p/ho6UMiNvMqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=3SfYi7BOx7h6WQsY6VluvRTVdbaxm
	1TDdeZJDWN5QJE=; b=f8PsMMtu8TJcEkBbmwJ+dMywiGbcoa9PAour8g+oRNPyf
	QGCOes2PTixy4USl8JYd3nue5T+yq25E+DwVW/FrHy7mcBrrKKQgMnoV4xl34/ZI
	cfvJ4FQwTGTc20G9vcfM6IUjoIlCWbNzvxIAU5iBx+glcvBfXw5+2endzIjgMJp1
	Um7/2BEl6WedYPsFJt+E7t1WhrwedPV4mzeP+2IIPfhJFQ7xVyC2eI/e8XodVm73
	FujLnF27C96g3DgkYJPTfiacZRnUqx5FXTmvykzg1kroea9ZHduoc2r3JzqcgA3v
	pJ1kWJJqHRJ3oBOuMiQaCn0U40DKE4m19FoWDtTzg==
X-ME-Sender: <xms:cd6JXZbRshS6dj_NV2lKeVYk6sV2HjggtsuVC2Vk0rYKjFc5eijIfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedtgdduvdcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefofgggkfffhffvufgtsehttdertderredtnecuhfhrohhmpedfrfgruhhluceu
	rghrkhgvrhdfuceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecurfgrrhgrmh
	epmhgrihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehluhhs
	thgvrhfuihiivgeptd
X-ME-Proxy: <xmx:cd6JXaHjRKApENf-afSA-0ibGM6GBk23I6wHPie9RecEGglXkzEajQ>
	<xmx:cd6JXbTSpJfpi4GghIq3CFCZDIUmoT_DqmLnNn1VX-Ur0ns5UtSpjg>
	<xmx:cd6JXfuMbAxsy2wYGPbJbL8-ar9CRZF_Kp0hzGK_B4fRTOtme5-wJA>
	<xmx:ct6JXb4XDpnuabqxZm7ZdgBfEuOJ3eiUDd-IxkFNHTtU3yM46t54ug>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id ABA28E00A5; Tue, 24 Sep 2019 05:14:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <0314bb01-d210-4a7a-adb4-c0c7c9992cf9@www.fastmail.com>
Date: Tue, 24 Sep 2019 10:12:00 +0100
From: "Paul Barker" <paul@betafive.co.uk>
To: "Armin Kuster" <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: oe-core warrior backport request
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
X-List-Received-Date: Tue, 24 Sep 2019 09:14:25 -0000
Content-Type: text/plain

Hi,

Could we get the following patches backported to the warrior branch? We're carrying them locally to enable builds on our infrastructure where DEPLOY_DIR and WORKDIR are placed on different devices.

    f064a581ba license_image: Use new oe.path.copyhardlink() helper
    5437efa16f oe.path: Add copyhardlink() helper function

Thanks,

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

