Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CB1587030B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jul 2014 08:41:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2014 01:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,648,1400050800"; d="scan'208";a="542358102"
Received: from pskulath-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.160])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2014 01:41:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Saul Wold <sgw@linux.intel.com>
Date: Sat, 12 Jul 2014 09:41:13 +0100
Message-ID: <1658509.iXhpYTtWFZ@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.2 (Linux/3.15.4-200.fc20.x86_64; KDE/4.13.2; x86_64; ; )
In-Reply-To: <CAJTo0LZrUCY5Fh97H06nEoROHcLkZB9R7xUjEC8SGLD7EvtYvQ@mail.gmail.com>
References: <cover.1404997871.git.roxana.ciobanu@intel.com>
	<53BE9A21.8060606@linux.intel.com>
	<CAJTo0LZrUCY5Fh97H06nEoROHcLkZB9R7xUjEC8SGLD7EvtYvQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] latencytop: fix mount error
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
X-List-Received-Date: Sat, 12 Jul 2014 08:41:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 10 July 2014 15:46:21 Burton, Ross wrote:
> On 10 July 2014 14:50, Saul Wold <sgw@linux.intel.com> wrote:
> > I think Ross's suggestion of using stat() to check for the existance of a
> > file in debugfs would be better.
> 
> At least one good way of checking if a directory is a mount point is
> to compare the device of / and /debug using stat().  For example:
> 
> $ stat -c %d /
> 2049
> $ stat -c %d /sys
> 13
> 
> Different devices, so /sys is a mount.

This came up a while back in another context, and someone (Phil?) pointed out 
the "mountpoint" standard Unix command which does exactly this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

