Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1B86C71B40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 06:51:18 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id g126so36459048ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 23:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Tlli/SfhJHepjZs9zNTWvIZuX8y32ow4Y/aI7yV1VHg=;
	b=nSOgctRqu0wF7saBQsazt5RDqEBCX/VHPR1iiYj7OcaK6RCENVVmYaPcGwYHadu3X1
	eEEGnQ5UiBqpNDBq/JoHRPR/yPgs6qcijeuT0oBzXyJSKV+TOoMQpdjJ7dLtZ645NZj/
	jRpPR/Vuux/bOGYoYnIJbab1slSssceKxu90D2uxFqMfzq5RK1ZNENwK3U0bTodhB9zY
	PIZNcJjg/MEjvVtb1W9xbKsej+btKn3n3mmSiBcfH7GpLGn1bIyUMWbty0lmCp5/FqZi
	rw0gu5Ikl0ZbjQXeI2wPZAW4paxV9EaCu7k89wPDQNuFcjKgHy2X9d3IuBnsD6jhk6Wk
	LBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Tlli/SfhJHepjZs9zNTWvIZuX8y32ow4Y/aI7yV1VHg=;
	b=ksh1f3t/rbDylApnQv++xSfVXhLttBHXZW1+0hsrnManVq3wBP+wDwsAEsccwK9Yrs
	9vbA8GUWRLRkG/UGqt8dLZQ8onqNjBW8ccjYeC0IpHJMIiWb7Df5vbFW3obbHDiI25hr
	qHSrdxEVhdp5EHEJyMLCXWaoFwrTwY1vjzoflGAeWDpLbdOUS3k3qBLtqd+yv1eLRZ3k
	0axnLDP8hHSXdmbkx4G7p91SP6lz70S0v8CxvIPyJV0XT+KhjI1GVKSfPYnb9+UcSR5G
	Mh2E2dTv0O2XT4ECkBJhxzvSmx0rYHWdP5+K93w61Y6CAvmzZm4dNNDYmwO4089dMCO5
	ywyQ==
X-Gm-Message-State: AODbwcDzRGCP8CHxE/tfy5T6ulnaa0bDE94f69Q7wrjFgfIqaC+X1+xT
	PdDeA2gsH3HfconqZBM=
X-Received: by 10.36.31.70 with SMTP id d67mr591448itd.80.1496127079781;
	Mon, 29 May 2017 23:51:19 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F3D5.dip0.t-ipconnect.de. [93.232.243.213])
	by smtp.gmail.com with ESMTPSA id
	y79sm5209128iod.13.2017.05.29.23.51.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 May 2017 23:51:18 -0700 (PDT)
Message-ID: <1496127075.16923.146.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Christopher Larson <kergoth@gmail.com>
Date: Tue, 30 May 2017 08:51:15 +0200
In-Reply-To: <CABcZANmeNcT0JHWXaJM2__EZrgarSjCqQO3Af4trGNF_Dria-A@mail.gmail.com>
References: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
	<c8d26bf705a207b8f639c966f811bbb15556038c.1496071841.git-series.patrick.ohly@intel.com>
	<592C48BD.5020107@linux.intel.com>
	<1496085537.16923.133.camel@intel.com>
	<592C75CC.2090708@linux.intel.com>
	<CABcZANmeNcT0JHWXaJM2__EZrgarSjCqQO3Af4trGNF_Dria-A@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 30 May 2017 06:51:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-05-29 at 13:14 -0700, Christopher Larson wrote:
> 
> On Mon, May 29, 2017 at 12:26 PM, Aníbal Limón
> <anibal.limon@linux.intel.com> wrote:
>         >
>         > Changing software versions is indeed a bit more problematic.
>         One could
>         > argue that layers shouldn't fight over who provides a
>         certain recipe in
>         > the first place. If they do, perhaps the "additional
>         layers" (= the ones
>         > with lower priority) need to provide explicit .inc files
>         with
>         > PREFERRED_VERSION assignments without which the overriding
>         recipes
>         > aren't used?
>         
>         Yes, so in this case will need to set automatically the
>         preferred
>         versions to oe-core recipes, and then let the distro layer to
>         change the
>         preferred version in this way when test a distro layer with
>         oe-core the
>         signatures not will change only when add the combo of distro
>         layer +
>         software layer.
> 
> Currently, if you add a high priority layer with an older version
> recipe, it will change the default selected recipe, lacking a
> PREFERRED_VERSION. You can’t use DEFAULT_PREFERENCE to make the new
> old version of a recipe not be used, since bitbake treats layer
> priority as more important than default preference, so adding a .inc
> won’t do much good, since you can’t make the recipe not be preferred
> by default without a preferred version set to the current oe-core
> version. You could add such a line to the layer.conf, but then you’re
> hardcoding the oe-core recipe version into a separate layer, which is
> pretty ugly. I don’t htink we should be enforcing this signature
> change without resolving this.

The key question is whether overriding existing recipes implicitly
merely by adding a layer is considered acceptable. Any opinions about
that?

We agree that changing via .bbappend unconditionally is bad, even for a
software layer, right?

That means that the signature check must be applied, but with an
exception for wholesale recipe replacements. I can think of one
solution, and that is to artificially lower the priority of the
collections in the new layer so that the recipes in it cannot override
the ones in the base configuration anymore. But this is kind of a hack
and might lead to broken world builds (for example, the layer overrides
recipe A with a version which adds an RPROVIDES foo, and another recipe
B in the layer RDEPENDS on foo).

The alternative would be to do a deep dive into the signature diff and
filter out those changes which are caused by a replaced recipe. This
could be fairly tricky to implement, in particular as these changes then
also affect all recipes depending on the replace recipe. The code behind
bitbake-diffsigs has known limitations regarding recursively identifying
changes [1], so this probably would have to be solved first.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=6428#c4

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




