Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TIewf-0004Z6-La
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 14:17:57 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 01 Oct 2012 05:04:58 -0700
Received: by obceq6 with SMTP id eq6so5030935obc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Oct 2012 05:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=idZO9co+fuApEpG496g8qC04JklkTEZmXxO1iqxvcik=;
	b=ZnzaVqdd4hCEgVtHH/zVI76eaSzqVP8yUrBS1BTZB6ho7v7eDBKepCbDGgsliU5Yrx
	Dv2+Z2tSK0g42X2x0cHt/jAbIGRXVPK5dFEjhsvd5SEyNe0pIsdlStM0/Eiq205USPIN
	hbYSevXmsiqX8v74brT3zqjvjJ4Ron+/cKdMKWPYSZ4njGBG9QmIyzujmXAK0LmQtgHi
	/fIvyutqgLOUlhLVegMsquNqSO+Q87Fg2DIxqj6DCkG3jtrkNPUiDjsfFNBO/7UkXlPZ
	u10xn3vLs5CRZqL4Kkl7FyjfEJJt+j8w119ltyTWm0F10Bzg03YpQAlSRyRUCcbsRarQ
	onyA==
Received: by 10.60.19.195 with SMTP id h3mr11321971oee.102.1349093096403; Mon,
	01 Oct 2012 05:04:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Mon, 1 Oct 2012 05:04:36 -0700 (PDT)
In-Reply-To: <20121001120203.GC3454@jama.jama.net>
References: <1349092569-26895-1-git-send-email-ross.burton@intel.com>
	<20121001120203.GC3454@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Oct 2012 13:04:36 +0100
Message-ID: <CAJTo0LZogROfi=ShqZCCA+2mbOVm-iBS3NfSoLX=eC9CZEU2BQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQn4tN+ZNFslvwhZYQPmOWFpZi67cs/9Mzw8AQaaXf3cDK4KVSIwM2RoBg/yi+PNW4KyEOvL
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libdrm: Remove Cairo dependency
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
X-List-Received-Date: Mon, 01 Oct 2012 12:17:57 -0000
Content-Type: text/plain; charset=UTF-8

On 1 October 2012 13:02, Martin Jansa <martin.jansa@gmail.com> wrote:
> shouldn't we disable that example explicitly, so that the output is not
> different when cairo gets built before libdrm?

The test (tests/modetest/) is noinst, so the output doesn't actually change.

Ross


