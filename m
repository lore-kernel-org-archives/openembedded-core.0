Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web08.5088.1630049842348039610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 00:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=P8kJpy/b;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mJWQR-0008AH-NG; Fri, 27 Aug 2021 09:37:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VQ6bDpbJuSNsFtOiV/jZZ5QBr7JlcbAEw39GWKCxVj0=; b=P8kJpy/bda/8dmkvCJunjiIWIV
	jcnwL/PhVcq9IAJTBKtKpT/AjHqO9V8l0uhWswofQABkK1OZGZBjLqxZF+nrDuQSH+N8Hht5BLM2j
	pv6HgXWjyIAdlUqEKjQ+RPuTPaPBPbc6APoY7AD3m6To4vUsuMWa3d1biuVm8Na1WQ6KDv1Tu6mwN
	PM8Z3Keh9CU5kSr51fjIULR8cCqAhCjwQQXz0YQnZPfj3wrEjw6oXRDMeVbGtL/Y9PL6maOqtP2eQ
	vu3yxTWLTGIZgrIRACGaNodI+wsHmVt0KZLOX/H3jPxMm0gy8bZhk1MbWBJ9Qappro7o2i9/omv5S
	v31dqL6A==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.lan)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mJWQN-0007Ok-T8; Fri, 27 Aug 2021 09:37:17 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: zboszor@gmail.com
Subject: Kernel and image related bbclass changes
Date: Fri, 27 Aug 2021 09:37:08 +0200
Message-Id: <20210827073712.2766816-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823145450.103319-1-zboszor@pr.hu>
References: <20210823145450.103319-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Scan-Signature: 0eafba088781daefc179b991590fe5af
X-Spam-Tracer: backend.mail.pr.hu -0.8 20210827073717Z
Content-Transfer-Encoding: 8bit

I have been carrying some forked bbclass recipes and I think
these can be beneficial to others, not to mention that I could
get rid of the private forks of these.

v2:
- drop the package_rpm.bbclass / posttrans patch
- squash the previous patches #3 and #4 together (patch #2 now)
- more verbose commit message for patch #3 (previously patch #5)

v3:
- fix commit message for patch #3 (stupid copy&paste&thinko)

v4:
- enable PACKAGECONFIG=zstd for squashfs-tools in patch #4


