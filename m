Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id E3E6071A82
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:44:55 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id j18so34929909ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Mar 2017 08:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Z40hBhkNtnKF97RNFQGkabSxBqx0qPFhufLj+7RzDEA=;
	b=rRGn+qdMZhLBOP23CpfGSBzhEoPLk8qA0+LjrBAGVjMhO4aghBPRz6azyh0vDdtIkt
	3UgBB5/mgFUt9YmHlnac62sOuewuT1vDUFld5edEJ5qZu8741HOjLi/m1C3EoxmREf0A
	mLkKC+njK47URCVmFykxwcYJIiiJ/FOIYQ9Vf2jMNtNqa/NuGVj1mnukz4oo7vRU7t9a
	Nt2QDGbO6WbYT/TBh7o36/GUUazkncoSuDKBy0dbQIkREoJuBF8Hsbt5tw06Li6BxHX3
	334qk2cWF1oHjZHWmUU9WWC3dMRfITYxy7rTpmSSYVm7VftdOO5nXVNMbXWonudaLfKQ
	/iNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Z40hBhkNtnKF97RNFQGkabSxBqx0qPFhufLj+7RzDEA=;
	b=fKO+IhTOGit21cl7hsynMqWYa1bG/Zz8GPqBr7JZAyfJsJ8Nm3Qf5qTi1/d4nteUsE
	xozkQXt1l7+RukjwSQaHgKBoexonxnfR+UpWJG/ksQvl1/sHY0CCHjRVT6RqaP08zMEk
	LYLFuqPY8mdXkQVMyRWTl8uEuw2Avqe2+sSdlLoxOoKafZ3MToH+U2Bfk38vdVSvfJey
	CtP3rfiDbFfXnd/HFeQWrSmy/CKcyTwt/sC4sJObbyq65k+/8fS7lCVANN7WUBVDhgfJ
	jSXQcsCmoo11v4fKFSp+rOseVj7ES/4Vcp+DBfGJFAzLc2pwDEsglfLrVhT3bb1HnVWJ
	ozrA==
X-Gm-Message-State: AMke39k2uVntL4vwL1EppqcgvUpHDQP87YzqzSJ5Q7KIDc17EcPQ1V0lMaufv55XsReC5IO+
X-Received: by 10.107.160.140 with SMTP id j134mr10391546ioe.180.1488386696667;
	Wed, 01 Mar 2017 08:44:56 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E037.dip0.t-ipconnect.de. [93.232.224.55])
	by smtp.gmail.com with ESMTPSA id
	l19sm2299648ioe.51.2017.03.01.08.44.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Mar 2017 08:44:55 -0800 (PST)
Message-ID: <1488386693.7785.172.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 01 Mar 2017 17:44:53 +0100
In-Reply-To: <20170301155243.GA3290@jama>
References: <cover.1483696378.git.patrick.ohly@intel.com>
	<6787329b6c24642352cd015ae22b5dfa579ca010.1483696378.git.patrick.ohly@intel.com>
	<CA+chaQebkND=ipbVvDGAJo=o79SsucECyyNgaaMRYyiOuVqZ2g@mail.gmail.com>
	<1487240814.13854.449.camel@intel.com> <20170301155243.GA3290@jama>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] rm_work.bbclass: clean up sooner
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
X-List-Received-Date: Wed, 01 Mar 2017 16:44:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-01 at 16:52 +0100, Martin Jansa wrote:
> On Thu, Feb 16, 2017 at 11:26:54AM +0100, Patrick Ohly wrote:
> > On Wed, 2017-02-15 at 19:32 +0100, Martin Jansa wrote:
> > > Are all changes necessary for this to work already in master?
> > 
> > Yes.
> > 
> > > Yesterday I've noticed that rm_work for some components which are
> > > early in the dependency (like qtbase) are executed relatively late
> > > (together with do_package_qa).
> > 
> > Could do_rm_work run before do_package_qa? rm_work.bbclass doesn't know
> > that, and therefore schedules do_rm_work after do_package_qa.
> > 
> > If yes, then adding a list of tasks that can be ignored would be
> > trivial. This can be a variable, so a recipe can even add their own
> > ones, if necessary.
> 
> That's now what I've meant.
> 
> I believe that rm_work needs to be executed after do_package_qa, but I
> don't understand the scheduler code enough (at least not yet) to say
> that higher priority of rm_work task also makes all the tasks rm_work
> depends on e.g. do_package_qa to be executed sooner.

I see. do_package_qa should have a high priority, but it's still blocked
by its dependencies. Building those dependencies only gets an indirect
boost from scheduling recipes that many other recipes depend on first (a
feature of the normal scheduler).

I suspect the problem with do_package_qa is similar to the problem with
do_build before: it depends on do_package_qa of everything a recipe
depends on, and thus finishing the build of those other recipes also
blocks finishing the current recipe. That creates very deep dependency
chains and thus increases the number of recipes which are "in progress"
at the same time.

> Another interesting test from today was to run:
> # rm -rf tmp-glibc/*
> # bitbake -n zlib | tee log.zlib.rm_work
> # cd oe-core; git revert -1 936179754c8d0f98e1196ddc6796fdfd72c0c3b4; cd ..
> # rm -rf tmp-glibc/*
> # bitbake -n zlib | tee log.zlib.rm_work.revert
> 
> and it shows interesting difference that many rm_work tasks aren't
> executed at all:
> 
> # grep rm_work log.zlib.rm_work* | grep zlib_
> log.zlib.rm_work:NOTE: Running task 526 of 527 (/OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 128 of 721 (virtual:native:/OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 717 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 721 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work_all)
> 
> # grep rm_work log.zlib.rm_work* | grep gcc
> log.zlib.rm_work.revert:NOTE: Running task 2 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-source_6.3.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 240 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross-initial_6.3.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 250 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_6.3.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 634 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_6.3.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 674 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_6.3.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 678 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_6.3.bb:do_rm_work)
> 
> # grep -c rm_work log.zlib.rm_work*
> log.zlib.rm_work:1
> log.zlib.rm_work.revert:63
> 
> I'll check if it's something in my setup or if this happens everywhere now.

I'll try to double-check this myself, too.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




