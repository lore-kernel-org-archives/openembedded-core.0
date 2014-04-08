Return-Path: <fathi.boudra@linaro.org>
Received: from mail-bk0-f50.google.com (mail-bk0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8249F65D57
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 14:00:42 +0000 (UTC)
Received: by mail-bk0-f50.google.com with SMTP id w10so326017bkz.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Apr 2014 07:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uc43x1F6IovbEDREj7IFv94oiCOKbnGa+oqKTCEXp1g=;
	b=B/BFfIUHkx5dOqYUZTrfr2cLWnwDbGeytRHXkLd+eWjz6DgPYhzIr6lp0EhaM3PRx8
	T7l511I7KCOgKp3g9bV6BYbjao8phySTRFPVrEtYLtplwtf53z/jb4Uv7082KbHs2NWH
	xRrwm2pKYcG3EeNrwyaSwSUcLsXeP4Tsa0PmT7iytSsBso+DvrrDb77NZxNz4gqh7GLD
	eaOPu3YVdFzJ+ZjOxHFAZMdpHVsZ7EjYA3Xdjp2PnS7QAYaCu8HiCP11Ybu1sSW/cERK
	Z8E3ce/QDu6SSzMeLGVaL+wu+mVYhrYAvPCFNKY4pA/Hwa63idvsruKaCqNsxoFUeqi4
	ExRA==
X-Gm-Message-State: ALoCoQk4mwfSTA8XpX1JCzKsTWYNTV7u6n9Mse5AsVSK0wdrrzoQu78aft8wPv+oLVGuxDWSDr/Q
X-Received: by 10.112.147.36 with SMTP id th4mr2872018lbb.32.1396965642706;
	Tue, 08 Apr 2014 07:00:42 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194]) by mx.google.com with ESMTPSA id
	eo12sm1756149lbb.13.2014.04.08.07.00.41 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Apr 2014 07:00:41 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Apr 2014 17:00:35 +0300
Message-Id: <1396965637-4802-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCHv2 0/2] trace-cmd/kernelshark: update to 2.3.2 release
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
X-List-Received-Date: Tue, 08 Apr 2014 14:00:46 -0000

This patchset updates trace-cmd and kernelshark to latest stable branch release

Fathi Boudra (2):
  trace-cmd/kernelshark: update to 2.3.2 release (latest stable branch)
  trace-cmd/kernelshark: oe-stylize recipes

 .../{kernelshark_1.2.bb => kernelshark_2.3.2.bb}   | 30 +++----
 .../trace-cmd/trace-cmd/addldflags.patch           | 51 ------------
 .../trace-cmd/blktrace-api-compatibility.patch     | 29 -------
 .../trace-cmd/trace-cmd/make-docs-optional.patch   | 36 --------
 ...dd-checks-for-invalid-pointers-to-fix-seg.patch | 61 --------------
 ...o-not-call-stop_threads-if-doing-latency-.patch | 38 ---------
 ...etting-plugin-to-nop-clears-data-before-i.patch | 96 ----------------------
 .../{trace-cmd_1.2.bb => trace-cmd_2.3.2.bb}       | 26 ++----
 8 files changed, 19 insertions(+), 348 deletions(-)
 rename meta/recipes-kernel/trace-cmd/{kernelshark_1.2.bb => kernelshark_2.3.2.bb} (48%)
 delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
 delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch
 delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch
 delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
 delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
 delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
 rename meta/recipes-kernel/trace-cmd/{trace-cmd_1.2.bb => trace-cmd_2.3.2.bb} (41%)

-- 
1.9.1


