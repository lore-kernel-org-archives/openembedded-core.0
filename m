Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 269FA787B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 09:10:24 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2018 01:10:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,543,1511856000"; d="scan'208";a="205776668"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2018 01:10:23 -0800
Date: Wed, 21 Feb 2018 11:13:10 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180221091309.GA8210@mbabyjoh-desk.ger.corp.intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
	<1519029438-11092-13-git-send-email-maxin.john@intel.com>
	<CAJTo0LYjvxdw-cr9P9He_+KMsW0XdOK-D2ch3qzaAB6OsMmSEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYjvxdw-cr9P9He_+KMsW0XdOK-D2ch3qzaAB6OsMmSEw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/27] kmod: define bashcompletiondir
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
X-List-Received-Date: Wed, 21 Feb 2018 09:10:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Wed, Feb 21, 2018 at 12:09:36AM +0000, Burton, Ross wrote:

>>On 19 February 2018 at 08:37, Maxin B. John <maxin.john@intel.com> wrote:
>>
>> After moving to pkgconf, kmod package qa test fails without it.
>
>Is this failing because pkgconf returns a full path (/path/to/my/build/usr/share/bash-completion) instead of the path in the pc (/usr/share/bash-completion)?  In the context of a target path in a makefile, the latter is correct and the former is very wrong.

Due to this line in configure.ac:
with_bashcompletiondir=$($PKG_CONFIG --variable=completionsdir bash-completion)

combined with this:
$(INSTALL_DATA) $$files "$(DESTDIR)$(bashcompletiondir)"

>I really do think that the pkgconfig and pkgconf maintainers need to be locked in a room and argue this out.  It's not a drop-in replacement if the behaviour changes...

Good suggestion :) 
While ageeing that these changes doesn't look good, I will try to find other reasonable fixes, if any.

>Ross
Best Regards,
Maxin


