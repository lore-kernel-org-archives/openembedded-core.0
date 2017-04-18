Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 20DB871AD1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 08:44:32 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 18 Apr 2017 01:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,218,1488873600"; d="scan'208";a="91135229"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 18 Apr 2017 01:44:33 -0700
Received: from drozhkov-desk.fi.intel.com (drozhkov-desk.fi.intel.com
	[10.237.72.60])
	by linux.intel.com (Postfix) with ESMTP id 3DD636A4006;
	Tue, 18 Apr 2017 01:44:22 -0700 (PDT)
Message-ID: <1492505071.7102.5.camel@linux.intel.com>
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
Date: Tue, 18 Apr 2017 11:44:31 +0300
In-Reply-To: <CAJTo0LYA8nsexqtfwz4bbOYA1HtnRDxCcKGZE8Jz+m+=tOcTdA@mail.gmail.com>
References: <20170413083344.22737-1-dmitry.rozhkov@linux.intel.com>
	<85c346c4-f6d6-c853-bfc5-0daa64ea2db8@linux.intel.com>
	<CAJTo0LYA8nsexqtfwz4bbOYA1HtnRDxCcKGZE8Jz+m+=tOcTdA@mail.gmail.com>
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python: make python2 and python3 alternatives to python
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
X-List-Received-Date: Tue, 18 Apr 2017 08:44:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-04-13 at 15:47 +0100, Burton, Ross wrote:
> 
> On 13 April 2017 at 11:15, Alexander Kanavin <alexander.kanavin@linux
> .intel.com> wrote:
> > This runs against upstream recommendation and common distro
> > practice. And it will break scripts that have not been ported to
> > Python 3. Please fix the scripts instead to refer to python 3
> > whenever possible.
> > 
> 
> Agreed.  If a script uses /usr/bin/python and gets py3, 99% of the
> time you'll get errors.

I've just checked PEP-349. It recommends that

"- The more general python command should be installed whenever any
version of Python 2 is installed and should invoke the same version of
Python as the python2 command (however, note that some distributions
have already chosen to have python implement the python3 command; see
the Rationale and Migration Notes below)."

The proposed patch doesn't violate this recommendation, because
"whenever" Python 2 is installed the python command still invokes
python2.

Also, there are other recommendations like

"- In order to tolerate differences across platforms, all new code that
needs to invoke the Python interpreter should not specify python , but
rather should specify either python2 or python3 (or the more specific
python2.x and python3.x versions; see the Migration Notes ). This
distinction should be made in shebangs, when invoking from a shell
script, when invoking via the system() call, or when invoking in any
other context.
- One exception to this is scripts that are deliberately written to be
source compatible with both Python 2.x and 3.x. Such scripts may
continue to use python on their shebang line without affecting their
portability."

If I understood correctly OE-core is not a distribution, but a tool to
create "a custom one". I would rather allow people to create
distributions where python3 is the default like in Arch Linux.

BR,
Dmitry

