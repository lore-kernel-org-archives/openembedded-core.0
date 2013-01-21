Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxGTu-0005h8-I6
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 13:28:27 +0100
Received: from mail-qa0-f72.google.com ([209.85.216.72])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 04:12:36 -0800
Received: by mail-qa0-f72.google.com with SMTP id d13so11857858qak.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 04:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=FKQVIEjONi7pIcZM3F2/DSXEKwPJW4gO8fNOsza7a+Q=;
	b=KZYvBuJ4mfSOXXoMigBpysDvNhvFqVb+w4lKHpwrtKSX+WHQTs4+Re7Apx6gh6pChv
	UCKIKA9asOIR5WqCGkRteNXEA6g4XoXl6ZTl3Y6A0J4cmYX7X12ARZvz/b5frAdcvyR5
	r4DuLnZW2iL3wytwsVecjsSbcB96HRRxMpqHakuyIBfvTMudkLOaFWhAt/5G9mTEUyOj
	46B2P74+XwRJtmH4UD6n61Qxr7rGoaBXph0rwwo3p9QsWg4NJ4iuwQ6Ezn7pyCTxHcQA
	xCDRwHVnwvVdkPMg+yC86PViN8zCdbgitixsvJyA6EMA4XjPNvDIEziz3Fwoyv5x4Q1z
	KZ+g==
X-Received: by 10.220.240.141 with SMTP id la13mr18927722vcb.39.1358770354686; 
	Mon, 21 Jan 2013 04:12:34 -0800 (PST)
X-Received: by 10.220.240.141 with SMTP id la13mr18927717vcb.39.1358770354627; 
	Mon, 21 Jan 2013 04:12:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Mon, 21 Jan 2013 04:12:14 -0800 (PST)
In-Reply-To: <1358739008.2945.29.camel@jethro.cheepee.homedns.org>
References: <cover.1358635193.git.ross.burton@intel.com>
	<1358739008.2945.29.camel@jethro.cheepee.homedns.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Jan 2013 12:12:14 +0000
Message-ID: <CAJTo0LarPUYHTJBWqi3ze3=aN5+HvizyVvw3V-V+YmxtS4786g@mail.gmail.com>
To: Ciprian Ciubotariu <cheepeero@gmx.net>
X-Gm-Message-State: ALoCoQlvJDhdcGQMgjyQ+3nCIPLAkXR4c4rHzf34R4VzBidZbp3Y2CRSVtZULLAOKPvi7QvwEtw0yKQEbVCZfHl1Hb3DnxmJTHcCglUfc0+Uy2us5vOkFRx7K9vACYAWiOnDOJtiDAXkwJA291Au9QVJkyToF6mluLON9jWquRIMsku5l1rajoqOW0daMs1BDLxpSzukfRHj
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Initial systemd integration
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
X-List-Received-Date: Mon, 21 Jan 2013 12:28:28 -0000
Content-Type: text/plain; charset=UTF-8

On 21 January 2013 03:30, Ciprian Ciubotariu <cheepeero@gmx.net> wrote:
> However, with oe-core/meta providing a default embedded policy, higher
> layers need to remove sysvinit or systemd stuff from base recipes, which is
> against bitbake's additive language design (only append/prepend functions,
> no -= operator) and against separating concerns.

If you don't do a systemd build, you won't get any of the systemd
files.  Ditto, sysvinit (well, that's the goal - as it was an
assumption until now that needs work still).

An oe-core without *any* init system will be very cumbersome - every
service will need a bbappend to actually work, with the subsequent
maintenance costs.

Ross


