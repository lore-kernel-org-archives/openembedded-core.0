Return-Path: <geiseri@geekcentral.pub>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id 30796771BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 15:25:00 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zoho; d=geekcentral.pub; 
	h=date:from:to:cc:message-id:in-reply-to:references:subject:mime-version:content-type:user-agent;
	b=agp84rPRxMYvCNkgL8qb/yU2MMVP+0+leK13lHNj7y+p87oozicqjWokc6Bf/xWHPXlxo+uFbjrl
	O5rHU0emp6zzwDgYKrDBH//k/BjzIQBsr5ctZuJDbA2iho7//o1+c72rmI5ZDAljbEo96HQ7RI40
	R3slOZz4Cc9zx+5ZX3I=  
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1464708292571971.4311218827523;
	Tue, 31 May 2016 08:24:52 -0700 (PDT)
Date: Tue, 31 May 2016 11:24:52 -0400
From: Ian Geiser <geiseri@geekcentral.pub>
To: "Christopher Larson" <clarson@kergoth.com>
Message-ID: <155076adecd.fbd58d4e28737.2520989404842375814@geekcentral.pub>
In-Reply-To: <CABcZANnTRsoFWBdshg1mvV1AWvxjs_XqYb0horJwFSpqrswT6Q@mail.gmail.com>
References: <154c86e7fa2.11a4a3b0e305159.2603931524640206304@geekcentral.pub>
	<20160523103623.GA18324@linux.intel.com>
	<154dd88c4a6.d1f78c40166145.7475080368514196708@geekcentral.pub>
	<20160524195145.GA21158@linux.intel.com>
	<CABcZANnTRsoFWBdshg1mvV1AWvxjs_XqYb0horJwFSpqrswT6Q@mail.gmail.com>
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Wic and "live" images
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
X-List-Received-Date: Tue, 31 May 2016 15:25:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



 ---- On Tue, 24 May 2016 15:56:39 -0400 Christopher Larson <clarson@kergoth.com> wrote ---- 
 > 
 > On Tue, May 24, 2016 at 12:51 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
 > 
 > The thing is, it's likely the machine/bsp setting the WKS_FILE, yet in OE/yocto we prefer machine/distro/image to be orthogonal. If you're injecting machine specific logic into an image, that image isn't going to be generally useful for all machines, and so violates our philosophy.

Isn't the physical disk image the place that machine/distro/image all intersect though?  Maybe this is some philosophy I have always not gotten because it seems every time I make an image for a machine I am fighting the current.  Really I think at the core what I want is a partition layout that I can put a payload in.  wic seems exactly that, but I am not sure how to get from my rootfs, initramfs and kernel to there.  Thanks!


