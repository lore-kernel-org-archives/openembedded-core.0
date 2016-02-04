Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B5C4A734B8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:05:10 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 04 Feb 2016 12:05:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="42599427"
Received: from ranerica-desk01.sc.intel.com (HELO [10.3.52.148])
	([10.3.52.148])
	by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2016 12:05:04 -0800
Message-ID: <1454616260.22677.169.camel@ranerica-desk01>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 04 Feb 2016 12:04:20 -0800
In-Reply-To: <CAJTo0LYodPTLumkFbfksxeNSDdbnq4B3T+vYe53KtmVy8P9BTw@mail.gmail.com>
References: <1454526437-31265-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<CAJTo0LbXnGobVdN6G_2JHx4gm2KCQCuAwFmFHhqKJYC+YCXpVQ@mail.gmail.com>
	<CAMKF1spEjpwvpZ5SsYPgOpSAiAX9D+_OnOhdytS28_J3KC58HA@mail.gmail.com>
	<CAJTo0LYodPTLumkFbfksxeNSDdbnq4B3T+vYe53KtmVy8P9BTw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: add runtime dependencies for udev-cache
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
X-List-Received-Date: Thu, 04 Feb 2016 20:05:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-02-03 at 20:56 +0000, Burton, Ross wrote:
>         I was wondering if busbox provides these applets then why pull
>         them in
>         explicitly like this
>         
> 
> Presumably Ricardo is building images without busybox?

Indeed, my build does not have busybox.



