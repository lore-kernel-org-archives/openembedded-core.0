Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EFBD265C60
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jul 2015 07:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6B7vhsZ015289; Sat, 11 Jul 2015 08:57:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id J7-xUYJ9QS1U; Sat, 11 Jul 2015 08:57:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6B7vUs0015274
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 11 Jul 2015 08:57:42 +0100
Message-ID: <1436601450.3310.27.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 11 Jul 2015 08:57:30 +0100
In-Reply-To: <CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Sat, 11 Jul 2015 07:57:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2015-07-11 at 00:20 -0700, Andre McCurdy wrote:
> GPLv3 was released in June 2007 and most GNU packages transitioned to
> it fairly quickly, so by definition, the pre-GPLv3 version of any GNU
> package is now very old and unsupported. We do have a precedent for
> keeping pre-GPLv3 versions alive though (a good thing for those of us
> who need them!). What makes parted different from the other pre-GPLv3
> packages which are already in oe-core?
> 
> Looking at the parted changelog, there have certainly been a lot of
> bug fixes since 1.8.7 (the last GPLv2 version) but it's difficult to
> tell how many are for functionality which would be relevant to a
> typical embedded system.
> 
>   http://git.savannah.gnu.org/cgit/parted.git/tree/NEWS
> 
> RHEL 5 seems to have been maintaining it's version of parted 1.8.1 up
> until Jan 2013. RHEL's 33 patches might be a good source of fixes for
> parted 1.8.7.
> 
>   http://vault.centos.org/5.11/os/SRPMS/parted-1.8.1-30.el5.src.rpm
> 
> As someone has volunteered to maintain the pre-GPLv3 parted recipe
> (and I'll volunteer as a secondary maintainer, if that helps)
> hopefully there would not be a "serious maintenance burden" on anyone
> who doesn't have an interest in the older version.

This does touch on something I have wondered about for a while, which is
whether the time has come to move the GPLv2 pieces to their own layer
and possibly their own maintainership. Obviously there are pros and cons
to doing that.

Thoughts?

Cheers,

Richard






