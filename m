Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id C8ED26FEA8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:32:03 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id l6so2125226qcy.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 13:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rvHkSHQDBu0R92h+yrCWERD7pZIqGR4qE9kkWJTUMZ4=;
	b=I6L7+EvHGd0tDai6vfvIpfuf9rjHud3fiXQKg2WiUzWR435tSF94CRDfxEWQZTDEnn
	SIQFVgUOZqVRL9HLUnMt/3zphUUhVD3ZSHKo7FK4JjmnV0fLwapVLNsSG1h5oDouQ7XN
	enUVi6/met7+YzhFg7lGFH0kVov60xBMa85O3oJzSnfVnvPlVmipW6cz8JxBR62nLBVw
	eAXTDcQxkKo4Efxn2uDi/Vriq0o6PHHJXJ5KJKUko0bjk99miE7wwrB7sCowd7EZeMBW
	EIk1s5/Kv5kLAQ1YSq2+3T4aA1ls2Q/FsYepPOzdtpWAd9jik5/V1WFoU4uverAxu5J3
	kIdg==
X-Gm-Message-State: ALoCoQmoKujND7xITt+U6/YAHKwBD3SzOa7/VeAn5pMAalv4faNUDOK3R6ZOUXv2XqSYCBg5MkAH
X-Received: by 10.229.231.68 with SMTP id jp4mr3244054qcb.4.1411504324271;
	Tue, 23 Sep 2014 13:32:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Tue, 23 Sep 2014 13:31:43 -0700 (PDT)
In-Reply-To: <20140923202717.GD2480@denix.org>
References: <1410909001-3284-1-git-send-email-denis@denix.org>
	<1410909001-3284-2-git-send-email-denis@denix.org>
	<20140923202717.GD2480@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Sep 2014 21:31:43 +0100
Message-ID: <CAJTo0LZv3xoTQ8kX4DXcBTRE5LMgtuWj_D6Kzg_tS5M7W0WuiQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] u-boot: update to version 2014.07
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
X-List-Received-Date: Tue, 23 Sep 2014 20:32:05 -0000
Content-Type: text/plain; charset=UTF-8

On 23 September 2014 21:27, Denys Dmytriyenko <denis@denix.org> wrote:
> Just to confirm - this patch was purposefully skipped in this merge cycle,
> right?

Yes.  Pending a good rationale for why to break the freeze for u-boot
it will wait for 1.8.

(poky-contrib:ross/unfreeze is where i'm staging patches that look
good for the 1.8 cycle)

Ross

