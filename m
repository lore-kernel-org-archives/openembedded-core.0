Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id C91D4601AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 12:25:12 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id l10so8820760oag.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 05:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=7ESJzDHZxqudqsD4nFrrGZYoO6zLxyBgN0JbtIC1Xv0=;
	b=otMOSkIEGKJtIGWLx+AVZqPaA1uF4M7w9Vj64BhGJxwum/dH0eNP/7RaOBFvwLLcO3
	yDSDStJtP59r106PTB1ClKEKBckZk5He08D27nmwfiL4Fj9vQQu6qVBZKgjt0bithRww
	vjJpukE9JSpQZU86eRmnZOZyqLmAPTR8AXw8B+2NqJBEpZKOU3hdIGdUBLnLe5a/cwsU
	9PgvuvvmJdFTar+4CCtAfNIQENQfvlxeUo565cFc7G79spYy3czohkoGIGi3g+ToOrxU
	xhRN30gDKD9VfJPTwxAuFvuPzc3Ycn83ZOMamMGxSZHKvoCyZlzbHT/a69xiqjJ9SyId
	ryWw==
MIME-Version: 1.0
X-Received: by 10.60.79.3 with SMTP id f3mr26352054oex.50.1374495912892; Mon,
	22 Jul 2013 05:25:12 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Mon, 22 Jul 2013 05:25:12 -0700 (PDT)
Date: Mon, 22 Jul 2013 09:25:12 -0300
X-Google-Sender-Auth: DbSJPSAK6PXLGWyEsY_fCKVIC5k
Message-ID: <CAP9ODKoHGqwBXZVbEAtMgig=x6RVud1ZWo2oXFPcD8gUyqiVCg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Handle of kernels which need dtc_cpp use
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
X-List-Received-Date: Mon, 22 Jul 2013 12:25:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I need to use one kernel which uses dtc_cpp. So for now I ended
duplicating all linux-dtc.inc file for it.

Does someone have a better option?

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

