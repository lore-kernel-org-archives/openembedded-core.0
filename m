Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 10D646022F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:04:45 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id j13so114970253iod.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 05:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=bW96RqG5EsjdYk0zufUSPNn17Rt6cU8MrbcgNak/UMc=;
	b=eH9vbwgB1kAiKBdWCy5uzbZuJ/zZEdUwFmuisADYADxnpYNMJGkCGafGqWxhTk/ADG
	1LZxmP5jHP+VhiWeqnHycdAoAFKvmW7lAGIUWE+ud7eU1QMS/KoqEN3dQlxlwpOJ5GW9
	LmayxyogMRUQveYOyOJjJ2kiNncZRU1VTwotrFZyaFOz8rXmXZOn74HLYehP9GhHGtYn
	piOr1CdYkvF9EnE0e06yTGxH0RtnDq/1E2xxh0+nezGKvWdlBa//z6rjJk7O/mA/C8/h
	+h18+/91zVDl09zx9SPT+E/l/sxT+TaTKNunMnpH/9KZ2u3Ubuqro09sAr6s+wlYFDeZ
	voeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=bW96RqG5EsjdYk0zufUSPNn17Rt6cU8MrbcgNak/UMc=;
	b=CFcFos3VR0rf/fqfxh8awi2XgU+IGX999OzhxlcPd8YVwLP7z1vdA3HtEbdcuqqPLJ
	td11DvCenzm9jy2xL+2t60CuBzk8EuWvjB/jLPS2ygHPfOHpw943du/tXJh+wRr/o63R
	ogRjxnaX+8F1y2QOJXchpnI2ilYl3eiAeLy92Va80wrpQtNChO/aUPFUo5II3i5q5R74
	SDN+xKP2MOWOI8zAmanb59cQUeFTS6Co4pNeFsrAs3TyujdizsqXLeK6tHx3KosyXbn3
	2yQjzV6glyjx+SpKA19SBU/YtX04WC7XrnGZOSH87J5oSAgnsHeW4vDOccbpAYACl0/8
	swzA==
X-Gm-Message-State: AMke39nCc9mKlHhjuCsVdjkNW37kGWrvSychTusXmlvFrNvLacb4fsARdccMP1mkmG3MNakY
X-Received: by 10.107.23.69 with SMTP id 66mr8054704iox.162.1486559086002;
	Wed, 08 Feb 2017 05:04:46 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DEB3.dip0.t-ipconnect.de. [93.232.222.179])
	by smtp.gmail.com with ESMTPSA id
	z125sm11277702iod.23.2017.02.08.05.04.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Feb 2017 05:04:44 -0800 (PST)
Message-ID: <1486559082.13854.12.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mike Crowe <mac@mcrowe.com>
Date: Wed, 08 Feb 2017 14:04:42 +0100
In-Reply-To: <20170208115042.GA21576@mcrowe.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
	<ab94bd9c9f3c7170e2a0e40afaec42d5ec9397fd.1484318722.git-series.patrick.ohly@intel.com>
	<20170208115042.GA21576@mcrowe.com>
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
X-List-Received-Date: Wed, 08 Feb 2017 13:04:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-02-08 at 11:50 +0000, Mike Crowe wrote:
> On Friday 13 January 2017 at 15:52:33 +0100, Patrick Ohly wrote:
> > Having do_rm_work depend on do_build had one major disadvantage:
> > do_build depends on the do_build of other recipes, to ensure that
> > runtime dependencies also get built. The effect is that when work on a
> > recipe is complete and it could get cleaned up, do_rm_work still
> > doesn't run because it waits for those other recipes, thus leading to
> > more temporary disk space usage than really needed.
> > 
> > The right solution is to inject do_rm_work before do_build and after
> > all tasks of the recipe. Achieving that depends on the new bitbake
> > bb.event.RecipeTaskPreProcess and bb.build.preceedtask().
> 
> We've run into trouble with this change. We have a number of custom
> ancillary tasks that are used to generate source release files and run
> package tests. No other tasks (including do_build) depend on these tasks
> since they are run explicitly when required using bitbake -c; either
> directly or via a recrdeptask.
> 
> Running a single task continues to work correctly - presumably this is
> because the do_build task is not being run, so its dependencies (including
> rm_work) aren't run either.
> 
> Running via the recrdeptask fails. This is because for any particular
> recipe we end up depending on both do_build and the source release tasks.
> There's nothing to stop do_rm_work running before (or even during!) one of
> the source release tasks.

Can you show how you use recrdeptask and how you call bitbake to trigger
those extra tasks, just for my understanding?

I suppose it worked before because your tasks could depend on do_build
without triggering do_rm_work, while now that is included.

> It seems that we need to ensure that do_rm_work also needs to depend on our
> ancillary tasks too, but only if they are being built. I'm unsure how this
> can be done though. :(

How do you determine whether the tasks need to run? Does it depend on
how bitbake is invoked or does it depend on specific properties of the
recipe?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




