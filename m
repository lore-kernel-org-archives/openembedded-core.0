Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.seebs.net [162.221.74.143])
	by mail.openembedded.org (Postfix) with ESMTP id 4FDEB71AEF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 20:06:17 +0000 (UTC)
Received: from seebsdell (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id A4D602ADC8B;
	Thu,  2 Feb 2017 14:06:16 -0600 (CST)
Date: Thu, 2 Feb 2017 14:06:14 -0600
From: Seebs <seebs@seebs.net>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170202140614.37db286c@seebsdell>
In-Reply-To: <1486064629.14889.62.camel@intel.com>
References: <1486031880.14889.35.camel@intel.com>
	<20170202102105.07a3bb91@seebsdell>
	<1486053547.14889.50.camel@intel.com>
	<20170202111201.3fcee3fa@seebsdell>
	<1486055849.14889.52.camel@intel.com>
	<20170202131123.038be11f@seebsdell>
	<1486064629.14889.62.camel@intel.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: host-user-contaminated QA check
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
X-List-Received-Date: Thu, 02 Feb 2017 20:06:18 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 02 Feb 2017 20:43:49 +0100
Patrick Ohly <patrick.ohly@intel.com> wrote:

> One could argue that an implicit "created during build -> owned by
> root" follows the same logic. But as the check as it is now did find
> a real issue and also others in the past (the pseudo bugs that Chris
> mentioned), let's keep it.

I am somewhat inclined to change pseudo's default to "if there's no
entry, report something definitely invalid", or make that an available
option, because that would avoid false positives, and allow a more
rigorous QA check.

-s

