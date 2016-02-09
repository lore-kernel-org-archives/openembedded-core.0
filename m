Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id AEBB360118
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 15:34:43 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id y8so55210085igp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 07:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=1/n43bIlSXMhPgCJRiRIzuGmnZoOkhsimdsagBg68LA=;
	b=NpgmaekXpVMHjTVf4gW/fhkj28G1GjJVMvF0RDdJ7dvvEV5SJR9hQQzNN7TYqS00u2
	VkL1BWt80jgf/zpaq3yNLLO8czanckTPjNqJbA11qdXsihFV3biVnaHtR/v7cLxHSHNT
	43BmeWNRJmGSzeLg+LGf0v0qkrRKLYzcCoFqXCmR3hFTySt9yw1bpO4eduKIRGa+uOBD
	KwnJHfbQCSLFN53NEl+VKyAO9nvOZvXw+NyrjHjka7r5F06qJJgCi5qqhMddqGe4tUoN
	bQBnl+PP8Npw0UPYVd6CNv/mQTd7lBPYxjmylpAq44swRVc0PDjhhrG7CrGEFqjPoiNb
	bIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=1/n43bIlSXMhPgCJRiRIzuGmnZoOkhsimdsagBg68LA=;
	b=gSvHOXq/uWvDCeBt2uPYIDiGLT6mOGLt2Ib1yPjfcAsxu+xWTD8WMwKU2XctW1ECc+
	QVz6SQtiGeZqOcckA6enkmHvQ6x6i3uxUSmfPthkGKNK5QH83rh7aN3dxKlOzXFuXyVH
	OyE/Rn5OY1O93MTjPboAvc1al448Usc3unMLqTBYiQgnFp73RTArIicDcDPxBf63L679
	vGLIweYaj34m8GUnyLkSu+G4CGaXDtGdphTF38SMCV47jV2YEJjw6V5PmnGlsDVu3C5K
	fzizBSu9OFv3LuMGr0kJJU+7qHTWrJCjaW51FHForAtQGPAfTOM3WYZEPxo1aT8SQGx3
	94cg==
X-Gm-Message-State: AG10YORHkal94rofqGuHEcUqyR/fKY2Q0F1WTlRz+aUcaF4yoOXzagWauBcSgac/VvLGFg==
X-Received: by 10.50.33.80 with SMTP id p16mr4809304igi.23.1455032084102;
	Tue, 09 Feb 2016 07:34:44 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	t16sm4703395ioe.36.2016.02.09.07.34.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Feb 2016 07:34:43 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <56B922B3.9070604@gmail.com> <56B931EA.6060107@windriver.com>
	<56B95575.7030505@gmail.com>
	<CAJTo0LYQx1cZT=bwmXhJqHtFvujqMNH7qNR=05Ciw_+SCekwKg@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56BA0710.8060207@gmail.com>
Date: Tue, 9 Feb 2016 10:34:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYQx1cZT=bwmXhJqHtFvujqMNH7qNR=05Ciw_+SCekwKg@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: noticeably longer build (link?) times with binutils 2.26
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
X-List-Received-Date: Tue, 09 Feb 2016 15:34:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/16 05:00, Burton, Ross wrote:
>
> On 9 February 2016 at 02:56, Trevor Woerner <twoerner@gmail.com 
> <mailto:twoerner@gmail.com>> wrote:
>
>     MACHINE          = "qemux86-64"
>
>     Essentially: minnowboard max (turbot, specifically)
>
>
> As an aside, if you're actually building for the MinnowMax then the 
> meta-intel BSP will be a lot better.
>

The images I build for my actual board do use the meta-intel BSP and set 
MACHINE to "intel-corei7-64".

This massive explosion in build time for chromium coincided with me 
adding a new disk to my build machine and moving my Jenkins builds over 
to the new disk. At first I assumed the problem might be related to the 
new disk so I was performing build speed tests on both the old and new 
disks. For this I setup 2 new builds (one on each disk) and set MACHINE 
to qemux86-64 by default and had forgot about it. But you bring up a 
good point, I should be using the same MACHINE (although my Jenkins 
instance is still using the correct MACHINE as is seeing the huge 
increase in build times too).

