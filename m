Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web09.23059.1629721413908814563
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 05:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=X6bnHkdh;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mI8zD-0003f0-Lu; Mon, 23 Aug 2021 14:23:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KIHXAuJrb2rVQND6wqQEFUHuz9go4nhzEdKMIYUjKCA=; b=X6bnHkdhGGL3SGwOTi9ugtmPDG
	5tP5lBFnRnIA9Y8lzt+mp50jL/XhzoYCzwDvZkbneOwKlbvyMe7UlrrCPw5JZiTGBVXLr48MjxMOk
	EVg6iw8Uk3voG+ZC0oqvLMYSonaYVdi0tGT7/6dqhFgDlm9ZyUQRxPHclFFva4BSrmbAfQxrP/o16
	5B7Ee8sRpNwaak8OznHB/eOUi3JIW7mNIqZGLUVAaL7jfdUmwf+XOLTUwH7Ftmvi+hr2DPR/73ofq
	V7XKjYPxET6JpC8zzjmgrhvEy1YYkNgQ/FbN/zdfEsGzCt2bzFWOANQJlEp5nZXasaqDalOjy85p6
	cvUhN+Bg==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.lan)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mI8z9-0005eF-Rr; Mon, 23 Aug 2021 14:23:29 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: zboszor@gmail.com
Subject: Kernel and RPM related bbclass changes
Date: Mon, 23 Aug 2021 14:23:17 +0200
Message-Id: <20210823122323.97400-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Scan-Signature: 5c27a7ee490ccbfea099474daaf9cbba
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210823122329Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I have been carrying some forked bbclass recipes and I think
these can be beneficial to others, not to mention that I could
get rid of the private forks of these.

Please, review.

Best regards,
Zoltán Böszörményi


