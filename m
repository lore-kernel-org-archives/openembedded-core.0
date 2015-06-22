Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DACA975A69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 12:36:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Jun 2015 05:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,659,1427785200"; d="scan'208";a="751046119"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga002.jf.intel.com with ESMTP; 22 Jun 2015 05:34:23 -0700
Message-ID: <558800DF.60005@linux.intel.com>
Date: Mon, 22 Jun 2015 15:34:39 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>	<1434547172-24620-6-git-send-email-alexander.kanavin@linux.intel.com>	<CAHiDW_EwLwe52-VXnJTctjMS5+4pevuOE1CZwHuEbc_xRQ=4Zw@mail.gmail.com>	<5582AA4A.9000202@linux.intel.com>	<CALbNGRQ5C5cMEPZEyYe03dJfMdAkyH-WiaWjoZCH77Y-DJ+f4A@mail.gmail.com>	<5582C4B8.4010408@linux.intel.com>	<CALbNGRRJjqzrfeJAY0ximXfCa0HpLxYB-2d51vfJDDvOgnfpkg@mail.gmail.com>
	<CALbNGRTj_Z-UqkrAXVCXqpKUgpYX+mewKFe6kgdeV0+XY60-Og@mail.gmail.com>
In-Reply-To: <CALbNGRTj_Z-UqkrAXVCXqpKUgpYX+mewKFe6kgdeV0+XY60-Og@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/22] Update libnotify to version 0.7.6
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
X-List-Received-Date: Mon, 22 Jun 2015 12:36:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/20/2015 12:41 AM, Andreas Müller wrote:

> Emotional part: I am sorry for my last email's style and I hope this
> does not cause lack of motivation on your side. This was definitely
> not an email that should have gone out this way.

Thank you Andreas, I very much appreciate you saying this. Also my email 
had the wrong tone, a bit too blunt and provocative perhaps.

> Technical part: Although your patches break things I think _now_ that
> they point in the right direction. The old gnome stuff turns into a
> maintenance burden with every new tool/library introduced. As Martin
> pointed out: I have tried to update libnotify two years ago and
> stopped due to huge fallout.
> Now we expect same but the situation is different: We have stable
> releases of better quality than two years ago. If still interested in
> gnome 2 style user experience and not accepting gnome 3 one could work
> with releases (or implement/use alternatives Mate/Xfce..).

I have looked at recent commit history for meta-gnome; my impression is 
that it only gets ad-hoc patching so that things still compile, and 
nobody is doing a systematic effort to keep things up to date and 
working. So the layer is effectively unmaintained and slowly bit rots.

> One note regarding gnome 3: I played around with gnome 3 long time ago
> but stopped messing around with gobject-introspection which looked
> mandatory for some packages. I think if we want to migrate meta-gnome
> to gnome 3 we should think of migrating meta-gir to meta-gnome.

Yes; getting gobject-introspection to work and perhaps taking it into 
oe-core is something that we'd really like to do, so I plan to look at 
it when I have a bit of breathing space later this or next week.


Regards,
Alex

