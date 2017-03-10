Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id E334C77722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 13:16:40 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id a6so40803197lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 05:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TnC+mQS7hGr0VWT6TiAyLbYVpf1cFRarfZOIng+XfVU=;
	b=UewvEEf/9oniQXGIwL/QJdakmZCgjk4ApVyLOjqbeGAAXtBp+8eKrL3ih/fjtH6xWC
	P9t0SNiVXtvUEc8Qm/iU62bQkYWQJQV2KuBfgKRIBZU7T4wW0VE5kxitq64NkGVWc3bJ
	bp5Gq50wjVniJMb3JiXf2YCi1UGFAGMyimPb3Qxz1rtiGMXtsLvtKdQVuZLlF8UgZyvV
	OM2/Ngz6EfXqxpI/qB72M/46X13c84c3zkcYl+cE+LVn1o8zmQwH5mZQ46D9CXGJKGSG
	u8sJW2ck/WN116KOhSZiwMNfncuyQJwLOvzYq0IuxpXUntXI1/bxBp2U34dsCsUYwTZ1
	t6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TnC+mQS7hGr0VWT6TiAyLbYVpf1cFRarfZOIng+XfVU=;
	b=OMDAV2atULsBoXrxuaCiRXS0SSc2/YowG0bdXryqYSLRpD7GEvHbJk6EntQk6LhGub
	QBrr0waADm0Da8/ms18aL0w/YngYqvkA/v0t/+ZEPUg9NBHoD3WGGSzB/QyUekFoCgvG
	3dUWCtvs06XKKqNEBEjovHozaZUdgNthrWj2wr3ZMEsMZjcMrU7qvZGtTV6Vuj5k5rtI
	AYPgox7JZ2EH0bzwazyqR2pMwOS5eCly7ebNa6keBKNx17FkcGihmsAuizrUeOrAhF3q
	IOC2owWerO+T8DcaiFl21Hl0U+o0RF92ScFoH2EcRHaPX/O+uPQ1A1ecP6xWKetFrKv2
	KT7w==
X-Gm-Message-State: AMke39l3qghDGAm6jtNgSpjvIG/q9JEl9/b9Op2OcR3j0xzBQI1Pw27cH7iXMhvQhyRb0g==
X-Received: by 10.46.84.22 with SMTP id i22mr5849406ljb.132.1489151801238;
	Fri, 10 Mar 2017 05:16:41 -0800 (PST)
Received: from kristian-Mender-T460s.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	a63sm1853764lfa.22.2017.03.10.05.16.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Mar 2017 05:16:40 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: ed.bartosh@linux.intel.com,
	OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Mar 2017 14:16:26 +0100
Message-Id: <1489151787-13834-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <2f34f5fc-ae61-d25a-2d55-5061158344e4@mender.io>
References: <2f34f5fc-ae61-d25a-2d55-5061158344e4@mender.io>
Subject: Re: [PATCH] wic/partionedfs: Avoid reserving space for non-existing ext. partition
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
X-List-Received-Date: Fri, 10 Mar 2017 13:16:41 -0000


Alright, finally got around to this again. Patch rebased, and passing
tests.

-- 
Kristian

