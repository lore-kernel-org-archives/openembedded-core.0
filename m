Return-Path: <net147@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8FDB76D136
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 10:51:06 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id x10so6483409pdj.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2013 02:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=C6gxYvbiK6/6QIOX9xPACwNrSK5hUqRkptQZ+/RwtPU=;
	b=ajwWmIxWKxlq/gdKzLEgi0r81o53Fmmd558CxKXn0jv3XgMES+tUuiF/rRK3H229VQ
	qyDlWo+bdw6kTMgqDq8EKYj23BMzUTmr/eH8xxbnZ+2bKnGSdioNFlIOFIB0ehK7Q9Tm
	cnzaelYiu3jJTtHh2rRLATFhOOUMlTXVQVrHhNhJqfrH0WP9/1jU+ompdykzuOYlg67z
	sl3t7DyIspunWFMFp/s2D7VmqMOn2XgROPgEo1YSKr+bN4yjXzwomlB8BlyDRVSdRAt4
	d9XhCGcSelR0SUcCZ6wbsp75mXOIwgcK4eVx3VqOpPEojME2xI1CZq7W5vX808SeDZAv
	TrTA==
X-Received: by 10.68.189.101 with SMTP id gh5mr16868175pbc.39.1383562268407;
	Mon, 04 Nov 2013 02:51:08 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	gf5sm27441307pbc.22.2013.11.04.02.51.06 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Nov 2013 02:51:07 -0800 (PST)
Message-ID: <52777AD9.20201@gmail.com>
Date: Mon, 04 Nov 2013 21:45:45 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [dora] Cherry-pick Qt fixes
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
X-List-Received-Date: Mon, 04 Nov 2013 10:51:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Robert,

I propose we cherry-pick the following Qt fixes from master to dora branch:
-qt4: add upstream QTBUG-31579 patch for QPainter regression 
[OE-Core/a5afc67cbfc32beb3be10392bf9788cfc3610ab1]
-nativesdk-qt4-tools: create qt.conf file 
[OE-Core/23f88695683a8e428375a8ccb6be935347a8768c]
-meta-toolchain-qt: put QT_CONF_PATH in environment script 
[OE-Core/fffa4c37c49b169f663d28612b9251819cef9577]
-qt4: add upstream QTBUG-34218/QTBUG-34234 misaligned selection patch 
[OE-Core/3af8f2e0697a9523d3b505ba4c48eca35f6de3a9]

Regards,
Jonathan

