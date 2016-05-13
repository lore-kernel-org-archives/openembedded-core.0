Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE15731B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 14:23:16 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id t140so4538259oie.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 07:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=BTvkjjkeVSZ181U6FMbu1hAHSIlqm7sNP74tyjNzYaM=;
	b=dTL2IYVtYUYyjTEPJ6rWjZDl6UXgVgVPKUawFPtC4hKbXxW95K68eNZHAmDBd4wI8E
	++W47z5zXkuXiDT/BoMLNbBBU7hEELCHSP81mzJz5XlIpJiJMzk7IkYsObN8iAL+UJFR
	B6bNtyIfUFtim/H0Gxar/k5eBH0UyJN2DNysooK0KN1OW4RF5BAD8tjThJjHS+FAvE2V
	l1P6c6NaasmWcIZe2u9rjpNQW7IMdpkT/pThKbCPDyWq/Zdf35EVkt517Y95EQ/VtQjX
	boWmgoQrXh6C2onI59Zk056RAgUvceQZhiVqLm1NgGZASCqxkqzh0o/0trG8wQZYxWsg
	M3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BTvkjjkeVSZ181U6FMbu1hAHSIlqm7sNP74tyjNzYaM=;
	b=gQ2sLWhme+wjNrf/q9vOd0+c2RLcXvfVOcwna59dtqcLmoFflxW/eGLjjUQNRNbzIN
	4GSqQ7VRvJH9ughrG1OQE5U+3p1ejRETOpHWVCS+LbSAWOXn1VYAl7twHbw3Z4UTNtA2
	Dr5TjSv3ISMr7DUFQYNTspihukdjf8ST8yOLdEF4DgYJriwbYvNpItU0ZOgykGTx35B/
	r5x4N9123qoRMkOBq6tw/r6JYohrXaWP03l2kYU2WumLkyQdpVHp2t21D3tzK7MExFi0
	igf/zS+hLNOXiSTwmNYkvPndPXXm15XNeDWmCK4JNlila1qvMa+6CFjzYhekTWZ6LbLx
	qDvA==
X-Gm-Message-State: AOPr4FX7fplpRLIyOoKWUojt7zKf/1a/ymmXVxlIV4ayEaJqhCDwPgYKxnhFnqZnYYWv0Q==
X-Received: by 10.157.59.69 with SMTP id z63mr9559259otb.154.1463149397070;
	Fri, 13 May 2016 07:23:17 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id m2sm1853295oia.1.2016.05.13.07.23.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 07:23:16 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 09:22:52 -0500
Message-Id: <1463149373-8181-1-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [master][krogoth][jethro][PATCH 0/1] wic: fix path parsing, use last occurrence
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
X-List-Received-Date: Fri, 13 May 2016 14:23:17 -0000

This patch was pushed to fido (35ecb0b8557aae85f377c9d99f1a72cbb76fb6d8)
but was never brought forward.

