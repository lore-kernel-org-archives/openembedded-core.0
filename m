Return-Path: <gary.robertson@linaro.org>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 70FB26AC9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 22:21:05 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id j17so6130431oag.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 15:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Xd7DxrGZV1BhDbVxKJQ5gSvTeZuAuEdcm6z9iwcZMdo=;
	b=l6aN4C5HG8mplHYwnc6GSjWcLhyItk+Fsh082G3c7JpmCGUDyPW58i59bC6GtZVUpP
	y5y4bNe6eRpGQgbTxLoPqstLWKSm77f8ya7KRivET+HVFGpUOf4MYNdowPBgiR7lJIzs
	2Un25UEkzhBNGc/nWDTcrDk8O2laZr+x9LeG27eveknTgrXc57yTR8EpMhS1F++gu1fK
	dxEm4/dkNDGEHcpgwbwlzH4uqb5qPro/V6ZVzkYHOfTdef6qR5oDrVu841xh/dACT+eR
	07bZ4srETA7LzgqBGrqOxXTteRRAkaZpvlZtk0M1gkWYX3A86kyociQuUATWXMHcU9bO
	0REQ==
X-Gm-Message-State: ALoCoQnOPYwvY0gF/KTpiomvm7eA2Yqpf5WCJJ3C1PzXg233C2MTZuq3ZgS1FGT6DN7vzDW3YBtd
X-Received: by 10.182.76.38 with SMTP id h6mr27305534obw.8.1406326866088;
	Fri, 25 Jul 2014 15:21:06 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id q3sm40881371oei.3.2014.07.25.15.21.05
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jul 2014 15:21:05 -0700 (PDT)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jul 2014 17:20:42 -0500
Message-Id: <1406326845-17506-1-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Cc: mike.holmes@linaro.org
Subject: [PATCH 0/3] LTP: Realtime test fixes
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
X-List-Received-Date: Fri, 25 Jul 2014 22:21:14 -0000

From: "Gary S. Robertson" <gary.robertson@linaro.org>

The following series of patches addresses several bugs which were preventing
some of the LTP realtime tests from running or completing in our OE-based
test environments.  The patches themselves are being separately submitted
to the upstream LTP maintainers for consideration, and are offered here
in hopes of addressing these issues in the OE LTP package until such time
as they can be obtained from a subsequent upstream LTP release.

Gary S. Robertson (3):
  LTP: Realtime tests -
    Allow-mutex-initialization-without-PI-configured
  LTP: pthread_cond_many - fix uninitialized return in parse_args
  LTP: prio-wake- eliminate deprecated usleep calls

 ...utex-initialization-without-PI-configured.patch |   66 ++++++++++++++++++++
 ...io-wake-eliminate-deprecated-usleep-calls.patch |   33 ++++++++++
 ...d_many-fix-uninitialized-return-in-option.patch |   31 +++++++++
 meta/recipes-extended/ltp/ltp_20140422.bb          |    3 +
 4 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Allow-mutex-initialization-without-PI-configured.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-prio-wake-eliminate-deprecated-usleep-calls.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-pthread_cond_many-fix-uninitialized-return-in-option.patch

-- 
1.7.9.5


