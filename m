Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T4EET-00026P-DJ
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 18:56:41 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 22 Aug 2012 09:44:35 -0700
Received: by obceq6 with SMTP id eq6so1395278obc.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 09:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=MhD643lR9IPrlChzu4X5sEd1nd3J4FKolzQHd+JdCZ8=;
	b=Z3I6XYjaYFsqfSnHhgu6xEVfNCNDVPdrGbPqi2edTEM75PPq7FyTU8NsAyGfhlNjOE
	ondzWkSrjy8+CYi2iezaKoQt1sPMGHic2BrnHGpSPW3iAfFpbJ9cBqRS5dIcYN5XQCfx
	ePZAkhMxWGqh/8ixlgPAP9QTh+dHSAA7W8/GB7/TAEiOC/HZYfDf8AvIh1OjsP1Wi0B5
	oJX1HT30W2/ju8xnsOSgdDgmVD7crWP93p+cdBhRDhUtre5KRZsnpAgzCtRg8EBhMxpm
	QQAx7vGpHRRFMy/BTvyqtoR71Uj7BawJkw2R+y24ZlkJFfi7C0pmCvWKrIirWEbpBz40
	+JVQ==
Received: by 10.182.108.71 with SMTP id hi7mr16725553obb.21.1345653874853;
	Wed, 22 Aug 2012 09:44:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Wed, 22 Aug 2012 09:44:14 -0700 (PDT)
In-Reply-To: <1345653628.3907.124.camel@ted>
References: <1345650627-3232-1-git-send-email-paul.eggleton@linux.intel.com>
	<1840245.41xHr4Jb3c@helios>
	<F1032BDA-250C-4EB3-94F5-5FB12A9FE6FB@dominion.thruhere.net>
	<1345653628.3907.124.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Aug 2012 17:44:14 +0100
Message-ID: <CAJTo0Las+a6gpTqgu3221qaeyO4B7BuLRDzFrSJNgN1WD48Rig@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQkc2Myw2KNfyPus50La/a9TzA1c+YHG0SyCcNjaekn8gR1Y8/gMNDBSMBq+J1/JQh4gQoqs
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
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
X-List-Received-Date: Wed, 22 Aug 2012 16:56:41 -0000
Content-Type: text/plain; charset=UTF-8

> I'm not sure that is enough to warrant it staying in OE-Core. meta-oe
> might be a better fit? Can avahi be cut down for "tiny" usage though
> configuration?

Agreed.

I don't think Avahi can be cut down enough, zerconf only supports
exposing the machine name which is a pretty tiny subset of mDNS in
total.

ross


