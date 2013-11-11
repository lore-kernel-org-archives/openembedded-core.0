Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id BE64E6D3D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 11:13:03 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hv10so3211655vcb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 03:13:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wwEsx1QlcdPBsJ1fCboBNvXy52L8gu24per70ut8V5A=;
	b=AO/nGDLorCpewvEaIWdrToMH/hrmV5rE32kUc7oi4DIC92D7EKN49SPBspOy0drOYf
	81MLUomBD8QkIgEbfcZLEqPJalmg0BM+va9xgKHkMA37YyWc1y+MCyApWsiJvKTGKsdM
	PO+kp1jFlyyBtZUfxIeieASP7fOZg6wMG163avry/7avrXCHEkmwLkm53ksf2Hehmc/G
	Gzwvz6gA861svvFkLnGNbHQN9RVWrPAd/QpCvbtXV4vBhLqYl5EoaVhV9sLCEp0QiLlY
	DCwJtUsR6wyTA10//LzYG3gZAcNGhTCXPz5LyYlWYIiwD1Bji1seuMpSmAkRHekMdwks
	p/WA==
X-Gm-Message-State: ALoCoQmsLbwQZVru8u8zAvzWBDko+rKYbCYmtLr3uYRekqQFUvQ3pxqFvoQ4G/Xe4HMav1flEv8q
X-Received: by 10.52.177.166 with SMTP id cr6mr2495450vdc.26.1384168385124;
	Mon, 11 Nov 2013 03:13:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 11 Nov 2013 03:12:44 -0800 (PST)
In-Reply-To: <cover.1383974819.git.Qi.Chen@windriver.com>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Nov 2013 11:12:44 +0000
Message-ID: <CAJTo0Lb8h=UYNCk8X5dL6XMRQrZSsC5OYA+iDVFOAX=95Vg6bg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Fixes about unsafe-references QA warnings
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
X-List-Received-Date: Mon, 11 Nov 2013 11:13:04 -0000
Content-Type: text/plain; charset=UTF-8

On 9 November 2013 05:28,  <Qi.Chen@windriver.com> wrote:
> This solution is based on the following two principles.
> 1. With /usr on a seperate partition, system should still boot without any error.
> 2. Without /usr, system should be able to boot into single user mode with error.

Presumably this is with sysvinit.  Have you tested systemd with these
principles?

Ross

