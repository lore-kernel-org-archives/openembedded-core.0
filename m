Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E644A7FA1A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 20:25:04 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id n188so3283661wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 12:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=0BHPRfQo6jRNFD/4HFd9LEgMBGTZZ5uXrPOFIgSMjWY=;
	b=I1cuaZVi6uNVu0ncpMUndLFZVm/jVMk5LI9lTA3BJ8t/t/NzpV/1SK5gvH2ZmYua1Z
	RmdC9az/yBouwKZ5Zq5fZH6S/GXhYKk1K3Evf+sZmdjdULcddhinIjhkF7q1tmiRXggd
	Gtq5RaekPqB+70qhfsdH8hEpB/hYHIQQKVfps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=0BHPRfQo6jRNFD/4HFd9LEgMBGTZZ5uXrPOFIgSMjWY=;
	b=pYlOanzVcSRpz3+j56llwg3cj7nUdjLCLuH5J4PJnVnGCa2VFdg0jed9SQ4MHosaG/
	njEMYCJVlM3NHal3DZ45iYHZFwjXQjhVK5t3lGHFFm7FQGy9JiS+i/0mjyIqLMb1HGZP
	cTiYp2mufWe6N6+v0gPYMYwfnPITkJEHCTudZXTj+k0z2XpU3VYJZtw9jGNMIF58WUqT
	AKwFMh9/Tf9WHExavwBqyykMT5YSZLqBDZ+eaWX9yTzNTdaFdN1SN4yRtrUzT6SB1nJ7
	RiQAd+6bSQH8wuM4reRNSPiPsKAA640p4IySL6YMrzBOnqaoJyufNkXTr1tjRcvewLIl
	q3lg==
X-Gm-Message-State: APjAAAXqNQGTiSa75WBNf/F2fV2/2L7IApCvmRjTTTbq5NlrsLxYxGJZ
	KyOXkPnfgJOJJWLSPwMPDd7SZw==
X-Google-Smtp-Source: APXvYqz7vxAwLbc88g1WY4Ir+6ZgKqHBWpzkt9wqSGRsYyFkma33eQkvn+6DQ1Joa7uUnv/jr/Nkkg==
X-Received: by 2002:a7b:c92e:: with SMTP id h14mr12669274wml.29.1574367905518; 
	Thu, 21 Nov 2019 12:25:05 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r15sm4869273wrc.5.2019.11.21.12.25.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 12:25:04 -0800 (PST)
Message-ID: <50236bca804ff079db05b696f783c9af7e408c8f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
Date: Thu, 21 Nov 2019 20:25:02 +0000
In-Reply-To: <531618732.621500.1574366028835.JavaMail.zimbra@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
	<b3ae667e644cf4b81c096562965268dbe5596065.camel@linuxfoundation.org>
	<531618732.621500.1574366028835.JavaMail.zimbra@savoirfairelinux.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Jonas Andersson <jonaskgandersson@gmail.com>,
	paul eggleton <paul.eggleton@linux.intel.com>,
	Savoir-faire Linux Rennes <rennes@savoirfairelinux.com>,
	OE-core <openembedded-core@lists.openembedded.org>, bunk <bunk@stusta.de>
Subject: Re: [PATCH v3 00/17] NPM refactoring
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
X-List-Received-Date: Thu, 21 Nov 2019 20:25:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-11-21 at 14:53 -0500, Jean-Marie LEMETAYER wrote:
> On Nov 21, 2019, at 7:26 PM, Richard Purdie 
> richard.purdie@linuxfoundation.org wrote:
> > On Wed, 2019-11-20 at 10:33 +0100, Jean-Marie LEMETAYER wrote:
> > > The current NPM support have several issues:
> > >  - The current NPM fetcher downloads the dependency tree but not
> > > the other
> > >    fetchers. The 'subdir' parameter was used to fix this issue.
> > >  - They are multiple issues with package names (uppercase, exotic
> > > characters,
> > >    scoped packages) even if they are inside the dependencies.
> > >  - The lockdown file generation have issues. When a package
> > > depends on
> > >    multiple version of the same package (all versions have the
> > > same checksum).
> > > 
> > > This patchset refactors the NPM support in Yocto:
> > >  - As the NPM algorithm for dependency management is hard to
> > > handle, the new
> > >    NPM fetcher downloads only the package source (and not the
> > > dependencies,
> > >    like the other fetchers) (patch submitted in the bitbake-devel 
> > > list).
> > 
> > I'm a little confused by this item.
> > 
> > If the NPM fetcher only downloads a given package's source and it
> > has
> > dependencies, where/when are the dependencies downloaded?
> > 
> > My worry here is that if the fetcher isn't downloading them, DL_DIR
> > can't contain all the needed pieces needed to reproduce a build at
> > a
> > later date?
> > 
> > I suspect I'm missing something obvious...
> 
> The magic is in the bbclass, in the do_fetch_append() function:
> https://github.com/savoirfairelinux/poky/blob/npm-refactoring-v3/meta/classes/npm.bbclass#L51
> 
> Which calls:
> https://github.com/savoirfairelinux/poky/blob/npm-refactoring-v3/bitbake/lib/bb/fetch2/npm.py#L312
> 
> Which runs the npm fetcher for each dependencies described in the
> shrinkwrap file. This is the same behavior for the do_unpack task.
> 
> 
> To be more clear, a recipe like this:
> 
> ```
> SRC_URI = "npm://registry.npmjs.org/;name=my-package;version=1.0.0"
> S = "${WORKDIR}/npm"
> ```
> 
> Will only fetch/unpack the package source without handling the
> dependencies.
> 
> But a recipe like this:
> 
> ```
> SRC_URI = "npm://registry.npmjs.org/;name=my-package;version=1.0.0"
> S = "${WORKDIR}/npm"
> 
> NPM_SHRINKWRAP = "${THISDIR}/${BPN}/npm-shrinkwrap.json"
> inherit npm
> ```
> 
> Will fetch/unpack the package and all the dependencies which are
> described in the shrinkwrap file.

That does remove some of my worries, thanks for explaining!

It does make me wonder if we shouldn't have two fetch classes and then
support a url like:
 
SRC_URI = "npm://registry.npmjs.org/;name=my-package;version=1.0.0 \
           npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json"

where the "npmsw" handler would handle the shrinkwrap file?

Basically I don't like the way the current code has to tag the
shrinkwrap file handling on to the fetcher...

> Bonus tips: you can have your base package SRC_URI using another
> fetcher than npm (e.g. git) without breaking anything. The behavior
> will still be the same.

That does start to make it clearer why this is advantageous.

Cheers,

Richard


