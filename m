Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 505156B7A6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 15:43:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Mar 2014 08:37:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,678,1389772800"; d="scan'208";a="474965091"
Received: from mcmahond-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.153])
	by orsmga001.jf.intel.com with ESMTP; 18 Mar 2014 08:42:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Chong Lu <Chong.Lu@windriver.com>
Date: Tue, 18 Mar 2014 15:42:01 +0000
Message-ID: <1799716.5KSDNaHqD4@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <CAJTo0LZbXvNgOAXibaLoxuViCv16QzcLdhoMxLhipkooqBtFpg@mail.gmail.com>
References: <cover.1395126237.git.Chong.Lu@windriver.com>
	<eff32371a8b9d824ff74e80bd2c3dffbf42961f4.1395126237.git.Chong.Lu@windriver.com>
	<CAJTo0LZbXvNgOAXibaLoxuViCv16QzcLdhoMxLhipkooqBtFpg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Tue, 18 Mar 2014 15:43:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 18 March 2014 15:15:23 Burton, Ross wrote:
> On 18 March 2014 07:11, Chong Lu <Chong.Lu@windriver.com> wrote:
> > +PACKAGES += "dbus-ptest"
> 
> This should be conditional on DISTRO_FEATURES containing ptest.
> 
> > +ALLOW_EMPTY_${PN}-ptest = "1"
> > +RDEPENDS_dbus-ptest = "dbus-test-ptest"
> 
> Please be consistent with the use of dbus-ptest and ${PN}-ptest.
> 
> > +RPROVIDES_dbus-ptest = "${@base_contains('DISTRO_FEATURES', 'ptest', '',
> > 'dbus-test-ptest', d)}"
>
> This line took me a minute to understand and won't be needed if the
> PACKAGES addition is conditional.

Right, agreed on all three.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

