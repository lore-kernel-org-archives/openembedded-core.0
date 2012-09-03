Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T8XI5-0006YL-Lv
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 16:06:13 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 03 Sep 2012 06:53:47 -0700
Received: by obblz20 with SMTP id lz20so9290631obb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2012 06:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=y/GR6cgdSsAvUoC8gxVB9TkByGxOiK+XZZW4NY5SK7Y=;
	b=ZFYJ6uEROSxklm3D3VYiEayVhCRYvNWEGHDejvNBhVnUsDISs5zZeZoc4Aeqt2CRiQ
	dmtvyB4XQtJcMx0C1ZjultmWjVI/cH1cVWwvEc3e0bArSrnx55JPgZgDsV8MsqOF6SGJ
	woLgYRUQq4LqhOhWzr1w/6bKXXaKE1KrJ4dI/Dw2Xco/kHUIOLY1HA1nSpA5eeOkGNJD
	thDRklmDntA8i6NEj4xJzInS1pju0FKTfC2vUiF3PSPnqVSg2eV4ZXioQvdq/PXBdf6i
	LOi39NcVgiBVeO7yBUr5+BlFcGt4lrWrXRlcLpuNlxAAPAwZbx8raa/AqNB0HeFqM28K
	EUBQ==
Received: by 10.60.29.72 with SMTP id i8mr13775404oeh.26.1346680431166; Mon,
	03 Sep 2012 06:53:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Mon, 3 Sep 2012 06:53:30 -0700 (PDT)
In-Reply-To: <8068324.QSSVEOGDPm@helios>
References: <1345650627-3232-1-git-send-email-paul.eggleton@linux.intel.com>
	<1345653628.3907.124.camel@ted>
	<CAJTo0Las+a6gpTqgu3221qaeyO4B7BuLRDzFrSJNgN1WD48Rig@mail.gmail.com>
	<8068324.QSSVEOGDPm@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Sep 2012 14:53:30 +0100
Message-ID: <CAJTo0Lbn5ow1yMDj5X-c77CxNDNQJri4cWH_WdBEU3guWJdfrg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQnpY9SCs20GoCPSyjkPBBg62x6Tmq2evyJGfBIYqDlO/6vD+wTX9lyqK1tNdLzQ/L5oOPdg
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] zeroconf: remove - RFC
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
X-List-Received-Date: Mon, 03 Sep 2012 14:06:13 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2012 14:47, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> So, where does that leave us with this patch then?

I'd say merge it, if anyone really needs a tiny mDNS responder they
can dig it out.

Ross


