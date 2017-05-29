Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id F273B77DE7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 19:18:59 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id f102so45248467ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 12:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=wDQy2EdToBFvXKMLf+0d32uHyIcmF2b/y19DaVFzbcA=;
	b=SmWyYRNLWGBwksBygtsXmtTPLVEAvegse0OvREd1qkOqRqUkAn3WbkS4kp6VIquZK4
	uHiqYVFVCH2Z4hHcNMfCLLk7fbCfZzDinnlgNipE5/t+eRgojAtlRSSX2ZUncrhgycF3
	80ygOiUZMZ5HXThMXs/RrV5YaLgACz7ANLlxqa4zeRKMTTQrWZAN20jZ/Wf595/uzqXP
	8g02hgOtCJZWFQl8r5S4IuxBiaEx5wkTjyH6OTxwwdywXSaFIBuTkdNOayoTEjBKotAP
	ZkG2NoJOyWF8eh3cWgvZhEkVXViVMCrnPk/E+lzCpFQMRNW+56Rdq7GSsSbMQZFPJFj0
	HoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=wDQy2EdToBFvXKMLf+0d32uHyIcmF2b/y19DaVFzbcA=;
	b=Kjivnp0j0nri3tW9gTDj3gJHVTFlt0Y76c6PEayyoPE+uurlCCLHqinJ5E3uBP+uxL
	VT3g99t9uqtpZhaPm2uoQ+2NIGotyTtHkgEGT4Q9KGwPvoYhTLm6aY5F0GSX2T+VrY1S
	HlF8uJf+SFDXozx4WukLQB2tXUyOzda/ukYUekOo7o6HU3Zo8FqEusNd+9D8LcYJOdWi
	zLz7cIzI5TgptqSYMIs9/20VArZTH+hYbt7kmeLGhKz61pFznWVoU0m9mnTzEGUzMxwp
	1rOmuXakj3slXQZZdwgi4GyspRVO/gAI73QHi+R3H9DrMjCYro1ule1yZFCHxfx6Z2hV
	eP3Q==
X-Gm-Message-State: AODbwcC72XevtUxI6ZgkCmN4qnUIyn3xTahtBZfhHOZOXP3mOAYRrcg9
	sDWivqYYCEHKli9T
X-Received: by 10.107.134.72 with SMTP id i69mr14108931iod.118.1496085540923; 
	Mon, 29 May 2017 12:19:00 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FCB8.dip0.t-ipconnect.de. [93.232.252.184])
	by smtp.gmail.com with ESMTPSA id
	l21sm4566925iod.43.2017.05.29.12.18.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 May 2017 12:18:59 -0700 (PDT)
Message-ID: <1496085537.16923.133.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Mon, 29 May 2017 21:18:57 +0200
In-Reply-To: <592C48BD.5020107@linux.intel.com>
References: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
	<c8d26bf705a207b8f639c966f811bbb15556038c.1496071841.git-series.patrick.ohly@intel.com>
	<592C48BD.5020107@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] yocto-compat-layer.py: apply test_signatures to all layers
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
X-List-Received-Date: Mon, 29 May 2017 19:19:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-05-29 at 11:13 -0500, Aníbal Limón wrote:
> On 05/29/2017 10:32 AM, Patrick Ohly wrote:
> > Software layers were previously allowed to change signatures, but
> > that's not desired for those layers either. The rule that a layer
> > which is "Yocto Compatible 2.0" must not change signatures unless
> > explicitly requested holds for all kinds of layers.
> 
> If i understand correctly now a software layer can't change a signature
> but how do we handle this?, currently if a software layer is added and
> has bbappends or newer version of a recipe the signature will change.

We've touched on this topic in the "[Openembedded-architecture] Yocto
Compatible 2.0 + signature changes" mail thread. I had asked about
software layers and Richard said "I do think we need to do this [strict
signature check also for software layers]"

For .bbappends, the solution from that mail thread is to turn
DISTRO_FEATURES into overrides and make changes in the .bbappend depend
on that, or include the .bbappend code only for certain features. That
reminds me, I still need to turn my prototype code for that into a
specific patch for bitbake.conf...

Changing software versions is indeed a bit more problematic. One could
argue that layers shouldn't fight over who provides a certain recipe in
the first place. If they do, perhaps the "additional layers" (= the ones
with lower priority) need to provide explicit .inc files with
PREFERRED_VERSION assignments without which the overriding recipes
aren't used?

Also remember that this is only a problem for layers who want to be
"Yocto Compatible 2.0". Other, private layers can simply ignore the
rules and do what needs to be done.

Alternatively, we can make the stricter checking of software layers
optional in the tool. Not sure what that'll mean for the "Yocto
Compatible 2.0" - all layers are created compatible, some more than
others? ;-}

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




