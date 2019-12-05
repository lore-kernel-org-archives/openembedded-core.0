Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 24AF77D19E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 13:11:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47TGLq6brtz40;
	Thu,  5 Dec 2019 14:11:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575551476;
	bh=6l+VAhjeo/rswGQ8rMzTSsF45LbtILT9yZ1GWpCz0EI=;
	h=Date:From:To:Cc:Subject:From;
	b=eQ3Afhq4ooDivv68LBjHStYnv4P6Ugjuq4B3c7QiSqv6GeIXt5wUoKHXr2XK2aLBT
	AHJQE9Y6oG9dMnmX8yEOvyOGw81hvPWwwDSiQ8xzEFR+mn6x5s7sFNoO5ycMJeuUSL
	ucX4ZPfN9kQYlTRDUWYB8dHkMrkV+gCR+f2M8GaPYUMfQDcsdTfbyhtd4HgJUtEVj3
	Mm6Ojhkpm468knF74/trZKtmA8raAjBiyfn6qRBKSPF6+mFx/5MHMNzzEyDJlbOull
	ArTfRIo4yPgvSzV4EgQS/VhjD/18qh+fCL8QShBvKnJ7F4U/fJjV24r3VLr8ya8HY0
	8n4+53/abmvYxZ58ZFMDxKqUqR11x+SDWEYsTHabSLpacGbkhU7lDDx8kIzo6BVf81
	emLPIbqZGCy/6Fu3Ad2WI6iLWKrnqcu07mPzTod4iV10aRSi4AeP9p97JpanXrZeT9
	UVgjrMhq9Dy4wOnZgyiKC8NGBQzv6gPJ8mb7EDeP+JmJIJkTy+XFDdmGOPRN8l4QV0
	4F3A6jnKT13nyqZkfqMr7Pzg01fRgAzfl6MRwdWHs9yHW7PZOWlEn5TB7mVq/6h/k4
	Q9bgC+vVccbaxKvaOsfHOach5q4twuyV1Kj3IBAZAUJvym0hdiyxEb2Nby2IqR6sFb
	JT9y+dSkp7pJ/U1ZrF6BX6jc=
Date: Thu, 5 Dec 2019 15:11:13 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191205131113.GB3151@localhost>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Is the CVE-2016-10739 fix in thud incomplete?
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
X-List-Received-Date: Thu, 05 Dec 2019 13:11:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

https://sourceware.org/bugzilla/show_bug.cgi?id=20018#c15

meta/recipes-core/glibc/glibc/CVE-2016-10739.patch seems to only contain 
the "resolv: Reformat inet_addr, inet_aton to GNU style" commit.

cu
Adrian

