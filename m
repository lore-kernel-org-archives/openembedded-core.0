Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 131A97F2F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 00:56:03 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id h195so6657061pfe.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 17:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=FwSYhspCf0H04IL2vOBnaiACTLTyZQStUNU5kJnfMPU=;
	b=ji93XEriUP0QAOQlH9QHlZ2BfePLC1Hk3XHAqTSq4gtQc0yHllMnGwTH2h58PeO+fJ
	f9v/PuwJYTFi/P5h+BXmkIx3TcFbtssPWpeUTsq3orTDmkcSbGSHwo5RtPbJiLyCfwVE
	rb9a+hUCIyRjCBE5Mo11A/ImjnVgLDUFaQ+T6YAnQlg799mkTvVoRYaSjOoXGd4HzuFM
	/CFEYN/x3PWKfvZFbBZWNkiARuPQqzjBNrNKCBySfTFwIgGuzzZoHakCpWavtwpFHZTu
	/Svz28eXZBIvE5zoRrQOTJXRwYe1OOsGlFhBXwD4bIlJhw2G17rLi8z26iW88r5w3uBH
	2+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FwSYhspCf0H04IL2vOBnaiACTLTyZQStUNU5kJnfMPU=;
	b=W6wtGx7g0NhRw/LvcV4j8a+tnx8vzNmFNNtMmqID7RjHPP32TfOLkWg8ofAWRScjCb
	cPUOVBSrPResXFY6vygSIQHhgH8+0o7jfVzbjrz484DVL4e1r6iMui1MMeXlltNleA+j
	TQNZALkxLxU6NVbM8M/pddqXzYR51VhdMbn315LUAX1SAesA07DLXj/YLCjFcz9J2AE7
	dOSsGQlH7JYFAveAoNf/S3FBZ7UB9BQvyNPB9Z9q0Kil27QYjPfahpGUFT3y8uWcgY2X
	U8flwAZ+4WuYP/iK455rt7LKHXoef6R0rtObywNv8vEafAGJNW1N0z1IABIoxYsFU4d0
	BB/Q==
X-Gm-Message-State: APjAAAXmRbq6GWKgiUwXw28S1jBGe9hgbBlJN36oJlSeVA5Dlc3qj2HA
	DkCkrjPeaRW769gt82AH1BSEaL2FB5E=
X-Google-Smtp-Source: APXvYqx0ZuzM+CZQFXwwg5v1/nSILIP3SoYMVg9r8bmqUgZCAkpfkpCuUhMAgd0ypRvq7cjci6Z4bA==
X-Received: by 2002:a63:8f5e:: with SMTP id r30mr28155629pgn.161.1569891364909;
	Mon, 30 Sep 2019 17:56:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a9c1:2a99:4c55:de93])
	by smtp.gmail.com with ESMTPSA id a7sm702881pjv.0.2019.09.30.17.56.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Sep 2019 17:56:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Sep 2019 17:55:58 -0700
Message-Id: <cover.1569891224.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [warrior-next 0/2] warrior pull request
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
X-List-Received-Date: Tue, 01 Oct 2019 00:56:04 -0000

These two commits fix the qemuarm64-ptest failures on the arm host


The following changes since commit 8c87e78547c598cada1bce92e7b25d85b994e2eb:

  cve-check: backport rewrite from master (2019-09-29 21:38:22 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/warrior-next

Richard Purdie (2):
  qemuarm64: Add QB_CPU_KVM to allow kvm acceleration
  runqemu: Add support for kvm on aarch64

 meta/conf/machine/qemuarm64.conf |  1 +
 scripts/runqemu                  | 22 +++++++++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

-- 
2.7.4


