Return-Path: <matt@madison.systems>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 832AF724DC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 12:32:18 +0000 (UTC)
Received: by patj18 with SMTP id j18so51062477pat.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Apr 2015 05:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:content-type
	:mime-version:content-transfer-encoding;
	bh=/OkJcuTBPtGAO/6c76lGIVuWscudu2FY9rrzLxPf3tE=;
	b=cAm4Pan17ou92LIDoEHUgGwwlvoE+GPVJd4XkUcZmZ/QLF8CQfJgm/altp+cIrMrNa
	gBQ59E0xMmhiaJfChL3LsSdosEny5+PJQsUTBicyqqGPrbIFly90YXBqEvJx1v6SH12d
	w3Wj7QuQE5RXOTlorBXoRWvuosFg6VcGIt+Ahjz16R+g9VyxeJIPuWATVPafpn1MnM3U
	gLGK5rfNMA8IKH8PdJYB+K7/ePiqbWXa1FvmqCKfsrbmPP6luoxLWUqbCGb/XKaESe6m
	m2VdJTcUb3V0RxNsxpDzmuyxORmVoDc6WejCBYl8TTpafvBCiqMtvPZTuTMRzn0gLbbN
	Vo0g==
X-Gm-Message-State: ALoCoQlZl6SkVyGErfcI3jY9Y3QW2xgg9esWzPxF9w1cgtFa2vkeqaecTK65ZYgcBi1IuMmVBPot
X-Received: by 10.70.7.193 with SMTP id l1mr35617380pda.106.1427891539796;
	Wed, 01 Apr 2015 05:32:19 -0700 (PDT)
Received: from [172.16.1.18]
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93])
	by mx.google.com with ESMTPSA id l2sm2036222pbq.30.2015.04.01.05.32.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Apr 2015 05:32:19 -0700 (PDT)
Message-ID: <1427891538.4690.5.camel@workhorse.madison.systems>
From: Matt Madison <matt@madison.systems>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 01 Apr 2015 05:32:18 -0700
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: busybox issue in latest dizzy
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
X-List-Received-Date: Wed, 01 Apr 2015 12:32:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I updated to the latest on dizzy and ran into an issue with busybox's
modutils commands failing, complaining about "no gzip/bzip2/xz magic".
I've tracked it down to this patch committed (cd20b3c) on the 21st:

busybox: libarchive: open_zipped() does not need to check extensions
Backport from busybox 1_22_stable branch:

I found a thread about this issue on the busybox mailing list archive,
and applied the patch in this message

http://lists.busybox.net/pipermail/busybox/2014-January/080389.html

which appears to have fixed the issue.  I can submit the patch, if this
isn't already being worked on.

Thanks,
-Matt


