Return-Path: <akuster808@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id DEA7160017;
	Tue, 30 Jun 2015 19:34:24 +0000 (UTC)
Received: by iecuq6 with SMTP id uq6so19859703iec.2;
	Tue, 30 Jun 2015 12:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=NemA66kBL5IgSsG1FWBvmjLAnQqut70YH/kodvOpNmI=;
	b=JvCKX4a2vf164ixuRdgqlKkzGNiylO/hZv4J2rry4UosfnrfRIUm2/DAr23MnujrFP
	ngNMOVpUom5ur/8SeUSO6IWzllRpJ33vr2nBDUF3boc/nI4JTsl0NFPXk9b/Ye8rPXhh
	2+1S60k0bw4GNpP1OcmtLSFuLAhDRd68hvtWTOSLIazP8aPnNsqHx4uEUj+oZ70cjWca
	vs8G7v+XR46CLuLfKLXpB/ynancjSW7hU8nlPNx7bNJHTsV+ZkAYLVVyFobLZpQOGbqj
	hqqgr5ZPbiRzqUJkPDNcAO1rPdh2vkX6lg3dwsGa/0tG/5EnCMgggN1Eaux0X1GW8tgE
	F6nQ==
X-Received: by 10.50.59.146 with SMTP id z18mr1083171igq.5.1435692864955;
	Tue, 30 Jun 2015 12:34:24 -0700 (PDT)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id
	b17sm30560829iod.32.2015.06.30.12.34.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jun 2015 12:34:23 -0700 (PDT)
Message-ID: <5592EF3D.9020906@gmail.com>
Date: Tue, 30 Jun 2015 12:34:21 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <5591E548.8090706@gmail.com>
	<CAJTo0LbVgo+rn3rPPbj=ho-aDc6WuHTq83UcR8Y=HNAique81w@mail.gmail.com>
In-Reply-To: <CAJTo0LbVgo+rn3rPPbj=ho-aDc6WuHTq83UcR8Y=HNAique81w@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: cmake update broke mariadb
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
X-List-Received-Date: Tue, 30 Jun 2015 19:34:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/30/2015 02:44 AM, Burton, Ross wrote:
>
> On 30 June 2015 at 01:39, akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     eo-core commit f8661aa "cmake: Upgrade 2.8.12.2 -> 3.2.2" broke
>     mariadb in meta-oe.
>
>     DOes  the person who updated cmake need to fix this or the person
>     who is feeling the pain will be fixing it ?
>
>
> Depends on what the breakage is really.  Can you provide build logs?

yeah, that would have helped.
- armin

>
> Ross

