Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.859.1794241189907757434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 08:19:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: otavio.salvador@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b10d24345dso10164017b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 08:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794241189; x=1794845989;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHTlOvmXYwrWCX2W41x0fkyovW1QuFfbFmdD0cGIWLI=;
        b=R+ptnpV45X2f4vdUEJpEQrOTRxgckrhjd4LIuLqX50Xtx/RKqlS+l8FxuJwe+GiQYK
         ImaLNKD6zniAjA1lTiyUvu+byziO6sSuGvejBP4s8IMk0kwKTmz+jXUP8IqNzWsuWIOt
         axsEaAaqnXpJtMSIM5LxR5Rix+mCeH4O0dUi7bwXbGhHzjVXadGFCng/wQe9xiCqZWPD
         EtCYS63zjpxjdhV6s1geBPxkbKTEqevzoJ+1SQUBIm7wJMWQAtD5hoKlrINybbROvoBJ
         A1DkFJPIGeF8jyAFEaK1/jb1PL0NFIzcoYD46WWfc/+QBsLeCRmHeR/P2BClqXxm3Sc+
         rsuw==
X-Gm-Message-State: APuU4Z+O1CNw285vURVu/C2GKRwbxhmckIunoG2mkidTVMN+BhGDwed7
	Mp6XYFdLlaVap5vGyTR/gZFRj/WTz5QISf+ge8RDGJnnA9nCKtkoZ3Cf
X-Gm-Gg: AYBFou1APg02q6SRY/hYUTJTUnsHUzZloVjRBpaOD+AUTC/git1E9UJ3vYLMxnY/NLt
	Qxw/1iolZJSEYy/T+4nMnhE3o/6bEBE5xYCuKoVO8URhjw35HL+/ixAz4sZzq1+fTSW8it1No18
	+BvSN00ivw9aX9JY5gfftWhsCg45+Uy5O+ZRGVYIGcQWOHBWMlipw1oDelBCwyU2mp4+imCoji+
	n1I2fwzn3WcYNKKin9mjTQppbpOqxQlJmhQovbEqutZuq/+Rrri9stAaO2L7M9r4+p6tRnYLiRt
	ijLSmjQg745QEaFdFL9UyKA/SMS6Huq/y2xW23049uQmycx/Dn0+i530SDJiHNG7KzrCXT+gOMA
	uXlql6DFaGV9nRJzOn1gY+vE014HpYKl3uTOVThc1JyzSb0rL9+2dMIYq8HKh7E2JNk3zsYCHgM
	MrFE0HIw5DV7FNF6s2y4Ef01/imK7AJ5hej/pfiT15HHsc4NUI/ZtxKVW+pwc0WOXXv8Sgw6v51
	AMOLl9vZ5BdiMorxsxgkyWTru67ud+HD1iqURzNt0bHvcDKisyr3awoFjrtG9u1hGEWb4sNE9Tr
	jx9ONV5S9tSdj/q8Nf0kbwushD300Ws7IA9o6eE55pJ1ZZ81Axy9UovrPZv86aoD2RJmL/nRGGh
	7U0MheNRpnz6+29DuOVXAuVi4Zt0k8zu4PboJdnroiFbgZdkRmv54IuNBzSBo7/m+rLW48cy6NA
	ldAzldUg+1JAkrvGAf2+5BxtxBvI222Q==
X-Received: by 2002:a05:690c:dc8:b0:8b3:4911:2dc1 with SMTP id 00721157ae682-8b36cbccd55mr30451537b3.39.1794241188608;
        Mon, 09 Nov 2026 08:19:48 -0800 (PST)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([201.89.183.192])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bc57e8bsm38536057b3.32.2026.11.09.08.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:19:47 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Subject: Re: [OE-core] [PATCH v2 1/3] yocto-check-layer: Add --run-tests to select the tests to run
In-Reply-To: <DMQQZ4DQ48LP.1O3YZ9RX6JP8S@pbarker.dev>
References: <20261019143924.1521981-1-otavio@ossystems.com.br>
 <20261019143924.1521981-2-otavio@ossystems.com.br>
 <DMQQZ4DQ48LP.1O3YZ9RX6JP8S@pbarker.dev>
Date: Mon, 09 Nov 2026 13:19:44 -0300
Message-ID: <179424118471.3181031.17871651714419088843@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 16:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249859

Hi Paul,

Sorry I missed your v1 questions.

> Why would yocto-check-layer be executed several times to repeatedly
> test a BSP layer? Why not just run it once with all the MACHINEs to
> be tested listed?

For the YP Compatible sign-off, one run with all the machines is the
right thing to do, and nothing in this series changes that.

The split runs come from pull request CI for meta-freescale [1], which
has 67 machines. There a single invocation is slow in wall-clock time:
it runs one world signature dump after the other, two per machine plus
four for the common tests before this series, in one build directory.
So CI checks only the machines a change can reach, and spreads them
over parallel jobs of up to four machines. Each job then repeated the
common tests and their dumps, which is what --run-tests avoids: the
common tests run in one job and the BSP tests in the others.

Splitting is not free: test_machine_signatures only compares the
machines within one run, so the CI keeps a shared machine in each job
to keep the comparisons across jobs. A single run doesn't need that,
and it remains the reference.

Patch 3/3 helps both cases: one dump per configuration, so a full run
over N machines goes from 2N+4 dumps to N+3.

> I ask because one of the things on my list to add is automatic
> discovery of MACHINEs in a BSP layer

That fits well. --run-tests is independent of how the machines are
chosen, as long as --machines can still restrict the list, so CI can
keep running a subset.

> If we allow running a subset of tests in yocto-check-layer, we need
> to update the docs and/or the YP compatible application form to
> explicitly say that *all* test cases must pass for a layer to be YP
> compatible.

Agreed. I can send the docs patch to the dev-manual yocto-check-layer
section saying that compatibility requires a full run, with all the
tests and every machine of the layer. I can also make
yocto-check-layer say so in its summary when --run-tests limits the
tests, so a partial PASS can't be mistaken for a full one. Would that
work for you?

[1] https://github.com/Freescale/meta-freescale/pull/2818

Thanks,
Otavio
