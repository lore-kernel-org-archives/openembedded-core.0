Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1E47160269
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 12:34:13 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id d140so6423680wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 04:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:mime-version
	:content-transfer-encoding;
	bh=jcaD8mrx84Mz4qczb69gOdlch26CKWPAzhpmeNVBRCc=;
	b=Q8AUYTYC3oVlhSPg9poFkJcIHmkKJznSkjDvA0yY8Klvos13ryEZ0aa0wqWoQNvEDB
	NKHiEzM/dkRFbzxwIcv330sIH53CkXjgF6Q7d5HU9eJaQPQkTgb08BwEcpwfjm/6UqIH
	KydTd7EuX6yrPlpn74RTYvrhvK7EbkwaWRbjmwh39Vn2gNzQkcGbBjqdhQOsdxR8CIjn
	XDOWDXbNNEHfXfXj/jmNkTMwWzUyzjeabuTvm2n5wUiwpfhiP5wBzD3NZjwLBeT4oQUF
	PScJRmRDbsoVMcNUv+AHkFXd2mMBcM0ia5ivGMnbgW3lc36T99L/kzlt1erNE3gmyFfg
	5OWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:mime-version
	:content-transfer-encoding;
	bh=jcaD8mrx84Mz4qczb69gOdlch26CKWPAzhpmeNVBRCc=;
	b=N/MwsZqLwuL1XDcZjqGWIbpklGczunktG/G3lPg1d4u4qEllKPhaas1VKIfOoljGH5
	NAOQPkDCqgrm8P9z4UTAuI9lWn3F/cwsjhCdcj3kY1qhtbd1bgUc0Ufgd0AiFG0EYo6c
	FX41/OF0xWYq8pDn7CyFmRxDyjcxh83v50oyTG+Ij1R9cXC8TkfI9V8lCXho1k20v9B4
	5ttQM52p3RnlSPwDBxNSuq4D6pDGAk5+YACjPCo/ujsAmWrw+91KIYJQHzTjbKLYuxiM
	eHaaTJ35KCksEbgHaAvtgMjtJ5kLIkECft/26jCA8AbYGpikCFGGd2/GtQ/1LCxTkqam
	MGEA==
X-Gm-Message-State: AIkVDXLG83cfmgIh/bWclcpwTrq4SOLU2jWTZ8qH28gjM5jVs3/MGFTb8cSN8Zeh5tGniA==
X-Received: by 10.28.156.151 with SMTP id f145mr3458717wme.8.1484915653336;
	Fri, 20 Jan 2017 04:34:13 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	u78sm5834909wma.11.2017.01.20.04.34.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jan 2017 04:34:12 -0800 (PST)
Message-ID: <1484915651.4907.9.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org, Armin Kuster
	<akuster808@gmail.com>
Date: Fri, 20 Jan 2017 13:34:11 +0100
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: [morty] backport request: nspr: set correct version in pkg-config file
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
X-List-Received-Date: Fri, 20 Jan 2017 12:34:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

Can we backport the following commit to morty?
http://cgit.openembedded.org/openembedded-core/commit/?id=cb4f5ecf32006192baaf41218a3d7b43ca1c2951

It fixes pkgconfig to no longer report an old version.

Currently this breaks firefox in meta-browser morty branch.

Thanks
Max

