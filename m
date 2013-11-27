Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6A13A6DE52
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 18:42:27 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id c11so5611067lbj.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 10:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=W2K6IKvc8f+g1KvebdSDvNPo2DQcFpOcoAo8ouAsV90=;
	b=brBa63+FklpUKu5htY2A7tibhFmg6NxBkAYuG3saBa76BJgVX+xDA8Px3JmnAil8mR
	dyubZDf/W2tAt25RGpSBAGrVm9DCSqL7n+gauF+DneJVG7QhzL4B1RUMDQ0/cP5zJjMM
	8zvM3oHFr2DFzDk4YsSPCRHmormelul+8LT2WubsLPpP1wPFYhJHX5siXSb3dkQwzwAd
	pezzITYfRO4kBc2wbnkJK/lXRnhq6HJyuX7+eEnOOZDWjNCu8NXWA2KlOw8etZnwumK2
	5KMcAx15x/xQOmFUcV+jWlIIavOBy/0vuHF336OqzcLSF6C+VAOGx5ybKSQjvtWvMsLl
	UiaQ==
X-Received: by 10.152.23.39 with SMTP id j7mr2448780laf.28.1385577746425; Wed,
	27 Nov 2013 10:42:26 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Wed, 27 Nov 2013 10:42:06 -0800 (PST)
In-Reply-To: <cover.1385571298.git.stefanx.stanacar@intel.com>
References: <cover.1385571298.git.stefanx.stanacar@intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 27 Nov 2013 11:42:06 -0700
X-Google-Sender-Auth: tvU7K7lRQrNSghm1yCqt6iwgZ8g
Message-ID: <CABcZANmBnxydmGn6OstDVu4TAB1urdN5teb2fAP6z02W5C38fQ@mail.gmail.com>
To: Stefan Stanacar <stefanx.stanacar@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Script and layer for running tests
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
X-List-Received-Date: Wed, 27 Nov 2013 18:42:29 -0000
Content-Type: multipart/alternative; boundary=089e0158ca04626dee04ec2cf567

--089e0158ca04626dee04ec2cf567
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 27, 2013 at 10:08 AM, Stefan Stanacar <
stefanx.stanacar@intel.com> wrote:

> This series adds an oe-selftest script, some modules and a new layer
> meta-selftest.
> which are meant to help in writing tests (using python unittest) for
> various
> bitbake tools/scripts as well as simple output checks or do
> complete builds with different options (with the emphasis that everything
> checked
> is done outside of bitbake context, just like a human would do.) For more
> details,
> please see YOCTO #4740.
>

Will this have its own repository like all the other poky integrated
layers? It really should, in my opinion.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0158ca04626dee04ec2cf567
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Wed, Nov 27, 2013 at 10:08 AM, Stefan Stanacar <span dir="ltr">&lt;<a href="mailto:stefanx.stanacar@intel.com" target="_blank">stefanx.stanacar@intel.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":t2" style="overflow:hidden">This series adds an oe-selftest script, some modules and a new layer meta-selftest.<br>


which are meant to help in writing tests (using python unittest) for various<br>
bitbake tools/scripts as well as simple output checks or do<br>
complete builds with different options (with the emphasis that everything checked<br>
is done outside of bitbake context, just like a human would do.) For more details,<br>
please see YOCTO #4740.</div></blockquote></div><br>Will this have its own repository like all the other poky integrated layers? It really should, in my opinion.<br>-- <br>Christopher Larson<br>clarson at kergoth dot com<br>

Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--089e0158ca04626dee04ec2cf567--
