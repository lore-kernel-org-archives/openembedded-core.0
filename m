Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3AEB07FEB2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 18:45:04 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id j20so14385304qka.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 10:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Sihp0PY6cfWgSoAiRX8NvjJxZ8AIdrvHcjB+UxYMDFM=;
	b=P3ndWX+NexSPBhhkIsiHQ1uGN9nrNlPlKKY4WrlNN0KHczNUzBWqe6ZxTWBfxMFMIO
	8Fosi2jTfsKTbM7qQ2IA2xuwRQRX30SzhGWEQ5LvswZFgZ7RMQ7I+om4EPXxVh+J1LvI
	g79CJ1vG892S+/awqbRk26TaHUnGW6yPG+rCNmk6YKFsmMS0TrTWEhudV38fp0yY+D/f
	jSLeqWte/HVJQRTY4Nek9VyRrqk07tP57Sf0ix1o3Tv7ID+23fBBhNK8e4LuE+RJ/go5
	LC0OqUUUVEY2/SLrCf11CwFiibIQcmdT7lqh8gj0SAsR5qLAb2rSpFnpbZdYlBwowyyY
	xmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Sihp0PY6cfWgSoAiRX8NvjJxZ8AIdrvHcjB+UxYMDFM=;
	b=n/mIts7ctKfDN/JLEluDOC/38hdIR8enq8IehuUBNBspL54tRVT2lKl6fxTTHfLNIG
	oT6jEgfnbFBYgddUj8ViWe7PlWhQhFa4OnkyiSVIuPLRM/oCnjx3cvRWkh9nni1IU9Kx
	o9boeC8Ja3pBlpGAkdwxT8+QR2KS1M2x17A4WWj01aVjs7Y0S5vlMDwg4J8qVTwUZgVo
	j5tqSKqSSbBDE+/zDI+qpXaNFvzrRNzsb1u+exCkBi8VkW2EaSFx46hi8OSGITFEkdiW
	GMSS2vr7gTkOYSd9930R6jkZHbl25n+5NMXralIvbxPEEjPIlpTBtWW32FGI/d1/nVgl
	Aglw==
X-Gm-Message-State: APjAAAVHJXwqWX8cT+633L8cpYsNCih5kVHScFVwzJzg8BERNN+lPyax
	PmbaSAwF9YTz3T0u/7qH65BhaPOmNfoKmWry1FQ=
X-Google-Smtp-Source: APXvYqwk5N8ebKekUpRd5p2s0fPkV0dSC8+Ki3yILSA9Utp+UCAG9UewEmcAe20fOwwkaPT5BgmcKwaJvCthMayT2+E=
X-Received: by 2002:a37:a3c7:: with SMTP id
	m190mr24149420qke.212.1580237104639; 
	Tue, 28 Jan 2020 10:45:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580066507.git.raj.khem@gmail.com>
	<d6dd73600145030ed93604364c66b129c8d843af.1580066507.git.raj.khem@gmail.com>
	<20200128110213.3ji3swjy2km22d7e@jama>
	<CAMKF1srz05b3nEVD7tNautZJ5E1WEObajGXi6miukyEVOQaJLw@mail.gmail.com>
	<CANNYZj-e+_y_=FbvoTALYduvi=yRy7j+VhDqHtr8nvmzkp1msA@mail.gmail.com>
In-Reply-To: <CANNYZj-e+_y_=FbvoTALYduvi=yRy7j+VhDqHtr8nvmzkp1msA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2020 10:44:38 -0800
Message-ID: <CAMKF1sqkSGcEFRN-2LKrYKO0WbxSxVX8i9JhgxvQSL3OTSY+aQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/13] glibc: Update to final 2.31 release
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
X-List-Received-Date: Tue, 28 Jan 2020 18:45:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 28, 2020 at 9:48 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> But 2.31 hasn't yet been released or tagged?
>

No, it will be released first week of February, given how much work is
required for upgrading
some of these core pieces, getting some early testing and reporting
any regressions and addressing
them while time is left in release works well for OE as well as
upstream components. So I usually
do pre-release updates for glibc and gcc for these reasons.

> http://sourceware.org/git/?p=glibc.git
>
>
> Alex
>
> On Tue, 28 Jan 2020 at 17:06, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Tue, Jan 28, 2020 at 3:02 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>>>
>>> On Sun, Jan 26, 2020 at 11:27:43AM -0800, Khem Raj wrote:
>>> > Drop ppc 8xx clear cache optimization, which we have been carrying
>>> > through eglibc days, it has been redone in glibc now
>>> >
>>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> > ---
>>> >  .../glibc/cross-localedef-native_2.31.bb      |   9 +-
>>> >  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
>>>
>>> ...
>>>
>>> > diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
>>> > index dca1916e80..c2cfb7e2f1 100644
>>> > --- a/meta/recipes-core/glibc/glibc-version.inc
>>> > +++ b/meta/recipes-core/glibc/glibc-version.inc
>>> > @@ -1,6 +1,6 @@
>>> >  SRCBRANCH ?= "master"
>>> >  PV = "2.30.9000"
>>>
>>> Should this be 2.31 if the SRCREV is the final version?
>>
>>
>> Yes
>>
>>>
>>>
>>> > -SRCREV_glibc ?= "def9c08c94da60bfb746644d56cffbe7a9de3477"
>>> > +SRCREV_glibc ?= "352bb99754ae7c83ff1b974f9c52244e974c9410"
>>> >  SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
>>> >
>>> >  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>>> ...
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

