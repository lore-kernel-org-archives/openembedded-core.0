Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD1671DEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 10:54:35 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id c7so73194363itd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 02:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=aZ0+iGHKDtGalG5naf8YiAsrIChJ6F+Q/QLz7D7I0Ak=;
	b=fjPAoRP9nOftoqwh/fIKNsMTgmYvWYr149QHB43ryIbhYxXjihbOUVp8p6uxdWJ/iV
	v4HmCax+0BuPh8ZbDGZ0mwqHNUufbN5ygRktn2Bv1t5n2ZrgcVOQxH3e20e2S8PTwc3O
	keDqc9A+CKoqj92R0aVna6BTQ4k9c/+NvY+CtDFc/LWJ2TWxeByHCJrW8ifdv8yBTgSG
	gEHPhoyGUsR4593eoW4eMknGaUESxJi7LWUA1h+0cnER1zjejxaTMzvS6+K+TKCcOkKy
	esyeuqVxiWDQQ/GeiN0H1LUusoZrkNZRISV+dX7v4JYeQja3NujDVeZKni09p7ZSmSgv
	S5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=aZ0+iGHKDtGalG5naf8YiAsrIChJ6F+Q/QLz7D7I0Ak=;
	b=iOVec2WaSVIKF1ZG/WcUwx9N5IwvN7d7bPn3G4CzIWdqF2Iee1QppQmUinYHc90zSn
	ZhYsaddB4OwuFYEbrLtdj/isOeRx7o9V3X20cvPHeeMfKGilAvWPPzwaRe8O/M7Xa5PQ
	yfGi5qwqqU9Um5DdXTQ8mL8L5gYC2GiY/j7LOHnLR0O8I1OBa0tx3a424jRjd0spzlVv
	5+UokJOMyyR0O0hjApgJKLK03hqe40IzUvzr0Suh8E8qzlZGoHExW17cfT5QQ3PJb5aG
	qBVx4BtQRUN4mHhEZLUTAEOFN5dIHHXlB6PH1NpGm9OFrE2FWAMTMAPlMfulY81gdp6S
	gYyg==
X-Gm-Message-State: AMke39mOKBsxBnqh9K55vFWDHHGbOyNGlgVmV8P9SWKw0xhwdYNNiU8tBgcw/cb0aasBHhQe
X-Received: by 10.107.26.205 with SMTP id a196mr21301990ioa.214.1486983276159; 
	Mon, 13 Feb 2017 02:54:36 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DB6A.dip0.t-ipconnect.de. [93.232.219.106])
	by smtp.gmail.com with ESMTPSA id
	v68sm4910010ioi.20.2017.02.13.02.54.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Feb 2017 02:54:34 -0800 (PST)
Message-ID: <1486983272.13854.223.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mike Crowe <mac@mcrowe.com>
Date: Mon, 13 Feb 2017 11:54:32 +0100
In-Reply-To: <20170210183213.GA10017@mcrowe.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
	<ab94bd9c9f3c7170e2a0e40afaec42d5ec9397fd.1484318722.git-series.patrick.ohly@intel.com>
	<20170208115042.GA21576@mcrowe.com>
	<1486559082.13854.12.camel@intel.com>
	<20170208134810.GA29105@mcrowe.com>
	<1486657479.13854.85.camel@intel.com>
	<20170210183213.GA10017@mcrowe.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/3] rm_work.bbclass: clean up sooner
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
X-List-Received-Date: Mon, 13 Feb 2017 10:54:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-02-10 at 18:32 +0000, Mike Crowe wrote:
> On Thursday 09 February 2017 at 17:24:39 +0100, Patrick Ohly wrote:
> > On Wed, 2017-02-08 at 13:48 +0000, Mike Crowe wrote:
> > > On Wednesday 08 February 2017 at 14:04:42 +0100, Patrick Ohly wrote:
> The part I'd missed is the all-important line in source-release-world.bb:
> 
>  do_source_release[depends] += "core-image-sato:do_build"

Okay, that explains it.

IMHO this do_build dependency should trigger do_rm_work. Your "bitbake
-c all_source_releases source-release-world" intentionally includes a
real world build, not just executing the source release tasks. Cleaning
up while building is the goal of rm_work.bbclass. It's arguably a
deficiency in the previous rm_work.bbclass that it wasn't active in your
case.

Now we just need to find a way to combine these without breaking the
extra tasks.

> > It seems unsafe to have tasks that are not properly ordered and just
> > rely on not activating them in the same build, but without understanding
> > the problem better it is too early to look for a solution.
> 
> Thanks for investigating. If you're still having trouble then I have a
> single patch on top of current oe-core master that reproduces it for me
> that I can send.

I can reproduce it.

As you said earlier, adding "before do_rm_work" solves the problem:
addtask source_release before do_rm_work

That's okay, even when rm_work.bbclass does not get inherited. However,
when rm_work.bbclass, a "normal" build like "bitbake menu-cache" ends up
triggering the source_release task:

$ bitbake -g menu-cache
...
$ grep do_rm_work task-depends.dot  | grep do_source_release | grep menu-cache
"menu-cache.do_rm_work" -> "menu-cache.do_source_release"

Is that acceptable for you?

To me it seems like the right solution. Inheriting
release-source.bbclass could be limited to builds which produce
releases, for example in your CI setup, then normal developers will not
be affected.

With that in mind, you could also just do:
addtask source_release before do_build

And then build with:
bitbake world (or your image)

That seems simpler than the construct with do_all_source_releases and
the special source-release-world.bb.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




