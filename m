Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5087E608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 11:12:39 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id m1so2916484ves.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 04:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4MmFGTrVt32sWiRD+oYIdwSPCU4RONmZrhvFASR1raI=;
	b=B2voBn6o9BJsHRKWKSsW6uu6lt1I3dc3E7hgUUVLnhp8yPEqoW6GGeg6i4z1g9kTIK
	QlrA3hz94qliqyiOBWBv259PbrI4HFYrFQsMsW6ZvYLJ+/qrP9l81fBShxIhlCa4rpKi
	Ntu+XmK1tzVBWR4ETlO2vQqu3K79ynBaIrPJRiyKJb3A4lRDnHY9B2QkZhtO6/MqFj/9
	fNkhGcBS6F+302h9MU8ziruqEqQyoLpEffiP+1U6Py4UeXzPkB/GegaFmaEQHgl+cvqp
	p7fDCGepuKz5mWKQP5b+z3KN2lND08SusibXoju9kBMxzLYLXwsLRV0TXDkBKaNtnCqH
	Vuiw==
X-Gm-Message-State: ALoCoQlQ5nsvhgSa+eRxLe48a18pOd4jm+/XP0bRstsEsxm2DP9JM1rr/HTXabsp8XOOXcqzXy5n
X-Received: by 10.220.75.73 with SMTP id x9mr3687010vcj.38.1375960359615; Thu,
	08 Aug 2013 04:12:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 8 Aug 2013 04:12:19 -0700 (PDT)
In-Reply-To: <52037BBF.1030600@windriver.com>
References: <cover.1375952210.git.hongxu.jia@windriver.com>
	<9facc9593dc27237a07ebd620b9d7c9d9541f20a.1375952210.git.hongxu.jia@windriver.com>
	<CAJTo0LZgSV7RRPE6qjNp9fkRD9abiWoW6teRdYq2zBXEWdcmew@mail.gmail.com>
	<52037BBF.1030600@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Aug 2013 12:12:19 +0100
Message-ID: <CAJTo0LbxpTyZCn7wCmynEPT9n5o=iSbZcn7HMooe=mewV_fE3w@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libdbm-sqlite-perl: add version 1.40
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
X-List-Received-Date: Thu, 08 Aug 2013 11:12:40 -0000
Content-Type: text/plain; charset=UTF-8

On 8 August 2013 12:06, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> It seems DBI is a commonly-used perl database support package,
> and work with multiple DBDs, the DBD::driver is based on actual
> database. We get sqlite in oe-core, so put them in oe-core.

There are many perl packages that are commonly-used but we don't put
them all into oe-core.  I'm really thinking that we need to start a
meta-perl for the majority of Perl libraries, apart from the ones that
are needed in oe-core.

Ross

