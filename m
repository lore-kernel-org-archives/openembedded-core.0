Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5C61-0004MR-SN
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 10:24:24 +0100
Received: by mail-wi0-f169.google.com with SMTP id l13so4277623wie.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 01:08:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:date:from:to:cc:message-id:in-reply-to:references
	:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=qALEGqQOZu1KYttwynv9JH6azz2rk5PGG0o7Xtg98tw=;
	b=AB+9XsgjXO210SB7GNe7TM0lGv52y+BqFoB+o56mFQU6QBF3oikFzlhE5W1IgJdjR4
	LYvPdYY6Nttwpa8WN94FdhhnnTJBoIknOuCMX4m0lB4vcz2Cbz1unDAw2CWJpPWa05yS
	arGeOuQL4NYzfO2n5QJiNPH2eYNufatgaK1GmldWtx2jhsHqHd/yCPfr3ujVYZklqR8F
	BfUrnFjYplDlIAI8siiBq1eHgmcGD8Y68S2LslIQf4gLgM+TW+NgVLle+YVjGCYd6zx7
	HKQmWeE3KnZE+V7CGOpgTxl3WO7UqDRpHMw2c3cLwYPRlkFtrHA9qI7PjQESvfKmRb0H
	k0og==
X-Received: by 10.194.76.7 with SMTP id g7mr29451280wjw.50.1360660094620;
	Tue, 12 Feb 2013 01:08:14 -0800 (PST)
Received: from [192.168.1.11] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ex15sm23182190wid.5.2013.02.12.01.08.11
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 01:08:13 -0800 (PST)
Date: Tue, 12 Feb 2013 09:08:09 +0000
From: Ross Burton <ross.burton@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <C7C45274F728429FA76E2C1C47BACCDC@intel.com>
In-Reply-To: <1360657337-7154-1-git-send-email-raj.khem@gmail.com>
References: <1360657337-7154-1-git-send-email-raj.khem@gmail.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmmPeM5RbWo3pxQWBn1wnUlS43KWCUOPHKBcWsb6Iju0rzKGfqcNJPahEbSkyKv3mjS61fb
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Add systemd package to PACKAGE var
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
X-List-Received-Date: Tue, 12 Feb 2013 09:24:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday, 12 February 2013 at 08:22, Khem Raj wrote:
> If someone defines SYSTEMD_PACKAGES to be different
> then ${PN} then we need to make sure that they get
> added to PACKAGES variable

The only case it won't already be in PACKAGES is if you're creating a package which contains just the service file, which as I've said before isn't recommended - package the service files along with the binaries that they are executing.

Or is there another use-case I'm missing?

Ross


