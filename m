Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7B616770A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 14:48:46 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i6so20290105pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 07:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=F5wIRtI1MBqERWLQDx0DOr/z/51oQDV2tMhLciGWApg=;
	b=Fud/TI8QPtT4uSrm8P0/wyvMinmZ+DbPMZbMMuLNnonqRllN06sqiq0YnqSwQs8nZ1
	DmCC5ZZxjb98KDuq/13v0kkjwS7Avfli4Gqczs4eeZ5LB6ymhaEx/VEgMT8fsX+VCPre
	QpEA4m2jZPcH7H6AjovXsrlIRysOhK/YYvIHQ9+TNuxh56Ui+JSg5Dq6/byFju/ygjWi
	i/FwMoQpVVOpkFX2ebkOPb+vd+Ur9ko54VkQUYL7o/fmO5gQzgILom81xS530nLWUzpN
	xeaS0MOvmdqB9TEFzWo77SVF/LDMYgZnakcC5yJkhUCre4FmB8lF7wSt6cv65mmt5ftb
	zv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=F5wIRtI1MBqERWLQDx0DOr/z/51oQDV2tMhLciGWApg=;
	b=JOExasqUyPw3APc3M42GJx7lHsTlVtpq5ptBfEZcStFDJEaXcTlpxdOd9DT51jTm66
	h+xJkyza1L59Og1lBtLWN1qncfXZWIwH5S268J7HHDZroH/3I0RvH7ZsSE/9OvdhCCpk
	kNvCBFo+DGT7W9tJum6aPdBj9rTi+POuCKZ8Rb5dQ2yQ0f/9PmorQSk+uWe4wniFTI9g
	iFt+8YBmR/NOZNQFlj9KOZ2WdaJ67SPAV5RFyoy5rGFQfEdisZJvXb5jCcStlGGtiNEX
	eJWbY3ofjwZXDdInIuGCCqhrL23GCdDWLgja/NXZJazKr7cuZHOlTX0WBaEosnJOg/AS
	tc8w==
X-Gm-Message-State: AEkoouvwi2CsoI6f/qj04HpNl8/3DiIL2RB0IYuud/Qlcu3g4QVx8bt0+PRV9Bnuc8Xb4A==
X-Received: by 10.98.22.212 with SMTP id 203mr136275942pfw.74.1470408527135;
	Fri, 05 Aug 2016 07:48:47 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:41d7:99c1:5cc6:c627])
	by smtp.gmail.com with ESMTPSA id 6sm19504434pab.11.2016.08.05.07.48.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Aug 2016 07:48:46 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>,
	Robert Yang <liezhi.yang@windriver.com>
References: <cover.1469337362.git.liezhi.yang@windriver.com>
	<07cae7b73779e89d5e038bf48fbfa204d51b4b68.1469337362.git.liezhi.yang@windriver.com>
	<CAJTo0LYCEP1nkeZ9-1i+K3YsK0OMAt+axx-4ezQsbxu+VwvyVA@mail.gmail.com>
	<57980BC4.80208@windriver.com>
	<BF50BCD4-DC5E-478D-9AF3-24C9E99C36A7@gmail.com>
	<CAJTo0LZ_9sp6+tWgoY1NSeh3H-KVWrCJfyCp0LW1YaF6AMS1tg@mail.gmail.com>
	<57A3FE58.8010704@windriver.com>
	<CAJTo0LbsdQVQ3yCsYdEFOoHSRSbSOmV6dSzAPLsH9P252=Zagw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <025b44d4-076f-747e-7d39-15209a3d3df5@gmail.com>
Date: Fri, 5 Aug 2016 07:49:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbsdQVQ3yCsYdEFOoHSRSbSOmV6dSzAPLsH9P252=Zagw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] epiphany: inherit perlnative
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
X-List-Received-Date: Fri, 05 Aug 2016 14:48:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 8/5/16 1:20 AM, Burton, Ross wrote:
> 
> On 5 August 2016 at 03:47, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
> 
>     I can reproduce the problem every time on my host Ubuntu 14.04 64bit:
> 
> 
> Just discovered that ephy for some reason ships its own copies of
> intltool.m4 (and a few others).  We'll need to delete those.  Patch
> incoming.

ah good find. I was still seeing the errors on my boxes.
> 
> Ross

