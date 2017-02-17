Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id F24BE65D00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 15:38:59 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id 203so24334021ith.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 07:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=IuId6vDOJhbJT1iAZljddXLAf7bu5qEHT3ZaIImLn1g=;
	b=SKVzh1s5uZk2hVUUGzNgfLZ3xJkamx0psVgIi2JfTk8vtL+smNPcTa9YvDJord0/EI
	uDfvBrsA2bAV/j0EfZMhI7+MzGtmU5DHaKySzdFk2fFFUWRaAdDcmuUm7ZqgPb/fZ23r
	yNzVHjYfXlbBMb/kzIcR4zwMlA8WzrdNX3Y19W9ZhwmWyxH4/RDA7uw/jbJPF6fF3rIj
	4MpdnleC92rNfvm1lBa6eJR3A2pRn3C4HoJM3Zc0upj9NK4r9aKMt0UfyubDJEp3+fJ/
	00aEQWLm3JkxrpjwyGAXiYW4CHMm0HQ/JIUNVs0LzrIs0Mthf13eCzYGkESSv+qasQqb
	TGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=IuId6vDOJhbJT1iAZljddXLAf7bu5qEHT3ZaIImLn1g=;
	b=VslGnLvP3zY1oBouGjBfCRpy6AQdXzi2TReRcdqwsGpuqjsQHGjMOi1yuYvr2lSNf3
	PAs876OdfM8pkBmTtMoa6JCZWA9iKS0kZ2BjQVptt0eAYplqYHEAj2bKC2GDCxCF0nTY
	SZxW2ywjSwX97bMM71NyLQ1B48z7/UFgAP/O1VtxKModB/YEw3vJ4o18Du3xXpDh7KTj
	FGi7xdkwJoD2BcaQ6XqfJrCtBvgcMoDna1jBgAhVM1g9jsTTToToPxR0EvQvl1HSFgxP
	JiVnxgOjZeN7ewGga07SpvXxDBQF+WwQ+JFOCyv0boVsOJIOkdPywTwdbXMHafVcrUTQ
	jfXg==
X-Gm-Message-State: AMke39nWGVTj50JpNijkFn8OmUcmy3v1uU/YZQaJUMjtjR68XIpRGb9ZPuQjJBT3sSKItpIB
X-Received: by 10.36.51.68 with SMTP id k65mr4330013itk.64.1487345939905;
	Fri, 17 Feb 2017 07:38:59 -0800 (PST)
Received: from pohly-mobl1 (p5DE8FD56.dip0.t-ipconnect.de. [93.232.253.86])
	by smtp.gmail.com with ESMTPSA id
	l17sm4810371ioi.60.2017.02.17.07.38.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Feb 2017 07:38:58 -0800 (PST)
Message-ID: <1487345936.13854.528.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mike Crowe <mac@mcrowe.com>
Date: Fri, 17 Feb 2017 16:38:56 +0100
In-Reply-To: <20170217152116.GA19114@mcrowe.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
	<ab94bd9c9f3c7170e2a0e40afaec42d5ec9397fd.1484318722.git-series.patrick.ohly@intel.com>
	<20170208115042.GA21576@mcrowe.com>
	<1486559082.13854.12.camel@intel.com>
	<20170208134810.GA29105@mcrowe.com>
	<1486657479.13854.85.camel@intel.com>
	<20170210183213.GA10017@mcrowe.com>
	<1486983272.13854.223.camel@intel.com>
	<20170217152116.GA19114@mcrowe.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Running task for all recipes required by an image (was Re: [PATCH v2 3/3] rm_work.bbclass: clean up sooner)
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
X-List-Received-Date: Fri, 17 Feb 2017 15:39:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-02-17 at 15:21 +0000, Mike Crowe wrote:
> On Monday 13 February 2017 at 11:54:32 +0100, Patrick Ohly wrote:
> > On Fri, 2017-02-10 at 18:32 +0000, Mike Crowe wrote:
> > > On Thursday 09 February 2017 at 17:24:39 +0100, Patrick Ohly wrote:
> > > > On Wed, 2017-02-08 at 13:48 +0000, Mike Crowe wrote:
> > > > > On Wednesday 08 February 2017 at 14:04:42 +0100, Patrick Ohly wrote:
> > > The part I'd missed is the all-important line in source-release-world.bb:
> > > 
> > >  do_source_release[depends] += "core-image-sato:do_build"
> > 
> > Okay, that explains it.
> > 
> > IMHO this do_build dependency should trigger do_rm_work. Your "bitbake
> > -c all_source_releases source-release-world" intentionally includes a
> > real world build, not just executing the source release tasks. Cleaning
> > up while building is the goal of rm_work.bbclass. It's arguably a
> > deficiency in the previous rm_work.bbclass that it wasn't active in your
> > case.
> > 
> > Now we just need to find a way to combine these without breaking the
> > extra tasks.
> 
> Now I think about this further, we're only depending on do_build in order
> to ensure that we get all the dependencies included in the source release
> via the recrdeps task. If there were a better way to do that then perhaps
> rm_work wouldn't cause any problems, and we also wouldn't waste time
> building stuff that we aren't going to use.

Isn't that exactly what do_fetchall does? I thought you wanted to build
things as part of your source-release-world. If that isn't needed, then
this in release-source.bbclass might work:

do_all_source_releases[recrdeptask] = "do_all_source_releases do_source_release"
do_all_source_releases[recideptask] = "do_build"

And used like this:
bitbake -c all_source_releases core-image-sato

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




