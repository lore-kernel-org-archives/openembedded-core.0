Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web11.25161.1629730505452665025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 07:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=ic/vIofu;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mIBLr-0008Su-3f; Mon, 23 Aug 2021 16:55:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=EfM59AmIgWFnpdMvmkpWdc5+OhJlDSUeGwMnpicF9CA=; b=ic/vIofuW8vZsCV/xSm5BQF58A
	oJEWxw3pq/TC21JUP8ujBpwr9N8xTftJ1x4B/afj/bHS5tkCA5nzJxQuubeIGLt5uskXB5tFqRb8I
	4icF5cdu2eUuIVU1M83oRuaobzrVvIqyLfmoRKNGhh+ymF+xMNqdnyBfD29+5gRkR0xhYzE60dCNN
	okP+rE0lcaz3CGKdm4OjZVI5mGhuhzM6yctRfDdCEMVO7UpIE9wAhlRlsE2KyUvRZ+h8ZheMvwf77
	Ws7CXmrPtLxJxkA2WzACU080zkqXjv1pAWsmNtJHOi026SRypufZV307He7SZHFp32DicFbsqRNcm
	MxgAtp+w==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.lan)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mIBLn-0005mB-7V; Mon, 23 Aug 2021 16:55:00 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: zboszor@gmail.com
Subject: Kernel related bbclass changes
Date: Mon, 23 Aug 2021 16:54:45 +0200
Message-Id: <20210823145450.103319-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823144712.101597-1-zboszor@pr.hu>
References: <20210823144712.101597-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Scan-Signature: 59c5510138b5be476e49709b9ba8d0df
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210823145500Z
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


