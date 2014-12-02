Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AA17560232
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 11:46:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 02 Dec 2014 03:39:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,500,1413270000"; d="scan'208";a="631331551"
Received: from fodonogx-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.21.108])
	by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2014 03:46:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Tue, 02 Dec 2014 11:46:21 +0000
Message-ID: <2036260.XzzDUvKe82@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.3-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <547D41C7.5020303@linaro.org>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<11435118.DSGP9nSeOe@peggleto-mobl5.ger.corp.intel.com>
	<547D41C7.5020303@linaro.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Tue, 02 Dec 2014 11:46:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 01 December 2014 23:36:23 Trevor Woerner wrote:
> On 12/01/14 05:11, Paul Eggleton wrote:
> > On Friday 28 November 2014 12:28:00 Trevor Woerner wrote:
> >> Perhaps any recipe you're working on could be automatically included via
> >> an IMAGE_INSTALL_append in conf/local.conf (or maybe that's too
> >> intrusive?)?> 
> > This is something I'd wanted to do - it's certainly something that should
> > be made easy, but I was concerned about causing a full reparse just
> > because of adding that to local.conf. (There might be a workaround
> > through some sort of packagegroup for containing the packages produced by
> > the recipes in the workspace that is added once when we create the
> > workspace - maybe that's the answer?)
> 
> Maybe even just printing a bit of text after a successful "add" to
> inform the user that the just-added project isn't part of any image and
> what they might want to do to include it?
> 
> The packagegroup sounds good too. But if the user doesn't want it
> included, they might be confused about how it magically appeared, and
> have some trouble finding how to remove it.

Right. I might defer this until we get to the SDK part where we'll need 
something to handle this (since the aim in that case is to avoid any editing 
of conf files or interacting with bitbake directly).

> >> Do you envision users creating multiple workspaces? I'm wondering why
> >> "devtool create-workspace" is required. Is there any advantage to
> >> requiring users to create the workspace explicitly instead of just
> >> having it be created implicitly?
> > 
> > I wouldn't expect users to want to create multiple workspaces, but I did
> > want users to be able to (a) choose where their workspace would go and
> > (b) know that it has been created, so that the workspace layer showing up
> > in the configuration isn't a surprise.
> 
> I can't help think that there's no harm in an unused workspace (is
> there?). Maybe the empty workspace from "create-workspace" should just
> be created by default by the "oe-init-build-env" tool (or whatever a
> given project is using).

I guess my thought was that some people are fussy about their setup, and this 
is a bit of a new thing.

> If I were writing the documentation for this workflow, or giving a
> presentation on it... I'm just trying to figure out how to justify the
> extra, empty (but necessary) step of creating the environment before
> using it. Maybe if someone tries to add a project before creating the
> workspace, instead of erroring out, just run the create-workspace for
> them with the defaults. If they're a power user who wants to put the
> workspace somewhere specific then they're free to explicitly call
> create-workspace on their own, otherwise it'll get called with the
> defaults for them (or created automatically as part of the
> oe-init-build-env).
>
> To borrow the analogy from git: create-workspace is part of the pluming;
> it's there if people what to call it explicitly, otherwise it gets
> called implicitly with defaults?

Actually you make a very good case; auto-creating it (and stating so) might be 
better than failing. I'll make the change.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

