Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id C87D161FB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 08:41:35 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id c10so4935258wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 01:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=6Slt6Thy9T7LFlgFJ9Qpa83p9VcQmsXK8HDlmHWuYMs=;
	b=AFjAK92J+MwmWfJhxEpkvM2lUJ9IrwL2L9g9xvXGDP8QBHfb/VX9J839gpqfkWuu9d
	9f947DoZ7w6qKgtiX+TsmlIJ1FeNWqFuIj7T0+KR0b3Ex/1/viUg56NB8s6xqJ/21cDz
	zqNW4AFknVnnL1tde8pcrP+leXfVEqP9EPyzAjq7AFUjKPkUyR3YKwB/TGd9zpyR/N5Z
	NNxcKuNuIUpVmG1F9rHWa+ux/23jE+83dB2Z8xhKwgnn/96euIKz6wtNsd3V9vqRBDSK
	Sj+cmvbllUg5sxnogpqsuUgNLehBaHc8W3qFCNt16TcVeyXxEBcw0A37iw4UFICAK7HG
	p8WA==
X-Received: by 10.194.84.205 with SMTP id b13mr22150226wjz.92.1372754496541;
	Tue, 02 Jul 2013 01:41:36 -0700 (PDT)
Received: from ?IPv6:2001:610:612::2914:ba26:88a1:fea3?
	([2001:610:612:0:2914:ba26:88a1:fea3])
	by mx.google.com with ESMTPSA id i1sm21370155wiz.6.2013.07.02.01.41.33
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 01:41:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <be17effcbc2076d384a7ac882cdae817e4cbf4e9.1372711267.git.sgw@linux.intel.com>
Date: Tue, 2 Jul 2013 10:41:32 +0200
Message-Id: <3ABD2994-6D45-4A08-B298-C455A0AC05E8@dominion.thruhere.net>
References: <cover.1372711267.git.sgw@linux.intel.com>
	<be17effcbc2076d384a7ac882cdae817e4cbf4e9.1372711267.git.sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
X-Gm-Message-State: ALoCoQlsDOHv2VHbuWyJ2YNL8klcu7DP3dOUk2/e9TjVjc6IjozPqGIzbJDpoJ+a/ihAJRbfPjru
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4 v2] udev: Add RRECOMMENDS for udev-cache to enable the cache
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
X-List-Received-Date: Tue, 02 Jul 2013 08:41:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jul. 2013, om 22:48 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> This will enable the udev cache for sysvinit systems, which does =
improve post-first
> boots.

Can I please get some numbers on that? I haven't used it for years since =
it actually slowed down boot when I started measuring it and besides =
that, it's flakey as hell.

regards,

Koen=

