Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 95E446AC3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 12:23:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 13 Apr 2016 05:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,479,1455004800"; d="scan'208";a="685555773"
Received: from mbabyjoh-mobl.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Apr 2016 05:23:17 -0700
Date: Wed, 13 Apr 2016 15:24:11 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20160413122411.GA11999@mbabyjoh-desk.ger.corp.intel.com>
References: <1460448862-16134-1-git-send-email-jussi.kukkonen@intel.com>
	<570E2F11.4070308@mlbassoc.com>
	<CAHiDW_GLpb20KWeHX4s6BmcbmX4tAv9ORvbBqzbfaK5CMYQ8JA@mail.gmail.com>
	<570E37F7.3020309@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <570E37F7.3020309@mlbassoc.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] matchbox-keyboard: Hide desktop launcher
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
X-List-Received-Date: Wed, 13 Apr 2016 12:23:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Apr 13, 2016 at 02:13:43PM +0200, Gary Thomas wrote:
> On 2016-04-13 14:08, Jussi Kukkonen wrote:
> >On 13 April 2016 at 14:35, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:

<snip>
> >
> >Have you checked that your /etc/formfactor/machconfig contains "HAVE_KEYBOARD=0"? This value is used by
> >/etc/matchbox/session to decide whether to load the keyboard panel or not, and by .the Xsession script to decide whether
> >to start the daemonized keyboard or not.
> 
> Has this or any of the files it depends on (/etc/formfactor/*) changed recently?
> As I said, as recently as mid February everything worked as expected, no longer.
> If something changed that I need to track, I'm happy to adapt.
>

Yes, there was a change in Keyboard related logic in formfactor with this recent commit:

commit 463fd5ee26c5037b0f4ecfe4bc6ed48945b3b07e
Author: Ross Burton <ross.burton@intel.com>
Date:   Thu Mar 3 16:56:43 2016 +0000

 formfactor: assume a keyboard is plugged in
        
 A sensible assumption is that BSPs have a USB keyboard and mouse connected
 unless told otherwise, so flip the logic in the formfactor config script that
 previously assumed that a keyboard was not connected by default.
                       
 [ YOCTO #9174 ]
                                
(From OE-Core rev: a82ce3e477a475dccea3837eabacd9e93b873ee6)
                                       
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 <snip>
if [ -z "$HAVE_KEYBOARD" ]; then
 -    HAVE_KEYBOARD=0
 +    HAVE_KEYBOARD=1


Best Regards,
Maxin

