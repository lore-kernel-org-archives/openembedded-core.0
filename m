Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id AF40F7605E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 14:39:13 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id o13-v6so13221958otl.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0sftRdAK38o88ILEPLQdA1/DFPh7OcSLk6h+dFd63aQ=;
	b=lnU3BxDBIOOKiru7hWfPLQnlVt7BVcw2nQ/CB3NHPeCQDbcV0/SDoI2qc8PquzPkst
	wip+3mcOzCcy58n7M/dmf/Nd6KVlR6yFrkG6YTYZhENo5ZU1vgDigWqPpzIcEWefFr99
	76jvsrBbW//ohMhQ3oyrWwNhwezdxnRFm5lyE1pykEua0wRyqSN4vaPLnuTI4HB659JJ
	6RvSe2u7FpcQjwob4WgkQqyglQsq03FEWteKSWsNlgIJ0jBQ/Cty4jaJGmTpVzVEcg4n
	PsKWThuhwZoJ9KGIvm1dEINLoydTJEqcvS1exR2BY2Q0vB1UaTNq96jmregqch8EauXn
	xaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0sftRdAK38o88ILEPLQdA1/DFPh7OcSLk6h+dFd63aQ=;
	b=S8VHeZLgOFZxVUrUhgxPnp2NXwoWn8GqVY9VP7iLjFBV4aXf2rqu+KTJD/EfHVyzkS
	jrUqP2VzRfc+XjyWPdjRK/9JydxGYKqsISBMJOvgAr3PnwShGNxzJxyLfnK0vvheZBaK
	zcPSCk745ao3A/Ow3xH/UFty9m63qnH/LMA5Cwe71OX1VfZVeJrffhPlD34vG1p1U5Rg
	pU0n6wgnHdWwH3HZkanOzt0dfFBU4i1YtIQzSM50m1JxpM63uNETmsOyIvTlSEID+1+6
	8g3IgT6YArJJZbphPNvxyzXw7U3pnNcSA2ic/7MGue1NKYOXgZz9DPuYtjelQQ5gQTpN
	Qz3Q==
X-Gm-Message-State: APzg51AVntpmxCt01Va4ggH5pFqRtcmJU2RCuOmeYlZYy9EktBqNAPeB
	ShqGoDo3OemXFQtko+GaYQ+O8WnLwmpMkc2g290=
X-Google-Smtp-Source: ANB0VdYY0OV3TzO62weRDYY392TymEBtIo4Mj1Zo6iwk30lDMd4XoWpvrrFjTliq9vuUafm8c7gB5egVueX66v3Egv0=
X-Received: by 2002:a9d:747:: with SMTP id
	65-v6mr24403134ote.315.1537540754573; 
	Fri, 21 Sep 2018 07:39:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:490c:0:0:0:0:0 with HTTP; Fri, 21 Sep 2018 07:39:13
	-0700 (PDT)
In-Reply-To: <0717be0e-0c72-e3f5-dc11-8e4065585749@intel.com>
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
	<20180402215705.GA25121@linux-uys3>
	<CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
	<ada194d6-5653-fde7-a70a-64646b08b281@intel.com>
	<CALbNGRTthOp+_T-6c_Vc3qmgMHTt-2ztyDiGbNEHY4+6UuW2ig@mail.gmail.com>
	<CALbNGRQT94ptEPAygj+Rm9vBm27yo=inbz+O6nR2gL_etkGd7g@mail.gmail.com>
	<CALbNGRQxauR4PkJ+FMXKmnJapcWO9pVSvW1cLVyrDU9-T+o65A@mail.gmail.com>
	<0717be0e-0c72-e3f5-dc11-8e4065585749@intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 21 Sep 2018 16:39:13 +0200
Message-ID: <CALbNGRQtXBw+yAeUK5X5WDZtrv6WeuSH1ZQ97neVrkJm4v8wVQ@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
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
X-List-Received-Date: Fri, 21 Sep 2018 14:39:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 21, 2018 at 1:46 PM, Anuj Mittal <anuj.mittal@intel.com> wrote:
>> Hi,
>>
>> seems upstream has introduced changes 4.17 -> 4.18 - the patch does
>> not apply anymore. Is this patch available for 4.18 somewhere?
>>
>
> Are you looking for this:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit?h=v4.18/standard/base&id=bd6314212686ef8156a108b6f1eec67d34402878
>
> https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/?h=v4.18/standard/base&id=0aa800372a846d6ed2c0fc3e0fdc22656d268968
Exactly thanks

Andreas

