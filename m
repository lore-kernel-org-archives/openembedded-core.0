Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 52A297199C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 03:31:32 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m203so1849468wma.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 19:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HDLz2f/jGp/zgLVUmom+T8x/Hg5PQMRZLGST6iSEibc=;
	b=e3OO8HVRL1lDp5mDo3TBEucJMNFWR3V1cAD4aQrNyUKQ4RQMweeOnZSW0pv7DQF1zR
	5mo8XauV+j0h/B2nQnI/Gj2TQdNDiSx/2Q8k0LYfpGYq7pNsCJqBJj+RYDGtHK284p7T
	JgvlNCYCJ26ruHysvbOifHzZtxy3CgM7Xjt+fWzXR+HlZrgMOsJt9vT70gZYg66UUumh
	eCYRbAFBRO3Z39c0RD38kceaHv4onNDqCsPDXrKAg22U9XFkFfh04oF/OsK4LVik3P0H
	7kZBePR0bDHCoLK8q6n8+Xh49RhBklQbCm542+urF41VIofXGMHZwsNa2BmPUsdF3BoV
	JqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HDLz2f/jGp/zgLVUmom+T8x/Hg5PQMRZLGST6iSEibc=;
	b=jCtk2ndGOFPQFQ3UHg8hJ1zbAMhPuq3nysqYqT+0D5tLNQPsPHyarLahQ1k3r6Gp06
	RHzHsAXSkmI4pg9GhZQ8/0PYCrDw7ooQogOyU7i9gw4Ior3pCQLVFUn6Is1q+Z4JE4+f
	3RgdmHUaEsznTRKOroPrC1NZKSbFI3BbD8QWPW+raKOmWhp3zTNryGCl4l7JLFoex9/q
	P18LMBs/L/ROgMXe1yR2lVMmlQk34LLIozgp29lPv0btMrUtMCrpeUqzCY27R+Akd6Z6
	90EGvfV6RL5yp+KF+m0dsoBJ8of8yisLUcFAIgzmx6SFEuECkYntNnf1dslkjaanOwFS
	uvSg==
X-Gm-Message-State: AKaTC03MGfGWfG/tG7Nns/RsBIkyux1/j+aexOXxQ475PqD9+3eANk4y0B0+hlqBqmnetez5qNLfv9402V2+gg==
X-Received: by 10.28.144.70 with SMTP id s67mr7304163wmd.138.1479439893826;
	Thu, 17 Nov 2016 19:31:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.45.33 with HTTP; Thu, 17 Nov 2016 19:31:33 -0800 (PST)
In-Reply-To: <CABcZANmfZSGZsFFcXvSAhTgPBPvoQm=wx=p9Q7sPgSSn3D4mAg@mail.gmail.com>
References: <CAJ86T=U8RB13J_we2bte22bFQKwnahCe3v5L6na9SDPKm6O8bA@mail.gmail.com>
	<CABcZANmfZSGZsFFcXvSAhTgPBPvoQm=wx=p9Q7sPgSSn3D4mAg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 17 Nov 2016 19:31:33 -0800
Message-ID: <CAJ86T=XQe55P7OvNUEXiYSJLfFc7=BZYMKDCyV83ABkhu=cWug@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Modifying SRC_URI from anonymous python
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
X-List-Received-Date: Fri, 18 Nov 2016 03:31:33 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 17, 2016 at 2:00 PM, Christopher Larson <clarson@kergoth.com> wrote:
>
> On Thu, Nov 17, 2016 at 2:28 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> I have a supplier who provides recipes which set SRC_URI to their
>> private git servers. To make those same recipes usable by others (ie
>> me), some anonymous python is used to transform the default SRC_URI
>> (elements which contain private git URLs are replaced, patches and
>> other files are left as-is).
>>
>> This apparently worked in OE 2.0 but from 2.1 onwards the anonymous
>> python which modifies SRC_URI races with the anonymous python in
>> base.bbclass which parses SRC_URI to determine additional
>> do_fetch/do_unpack dependencies and whether or not to call
>> fetch2.get_srcrev(). Specifically I get failures because
>> fetch2.get_srcrev() sees the original SRC_URI and tries to resolve
>> AUTOREV from a repo to which I don't have access.
>
> You might want to try using a RecipePreFinalise event handler instead, they
> run before anonymous python functions do.

Thanks, that works.

(For the benefit of anyone else who may try copying and pasting the
example from the bitbake user manual, the correct eventmask is
"bb.event.RecipePreFinalise" rather than
"bb.build.RecipePreFinalise").

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics

