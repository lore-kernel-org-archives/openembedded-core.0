Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5A3176B438
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 00:37:49 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id ey11so2451311pad.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 17:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=N3j99s38tF74RnFlqtV31haH1D12OmOcjPfeCzNqrAg=;
	b=UW6LcCXRKwN1lyi/Ld9i4b4RDgPyHWCLrtkoqsyuiqW34TNbZ/z3hWDXd0uxQkNIyh
	My5BBVRu0IhV9a2pbOSQtxf774m9CV53bX0qvdUvalxx2chFGe1cJtw0b+clPHrccHNe
	4RfnBTeydr80EuOGl8LHVWxWo//k9ThwQPiWumRrVfycig51i5QejKgcEShNkUc7Sd/J
	SpjFch7b3R0PPDHsYNxcIwkMBdpVy3rjQ4Yyc7m2ciLzW802LPeIS9kTT+9YIAiqc7Bl
	MX7GxYEyr8HxPfGzXeSAENzfEUWAgvcc8OgvdT9VLC6kajCCNSxl20YyN8juDrNrVAnt
	gTBg==
X-Received: by 10.66.102.102 with SMTP id fn6mr32984pab.6.1403224670639;
	Thu, 19 Jun 2014 17:37:50 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([180.109.86.141])
	by mx.google.com with ESMTPSA id
	dd5sm10487332pbc.85.2014.06.19.17.37.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Jun 2014 17:37:49 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jun 2014 08:35:12 +0800
Message-ID: <12874293.qmlQjDjeXe@yiqingliang-pc>
User-Agent: KMail/4.13.1 (Linux/3.14.5-1-ARCH; KDE/4.13.1; x86_64; ; )
MIME-Version: 1.0
Subject: eglib is dead?
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
X-List-Received-Date: Fri, 20 Jun 2014 00:37:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello,

	this morning I have seen that:
http://www.phoronix.com/scan.php?page=news_item&px=MTcyNDY

	it said that the "eglibc" is a "dead project", and most feature had 
been merged into "glibc" at version 2.19.

	so maybe we should drop "eglibc", and switch back to "glibc"?

Yi Qingliang
20140620

