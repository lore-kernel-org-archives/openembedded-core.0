Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 17C83601A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 16:25:15 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id v10so20643900pde.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 09:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dZfQGJDb4G5kGgT0sHAntAeVW2Gpi0VP5FluksnB5as=;
	b=pXr5ejTEk4zMUo+GJ5XdktQe/nHbzVNUMXZ8OMRQ4iBIpqHb/x86S3B4bgU1MM/7ta
	s10wbTYs7xIsGfi1XyTdu/HnEgqToQ6HSDCyT03cdqJudPx7zk8A3LEQ59UFS2+9NzBf
	1iBHvXdIPZZTU+FlKrchEjjBOIAIzAIaV0Y9QwVLQwammDux3NkIOVKMt8i0uMusx7ml
	ghH3HHet59Hnrj7caIWpg7tsaLdNqu0vBBH2SunbCLapRwh1MeeTyogw4qXFzFKl5SsR
	86J2OUDl2nK4L5Jr+lSg6GzkFoSGB2ouZvmrgGjr2iIvkao7Mss/9HJLrRgexLsYylhv
	QtJw==
X-Received: by 10.68.226.65 with SMTP id rq1mr12817665pbc.131.1408983917095;
	Mon, 25 Aug 2014 09:25:17 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id n4sm368714pdk.57.2014.08.25.09.25.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 09:25:16 -0700 (PDT)
Date: Mon, 25 Aug 2014 09:29:03 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <20140825162903.GB22907@haswell>
References: <53ED0E67.9040505@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <53ED0E67.9040505@pseudoterminal.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Kernel firmware files with a .dsp ending
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
X-List-Received-Date: Mon, 25 Aug 2014 16:25:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-14 21:30:47, Carlos Rafael Giani wrote:
> Hello,
> 
> while writing new recipes for an updated machine specific kernel, I noticed
> some packaging errors:
> 
> ERROR: QA Issue: linux-cubox-i: Files/directories were installed but not
> shipped
> /lib/firmware/korg
> /lib/firmware/korg/k1212.dsp [installed-vs-shipped]
> 
> Looking into kernel.bbclass , I see that .bin .cis and .fw files are
> packaged, but not .dsp .

Submit a patch to fix it. This is a valid firmware blob for korg audio
devices

