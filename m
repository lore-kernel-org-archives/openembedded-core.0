Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9180273D2B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 09:30:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3F9UfMk008677
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Apr 2015 02:30:41 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 15 Apr 2015 02:30:41 -0700
Message-ID: <552E2FBF.9030701@windriver.com>
Date: Wed, 15 Apr 2015 17:30:39 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
	<CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
	<CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
	<552DC27E.3060804@windriver.com>
	<CAJTo0LYB+2tqXJj5KbpCSvW8TyPHeoZo78f9UrK0S6Z9X9MfKA@mail.gmail.com>
In-Reply-To: <CAJTo0LYB+2tqXJj5KbpCSvW8TyPHeoZo78f9UrK0S6Z9X9MfKA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] libepoxy: DEPENDS on virtual/mesa
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
X-List-Received-Date: Wed, 15 Apr 2015 09:30:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/15/2015 04:32 PM, Burton, Ross wrote:
>
> On 15 April 2015 at 02:44, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     virtual/mesa or virtual/egl depends on virtual/libx11, so I didn't add
>     virtual/libx11, I updated virtual/mesa -> virtual/egl in the repo.
>
>
> That's not strictly true.  Mesa depends on libx11 if it's enabled, but EGL
> doesn't.  This should be an explicit dependency, and we need to be able to
> control X11 enabled/disabled as otherwise we've lost the ability to ship GTK+
> without X11.

Thanks, updated in the repo:

-DEPENDS = "util-macros"
+DEPENDS = "util-macros virtual/egl virtual/libx11"


   git://git.openembedded.org/openembedded-core-contrib rbt/6fixes

// Robert

>
> Ross

