Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC106BF60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 17:04:04 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kl13so5618480pab.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 10:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=PEPi/Ev+WGJIQ1MhFMPb8SqF0OGTfL0c5LbvBVhq39c=;
	b=yZIn2mI+0K153/Xt9lhNColvoF7RmsxF4YbNlA0haWg2KgTtJNgC0MwP9sfeRDSkSr
	CqdCuECg6lc0QV+H+CZ/57bdsw4s6AGDC+gzNenutvqLfqehhhg1HNtZKn3+mFLH3CY/
	JRCK/kHPIr/h9+xRm4E6ER/2SkNObJhqPWrbrQdNGu1LfVo7Xk315zAIVxhKgvcokAId
	CMZUhioYWQDzqqxvj0STfSP5vRtGzlhkPVAt1aRvpJSKUzsVj1nvfDlvm/x9sGgZOcqy
	OZ15O0xN64lF/YSkfpeI9DvHKIlD16SJ+Vzb9+n6q9DXQQOXa/BSXzHNgmIRA/xOZh37
	O29A==
X-Received: by 10.68.9.3 with SMTP id v3mr29659404pba.84.1379351045922;
	Mon, 16 Sep 2013 10:04:05 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	7sm39860576paf.22.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 10:04:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZPbYuFyCK2xRy4QcM=miAKaEQby+7Hxgw3V1WAuhVkAQ@mail.gmail.com>
Date: Mon, 16 Sep 2013 10:04:07 -0700
Message-Id: <FA6FA9DB-DA71-4288-B0B4-5B575E2A5BE7@gmail.com>
References: <1379319989-9475-1-git-send-email-ross.burton@intel.com>
	<5236C833.30002@windriver.com>
	<CAJTo0LYqh0+TY8hgv4NufumF_uu6c_sVSG5=Eyf2b=FNe+FRhA@mail.gmail.com>
	<CAJTo0LZPbYuFyCK2xRy4QcM=miAKaEQby+7Hxgw3V1WAuhVkAQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1510)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] transfig-native: remove, nothing depends on it
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
X-List-Received-Date: Mon, 16 Sep 2013 17:04:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Sep 16, 2013, at 2:30 AM, "Burton, Ross" <ross.burton@intel.com> wrote:

> On 16 September 2013 10:15, Burton, Ross <ross.burton@intel.com> wrote:
>> On 16 September 2013 09:58, Robert Yang <liezhi.yang@windriver.com> wrote:
>>> Is there a specify reason that we need to remove it ? transfig
>>> provides fig2dev which is used for building the documentation,
>>> for example, gstreamer and libtheora may use fig2dev.
>> 
>> Considering nothing depends on it, clearly not in stock oe-core.
>> Presumably you have some patches to enable the documentation builds
>> and add the missing dependencies?
> 
> It also appears that GStreamer (at least gstreamer itself, HEAD of
> master and 0.10) doesn't actually use fig files for the documentation,
> just PNG.
> 
> If we're talking about a large number of packages then I'd agree, but
> if we're saying that oe-core should have imake and transfig-native so
> that if you patch libtheora to build documentation it has diagrams,
> then I'm not sure that's a suitable trade-off.

agreed.

> 
> Ross
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


