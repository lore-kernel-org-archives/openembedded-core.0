Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 04A296B519
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:32:52 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id q14so9997139itk.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=sGIWJpgsjhZihJbSGEmH709F/XbpEorhg/f6r1E/a0k=;
	b=jRZfdn0RpQ7qtLCe7WQMMxDvma3f7nzT0FfBzd5UtxYTwq8wlnRaxsfdNg5MwX6Uor
	T5zgW79uFy9k5qtNGctpjJ9gF2CXzM6BJrmrGA9bzdls8RtBTvRgw2vkpOrVAXcpKO4H
	+pZwrEtBNt/6mv4kQdeIgkHj9+jWeZbCLMg4+uU7vAsYpKmoBv4VIYwVWuKOy5WhU1IN
	YMh++ljzeQ25toXY2TpAsGTHGPIoeli6KKqg+ZoBgAR4VTlvPEqldyODdjEOisDarMxQ
	q1j1VWWVFicp1qoU4xVZqXVe/b5OYfAwopwzEhwcyAOTyl86Mphy+tOygcLpySUSJMUE
	XpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sGIWJpgsjhZihJbSGEmH709F/XbpEorhg/f6r1E/a0k=;
	b=b97m8G50pdVN5v8i6QfHeSVvz23c/GNHEkfYohL5njpcVZcUXgL0KLq46eTFWjXJA6
	Gk7Oi2GyItJ4HhSCq+E/kRR/UaTdLjDqe343D44uXlXQE7UBG32w7La9dE+S8OtBa5QQ
	3wj0wa4fISAo0txGmYQ2AuOFxkcgQQEjFiQ4MxCQ8jpBalrBcOzOwsgPcd1jJpaAewIz
	73LYRzX0b3vSp9OY5nj89OFscbH5wdCo8TJJK79wtU0wfHo9znIfq7QMLHaHgKkxMQcU
	8fgo6HuvdBiME59zxz4f2FJ+ccj/RzXLAkR1AtYYSXvY2JATqqkbC2TqeM3JBNQ6TbyD
	xaGA==
X-Gm-Message-State: APjAAAXriaaAg6Kqia6isuRy6myixPp8CZ1/AeN+Ygpc1dKYS09P1wbt
	3rIIVVmyzHrdPJGphijjyKLITovB
X-Google-Smtp-Source: APXvYqzNwYwAeGZrM7r6rRxtvknYueiA9UjX2/uLVX+ApE01GcgIKd6tj16QXmwaB8Yb+rgcI8iPZA==
X-Received: by 2002:a24:43d1:: with SMTP id
	s200mr12146831itb.155.1555936373862; 
	Mon, 22 Apr 2019 05:32:53 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id 19sm5889536itm.6.2019.04.22.05.32.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:32:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:32:37 -0600
Message-Id: <1555936363-18793-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [QA][PATCH 0/6] Add LTP runtime support
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
X-List-Received-Date: Mon, 22 Apr 2019 12:32:53 -0000

Yes I realize resulttool has pending patch so v2 will most likey be needed.

This allows for running ltp and the ltp compliance tests found in the 
manual test section. These have been structured so they can be scaled into smaller bits
if time is an issue or by function.

Tested on some Qemu and h/w.

Armin Kuster (6):
  resulttool: add ltp test support
  logparser: Add decoding ltp logs
  ltp: add runtime test
  resulttool: add LTP compliance section
  logparser: Add LTP compliance section
  ltp_compliance: add new runtime

 meta/lib/oeqa/runtime/cases/ltp.py                 | 124 +++++++++++++++++++++
 meta/lib/oeqa/runtime/cases/ltp_compliance.py      | 104 +++++++++++++++++
 meta/lib/oeqa/utils/logparser.py                   |  62 +++++++++++
 scripts/lib/resulttool/report.py                   |  83 +++++++++++++-
 .../resulttool/template/test_report_full_text.txt  |  34 ++++++
 5 files changed, 406 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/ltp.py
 create mode 100644 meta/lib/oeqa/runtime/cases/ltp_compliance.py

-- 
2.7.4


