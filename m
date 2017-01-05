Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6B1EF719F7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 07:32:47 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id v96so2901501ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 23:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=WxYf7posXfj/6vvkxHkDKGbtjIS77Gcil1t5c8/a3YQ=;
	b=mvhwbe0W8j7uitjxgWJBGWax3d9jG8P6ZMnmugqkmAVlhfD9n7PZuzjto3FjG3R+Mi
	yCiVf3nVjuzpR7xHuZLP3kpVY0V3a5B+tyGMYBHhh6bqAMLFd41HYPEqWnrVMV0010wK
	Re8v6xXnj6UrmifRgi63MPUpDXsUdaCIYkgn2MKft7BvBJ/d2fQsyIynE+F536IBWmBc
	N2s9ja8iRlym570PLLlY4Z0y+mJnEtSKdV8EWZhZEyxpTowXE3+95Ss1ZiweQs/BPxWd
	Fpv4XrIqy/9JxLvvX94fSmbpp05clHLAFRtEO4h/yA1+U6/1+WHIpBgAx+pGiT9pT76i
	Eu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=WxYf7posXfj/6vvkxHkDKGbtjIS77Gcil1t5c8/a3YQ=;
	b=NPbgYq0DAohzzhfjDQWRYnHlqJHP0wa23xX8UeT7Jl7oOzV0yC+bqQ69fpf7UFsLXn
	i/0MueBwVv8od+0ayzIezxmIskKf1xDT6Xi4JewWAS6niqNb1MeNZXm83XWUuyM+YLwy
	ACQk8GFNZ/vxu9qIEsCQ1Ru5HGcTt1nhHsXUEbDXmz8fuwCo2w1RLLnI0ZrTwRFNgTBP
	J6Wcqnsyf7HFGleooaJEYMbY5MtSGh6Dcy/RpjyAx2KjGj5ZkRurseeVQYa0UZA34G9I
	9ZBq+IIhxTFXn5V4QSXzf8LaMsOuYbuQS/OWCgFNktK483HX0QHF8o7wRk6vhVQJKVq1
	mvVQ==
X-Gm-Message-State: AIkVDXLmAhc85Y2UP5NHyxoFIavw+5BKrg2zVCjvJirFO3L1hESYR3oaKg+hWOdUOkz6nG0E
X-Received: by 10.107.33.10 with SMTP id h10mr40019227ioh.201.1483601568444;
	Wed, 04 Jan 2017 23:32:48 -0800 (PST)
Received: from pohly-mobl1 (p5DE8FAB5.dip0.t-ipconnect.de. [93.232.250.181])
	by smtp.gmail.com with ESMTPSA id
	k130sm35693309ita.20.2017.01.04.23.32.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jan 2017 23:32:47 -0800 (PST)
Message-ID: <1483601563.28169.69.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 05 Jan 2017 08:32:43 +0100
In-Reply-To: <CAJTo0LYepu3mAAc=Y76RxBW20w1gEVH1+ms7gpfmSTB-ePfrcQ@mail.gmail.com>
References: <cover.1483570577.git.chris_larson@mentor.com>
	<CAJTo0LYepu3mAAc=Y76RxBW20w1gEVH1+ms7gpfmSTB-ePfrcQ@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Add opengl to REQUIRED_DISTRO_FEATURES for some recipes
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
X-List-Received-Date: Thu, 05 Jan 2017 07:32:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-01-04 at 23:49 +0000, Burton, Ross wrote:
> 
> On 4 January 2017 at 22:57, Christopher Larson <kergoth@gmail.com>
> wrote:
>         These aren't buildable without it, and adding it fixes oe-core
>         world builds
>         with nodistro (which does not have the opengl feature by
>         default).
>         
> 
> Am I still the only person who thinks skipping of recipes should be
> recursive, so if say libx11 throws a SkipRecipe then everything else
> that depends on it is also magically skipped?

Not at all, I'd also prefer that. If recipe "foo" has some obscure
conditions when it can be built, then repeating those conditions in any
recipe depending on "foo" is a maintenance headache.

Last time I brought this up, it was mentioned as advantage of the
current approach that conditions are explicit and thus less surprising.
There's some truth to that, but I don't believe that it outweighs the
disadvantages.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




