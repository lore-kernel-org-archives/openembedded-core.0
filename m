Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
	[209.85.210.49])
	by mail.openembedded.org (Postfix) with ESMTP id DD85878EFF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 09:40:09 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id c23so23727013otl.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 02:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=B+BT+xx1tLuHqZdPFBCDoTpxoL46JeLa4CZD+k15528=;
	b=SmN7nYtpq4Vg2/FNBncElcXyOiMxuCd8+7hw7MbVncYInGR2UEiFEV13QEsoQ/hqxn
	KN0MGEGBAPEOdpSOyTeVm2yxD/WAOgfC3sAi9BCeM2xl8Mo+JRwrOX+Plq9/C6IB1FMO
	4jdr6lNV2daiM7ATs+Pfsrbm4M2mRQFrGC7UDxFCmB1vTTrpYRwGNywCGhUtvfa6KXUT
	UyDw/N+QGhbwf6KCulleksJ01gG9b+gNU5l+1iu77BuE5Fu6xVHtTiYeOM6Nr2TQBSkQ
	U8JoQgWZntoE0wINDN29h5dTDy98CG1CaWaOFBmlMnapShVABi1gBW4r3m0mxBgSBIDw
	fv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B+BT+xx1tLuHqZdPFBCDoTpxoL46JeLa4CZD+k15528=;
	b=JrSTKFuoGD2Y3G98w4yN4C0TK0lzb16rM4p4d5v5yoBhrNm6XJV3s5f5lLIo4nd/ox
	mwI64z5I1nLBanHJaimU3U5BpAU3Iahje6dyetd2ACXQpTKp9ciQwoXnWeTNi616adrD
	C2DsSnSVmf2YDfwGXMB3lsow2lXT1sA6qDnNqG/ksvtzfsKKWQdQ278PyzkUKjdOZJBy
	ITmujQuJL8RypwxxYiJRPnZ1LONg7SwwM6ezBnPCqmf3eGQoI0gb2M98+P1A1EGlqgJ2
	dVnG5tAIbG3nKo4xbV/8KgqMVGinXU5dOWxdbOEw/sjLmb1lPRWiBgUxKVV2eB371H0f
	Xq7Q==
X-Gm-Message-State: ABuFfojsFV6VP2BMgZLUMbLviH5DJaZW3vTY05cl+l3n07PfkwS+Qdfc
	FGozk5OhXhIxMN9oaFLBKT27WOuF1dHntQHZHasCBA==
X-Google-Smtp-Source: ACcGV60bC2Kxj5Gk8WSfAcOIirVLD4Ed3ueBTHGl//xhNsjHSZdxMz4NVkZ1v11wOu6ciiIYxi5BnRrtE/oatcdFY2g=
X-Received: by 2002:a9d:3e50:: with SMTP id h16mr14736092otg.8.1539769210775; 
	Wed, 17 Oct 2018 02:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20181016090054.122374-1-mingli.yu@windriver.com>
	<fb67373823b7952f1acf022bed6bd40611c74754.camel@linuxfoundation.org>
	<CAJTo0LbbgiiPQSanVFuibf2PpYmVr9t1vebxZD6OT7DF+BdhDw@mail.gmail.com>
	<CAJTo0LZT1ytnsBoKkfdwv8GThzsOCjoQtLdbe9dtFPMaPupMxw@mail.gmail.com>
	<CAJTo0LY79q4La-mTQwG552XAkwJ8UTLp9yztVCd4g7m-pogpKw@mail.gmail.com>
	<5BC6CCD3.4050003@windriver.com>
In-Reply-To: <5BC6CCD3.4050003@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Oct 2018 10:39:58 +0100
Message-ID: <CAJTo0LaYemE+q9=n0LTET2DzsQgGQPWSH+bmaM0k4ifa9oRM+A@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost.inc: make libboost_python3.so available
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
X-List-Received-Date: Wed, 17 Oct 2018 09:40:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Oct 2018 at 06:48, Yu, Mingli <mingli.yu@windriver.com> wrote:
> I'm fine not add the the hack fix from boost side, but as I know there
> is another package camera-calibration-parsers which has the same problem
> as below apart from cv-bridge. BTW, there may some other package also
> has this kind of problem. This to say we need to fix the issue for the
> this kind of packages one by one.

Yes, it will need to be fixed one by one, but everyone will have to do
this because this is what Boost is now doing.  This isn't a change to
boost that we introduced, upstream changed the library names so
everyone who uses boost will be fixing their code.

Ross

