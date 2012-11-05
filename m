Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TVKCq-0000TQ-CO
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Nov 2012 11:47:00 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 05 Nov 2012 02:32:43 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so17884444oag.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2012 02:33:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=QcZI+qX3MNsRG7KYj/LfTICvl/WRtgjcoWSeR838O3A=;
	b=ezhSI9PnnhF6oEYuv590mhx2g/6vVsyNVNlcznfJwCh3g1LxVsmDpTn8AwOp2ujLtH
	2IJrhPZHpi3syxf+/FeI10RlAeECYlM5RSl9kDnpQYqp29E2jjdLqX3uBobr9fJabQp3
	xRcDM8by1DMf7MOgBpsX4ovNjrEdj8bqK3Z3qTELoV5+EdrYgFD0LpDf87Ur9Q3vOf2h
	a+RsmgpGF5mRvNeBXRKpHwSk9QICWXmO0t8CBd1O6AoQswNxm8xtFCGP2ivSIgMA64IQ
	GDXeYustAWjHovNf4YkbVSRVa7f/HUu0G7EhCi83e7QAOSHifgiEVnDM49zXpc5VXd/b
	Nwog==
Received: by 10.50.33.138 with SMTP id r10mr8959300igi.6.1352111595011;
	Mon, 05 Nov 2012 02:33:15 -0800 (PST)
Received: by 10.50.33.138 with SMTP id r10mr8959294igi.6.1352111594917; Mon,
	05 Nov 2012 02:33:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.58.197 with HTTP; Mon, 5 Nov 2012 02:32:54 -0800 (PST)
In-Reply-To: <105BDECCD49949F39D05D8FB1F044989@intel.com>
References: <20121102161855.814CC102E2@opal>
	<20121103195435.GE30165@jama.jama.net>
	<105BDECCD49949F39D05D8FB1F044989@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Nov 2012 10:32:54 +0000
Message-ID: <CAJTo0LZJr57=Y0GVtJmvQz8bzVhM4zJqsqFfbdsnB5_PQRwxGw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQm5UdcrdHpaZkRMoI1y/BhBHMByvyKsrHxDEd7zWHfRpemsTbndNpGi87SjrI3XajZG7JnK3r07eyN7V19vQsH9oyBRrA9Sc7qJzAs3j/0YI9CSeK0c1DdbLp+ivgT8agNY/vqgK5DU0R+8/WBFPy1VNPKtr5KFRByhxguayYDyDladj1mNdp5VlxwTdlKiJaHETmo5
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Daniel Stone : mesa: Build separate GLU library
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
X-List-Received-Date: Mon, 05 Nov 2012 10:47:00 -0000
Content-Type: text/plain; charset=UTF-8

On 3 November 2012 20:04, Ross Burton <ross.burton@intel.com> wrote:
> Missing dependency, easily sorted (on Monday).

Untested but hopefully obvious patch just sent.

I'll point out that Qt depends on virtual/libgl and libglu even when
it's not building GL (as controlled by distro features), but I'll
leave that for someone who cares about Qt to fix.

Ross


