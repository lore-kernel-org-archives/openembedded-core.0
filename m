Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2574473196
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 16:24:42 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id v96so20914219ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2017 08:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=UyP5+8Nho+WZF7NT++R68NjfUaEqRlxrpF2ZFQTL/FI=;
	b=yW2Jf578U7CKUSaohjs0bnZ2G/ZbXLrwKncLSf1OxifXBR3v0xAmU1/vRlt+KrZGmG
	Gkc0g6Mf7msFLhRSonV3BzFO/m46Hbg+R9C4AaMjeORsXVKpWP1vNaEEr3e2mOI+swyI
	2uOwFTMA4qXQ/CxJvQNdghbKEHKGUffazetAgtW6SGkwDqrloF4k21Qw0m5lYPw1BsiP
	/HsBtdM5DCdDaus+Of8k5Uk+wYK6DK65W7m2GSdaho0KsnRuTVpsir35u8/rOaDs5Vjr
	nygEpZUI/xQtOHTmpJulc6MA7ffOohNfoc010AaLHi9E9/vAkyaHoaV58TTepkQDRJvG
	sDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=UyP5+8Nho+WZF7NT++R68NjfUaEqRlxrpF2ZFQTL/FI=;
	b=XtDBCWX5vyQCbEC4PZO0b2H/M2Zmj8WIMPUqN4bcvMZs8j6aGOjiL9jRgPIjlQpzGz
	e867VqNAw5d+6QIksrB70hq4QXEaO9ySpsQTcy9URbl0B7ANhg9KfnIMl+QoYv9bqPKY
	F4+kEE9Svwq0rSB4dkt8wi+L5kLM96lv9WB/I/qhTJURTAXLqp8D5BIoggBdwqBfTHkR
	rl1x07qVxe9iZNZICt1K45BI7q/7ImM2H2lfLs/KY0K+o+i+AGxsF4ktirpkFx5Ml/K5
	2V6L2AapBIMDIq4Ilo1wwPByOxIhfBeoMh7Ng025bRg8ZhQOgUk1SEFxBpKmG8hXeNIt
	yFwA==
X-Gm-Message-State: AMke39njiCroQ+rcoDGloDwb7lGHDWXwZ4z9Yn+lnalPN9Cr9D0Ybm31bXz/2FTp3K2EqFlG
X-Received: by 10.107.7.78 with SMTP id 75mr4557668ioh.165.1486657482887;
	Thu, 09 Feb 2017 08:24:42 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DC0B.dip0.t-ipconnect.de. [93.232.220.11])
	by smtp.gmail.com with ESMTPSA id
	p82sm3095564itg.15.2017.02.09.08.24.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Feb 2017 08:24:41 -0800 (PST)
Message-ID: <1486657479.13854.85.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mike Crowe <mac@mcrowe.com>
Date: Thu, 09 Feb 2017 17:24:39 +0100
In-Reply-To: <20170208134810.GA29105@mcrowe.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
	<ab94bd9c9f3c7170e2a0e40afaec42d5ec9397fd.1484318722.git-series.patrick.ohly@intel.com>
	<20170208115042.GA21576@mcrowe.com>
	<1486559082.13854.12.camel@intel.com>
	<20170208134810.GA29105@mcrowe.com>
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
X-List-Received-Date: Thu, 09 Feb 2017 16:24:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-02-08 at 13:48 +0000, Mike Crowe wrote:
> On Wednesday 08 February 2017 at 14:04:42 +0100, Patrick Ohly wrote:
> > On Wed, 2017-02-08 at 11:50 +0000, Mike Crowe wrote:
> > > On Friday 13 January 2017 at 15:52:33 +0100, Patrick Ohly wrote:
> > > > The right solution is to inject do_rm_work before do_build and after
> > > > all tasks of the recipe. Achieving that depends on the new bitbake
> > > > bb.event.RecipeTaskPreProcess and bb.build.preceedtask().
> > > 
> > > We've run into trouble with this change. We have a number of custom
> > > ancillary tasks that are used to generate source release files and run
> > > package tests. No other tasks (including do_build) depend on these tasks
> > > since they are run explicitly when required using bitbake -c; either
> > > directly or via a recrdeptask.
> > > 
> > > Running a single task continues to work correctly - presumably this is
> > > because the do_build task is not being run, so its dependencies (including
> > > rm_work) aren't run either.
> > > 
> > > Running via the recrdeptask fails. This is because for any particular
> > > recipe we end up depending on both do_build and the source release tasks.
> > > There's nothing to stop do_rm_work running before (or even during!) one of
> > > the source release tasks.
> > 
> > Can you show how you use recrdeptask and how you call bitbake to trigger
> > those extra tasks, just for my understanding?
> 
> Certainly, we have a bbclass globally in INHERIT that contains:
> 
>  addtask source_release # potential fix here
>  do_source_release() {
>      :
>  }
> 
>  addtask all_source_releases
>  xx_do_all_source_releases() {
>      :
>  }
> 
>  do_all_source_releases[nostamp] = "1"
>  do_all_source_releases[recrdeptask] += "do_all_source_releases do_source_release"
> 
>  addtask husk_recipe before do_source_release
>  python xx_do_husk_recipe() {
>     ...
>  }
> 
>  (there's also another task similar to do_husk_recipe)
> 
> and in the particular recipe that has trouble with racing against rm_work:
> 
>  do_husk_recipe() {
>     # do stuff in ${WORKDIR}
>  }
>  addtask husk_recipe after do_populate_sysroot before do_source_release
> 
> there's also a source-release-world recipe that contains:
> 
>  DEPENDS = "our-image"
> 
> and we run:
> 
>  bitbake -c all_source_releases source-release-world

I tried to replicate that with Poky master (= 226a508da), but without
luck:

/work/poky$ cat meta/classes/release-source.bbclass 
addtask source_release # potential fix here
do_source_release() {
    :
}

addtask all_source_releases
do_all_source_releases() {
    :
}

do_all_source_releases[nostamp] = "1"
do_all_source_releases[recrdeptask] += "do_all_source_releases do_source_release"

addtask husk_recipe before do_source_release
python do_husk_recipe() {
    pass
}

/work/poky$ cat meta/recipes-core/husk/husk.bb 
LICENSE = "custom"

do_husk_recipe() {
    # do stuff in ${WORKDIR}
    :
}
addtask husk_recipe after do_populate_sysroot before do_source_release

/work/poky$ cat meta/recipes-core/husk/source-release-world.bb
LICENSE = "custom"
DEPENDS = "core-image-sato"

/work/poky/build$ tail -1 conf/local.conf
INHERIT += "rm_work release-source"

/work/poky/build$ bitbake --dry-run -c all_source_releases source-release-world
...

That last command does not trigger the do_rm_work task and thus there is
also no race.

I had a hunch that it is related to populating the sysroot and how it
might depend on do_build in the dependencies, but that's not it. I added
DEPENDS="m4" to the husk.bb above and it has an effect:

/work/poky/build$ bitbake -g -c all_source_releases husk
Loading cache: 100% |
#################################################################################| Time: 0:00:00
Loaded 1324 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: PN build list saved to 'pn-buildlist'
NOTE: PN dependencies saved to 'pn-depends.dot'
NOTE: Package dependencies saved to 'package-depends.dot'
NOTE: Task dependencies saved to 'task-depends.dot'
/work/poky/build$ grep -e 'husk.*->.*m4' task-depends.dot 
"husk.do_all_source_releases" -> "m4.do_source_release"
"husk.do_all_source_releases" -> "m4-native.do_source_release"
"husk.do_prepare_recipe_sysroot" -> "m4.do_populate_sysroot"

But it does not cause m4.do_build and thus m4.do_rm_work to run.

> > > It seems that we need to ensure that do_rm_work also needs to depend on our
> > > ancillary tasks too, but only if they are being built. I'm unsure how this
> > > can be done though. :(
> > 
> > How do you determine whether the tasks need to run? Does it depend on
> > how bitbake is invoked or does it depend on specific properties of the
> > recipe?
> 
> Running bitbake as above.
> 
> I think that I could fix this by changing:
> 
>  addtask source_release
> 
> to
> 
>  addtask source_release before do_rm_work
> 
> (and also fixing any other tasks that suffer from this problem)
> 
> but I was hoping that there was a better fix to rm_work.bbclass itself.

It seems unsafe to have tasks that are not properly ordered and just
rely on not activating them in the same build, but without understanding
the problem better it is too early to look for a solution.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




