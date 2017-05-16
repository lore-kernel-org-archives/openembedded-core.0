Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3BC5F77D31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 08:17:33 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id e65so83200952ita.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 01:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=+b5DXxCdArtl+2s1Yvf4/HIy1Czlye6nTfCcf/TXEYo=;
	b=Tmz3GFEPu2cG6M5/f5Sa+HE4OX1C3JeY99ovIjAj/kQxWFSIJrJK90ILByeGcn9ZVq
	QGMYSOXEGYEX6WG9EogqfELOgGENAsYxlOdTRNVPM3qE2BlLT53jqMevawz+mOIR2nyF
	uEsrrervdR7M9LVppB9MlTRSRYd5BfNYxCiX9xBDZ/zAJI5fsMzDJot2iJ9LNju5FBUP
	2H4JKnvRZDKlf0V0ONFQtGkpD3Aj9LvnFPqt1DdAbnX+vbrRnGFp62HXn5wn2/eBwBKC
	F5I+Dn7ep8oI/7ccr+qPKbbyoH+l8ddCGn6Qd45mLelSftU4uIl+OziB62CLs91+PWm2
	40xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=+b5DXxCdArtl+2s1Yvf4/HIy1Czlye6nTfCcf/TXEYo=;
	b=V7k988VaFr7XtyeaUotgfbjtfcJKEXQAIOCxrxT7zKUC8UgSyG+tIXljc6oIuihzq7
	n3M+sfTO+HkAwH5vImYuEeaI0k4tKCaskDuQtk55uHfp/9VgdMo+RceIuU7r0nw6hveq
	OUgQEORzMLU5nNgtrGecQOj+nbCce9NB1dlh0m6km+HM/rsG4pp5LnGE2btSnZbZB2zS
	Rkso3dxWIc/VhPCZ26fgewA1oW8m5qNi0Mp8ExcIJf7NMastm3IiEkMTH/eP+bsNGL9J
	S4sKvm9WJq/bHprSILtR/BjDmRYGMqbkI7YvtvdtISxkQnj1E6XBJpeWvDEmx3WK/3XP
	9ByA==
X-Gm-Message-State: AODbwcArErAe5+Ve6Ua79WyctmHpC4zvbacezciWbsVMk71//XagHK32
	M+b1FIUFhTidHwof
X-Received: by 10.36.211.195 with SMTP id n186mr1598137itg.0.1494922654936;
	Tue, 16 May 2017 01:17:34 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EB79.dip0.t-ipconnect.de. [93.232.235.121])
	by smtp.gmail.com with ESMTPSA id
	f193sm5738280itb.8.2017.05.16.01.17.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 May 2017 01:17:33 -0700 (PDT)
Message-ID: <1494922650.1179.301.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 16 May 2017 10:17:30 +0200
In-Reply-To: <1494919764.27342.27.camel@linuxfoundation.org>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
	<1494919764.27342.27.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 0/6] development vs. production builds
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
X-List-Received-Date: Tue, 16 May 2017 08:17:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-05-16 at 08:29 +0100, Richard Purdie wrote:
> I'm not really sure I like this change, it seems fairly invasive and
> complex for gains which don't seem to add up to me.
> 
> For example after your patchset, we end up with two different places
> motd may be generated based on various flags. I think it would be
> confusing for the user to find out where a message as coming from.

Fair enough. I'm not a big fan of the "debug-build" DISTRO_FEATURES
either, and just included it as reference for what could be done at the
distro level.

What about just patch 4, the one which introduces image-mode.bbclass? Is
that of enough interest to carry it in OE-core? With or without enabling
it by default for images (patch 5)?

That classes currently defines three modes in IMAGE_MODE_VALID, but
intentionally with the weakest default possible. Distros can override
that to match their intended usage modes, or (better, now that I think
about it) we make the default empty and when users try to set IMAGE_MODE
(because they might have seen it in some other distro) they get an error
(assuming that we inherit the class in image.bbclass).

My concern with not having this class in OE-core is that each distro
will have to come up with their own way of doing something like this,
with no consistency between distros. That is going to confuse some
users. If a distro does not want this feature, they can just ignore the
class, once we make IMAGE_MODE_VALID empty by default.

> One of the reasons I have grown to hate "debug-tweaks" is that when you
> enable it, you have no idea what you're really changing as the name
> doesn't tell you what it does.

I'm fine with eliminating "debug-tweaks" entirely. In that case,
local.conf.sample should just list the individual features directly?

>  I worry "debug-build" will become the
> same problem, it doesn't do one thing well but many things badly. If it
> really just changes debug and logging PACKAGECONFIG (if present), why
> doesn't the distro just do that?

The idea was that the distro or user can set a global flag without
having to know all these details. For example, consider the case where a
user adds a custom recipe to a distro. If the distro has a
"development.inc" and "production.inc" with PACKAGECONFIGs that tune
recipes to match the intended usage, then those lists won't configure
the custom recipe. 

> I also worry about the number of classes this introduces. Whilst
> classes are cheap and easy, I have heard concerns we have too many of
> them. In this case image-mode gets hardcoded into image.bbclass.

We could merge the content of image-mode.bbclass also into
image.bbclass, if there is consensus that this code should be active by
default.

I've done it differently here because I wanted to have the ability to
use the standalone image-mode.bbclass in refkit.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




