Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 09FCF78293
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 19:31:59 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id y77so24602158ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 12:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Q2m7h6CcGW3wLxi4qMWX3ExCC4tu4IMSaAbPxqm/SuE=;
	b=NW6pB8Zhg0EyF7v53u2IU8RCnNdHa6gd+YPue94vj7E/m+foxeQuyrRQHR6PuIoj9+
	Wz7Z4Ed+9KrB3KRZSkLptrQocBcRPrGVyNMXORFmsEZoroxvs0U0jwWbVqYxjq9XahIz
	DBT+ZIGW3slPzTzuKyVm1/DZmKaeazDIPZWsFvO34zeSSMDYWm4I1k4THQ9RWd0dQg0J
	Deqmlf62Cgz2gI1MT9Q5VEHjKE4Bo1lfsH1PTiiaf08A6F1OoJpNv3JSIt7+Nkv9u0R4
	mDIAa3RSfyQHD3pYS7WkHCg07V06j8UzJnEXBVOmhi0ozKvWKOnujwPJqie/MQjwDflf
	DcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Q2m7h6CcGW3wLxi4qMWX3ExCC4tu4IMSaAbPxqm/SuE=;
	b=oRaqHf7qhTTGsrB3hARY9Bko68FVZp3nyQGyAPjcI2GSkUCLaIq8V0IZI6K6zx2RcK
	Uzxt/kG+9OS4jnncCQyh25fokkLuMxYql3fzALVlzkd9uiY0IbWNRDER5T2/Db+QGNqw
	vJX2fW/t8eqf35/AzMUJ99l2UQjzvT5Vqh4qDXBybELMAKINyNUFIwxwPlW6xjRM1y8Y
	epE6jms9I4OTkmnR6+Xc3b+BlHIDfn3XaLFjFMa/R2RtuarGpXllAGOGSQ7uXi0QN/yt
	mkur0rAnhlKBIskCzdVwmvcf6LbKl7MLMIqy+kyhT9IOTlOKIThFbUjvYBKo926ga/7n
	+eiw==
X-Gm-Message-State: AODbwcAbE/ABGflC0twFIx85isOODfwnwrQOp6btN6t5loiqvxKeIs/K
	nz1ofG6biGSDPc0r
X-Received: by 10.107.163.84 with SMTP id m81mr39580624ioe.74.1496950320239;
	Thu, 08 Jun 2017 12:32:00 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8CE54.dip0.t-ipconnect.de. [93.232.206.84])
	by smtp.gmail.com with ESMTPSA id o66sm2880280ito.2.2017.06.08.12.31.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jun 2017 12:31:59 -0700 (PDT)
Message-ID: <1496950316.30163.152.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 08 Jun 2017 21:31:56 +0200
In-Reply-To: <1496935714.8427.7.camel@gmail.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<1496850184.21235.1.camel@gmail.com>
	<1496912216.6630.225.camel@linuxfoundation.org>
	<1496930142.8427.2.camel@gmail.com>
	<1496932400.6630.250.camel@linuxfoundation.org>
	<1496935714.8427.7.camel@gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Yocto Compatible 2.0 support code
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
X-List-Received-Date: Thu, 08 Jun 2017 19:32:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-08 at 10:28 -0500, Joshua Watt wrote:
> Sure. I wouldn't suggest using an if statement for "just anything", you
> can surely do terrible things that way. It would (by convention) be
> restricted to the same sorts of things that the conditional includes
> allow now. On a similar token, you can do the same sorts of terrible
> things with conditional includes as currently proposed because it has
> the same enforcement policy (i.e. "by convention").

I'm starting to wonder whether this "convention" can be strengthened
with additional warnings. The code which currently evaluates the include
parameter could record in the datastore the original expression and what
it evaluated to, then later when the recipe gets finalized, an event
handler can check whether evaluating the expression still gives the same
result.

This would also be useful for "inherit". I remember struggling to
understand why certain image type classes kept getting inherited despite
changing IMAGE_FSTYPES - it turned out, that change had to be made
earlier.

That's neither an argument for nor against the "if" check - the same
could be done for that. Just something that occurred to me.

> On the other hand, perhaps the range of terrible things that can be
> done extends to more than just how you conditionally include something.
> *What* is conditionally included might also require some scrutiny. As
> you have alluded to, overrides are probably the best option for
> variables, so putting them in a conditional include file is probably
> not ideal. Forcing people to move the things that have to be
> conditional to a separate file might actually be detrimental in a
> number of ways:
>  1) It might encourage recipe writers to do more in the include file
> than they maybe should so that they don't have to make a plethora of
> files.
>  2) It might make it harder to verify that what the recipe writers did
> is correct since the context of what they are doing is removed from the
> parent recipe.
> 
> IIRC the conditional syntax (if or conditional include) is really
> mostly needed for the parts of bitbake that don't allow overrides
> (addtask and such). If that is the desired restriction, it would not be
> difficult to have bitbake enforce that by only allowing the subset of
> things that don't support overrides to be in the body of a if
> statement. This would be more difficult with conditional includes
> unless some other bitbake syntax was added.

There's some truth to that IMHO, but I'm uncertain whether it warrants
introducing entirely new syntax. In refkit, I only ran into one
particular case were an include file was necessary.

> If that's the consensus, than I'm fine with that. From my perspective,
> conditional includes are just another (more difficult to use) form of
> an "if" statement, and making it difficult to do things conditionally
> doesn't necessarily make it better for anyone.

Making it hard sends the message that it shouldn't be used lightly.
Documentation will have to make clear that conditional includes are the
last resort when everything else isn't usable.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




