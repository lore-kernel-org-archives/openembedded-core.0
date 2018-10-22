Return-Path: <christian.meusel@posteo.de>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 Oct 2018 11:57:48 UTC
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA70744F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 11:57:48 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
	by mout01.posteo.de (Postfix) with ESMTPS id B96C321124
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 13:51:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1540209068; bh=Gku2FYRlbwyXbEQTJEd1Skru9pcxmjdAua1qE/RsJP0=;
	h=From:Subject:Date:Cc:To:From;
	b=WprQKf7gh/IPwC7ftAIZpeYWjy0u11cFLliWNW8tWZx40PSHCXn9fyZfhZhfFg/f+
	boYy8i7NBtjfnVZDPfvcyYyfpt4gD6p/QPo+qw+OMD8jLVJXqszXbEY8pJ+bWuDh1p
	23/O2PVSfm5HdvwsVS0D3i/CbkJF39KFxvTdQp5PlxWPxaLMjnA5u1H9zAWs4/AWZs
	JqXtuk4kQ1GlaSCIcylFXbf5Eb3x/5w8vlaABnVamzAn5Pqt1RtFnogIsYHY95BfDF
	yKZd4NpGHoydo2KyPJVqYbMiuCFjltUfB89mH0lfPtgxIxbFebD27Aex9YjYiegyo8
	r9J9a03s1VYUw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 42dvx765dSz6tmK;
	Mon, 22 Oct 2018 13:51:07 +0200 (CEST)
From: Christian Meusel <christian.meusel@posteo.de>
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
Message-Id: <F12D1065-F33F-463E-8965-E0680D51C3F0@posteo.de>
Date: Mon, 22 Oct 2018 13:51:06 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3445.100.39)
Cc: openembedded-core@lists.openembedded.org
Subject: ca-certificates-native: stage certificate files for rocko too
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
X-List-Received-Date: Mon, 22 Oct 2018 11:57:49 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hello Richard,

the last days I worked on an issue with ca-certificates-native for =
rocko: the certificate files do not get staged into sysroot's =
/usr/share/ca-certificates. When building openjdk-8-native from =
meta-java for rocko, it will end up with empty trust anchors and refuse =
to establish for example TLS connections.

For pyro and sumo this issue does not exist as the certificate files get =
installed into sysroot's /usr/share/ca-certificates directory.


Cherry-picking the following commits from master onto rocko solves the =
issues there:

    20e6d8762b ca-certificates: use relative symlinks from $ETCCERTSDIR
    616075eca3 ca-certificates: avoid using +=3D with an over-ride

Could you please add these commits to the rocko branch?


Best regards,

Christian=

