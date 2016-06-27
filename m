Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5483A6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 16:05:43 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id bz2so60328798pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 09:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=yOvjHNTHzvOvbE+ZCIRkq8i9koKzeMOUJw0+ckpp/x0=;
	b=ovuobzUak3+c/W5TWNBfwzGZ73g7yAkoOOXXcgxdVoCH6Bngh/mbSUOeoDxWBZrDSd
	PVEw9BaSbBxKg5FKJOWX05slYPUU5Qc19daWE2z7C2YLQ1AX/MIq5ZKlunG+gkGYZqDe
	E7NEU2ML3n3zEYoevJK/YW09935Deg6Yt4dIrm2UtMJmI6y+lbsQ03ktp2QM8g40HyWu
	9guW8QxTpJ4YDCOeCjS4tHCNSj7Yyrr8o9nh2UMZhegvEK2DjorJAP5DIyQGt/B/ulEb
	bsT7jdJhhPgnrz3NNBIsZgA02W43f2dGp7sCEVpNhchDwVtbExJocUgYMUCLUolDLGQE
	I+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yOvjHNTHzvOvbE+ZCIRkq8i9koKzeMOUJw0+ckpp/x0=;
	b=f8cqg1d/+FC/kYh9TpJ5xTh87AIGeU8IPBY87IWhaMA5suhQKpUIzlSoTI4kRIKS0q
	rMZyC6bSEDokOtqouO5nYqonl7KAkbvK7k23EvNjcNprlo+/GzseGf6RnfUr4rS/yEYR
	hh1RaDUFG6hirQd24NkiMJlYHdzIlqS0+plxnTMb+aekklYIumwh24uVndliwCHJ66pi
	1kjhvmciDb6RRUvhEc0u8A9P2O+c1u1YFRnQBnXia7xNY23YL/tZcCWET4CH0nUV/r9O
	svuWqWDwptOQ3BrSd/IzpXldyhZBbmW0gtEKFn8u6XGvJ6UqbzflGNpTDXsO53uq4c7e
	Yx1g==
X-Gm-Message-State: ALyK8tIb4yz7xuht5h54So7aazyueNnzQlmRTTFnZh/YmsKTjfWMRYcOVSLZTUGIlifMOQ==
X-Received: by 10.66.127.47 with SMTP id nd15mr35465243pab.74.1467043544540;
	Mon, 27 Jun 2016 09:05:44 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 64sm633520pfj.96.2016.06.27.09.05.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Jun 2016 09:05:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon, 27 Jun 2016 09:05:37 -0700
Message-Id: <1467043538-18722-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH] Add tcmode to build summary
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
X-List-Received-Date: Mon, 27 Jun 2016 16:05:44 -0000

Dropped tclibc in favor of tcmode for build summary

Armin Kuster (1):
  build summary: add TCMODE to build summary

 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.3.5


