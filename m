Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7281E6FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 07:56:04 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id w43so201901885wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Apr 2017 00:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sAvUCJXDHus8s2JyZW+w1qjX6GdE0iLduaRJrXVkHHc=;
	b=e9rIEUeZL/GgmG/7rSO5EugPBzk1erwYukLo2SMSMHj0nfhAfqRW645GbPLYrbhRzC
	6ZHC0qoCRRfXLBiZQd0mqztau49X0RXZz4qCNUoQA1Oa/VsM+MAOp5pcLSj4kiqmJxny
	yBfrK1GkTPZYclxmpzTpf+68yMYSljlg6PzO2aWFrs2DSOUyKFjyljfJQERITMUUgMKG
	QRnnpMHUt3lLIBIWIIJmJjwWEbHQC3DDzKI3X3JmyV+kG0iSCe7GK1Y7bUA0SRj+u+Xk
	rhPx9x2bNW+aGv+Rnqm8X+QLuvpQikIvkFVDSh3KD1v1IkDqY3e+l0aVQHs5RsLYbI3F
	1SEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sAvUCJXDHus8s2JyZW+w1qjX6GdE0iLduaRJrXVkHHc=;
	b=d8F64/tLiZzQbj6K6PuW0Vr+Q5dCc1EKut6pg+881HKX3SYGUD5yMTIQ7FclFW4C8m
	5Ft2FaWTJEe59Ev9AuGycDr6pof4ORCmfQYBg3HuhcbBd8XAcQYHBDZE8bPqBMYTAiMS
	qgJlfYc+B5WWpBNkB53HLwCQXzIYS2C/zVfDzAEyeccwhqwX77a6Gv07EtCqRtUuxNqI
	g3G/mp8dIvwf3ifw0/1Avft7J39f9w5H+Wv8LkfA88GXra3xwbS385+TqPDEzudeRCxJ
	ypzSLP5zpewmPbY0VIweo9jbs9xWMRK6fG8b8CfvtPEOR2nBxngAzop6Qm1pxWwbXzZi
	QS6g==
X-Gm-Message-State: AFeK/H3Sm4i4DeB2qeh+mbQ2tTqc5lJ12lcLjP2Iiynj2A0p92CUnlbHyw0FjSgt8Q7p+sIPFWMF3eGDkFdaCQ==
X-Received: by 10.223.160.168 with SMTP id m37mr19782138wrm.196.1491292563946; 
	Tue, 04 Apr 2017 00:56:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Tue, 4 Apr 2017 00:56:03 -0700 (PDT)
In-Reply-To: <15fc06fcec149b142965c862627800936401b469.1490705726.git.bruce.ashfield@windriver.com>
References: <cover.1490705726.git.bruce.ashfield@windriver.com>
	<15fc06fcec149b142965c862627800936401b469.1490705726.git.bruce.ashfield@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Apr 2017 09:56:03 +0200
Message-ID: <CA+chaQfi=8hN61YovW-qfwPuvYJJqsFNBujC2RPp_2Nyn-sAnA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] linux-yocto: drop 4.8 recipes
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
X-List-Received-Date: Tue, 04 Apr 2017 07:56:05 -0000
Content-Type: multipart/alternative; boundary=94eb2c082fd887c3a5054c529b37

--94eb2c082fd887c3a5054c529b37
Content-Type: text/plain; charset=UTF-8

What about updating preferred version, so that each build doesn't start
with this very nice output?

meta/conf/machine/include/x86-base.inc:PREFERRED_VERSION_linux-yocto ??=
"4.8%"
meta/conf/machine/qemuarm.conf:PREFERRED_VERSION_linux-yocto ??= "4.8%"

NOTE: Resolving any missing task queue dependencies
NOTE: preferred version 4.8% of linux-yocto not available (for item
virtual/kernel)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-raid456)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nfsd)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nf-log-ipv4)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-autofs4)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nf-nat)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-rtc-dev)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-loop)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-bnep)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-ip-tables)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-cdc-acm)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-iptable-filter)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-rtc-sysfs)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-gadgetfs)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nf-addrtype)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nf-conntrack)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nfs)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-hci-uart)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-g-file-storage)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-g-mass-storage)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-ieee80211-crypt)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-sha256-generic)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-ieee80211-crypt-tkip)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-michael-mic)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-fuse)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-x-tables)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-hwlat-detector)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nls-utf8)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-cdc-wdm)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-aes-generic)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-aufs)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-uinput)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-pxa27x_udc)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-tun)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-cryptomgr)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-aufs-native)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nf-log-common)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-ipt-masquerade)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-crc32c)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-hidp)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-raid1)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-arc4)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-raid10)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-zram)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-ieee80211-crypt-ccmp)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nf-log-ipv6)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-iptable-raw)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-ebtables)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-ecb)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-aoe)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-unix)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-snd-mixer-oss)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-snd-pcm-oss)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-sco)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-linear)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-iscsi-trgt)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-ipsec)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nf-tables)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-xts)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nf-conntrack-ipv6)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-base)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-rfcomm)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-hci-vhci)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-md5)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-ieee80211-crypt-wep)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-binfmt-misc)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nf-limit)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-cifs)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-cbc)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-crypto_algapi)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-softdog)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-l2cap)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-raid0)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-modules)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-bridge)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-g-ether)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-bluetooth)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nf-recent)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nf-conntrack-ipv4)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-aes)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nfc)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-libcrc32c)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-input)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-vmlinux)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nf-log)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-iptable-mangle)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-iptable-nat)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-rtc-proc)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-dm-crypt)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-g-serial)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-image-zimage)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-ipv6)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item
kernel-module-nf-defrag-ipv4)
NOTE: versions of linux-yocto available:
4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c
4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06
4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2
4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a


On Tue, Mar 28, 2017 at 2:58 PM, Bruce Ashfield <
bruce.ashfield@windriver.com> wrote:

> We have 4.1 (LTSI), 4.4 (LTS), 4.9 (LTS/LTSI) and 4.10 available in
> master. 4.8 is no longer required, so we drop the recipe to keep
> the version selection under control.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   | 38
> --------------------
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb | 25 -------------
>  meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 44
> -----------------------
>  3 files changed, 107 deletions(-)
>  delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
>  delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
>  delete mode 100644 meta/recipes-kernel/linux/linux-yocto_4.8.bb
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> deleted file mode 100644
> index f99f200598d3..000000000000
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -KBRANCH ?= "standard/preempt-rt/base"
> -
> -require recipes-kernel/linux/linux-yocto.inc
> -
> -# Skip processing of this recipe if it is not explicitly specified as the
> -# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
> -# to build multiple virtual/kernel providers, e.g. as dependency of
> -# core-image-rt-sdk, core-image-rt.
> -python () {
> -    if d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
> -        raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel
> to linux-yocto-rt to enable it")
> -}
> -
> -SRCREV_machine ?= "ffd0a071c2df55ecb2bb1f101465df93a81093b5"
> -SRCREV_meta ?= "ea8a679c9542ab214e4afebcbc82a929624daeb5"
> -
> -SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${
> KBRANCH};name=machine \
> -           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
> -
> -LINUX_VERSION ?= "4.8.18"
> -
> -PV = "${LINUX_VERSION}+git${SRCPV}"
> -
> -KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
> -
> -LINUX_KERNEL_TYPE = "preempt-rt"
> -
> -COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
> -
> -KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> -
> -# Functionality flags
> -KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc
> features/taskstats/taskstats.scc"
> -KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> -KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
> -KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> deleted file mode 100644
> index 18ef51788fd3..000000000000
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -KBRANCH ?= "standard/tiny/common-pc"
> -LINUX_KERNEL_TYPE = "tiny"
> -KCONFIG_MODE = "--allnoconfig"
> -
> -require recipes-kernel/linux/linux-yocto.inc
> -
> -LINUX_VERSION ?= "4.8.18"
> -
> -KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
> -
> -SRCREV_machine ?= "db2e91ce904f32347ccf739de969b4216cbcaf92"
> -SRCREV_meta ?= "ea8a679c9542ab214e4afebcbc82a929624daeb5"
> -
> -PV = "${LINUX_VERSION}+git${SRCPV}"
> -
> -SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${
> KBRANCH};name=machine \
> -           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
> -
> -COMPATIBLE_MACHINE = "(qemux86$)"
> -
> -# Functionality flags
> -KERNEL_FEATURES = ""
> -
> -KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> deleted file mode 100644
> index 4c89183a3512..000000000000
> --- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -KBRANCH ?= "standard/base"
> -
> -require recipes-kernel/linux/linux-yocto.inc
> -
> -# board specific branches
> -KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
> -KBRANCH_qemuarm64 ?= "standard/qemuarm64"
> -KBRANCH_qemumips ?= "standard/mti-malta32"
> -KBRANCH_qemuppc  ?= "standard/qemuppc"
> -KBRANCH_qemux86  ?= "standard/base"
> -KBRANCH_qemux86-64 ?= "standard/base"
> -KBRANCH_qemumips64 ?= "standard/mti-malta64"
> -
> -SRCREV_machine_qemuarm ?= "c0123490bb9b454a43c3573e2573b491e0c09701"
> -SRCREV_machine_qemuarm64 ?= "304f750aa5be0bf66f70720d68f16865d912ff9f"
> -SRCREV_machine_qemumips ?= "aa15b7a291ca18d08fd640932efad673f6b278c3"
> -SRCREV_machine_qemuppc ?= "d2c3ea488fe179898ae853cb9565cb7ac62291c6"
> -SRCREV_machine_qemux86 ?= "c50f695341260d4757af64d809390610aae213e1"
> -SRCREV_machine_qemux86-64 ?= "c50f695341260d4757af64d809390610aae213e1"
> -SRCREV_machine_qemumips64 ?= "40a880b0f21aa09f3b52d68969339d80f9cc10ad"
> -SRCREV_machine ?= "c50f695341260d4757af64d809390610aae213e1"
> -SRCREV_meta ?= "ea8a679c9542ab214e4afebcbc82a929624daeb5"
> -
> -SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=
> machine;branch=${KBRANCH}; \
> -           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
> -
> -LINUX_VERSION ?= "4.8.18"
> -
> -PV = "${LINUX_VERSION}+git${SRCPV}"
> -
> -KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
> -
> -KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> -
> -COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|
> qemuppc|qemumips|qemumips64|qemux86-64"
> -
> -# Functionality flags
> -KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> -KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> -KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
> -KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> -KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32",
> " cfg/x32.scc", "" ,d)}"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c082fd887c3a5054c529b37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What about updating preferred version, so that each build =
doesn&#39;t start with this very nice output?<div><br></div><div><div>meta/=
conf/machine/include/x86-base.inc:PREFERRED_VERSION_linux-yocto ??=3D &quot=
;4.8%&quot;</div><div>meta/conf/machine/qemuarm.conf:PREFERRED_VERSION_linu=
x-yocto ??=3D &quot;4.8%&quot;</div><div><br></div><div><pre class=3D"gmail=
-console-output" style=3D"box-sizing:border-box;white-space:pre-wrap;word-w=
rap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-si=
ze:14px">NOTE: Resolving any missing task queue dependencies
NOTE: preferred version 4.8% of linux-yocto not available (for item virtual=
/kernel)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-raid456)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nfsd)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nf-log-ipv4)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-autofs4)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nf-nat)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-rtc-dev)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-loop)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-bnep)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-ip-tables)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-cdc-acm)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-iptable-filter)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-rtc-sysfs)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-gadgetfs)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nf-addrtype)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nf-conntrack)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nfs)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-hci-uart)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-g-file-storage)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-g-mass-storage)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-ieee80211-crypt)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-sha256-generic)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-ieee80211-crypt-tkip)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-michael-mic)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-fuse)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-x-tables)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-hwlat-detector)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nls-utf8)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-cdc-wdm)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-aes-generic)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-aufs)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-uinput)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-pxa27x_udc)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-tun)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-cryptomgr)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-aufs-native)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nf-log-common)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-ipt-masquerade)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-crc32c)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-hidp)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-raid1)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-arc4)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-raid10)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-zram)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-ieee80211-crypt-ccmp)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nf-log-ipv6)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-iptable-raw)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-ebtables)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-ecb)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-aoe)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-unix)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-snd-mixer-oss)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-snd-pcm-oss)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-sco)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-linear)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-iscsi-trgt)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-ipsec)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nf-tables)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-xts)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nf-conntrack-ipv6)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
base)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-rfcomm)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-hci-vhci)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-md5)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-ieee80211-crypt-wep)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-binfmt-misc)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nf-limit)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-cifs)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-cbc)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-crypto_algapi)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-softdog)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-l2cap)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-raid0)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
modules)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-bridge)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-g-ether)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-bluetooth)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nf-recent)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nf-conntrack-ipv4)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-aes)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nfc)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-libcrc32c)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-input)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
vmlinux)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nf-log)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-iptable-mangle)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-iptable-nat)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-rtc-proc)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-dm-crypt)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-g-serial)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
image-zimage)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-ipv6)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-=
module-nf-defrag-ipv4)
NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c9=
5e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_=
01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a</pre></div></div></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Mar 28, 20=
17 at 2:58 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce=
.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">We have 4.1 (LTSI), 4.=
4 (LTS), 4.9 (LTS/LTSI) and 4.10 available in<br>
master. 4.8 is no longer required, so we drop the recipe to keep<br>
the version selection under control.<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windrive=
r.com">bruce.ashfield@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.8.bb</a>=C2=A0 =C2=
=A0| 38 --------------------<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.8.bb" =
rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-tiny_4.8.bb</a> | 25 =
-------------<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb" rel=
=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.8.bb</a>=C2=A0 =C2=A0 =
=C2=A0 | 44 -----------------------<br>
=C2=A03 files changed, 107 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-kernel/linux/<a href=3D"http://linux-=
yocto-rt_4.8.bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4=
.8.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-kernel/linux/<a href=3D"http://linux-=
yocto-tiny_4.8.bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-ti=
ny_4.8.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-kernel/linux/<a href=3D"http://linux-=
yocto_4.8.bb" rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.8.bb<=
/a><br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8=
.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.8.bb</a> b/=
meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.8.bb</a><br>
deleted file mode 100644<br>
index f99f200598d3..000000000000<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.8.bb</a><br>
+++ /dev/null<br>
@@ -1,38 +0,0 @@<br>
-KBRANCH ?=3D &quot;standard/preempt-rt/base&quot;<br>
-<br>
-require recipes-kernel/linux/linux-<wbr>yocto.inc<br>
-<br>
-# Skip processing of this recipe if it is not explicitly specified as the<=
br>
-# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying<br=
>
-# to build multiple virtual/kernel providers, e.g. as dependency of<br>
-# core-image-rt-sdk, core-image-rt.<br>
-python () {<br>
-=C2=A0 =C2=A0 if d.getVar(&quot;PREFERRED_PROVIDER_<wbr>virtual/kernel&quo=
t;) !=3D &quot;linux-yocto-rt&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;Set PREFERRED=
_PROVIDER_virtual/<wbr>kernel to linux-yocto-rt to enable it&quot;)<br>
-}<br>
-<br>
-SRCREV_machine ?=3D &quot;<wbr>ffd0a071c2df55ecb2bb1f101465df<wbr>93a81093=
b5&quot;<br>
-SRCREV_meta ?=3D &quot;<wbr>ea8a679c9542ab214e4afebcbc82a9<wbr>29624daeb5&=
quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-yocto=
-4.8.git;branch=3D${KBRANCH};name=3Dmachine" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/<wbr>linux-yocto-4.8.git;branch=3D${<wbr>KBRANC=
H};name=3Dmachine</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.8;=
destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoprojec=
t.org/<wbr>yocto-kernel-cache;type=3Dkmeta;<wbr>name=3Dmeta;branch=3Dyocto-=
4.8;<wbr>destsuffix=3D${KMETA}</a>&quot;<br>
-<br>
-LINUX_VERSION ?=3D &quot;4.8.18&quot;<br>
-<br>
-PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
-<br>
-KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
-<br>
-LINUX_KERNEL_TYPE =3D &quot;preempt-rt&quot;<br>
-<br>
-COMPATIBLE_MACHINE =3D &quot;(qemux86|qemux86-64|qemuarm|<wbr>qemuppc|qemu=
mips)&quot;<br>
-<br>
-KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<br>
-<br>
-# Functionality flags<br>
-KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilter.<wbr>scc fea=
tures/taskstats/taskstats.<wbr>scc&quot;<br>
-KERNEL_FEATURES_append =3D &quot; ${KERNEL_EXTRA_FEATURES}&quot;<br>
-KERNEL_FEATURES_append_<wbr>qemuall=3D&quot; cfg/virtio.scc&quot;<br>
-KERNEL_FEATURES_append_<wbr>qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kv=
m.scc&quot;<br>
-KERNEL_FEATURES_append_<wbr>qemux86-64=3D&quot; cfg/sound.scc&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4=
.8.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.8.bb</a=
> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.8.bb</a><br>
deleted file mode 100644<br>
index 18ef51788fd3..000000000000<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.8.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.8.bb</a><br>
+++ /dev/null<br>
@@ -1,25 +0,0 @@<br>
-KBRANCH ?=3D &quot;standard/tiny/common-pc&quot;<br>
-LINUX_KERNEL_TYPE =3D &quot;tiny&quot;<br>
-KCONFIG_MODE =3D &quot;--allnoconfig&quot;<br>
-<br>
-require recipes-kernel/linux/linux-<wbr>yocto.inc<br>
-<br>
-LINUX_VERSION ?=3D &quot;4.8.18&quot;<br>
-<br>
-KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
-<br>
-SRCREV_machine ?=3D &quot;<wbr>db2e91ce904f32347ccf739de969b4<wbr>216cbcaf=
92&quot;<br>
-SRCREV_meta ?=3D &quot;<wbr>ea8a679c9542ab214e4afebcbc82a9<wbr>29624daeb5&=
quot;<br>
-<br>
-PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-yocto=
-4.8.git;branch=3D${KBRANCH};name=3Dmachine" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/<wbr>linux-yocto-4.8.git;branch=3D${<wbr>KBRANC=
H};name=3Dmachine</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.8;=
destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoprojec=
t.org/<wbr>yocto-kernel-cache;type=3Dkmeta;<wbr>name=3Dmeta;branch=3Dyocto-=
4.8;<wbr>destsuffix=3D${KMETA}</a>&quot;<br>
-<br>
-COMPATIBLE_MACHINE =3D &quot;(qemux86$)&quot;<br>
-<br>
-# Functionality flags<br>
-KERNEL_FEATURES =3D &quot;&quot;<br>
-<br>
-KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb=
" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.8.bb</a> b/meta/r=
ecipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb" rel=3D"noreferrer=
" target=3D"_blank">li<wbr>nux-yocto_4.8.bb</a><br>
deleted file mode 100644<br>
index 4c89183a3512..000000000000<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.8.bb</a><br>
+++ /dev/null<br>
@@ -1,44 +0,0 @@<br>
-KBRANCH ?=3D &quot;standard/base&quot;<br>
-<br>
-require recipes-kernel/linux/linux-<wbr>yocto.inc<br>
-<br>
-# board specific branches<br>
-KBRANCH_qemuarm=C2=A0 ?=3D &quot;standard/arm-versatile-<wbr>926ejs&quot;<=
br>
-KBRANCH_qemuarm64 ?=3D &quot;standard/qemuarm64&quot;<br>
-KBRANCH_qemumips ?=3D &quot;standard/mti-malta32&quot;<br>
-KBRANCH_qemuppc=C2=A0 ?=3D &quot;standard/qemuppc&quot;<br>
-KBRANCH_qemux86=C2=A0 ?=3D &quot;standard/base&quot;<br>
-KBRANCH_qemux86-64 ?=3D &quot;standard/base&quot;<br>
-KBRANCH_qemumips64 ?=3D &quot;standard/mti-malta64&quot;<br>
-<br>
-SRCREV_machine_qemuarm ?=3D &quot;<wbr>c0123490bb9b454a43c3573e2573b4<wbr>=
91e0c09701&quot;<br>
-SRCREV_machine_qemuarm64 ?=3D &quot;<wbr>304f750aa5be0bf66f70720d68f168<wb=
r>65d912ff9f&quot;<br>
-SRCREV_machine_qemumips ?=3D &quot;<wbr>aa15b7a291ca18d08fd640932efad6<wbr=
>73f6b278c3&quot;<br>
-SRCREV_machine_qemuppc ?=3D &quot;<wbr>d2c3ea488fe179898ae853cb9565cb<wbr>=
7ac62291c6&quot;<br>
-SRCREV_machine_qemux86 ?=3D &quot;<wbr>c50f695341260d4757af64d8093906<wbr>=
10aae213e1&quot;<br>
-SRCREV_machine_qemux86-64 ?=3D &quot;<wbr>c50f695341260d4757af64d8093906<w=
br>10aae213e1&quot;<br>
-SRCREV_machine_qemumips64 ?=3D &quot;<wbr>40a880b0f21aa09f3b52d68969339d<w=
br>80f9cc10ad&quot;<br>
-SRCREV_machine ?=3D &quot;<wbr>c50f695341260d4757af64d8093906<wbr>10aae213=
e1&quot;<br>
-SRCREV_meta ?=3D &quot;<wbr>ea8a679c9542ab214e4afebcbc82a9<wbr>29624daeb5&=
quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-yocto=
-4.8.git;name=3Dmachine;branch=3D${KBRANCH}" rel=3D"noreferrer" target=3D"_=
blank">git.yoctoproject.org/<wbr>linux-yocto-4.8.git;name=3D<wbr>machine;br=
anch=3D${KBRANCH}</a>; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.8;=
destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoprojec=
t.org/<wbr>yocto-kernel-cache;type=3Dkmeta;<wbr>name=3Dmeta;branch=3Dyocto-=
4.8;<wbr>destsuffix=3D${KMETA}</a>&quot;<br>
-<br>
-LINUX_VERSION ?=3D &quot;4.8.18&quot;<br>
-<br>
-PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
-<br>
-KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
-<br>
-KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<br>
-<br>
-COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemux86|<wbr>qemuppc|qemumi=
ps|qemumips64|<wbr>qemux86-64&quot;<br>
-<br>
-# Functionality flags<br>
-KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilter.<wbr>scc&quo=
t;<br>
-KERNEL_FEATURES_append =3D &quot; ${KERNEL_EXTRA_FEATURES}&quot;<br>
-KERNEL_FEATURES_append_<wbr>qemuall=3D&quot; cfg/virtio.scc&quot;<br>
-KERNEL_FEATURES_append_<wbr>qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kv=
m.scc&quot;<br>
-KERNEL_FEATURES_append_<wbr>qemux86-64=3D&quot; cfg/sound.scc cfg/paravirt=
_kvm.scc&quot;<br>
-KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&quot;TUNE_<wbr>FEA=
TURES&quot;, &quot;mx32&quot;, &quot; cfg/x32.scc&quot;, &quot;&quot; ,d)}&=
quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.5.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c082fd887c3a5054c529b37--
