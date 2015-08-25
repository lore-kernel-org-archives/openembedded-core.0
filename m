Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 84DF065CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 20:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7PKkrgp028381; Tue, 25 Aug 2015 21:46:53 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GyA08Zvpf1Pe; Tue, 25 Aug 2015 21:46:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7PKkeVI028377
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 25 Aug 2015 21:46:52 +0100
Message-ID: <1440535600.12105.442.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Aug 2015 21:46:40 +0100
In-Reply-To: <F48F6534-0553-41E1-84C9-45181AA4FCDC@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
	<9bf77291c7084cfdef86008d204932e7adb1067a.1440446290.git.raj.khem@gmail.com>
	<CAJTo0LZLhzWSo-vN79hKbOdZ-N7U+zD_wECtXCAGgN5y56=Y2A@mail.gmail.com>
	<F48F6534-0553-41E1-84C9-45181AA4FCDC@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/17] python-distribute, python-setuptools: Migrate to good old python-setuptools
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
X-List-Received-Date: Tue, 25 Aug 2015 20:46:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-08-25 at 13:34 -0700, Khem Raj wrote:
> 
> > On Aug 25, 2015, at 9:26 AM, Burton, Ross <ross.burton@intel.com>
> > wrote:
> > 
> > On 24 August 2015 at 21:03, Khem Raj <raj.khem@gmail.com> wrote:
> >         setuptools the old king is ruling again, distribute fork has
> >         been merged
> >         into setuptools starting 0.7x, so lets move to use it as
> >         well
> > 
> > 
> > This fails dramatically on the autobuilder with the core error
> > being:
> > 
> > ERROR: Nothing PROVIDES 'python-setuptools-native' (but
> > virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm64/build/meta/recipes-devtools/python/python-git_1.0.1.bb DEPENDS on or otherwise requires it). Close matches:
> >   python3-setuptools-native
> >   python3-setuptools
> >   python-scons-native
>

> I can not reproduce it. I did bitbake nativesdk-python-git
> from scratch and all worked fine. I used qemux86 but I guess its
> target independent problem. How do you reproduce it.

"bitbake buildtools-tarball" seemed to reproduce issues, as did a
"bitbake world -c fetch" on the autobuilder so I'd try those.

Cheers,

Richard





