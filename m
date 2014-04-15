Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 72B1F65E5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Apr 2014 17:04:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Apr 2014 09:59:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,865,1389772800"; d="scan'208";a="521466831"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.121.134])
	by orsmga002.jf.intel.com with ESMTP; 15 Apr 2014 10:04:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Date: Tue, 15 Apr 2014 18:04:18 +0100
Message-ID: <8474154.NWdoUUSmHp@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.9-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <CAGNsrLDp9m9q4a9fSO5TZGRbqoPs6=p6EyboKX+8K5fBLJFF=Q@mail.gmail.com>
References: <1396965637-4802-1-git-send-email-fathi.boudra@linaro.org>
	<CABcZANmn9=b_onZz-mCSicPeDgxg=u4ebuDhE1KExvRDbN00Tg@mail.gmail.com>
	<CAGNsrLDp9m9q4a9fSO5TZGRbqoPs6=p6EyboKX+8K5fBLJFF=Q@mail.gmail.com>
MIME-Version: 1.0
Cc: Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 1/2] trace-cmd/kernelshark: update to 2.3.2 release (latest stable branch)
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
X-List-Received-Date: Tue, 15 Apr 2014 17:04:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 09 April 2014 22:25:31 Fathi Boudra wrote:
> On 9 April 2014 22:15, Chris Larson <clarson@kergoth.com> wrote:
> > On Wed, Apr 9, 2014 at 9:18 AM, Fathi Boudra <fathi.boudra@linaro.org>
> > 
> > wrote:
> >> On 9 April 2014 18:02, Chris Larson <clarson@kergoth.com> wrote:
> >> > On Tue, Apr 8, 2014 at 10:16 AM, Fathi Boudra <fathi.boudra@linaro.org>
> >> > 
> >> > wrote:
> >> >> On 8 April 2014 20:05, Khem Raj <raj.khem@gmail.com> wrote:
> >> >> > On Tue, Apr 8, 2014 at 7:00 AM, Fathi Boudra
> >> >> > <fathi.boudra@linaro.org>
> >> >> > 
> >> >> > wrote:
> >> >> >>  do_install() {
> >> >> >> 
> >> >> >> -       oe_runmake prefix="${prefix}" DESTDIR="${D}" install
> >> >> >> +       ${MAKE} NO_PYTHON=1 prefix=${prefix}
> >> >> >> plugin_dir=${libdir}/trace-cmd/plugins DESTDIR=${D} install
> >> >> >> 
> >> >> >>  }
> >> >> > 
> >> >> > can you explain/document this change
> >> >> 
> >> >> sure. trace-cmd doesn't have a build system generated Makefile. It's
> >> >> hand written.
> >> >> To do the install properly, one has to pass prefix/plugin_dir.
> >> >> In addition, the previous command in the recipe doesn't do the right
> >> >> thing anymore (you'll end with duplicated prefix /usr/usr/).
> >> > 
> >> > You don't need to avoid the use of oe_runmake to pass variables in,
> >> > that's
> >> > what EXTRA_OEMAKE is for :) See
> >> > https://github.com/MentorEmbedded/meta-mentor/commit/4639877 for a
> >> > version
> >> > of this fix that uses it instead.
> >> 
> >> You don't need oe_runmake or EXTRA_OEMAKE to properly build and
> >> install the files in the right path either :)
> >> You can even drop inherit pkgconfig pythonnative since they aren't
> >> used. My version is also slightly shorter to achieve the same goal.
> > 
> > oe_runmake is the convention used by nearly every recipe in oe-core.
> > Breaking that convention for no good reason accomplishes nothing.
> 
> you can argue as you prefer. reality is that  using oe_runmake on this
> particular software accomplishes nothing.

It accomplishes as much as it does anywhere else. I don't see that this recipe 
needs to be special by not using it. In any case, you've run the recipe 
through oe-stylize to make it conform to OE style guidelines that that script 
handles, surely it's not a big thing to conform to this expected style as 
well?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

