Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6lhm-0002Ls-LK
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 19:05:26 +0200
Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 09:53:09 -0700
Received: by wibhq4 with SMTP id hq4so5511008wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 09:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=pbxT+lDYGdw2Mm6dZjUpySZucwefm0SB01euiHAJ2YU=;
	b=o/XrahW6MjhAlH1pJW/A4FFUq5J4bpXCAItC0VpHN1yn2lcOPXwr+TMas2edyfWY0r
	OrIW1x8acESSf+7BWvhoW/anPUp7FTkve652kliCYeM+s8KTWi7Ow/esalYqyb2ud2C0
	+vdO5fszu/4S/SE22JOmZ7xec0z5nCV2fxZ9Ur0JFCd6hkhA3CfPKkmzKDdLwRR3aN/z
	7Phbr1KFXrunp1yVSX5FQgWBCAlkJdycvFCvQCoDSsvQz47s/k5UvroF62Ws0UPsi7bx
	KxgnmhjmYZP+YyHpMHTBafxxZP5P/g/RLc9+lrORbTKfTRr2hzP3zghrXSQXYeo09oEE
	QW6g==
Received: by 10.216.197.162 with SMTP id t34mr1389178wen.5.1346259189562;
	Wed, 29 Aug 2012 09:53:09 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id w7sm11061190wiz.0.2012.08.29.09.53.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 09:53:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2012 17:52:25 +0100
Message-Id: <1346259146-14016-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmfMxBV14q88U12DeQsBwYW1FNtN1t6HM+++r2P1789y7PL7j/Uui9qE/+sH57+fzRfonDa
Subject: [RFC] [PATCH] xserver-kdrive: remove.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 17:05:26 -0000

Hi,

This is the interesting bit of an in-progress branch to purge kdrive from
oe-core.  The commit message for some context:

    xserver-kdrive: remove.
    
    kdrive is effectively unmaintained upstream (it's only kept for Xephyr).
    
    Apart from two headless machines in meta-yocto (patches sent), every BSP I
    looked at (oe-core, meta-intel, meta-oe, meta-ti, meta-smartphone) is using the
    traditional X.org X server.  Changing kdrive to Xorg means an extra ~200kb of
    disk usage but extra features and more importantly continued maintenance.

I hope to finish the branch tomorrow and send it for review.

Ross


