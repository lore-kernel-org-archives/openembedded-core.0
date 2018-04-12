Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D790744EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 22:12:16 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id l190-v6so6663935oig.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 15:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+hTHfzoC9O2hXBcme3CdzvM07bANAJ89jwTHqNjURWI=;
	b=BZSX7oC32HM7tPAx4pgpLZP6gYLw4ZYKeWKiawvCh5HmkLbPJ5tCEQ+o5oW8+HJbDH
	UbiHtl1TQcVAQJ8ccEe5pRL8sH8qpf04re25XssxTf2RD1fedBKjQFQDY1k4gS5buDZ+
	RLvZ3NeBm2LHWd+iRbDzYBWZX23bNHFFkQcFgbmJpx4iGeWnuPuVOTQn1UEa9Ng3n0dD
	N0mPSCyAHA2gPGF9qveMI2FgrQNdOMbjq3wrzTRAimCijRaaK4NnZQYeQ8dXwMHIjKfX
	L6eVJGD2vssuEMNuWrQVqgmkIybnHiHLtFjy1P0QYhx6ItnzSwms7/2nDLTey60DsWe2
	MuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+hTHfzoC9O2hXBcme3CdzvM07bANAJ89jwTHqNjURWI=;
	b=oVsDF0NH1RHNtjEHc3fTd8Tbd+Mm5X05ReB4+GqjrUIRckqImfGx5I5p5CJA/Fo6z+
	z2KrhXG6I85VV4badxp+eQIfK2KSPTQ3fSPB0Xjz9KnXSueec2m5gtZFslEBlxiRFfhI
	o7Aq0dAmRZpSVpcY2uakOGaqlQ8xU1a32D4dSPYXzi5uVIflENoLSQoJtGhM7p4v+kUz
	s5HEZ2VxVEu9bg3t50XQziuAD+7CPHTLK1do2JQO6svoSX2qnSk9MQgm3ccuGsMJDkxD
	g/MHnZgvUUXa0+dSzupTU2m3Khr+Tuuv/MhJS3MKIp2wY7ym9DxbzlVZuFNHB0YT7Zsz
	ZRaw==
X-Gm-Message-State: ALQs6tBnVUp8V2PDDr9QoL0S100txLZhJWlojRwtvRACsVw35sdHRPG4
	vKJ8yJU/9gRw6SUJcBjjTFpFChW84opv15QqSIQ=
X-Google-Smtp-Source: AIpwx4+z+EL5gbjn0yDDcptxMrWde/e4s+FFA8IY40WA2iQuI/5UhrUl6LkG5eT0uRFh26D+5aUQcV2xqr4rdZq2DmA=
X-Received: by 2002:aca:6254:: with SMTP id
	w81-v6mr6535957oib.251.1523571137147; 
	Thu, 12 Apr 2018 15:12:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Thu, 12 Apr 2018 15:12:16 -0700 (PDT)
In-Reply-To: <CALbNGRTthOp+_T-6c_Vc3qmgMHTt-2ztyDiGbNEHY4+6UuW2ig@mail.gmail.com>
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
	<20180402215705.GA25121@linux-uys3>
	<CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
	<ada194d6-5653-fde7-a70a-64646b08b281@intel.com>
	<CALbNGRTthOp+_T-6c_Vc3qmgMHTt-2ztyDiGbNEHY4+6UuW2ig@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 13 Apr 2018 00:12:16 +0200
Message-ID: <CALbNGRQT94ptEPAygj+Rm9vBm27yo=inbz+O6nR2gL_etkGd7g@mail.gmail.com>
To: Cal Sullivan <california.l.sullivan@intel.com>
Cc: bruce.ashfield@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel menuconfig broken?
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
X-List-Received-Date: Thu, 12 Apr 2018 22:12:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2018 at 11:46 PM, Andreas M=C3=BCller
<schnitzeltony@gmail.com> wrote:
> On Thu, Apr 12, 2018 at 11:38 PM, Cal Sullivan
> <california.l.sullivan@intel.com> wrote:
>> If you're using a non-linux-yocto kernel you likely need to apply this p=
atch
>> to your kernel as well:
>>
>> https://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/recipes-kerne=
l/linux/linux-intel/0001-menuconfig-check-lxdiaglog.sh-Allow-specification-=
of.patch
> Correct: RaspberryPi kernel
>>
>> (This is in all linux-yocto kernels, I'm only linking to meta-intel beca=
use
>> I knew where it was off the top of my head)
>>
>> This was sent upstream but last I looked it didn't gain any traction. I
>> think Bruce resent it recently but I can't be sure.
>>
>> Thanks,
>> Cal
>>
> That looks very promising - will try and let you know - thanks in advance=
 :)
>
Perfect! - Thanks Cal for quick help!

Andreas

