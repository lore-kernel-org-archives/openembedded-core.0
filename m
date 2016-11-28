Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 28EF27197B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:17:13 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id m5so90505385ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 05:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=UptCDdIjcfsA7Uxosh7GAeIlGOTAAFgSc5wPTlAiuGc=;
	b=dFdwonMPVcGy3R/VArgDx2muF10dmoafKtDvipUNoPcFJ0p7HldWyS73WFfvkf9Spx
	yTg1h3qDjQ5vmaPOKFDfhkYom96xeW5Nk7SJZBD7oXuoHXuZBFg7TtmreXU1TGqXitNM
	aPfKYBxGdK6ok3JvIs7BialW4muTpbf1vxlMsL0zqIksJuVAC/XxtcTVzNquDRg8z6K7
	zqZzYAGLebRPAQufjcTR8NV+SvDksBy6k6TNCFd2mAKwV4CHTHTwmzeM47odfez9qS/b
	zrmab4AkQveBEzSi2pWpi6frQ1AGrWmT1MIZiLrMCa6TrdbKn2IeuLXJ4Ur5Ump6Vwpv
	TKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=UptCDdIjcfsA7Uxosh7GAeIlGOTAAFgSc5wPTlAiuGc=;
	b=EkUqUrrtejJlRub/FlRcC4rtGpqfE7GVAR40IE5WMGv8hD4lvVcgzvpkCibpubG3No
	polQHB4AZLPnBkwhVjTPLHlDD3yXRgGRWeCZMKACZsEDx0btbz74N9CDjUOR/QcwfgM8
	SqMgXMGibeuTR0hy8tcfyjxoDsbEED4MjgmvongpRiPzYNKcpH7k5Th7udb8J38blYVk
	Amb6YgBEkMrhJcLar+cC3dG+CxumPYI7xOQjQTs9fYYlNhEVCauZdqs+h0CRDvGHEB6k
	ofa996YH9tD/b9OWwOHZfOYNQdEiXiOzvDnzhdyR65DUhOdVy7OJjFgAYDkCQKXk7vkX
	80GQ==
X-Gm-Message-State: AKaTC00gvQlnlTaglekiwibZkALl2ckdlP44J4eol1U5rJ2wNb0Zr6rdyQmo4uwsXXoKF5IZ
X-Received: by 10.107.185.87 with SMTP id j84mr16618562iof.3.1480339035099;
	Mon, 28 Nov 2016 05:17:15 -0800 (PST)
Received: from pohly-mobl1 (p5DE8C83A.dip0.t-ipconnect.de. [93.232.200.58])
	by smtp.gmail.com with ESMTPSA id
	f24sm19838596iod.21.2016.11.28.05.17.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 05:17:14 -0800 (PST)
Message-ID: <1480339031.6873.181.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 28 Nov 2016 14:17:11 +0100
In-Reply-To: <1480334664.28508.167.camel@linuxfoundation.org>
References: <alpine.LFD.2.20.1611280544090.16875@localhost.localdomain>
	<1480334664.28508.167.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: ASSUME_PROVIDED versus SANITY_REQUIRED_UTILITIES versus "The Build Host Packages"
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
X-List-Received-Date: Mon, 28 Nov 2016 13:17:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-11-28 at 12:04 +0000, Richard Purdie wrote:
> On Mon, 2016-11-28 at 06:20 -0500, Robert P. J. Day wrote:
> >   a bit confused by what i'm seeing in a recent
> > qemuppc/core-image-minimal build on my fedora system regarding which
> > native packages are built, despite what's in bitbake.conf (using
> > current poky layer checkout).
> > 
> >   first, here's a snippet from bitbake.conf:
> > 
> >   ASSUME_PROVIDED = "\
> >     bzip2-native \          <---
> >     chrpath-native \
> >     file-native \           <---
> >     findutils-native \
> >     git-native \
> >     grep-native \
> >     diffstat-native \
> >     ... snip ...
> > 
> > suggesting that (among other things) bzip2-native and file-native
> > shouldn't be built -- it's the developer's responsibility to install
> > them, yes? but if i peek under tmp/work/x86_64-linux, i can see:
> 
> There are two ways "file-native" can be used in a build. It can be used
> as the host provided "file" command and it is also needed by the file
> recipe to build file for the target.

I recently ran into a third usage of "file-native": swupd-server links
against libmagic from file and therefore has a DEPENDS = "file". But
building swupd-server-native didn't actually build file because of
ASSUME_PROVIDED and because I hadn't installed libmagic-dev on my build
host, the build was failing.

Is there a way to declare that ASSUME_PROVIDED does not apply to this
case? It sounds like there is a way (based on your comments about
building file-native when building file and the libbz2-devel example),
but it did not become clear to me how that works in practice.

Or is it just a case of educating the developer that libmagic-dev needs
to be installed on the build host in addition to the file command?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




