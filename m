Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id DD42978555
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 20:09:16 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id k20so1384098wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 13:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=y+p6taXBjd3Tj4lg/1Qydmh+TrlghmnPws987wSZa98=;
	b=j7xnacgkUH2PWlczYmrLcngaa4fSNuo6y5KA6xhcFHEMlmrzas1XJQ31KdQP9S+IJ5
	xYXb+ilBslQuEYw1PEgtdoLF4+wLXWg/06Jm6aKIhJl4xG8Wg+fLwsrF/Esf3Bu5j2rV
	WBCT/ogMWV9eM3uAGn9wQMY7n9mAJzYziJiV3J9IxAmg6t12PmUVQInpoUYht/+QE+h1
	KsoKihIGSCzGJlNqMe5SpA/eUEPJQ/Do13YVab9dmvQpy6cJk7Ii7bM/kY6eJXaMeAi9
	7AGS9M/xbmuPu4lUrMxt7Cn9XV1P3jRGjMBp1+qoPaFAE7T3CDQ+JzFKZdugQUkMVqXf
	hljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=y+p6taXBjd3Tj4lg/1Qydmh+TrlghmnPws987wSZa98=;
	b=BkBDCJVALnQo50trAXx8BiYP6Vuo1SRhp1j3yYH4Eq75245s5ST3SGYUFvAuCtLlXS
	QzpKvV+HPrNs2pNlr+2x8dPxsWIRC2J7YnUXjhnw3P4NGrXGTDPDQAj53BFV3jdgcWcA
	sghaCDTRNjZkMNh6Lj/KGlReEZkiTKNdJRBvyLJlfZwhgEg2P1JezkRuj/MEZHVa5e0W
	BKQ2E4aeXUKEGeoopq0aRbcG2F8qqbugrednKRym6z1/gdAYTD95EXdVQmTQxkmHGREI
	5/Y2JRa7yhLhD28XwzkL7GmPU79bJdrbSIyiNmBguct2f3oOw2iSl5PXChLIl4YvuduX
	GT7w==
X-Gm-Message-State: AIVw111OznMys7O75f7e9nEhZHJss9HCHNIzKBYc1BbVY55yhY3B4FpV
	qu/BNpxRwq+cAB8KkdXdcA27eyQ0mcYt
X-Received: by 10.80.176.162 with SMTP id j31mr7826245edd.186.1501272557845;
	Fri, 28 Jul 2017 13:09:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Fri, 28 Jul 2017 13:08:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jul 2017 13:08:47 -0700
Message-ID: <CAMKF1sqWosmxhDABfXu59DvPHmxMNybw0_5qprvbo+jHDoN+GA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Cliff Brake <cbrake@bec-systems.com>
Subject: [Pyro] backport request
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
X-List-Received-Date: Fri, 28 Jul 2017 20:09:17 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Armin

Please consider

http://git.openembedded.org/openembedded-core/commit/?id=5d3df78367be0afbfe001b4fa776a98a82e6ce54

for your next pyro backport list.

Thanks
-Khem

