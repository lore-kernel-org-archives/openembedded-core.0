Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 44EE77264B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 11:25:04 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sBMBOvew015087
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 12:25:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1419247501;
	bh=isty/Kh3atyq1Y9CxAP36frotEprywXGeWLfFOHLFgM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Sender;
	b=eJe7ang69+QHQDngAr6PfwCfjbTAFmQbNo6EAys9oePUb6W+xK3M9mYgxKhAC7+Ih
	H+hfsCESM4U56FOgPP6mdXaKBofeSNCeyCwNP1qvkr3fIN4WgItGVn4y5qxqCUfgSC
	RLp1CcOkwIlJCfGxkS9UOJopDVvDavMFlnMX5n5M=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sBMBOoxb000863
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 12:24:53 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1Y316Y-0003RX-6T
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Dec 2014 12:24:50 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 22 Dec 2014 12:24:50 +0100
Message-ID: <lymw6gylj1.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Subject: How to enforce ${B} = ${S} builds globally?
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
X-List-Received-Date: Mon, 22 Dec 2014 11:25:15 -0000
Content-Type: text/plain

Hi,

what is the recommended way to enable in-source builds globally?
Building in a separate directory might be interesting for qa, but it
lowers end-user experience significantly because __FILE__ expands now
to absolute names.

E.g.

| #include <assert.h>
| int main() { assert(0); }

gives

| test: /srv/oe/cache/bld/f95aceac-8952-bd61-430a-dfcdf48db33c/work/cortexa9t2hf-vfp-neon-linux-gnueabi/test/1.0-r0/test-1.0/test.c:2: main: Assertion `0' failed.

instead of

| test: test.c:2: main: Assertion `0' failed.



Enrico

