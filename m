Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3A0E06D86B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 01:59:05 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id y10so8796821pdj.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 17:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=qzi8BfOkGFeaq2MhG+vB2XnLsMAzBlz3SpsFfqKYf9o=;
	b=txmeX857NgsEr84GHS1JAJyHR+twN4i26d830LT1hOwj7Z2clxFAQ63iOeEepwl9SR
	nUndQ00Zufik2hZo0CZuQt5FOn1R7i0Nuh+CYl2gHlikP00nz6BIJ4fRCNEzXcJt5xPj
	1rm5NrLd+G4pnNBeofm7DUuRBx++0sFw23xj8A0L+S+VX1+0+dCB0uU1XBCr7VXoREIB
	2s42o/YMQLgOP8cW5lx68DwZvOEGv+Dzv6y5WzNTpHU7s67CkeaoYYjNfTSiXXIryx7W
	liWTgNGBBIWZMuNC7pcKNyctKbCLMVggT/iu/S6J4QgsrjgUncO4QBkRtb7osTBB5zJz
	gscA==
X-Received: by 10.68.91.3 with SMTP id ca3mr2513290pbb.20.1385517544544;
	Tue, 26 Nov 2013 17:59:04 -0800 (PST)
Received: from yiqingliang-pc.localnet ([49.65.161.88])
	by mx.google.com with ESMTPSA id ki1sm83863319pbd.1.2013.11.26.17.59.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Nov 2013 17:59:03 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 09:51:22 +0800
Message-ID: <72922584.TJuWgrnFYb@yiqingliang-pc>
User-Agent: KMail/4.11.3 (Linux/3.11.6-1-ARCH; KDE/4.11.3; x86_64; ; )
MIME-Version: 1.0
Subject: kernel and boost will recompile every time
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
X-List-Received-Date: Wed, 27 Nov 2013 01:59:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello.

	I know the kernel will recompile every time for recent update, and I 
found the boost will also do like that, even I have sstate cache in my own 
server.

	How to debug this problem?


-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com

