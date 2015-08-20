Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 41730737F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 16:20:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 20 Aug 2015 09:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="772530139"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2015 09:20:58 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 277E16A4087; Thu, 20 Aug 2015 09:20:10 -0700 (PDT)
Received: from 10.252.47.114
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Thu, 20 Aug 2015 19:20:10 +0300 (EEST)
Message-ID: <53995.10.252.47.114.1440087610.squirrel@linux.intel.com>
In-Reply-To: <CAHyyKNnpUqqsDahww8wCKbDCrFSS8Ry7cdnpmTYXx0ipgxx0JA@mail.gmail.com>
References: <CAHyyKNnpUqqsDahww8wCKbDCrFSS8Ry7cdnpmTYXx0ipgxx0JA@mail.gmail.com>
Date: Thu, 20 Aug 2015 19:20:10 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Alex M" <0xf777@gmail.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Phonon is not available Qt 4.8.7
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
X-List-Received-Date: Thu, 20 Aug 2015 16:21:01 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> Hello!
> I have a piece of my custom software which is depends on Qt4 + Phonon +
> gstreamer 0.1 and two years ago I had successfully built oe-core image.
> Recent version of oe-core (19 Aug 2015) contain QT_PHONON ?= "-no-phonon"
> option inside qt4.inc file. Why this option banned in default Qt 4
> configuration? Also I do not see qt4-plugin-phonon-backend-gstreamer
> package in recent version, which my software also requires. Other
> gstreamer-0.1 components is fine and already built. What I should do to
> activate Phonon support for Qt4 in oe-core?

The reasons for this are explained here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=6294

In the short term, don't use the master branch of oe-core. Use the current
stable branch (fido) which should still have the Qt4 with Phonon enabled.
It's also possible to use the master branch, by creating a custom layer
with a .bbappend file that tweaks the Qt4 build options, but I think it's
less hassle to roll back to fido.

In the long term, do port your software to Qt5. Qt4 itself goes out of
support at the end of 2015, and we plan to move it out of oe-core around
same time.

Alex

