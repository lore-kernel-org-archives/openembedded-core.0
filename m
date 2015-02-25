Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 261F173630
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 18:14:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 25 Feb 2015 10:06:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,646,1418112000"; d="scan'208";a="683355249"
Received: from besquive-mobl.zpn.intel.com (HELO [10.219.4.156])
	([10.219.4.156])
	by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2015 10:14:34 -0800
Message-ID: <1424888075.6730.19.camel@besquive-mobl.amr.corp.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Saul Wold <sgw@linux.intel.com>
Date: Wed, 25 Feb 2015 12:14:35 -0600
In-Reply-To: <CAJTo0LYsD6SZO71Q6BBnX0td8LZWBeRGWXJ-Ga2LbuWMYN6OHw@mail.gmail.com>
References: <1424685241-17960-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<54ECD3C2.8040005@linux.intel.com>
	<1424816244.6730.14.camel@besquive-mobl.amr.corp.intel.com>
	<CAJTo0LYsD6SZO71Q6BBnX0td8LZWBeRGWXJ-Ga2LbuWMYN6OHw@mail.gmail.com>
Organization: Intel OTC
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: 'yes' within the path sets wrong variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: benjamin.esquivel@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Feb 2015 18:14:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-02-25 at 12:23 +0000, Burton, Ross wrote:
> 
> On 24 February 2015 at 22:17, Benjamin Esquivel
> <benjamin.esquivel@linux.intel.com> wrote:
>         > So the configure file does not get regenerated as part of
>         the standard
>         > auto-reconf?
>         >
>         No, if the fix is only applied at the configure.ac file the
>         unwanted
>         behavior still shows up from the configure file.
> 
> Yeah, gcc isn't reconfigured.  Presumably there's a good reason for
> this. :)

Saul, is there a specific part of the glibc's run.do_configure that
should re-conf?

> 
> Ross



