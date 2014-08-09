Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id C633C65F2A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 13:17:25 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20140809131725539
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 13:17:25 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=35508 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XG6WP-0003hK-5m; Sat, 09 Aug 2014 09:17:21 -0400
Date: Sat, 9 Aug 2014 09:17:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <53E54245.4070704@linux.intel.com>
Message-ID: <alpine.LFD.2.11.1408090914290.7338@localhost>
References: <alpine.LFD.2.11.1408081529290.23581@localhost>
	<53E54245.4070704@linux.intel.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Remove "SRC_URI_OVERRIDES_PACKAGE_ARCH = 0" from tslib.bb
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
X-List-Received-Date: Sat, 09 Aug 2014 13:17:29 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 8 Aug 2014, Saul Wold wrote:

> On 08/08/2014 12:31 PM, Robert P. J. Day wrote:
> >
> > Given that there are no machine-specific files for the tslib recipe
> > anymore, might as well remove this line.
> >
>
> Robert,
>
> Can you please review the commit guidelines
>
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>
> The summary line should be in the form of
> tslib: Remove ...

  serious question -- how does one identify the "primary item" under
consideration if it's scattered over several files. recently, i
submitted a patch to remove a few references to "do_package_write",
a deleted task. the existing references under meta/:

conf/documentation.conf:do_package_write[doc] = "Creates the actual packages and places them in the Package Feed area"
recipes-core/meta/meta-ide-support.bb:do_populate_ide_support[recrdeptask] = "do_package_write"
recipes-core/meta/package-index.bb:do_package_write[noexec] = "1"
recipes-devtools/installer/adt-installer_1.0.bb:do_package_write[noexec] = "1"

  i'm assuming, in this case, the primary item would be
"do_package_write"?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


