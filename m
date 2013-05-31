Return-Path: <net147@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 231E660959
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 09:54:05 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so1947064pbb.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 02:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=oYn5jS6sjpHEAR04iFtD/mHFT/xws/SUG1AfLFxipaE=;
	b=xUBE7ghXMY+wSos7dttPTtxwaaVXsuOWq03uSrxP/5SJ52A5itgzjHrl9Jehw5G35d
	vmZiOQmQu4aXJCxQ+z1F7NzWUXcip2VezcWasZmCO+YvSL2F+p6TojcD/PLOtyXY3ADh
	+xRSQ/2m5s0heC0PL0eisW48/rs/gOO4OS1eQTJOTKqPVz7CB/CDPY/IYsDB5euumU5y
	HXKDt9mebenxfxKazjCMjruGcvdtHkOIdtdhcVKlIdwW3uCf+LWaRkDCs8BBtkx3bpYY
	mO8a4/1EXGmFs0zZacqeBjmJUg+vKkoOodnoj2u6N3G/GncBEhbOvi9fPdY4EscPY0Nk
	u4FQ==
X-Received: by 10.66.144.136 with SMTP id sm8mr12591821pab.115.1369994046566; 
	Fri, 31 May 2013 02:54:06 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id do4sm46036907pbc.8.2013.05.31.02.54.04
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 02:54:05 -0700 (PDT)
Message-ID: <51A8721B.5060806@gmail.com>
Date: Fri, 31 May 2013 19:49:15 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1369978815-15261-1-git-send-email-net147@gmail.com>
	<CAJTo0LbQKdr3CaHrd4G-T5KRxgZRZ4ddakK5i3GWkJxijtmQLA@mail.gmail.com>
In-Reply-To: <CAJTo0LbQKdr3CaHrd4G-T5KRxgZRZ4ddakK5i3GWkJxijtmQLA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xf86-video-modesetting: update to git revision cba29fd8c2
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
X-List-Received-Date: Fri, 31 May 2013 09:54:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/05/2013 7:28 PM, Burton, Ross wrote:
> On 31 May 2013 06:40, Jonathan Liu <net147@gmail.com> wrote:
>> This adds support for 32 bpp pixmaps when 24 bpp framebuffer is used
>> which fixes graphics corruption in some cases.
> Instead of grabbing a random git revision, can the patch be backported?
>
> Ross
Done.

Regards,
Jonathan

