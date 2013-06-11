Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6088B6A9A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 13:24:19 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Jun 2013 06:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,845,1363158000"; d="scan'208";a="253477492"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Jun 2013 06:24:18 -0700
Date: Tue, 11 Jun 2013 16:24:17 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Tasslehoff Kjappfot <tasskjapp@gmail.com>
Message-ID: <20130611132417.GE7181@lpalcu-linux>
References: <51B6EF5E.1020404@gmail.com> <20130611124350.GD7181@lpalcu-linux>
	<51B7219D.7070703@gmail.com>
MIME-Version: 1.0
In-Reply-To: <51B7219D.7070703@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SDK relocation issues
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
X-List-Received-Date: Tue, 11 Jun 2013 13:24:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2013 at 03:09:49PM +0200, Tasslehoff Kjappfot wrote:
> 
> I have time for one more :)
> 
> What does it mean that the SDK is relocatable? That I can choose
> when I run the .sh where I want to install it? Is it then "bound" to
> that directory, so that every dev that wants to use the SDK have to
> run the installer on their machine?

That's correct. Each developer can install the SDK wherever he/she wants
to.

> Maybe my "I can copy it wherever
> I want" interpretation of relocatable is the problem :)
Indeed, that's causing the issue. :)

> 
> The DL is shipped with the toolchain, but is looked for in the path
> I installed to when I run the .sh. If I move the entire folder, I
> get the problems.
When the relocation process takes place, it changes the path to the
dynamic loader in all binaries. Moving the SDK to another location would
imply re-running the installer again and choose the new location as
destination.

Thanks,
Laurentiu

> 
> Regards,
> Tasslehoff
> 
> 
> 
> 

