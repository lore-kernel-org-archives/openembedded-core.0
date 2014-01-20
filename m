Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8D4476D315;
	Mon, 20 Jan 2014 18:29:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2014 10:24:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,691,1384329600"; d="scan'208";a="441800298"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.196.58]) ([10.7.196.58])
	by orsmga001.jf.intel.com with ESMTP; 20 Jan 2014 10:29:00 -0800
Message-ID: <1390242540.3441.36.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Nick D'Ademo <nickdademo@gmail.com>
Date: Mon, 20 Jan 2014 10:29:00 -0800
In-Reply-To: <CANR6C55w4BGDQadD5+Udv=2ae6nBUZiO8UdfVnFdSDkHGb2L9w@mail.gmail.com>
References: <20140106112936.C3F0C50472@opal> <20140109144245.GF3709@jama>
	<1389763343.3092.17.camel@dvhart-mobl4.amr.corp.intel.com>
	<52D62433.8020402@windriver.com> <20140115103059.GH3717@jama>
	<CANR6C55w4BGDQadD5+Udv=2ae6nBUZiO8UdfVnFdSDkHGb2L9w@mail.gmail.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : autogen-native: upgrade to 5.18.2
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
X-List-Received-Date: Mon, 20 Jan 2014 18:29:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Reverting the patch allows me to move forward, but yes, I'm surprised we
aren't seeing more build failures.... I wonder what makes us special?

On Tue, 2014-01-21 at 00:08 +1100, Nick D'Ademo wrote:
> Any update on this one? (it's actually a showstopper to my build)
> Is a fix in progress? Alternatively, I can try and tackle it.
> 
> 
> Nick
> 
> 
> 
> On Wed, Jan 15, 2014 at 9:30 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>         On Wed, Jan 15, 2014 at 02:01:23PM +0800, Robert Yang wrote:
>         >
>         >
>         > On 01/15/2014 01:22 PM, Darren Hart wrote:
>         > > On Thu, 2014-01-09 at 15:42 +0100, Martin Jansa wrote:
>         > >> On Mon, Jan 06, 2014 at 11:29:36AM +0000,
>         git@git.openembedded.org wrote:
>         > >>> Module: openembedded-core.git
>         > >>> Branch: master
>         > >>> Commit: 6bcd2dafa379badab11bff9d7b607f7f5d72fc94
>         > >>> URL:
>          http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=6bcd2dafa379badab11bff9d7b607f7f5d72fc94
>         > >>>
>         > >>> Author: Robert Yang <liezhi.yang@windriver.com>
>         > >>> Date:   Fri Dec 27 01:05:14 2013 +0800
>         > >>>
>         > >>> autogen-native: upgrade to 5.18.2
>         > >>>
>         > >>> * Upgrade from 5.17.4 to 5.18.2
>         > >>> * Rename files -> autogen
>         > >>>
>         > >>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>         > >>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>         > >>
>         > >> Fails in world builds:
>         > >
>         > > Guessing I'm behind somewhere - seeing this as well. I
>         thought it was an
>         > > sstate issue, but doesn't appear to be. Is this addressed
>         in a MUT build
>         > > or something already?
>         > >
>         >
>         > Hi Darren,
>         >
>         > I'm trying to figure out the reason, but haven't got much
>         progress yet.
>         
>         
>         Does autogen autodetect guile like make-4 does? RP fixed it in
>         make
>         yesterday.
>         
>         --
>         Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>         
>         
>         _______________________________________________
>         Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>         
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



