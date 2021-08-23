Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web08.24797.1629730045863795984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 07:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=iHI+EKij;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mIBEQ-0004pm-0l; Mon, 23 Aug 2021 16:47:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=zWgXegqVEoKAUYtDipo9CJBNjal6QxziqFrbauvytMM=; b=iHI+EKijzvWbvo9ND+hvZKnS4p
	y0M4+oquoyMbDE9BNem3QtX4xo/tLlbaovG+UTCYhI24rTOhM986gJsdU3A2WcEM1NBLU9q/tKQW7
	YC+yJ8sR2XydqLtdPuGTa4MThrx5J1qQb50UhH864LZLPcC7wVA/3irjxQJOEmeGyxwHIeny5J9AI
	tLaQljEs1huSU3Gr3vLFwSAFUwCq+6sOfZ70XSXbPF/cr9C1uEiaIaIk4cbs4DquWVpHWUIVazwq2
	+GOn4REQaNGWP71K19RoE1/pqothskNVuwJNY+4gW4e2nTa4FwF7HBdiqfwnXYKQu1duulTC2kdWW
	KImybqFA==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.lan)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mIBEM-0003gu-6z; Mon, 23 Aug 2021 16:47:19 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: zboszor@gmail.com
Subject: Kernel related bbclass changes
Date: Mon, 23 Aug 2021 16:47:08 +0200
Message-Id: <20210823144712.101597-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823122323.97400-1-zboszor@pr.hu>
References: <20210823122323.97400-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Scan-Signature: 5c27a7ee490ccbfea099474daaf9cbba
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210823144719Z
Content-Transfer-Encoding: 8bit

I have been carrying some forked bbclass recipes and I think
these can be beneficial to others, not to mention that I could
get rid of the private forks of these.

v2:
- drop the package_rpm.bbclass / posttrans patch
- squash the previous patches #3 and #4 together (patch #2 now)
- more verbose commit message for patch #3 (previously patch #5)


