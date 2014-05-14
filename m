Return-Path: <otavio.salvador@gmail.com>
X-Greylist: delayed 5417 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 May 2014 20:34:40 UTC
Received: from mail-yh0-f47.google.com (unknown [209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5761365DBF;
	Wed, 14 May 2014 20:34:40 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id z6so2198291yhz.20
	for <multiple recipients>; Wed, 14 May 2014 13:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=rqS1v/2e2dBLF5CnUU2gBWLGzZ1v/V2mhm2aM8gKeP4=;
	b=PYatQhyUy2q7aeTnmAFw3GzHm5/2tTDsODt0sk2/HFk1WWdBSNYnPjcLrRXhI08HFa
	ENQEeO1XERQ0tlGrcDs2pF4ZS/wX+450PNzGrIXPHenrF5BKw9aFlBwR6lAVklpHQqjY
	wzUglvfI9bhWy1nIIPjh+gyf5ZTfSfiBNLZooeVZAqLONRlTHgqYPq6mHrS51MZ/TD6x
	vJJLiULBbgF9Glj6pGEejLUfNC1VXPggfJC9bMEZR3FaJ2Fg+ah8Zqi2ExB8t1TJ/wsf
	Uvpx5CzRCIVF3o5lvjPBMqVO3yGmLyy5YqXNjpvOilCh6Zz7VqBmYKBlSGEpkxKH9g0P
	lCxg==
MIME-Version: 1.0
X-Received: by 10.236.180.169 with SMTP id j29mr8489363yhm.47.1400099681893;
	Wed, 14 May 2014 13:34:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Wed, 14 May 2014 13:34:41 -0700 (PDT)
In-Reply-To: <CAJTo0LaNVqizccFhw8E_Bp8WXX07ZB9Mu+_DoQ0tmjcLf8f=Fg@mail.gmail.com>
References: <cover.1399993010.git.valentin.popa@intel.com>
	<CAJTo0LaNVqizccFhw8E_Bp8WXX07ZB9Mu+_DoQ0tmjcLf8f=Fg@mail.gmail.com>
Date: Wed, 14 May 2014 17:34:41 -0300
X-Google-Sender-Auth: 3JsqTQq2LowglJhQfH72n4cSwZs
Message-ID: <CAP9ODKrXJJ4O_WKqS1osA1_KBKCcsBknLEiRvNc6GXBC-+F4Qg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH 0/3] mesa upgrade
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
X-List-Received-Date: Wed, 14 May 2014 20:34:47 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 13, 2014 at 12:28 PM, Burton, Ross <ross.burton@intel.com> wrote:
> As this is a major release of Mesa I'm expecting breakage somewhere...
>  Can BSP maintainers please test these patches if their machines build
> Mesa?  I'm expecting machines that use mesa-gl to break if they don't
> just use the pure software drivers (so that's at least EMGD and if I
> recall correctly some ARM drivers).

Yes; we'll give it a try in meta-fsl-arm.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

