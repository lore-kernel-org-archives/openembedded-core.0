Return-Path: <sgw@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E13C172F9E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 15:13:25 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 28 Feb 2017 07:13:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,220,1484035200"; d="scan'208";a="70530557"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.4.127])
	by fmsmga005.fm.intel.com with ESMTP; 28 Feb 2017 07:13:26 -0800
Message-ID: <1488294806.22952.60.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Feb 2017 07:13:26 -0800
In-Reply-To: <CAJTo0LaWEDCdoRcS+GrBkW7D=xW7dPLn9VWKP9MkzkSmNCA7og@mail.gmail.com>
References: <1488212665-27534-1-git-send-email-sgw@linux.intel.com>
	<CAJTo0LaWEDCdoRcS+GrBkW7D=xW7dPLn9VWKP9MkzkSmNCA7og@mail.gmail.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] LICENSE: Clarify what is meant by 'metadata'
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
X-List-Received-Date: Tue, 28 Feb 2017 15:13:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-02-27 at 20:59 +0000, Burton, Ross wrote:
> 
> On 27 February 2017 at 16:24, Saul Wold <sgw@linux.intel.com> wrote:
> > The term metadata in the LICENSE text is unclear and recently
> > garnered some questions at ELC, so clarify metadata to include
> > bbclasses, which is and has been metadata as well as code.
> > 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > 
> 
> This breaks other layers (including meta-intel and meta-qt), do you
> have corresponding patches?
> 
Oh man, I did not consider recipes using the OE-Core LICENSE file as a
LIC_CHKSUM_FILE, that's sort of wrong on almost all cases except maybe
the build-appliance or some containers that also contain OE-Core meta-
data.

Layers particularly should not use OE-Core's LICENSE, so fixes to
layers will go first.

V2 coming when those are merged.

Sau!

> Ross

