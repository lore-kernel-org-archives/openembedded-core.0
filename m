Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id DD40574FB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 19:43:49 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c10-v6so7560058pfi.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 12:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Bnl7x6XGheqO9nj/SIXUC/GNZQJzSunO4fiIgTBSc58=;
	b=KlbLd3Pc/4U/fGi3BxJzuSHHV+0ys7AmqXWxroyQurpH9dKTIhWcMOvoVVywEbAILg
	puvSnDnqqhUWMxydN5uegPuPAKdaHu7WqcJ555imIozwaWztPHZohbJlHdhgRcQ1YhTx
	iIEk62c/IXwGpnK9rlOKv6q0KbjRIsRFkWZVlkIMvfN3J4DnFJUiMX/QXnp7OhJctNWd
	ZkZSoi3zCWEc54OAXg7dO9ZR/7Y93EPsy3tGct+Vku8thaoy3hSV9lBRvV3olkiatCll
	uLKnh1ZOZ+aIRqNeLiGpnS9ETJYM6xqrF1miByi4RsBljT5TLlGt9nE0VJHsRKxnACuu
	q7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Bnl7x6XGheqO9nj/SIXUC/GNZQJzSunO4fiIgTBSc58=;
	b=tMNT3OurG3I68enX8Ehd7WugzyCgCbjT3BIfE8DW9x3YLnb4b3dTqFBLsLSLFX+3AE
	Vpj4Ozy8YcVLFlpHkry1y6I/fvP/yLHZYRygQDqmh6KQDmWVxhnipnMGlTahVKZVgjGH
	YxGcxtodZqyMyQjHRTLUIXVrRBiq0wW8mT4I6UuMv6hZzgFl30yfpkkvOW7FjfYN9muR
	LS+RdKUqtCJQ41WfIoY+gH9Nk+occnni6XTrYor1a6cqK9YpXJMaJ0pmhQj35TZNA1Pi
	7TdV6affuMaxx9ojN864OYuRU7lGh+XnJBaRSqcFVreg6vN8ExbocOoPnT4mlu8Ji0+X
	UxCg==
X-Gm-Message-State: ALKqPwfdtUgklfgNY7YACg6H5HbUhFlMawpU4WkfLRpp6YY5e2mduudo
	eo12W3/SyOcEOL83bxSwt5k=
X-Google-Smtp-Source: AB8JxZoXAiamJ78L1fP0Z7fyxxkB3gQ1zEJgcM8NM27Tz651moyeQjnEWay/aeh8Sq8bR1UkA+UN8w==
X-Received: by 2002:a63:6fcb:: with SMTP id
	k194-v6mr2348114pgc.349.1526931830584; 
	Mon, 21 May 2018 12:43:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:cda1:4d10:a5a1:339b])
	by smtp.gmail.com with ESMTPSA id
	v1-v6sm29723032pfd.2.2018.05.21.12.43.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 May 2018 12:43:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2018 12:43:46 -0700
Message-Id: <1526931828-20358-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] bind update req. new pkg in core
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
X-List-Received-Date: Mon, 21 May 2018 19:43:50 -0000

With this update, the python-ply package is required.
I copied the one from meta-python to core. Once this hits master,
I will send a patch to remove the same recipe from
meta-python.

Armin Kuster (2):
  bind: update to 9.12.1
  python3-ply: add package needed by bind 9.12 update

 ...0001-build-use-pkg-config-to-find-libxml2.patch | 13 +++---
 ...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 13 +++---
 .../0001-lib-dns-gen.c-fix-too-long-error.patch    | 13 +++---
 .../bind/bind/bind-confgen-build-unix.o-once.patch | 48 ----------------------
 ...-searching-for-json-headers-searches-sysr.patch | 13 +++---
 .../bind/bind/dont-test-on-host.patch              | 17 --------
 .../use-python3-and-fix-install-lib-path.patch     | 36 ----------------
 .../bind/{bind_9.10.6.bb => bind_9.12.1.bb}        | 21 ++++------
 meta/recipes-devtools/python/python-ply.inc        | 18 ++++++++
 meta/recipes-devtools/python/python-ply_3.11.bb    |  2 +
 10 files changed, 49 insertions(+), 145 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
 rename meta/recipes-connectivity/bind/{bind_9.10.6.bb => bind_9.12.1.bb} (86%)
 create mode 100644 meta/recipes-devtools/python/python-ply.inc
 create mode 100644 meta/recipes-devtools/python/python-ply_3.11.bb

-- 
2.7.4


