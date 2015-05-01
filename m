Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 63EEE73DD1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 10:52:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 8FFFE600F5F
Message-ID: <1430477536.3318.8.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: "Chatre, Reinette" <reinette.chatre@intel.com>
Date: Fri, 01 May 2015 11:52:16 +0100
In-Reply-To: <0D818C7A2259ED42912C1E04120FDE26710B11FC@ORSMSX111.amr.corp.intel.com>
References: <0D818C7A2259ED42912C1E04120FDE26710B11FC@ORSMSX111.amr.corp.intel.com>
X-Mailer: Evolution 3.16.1 (3.16.1-1.fc22) 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [fido] [dizzy] Please port gummiboot install fix to fido and dizzy branches
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
X-List-Received-Date: Fri, 01 May 2015 10:52:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Reinette,

On Wed, 2015-04-29 at 17:46 +0000, Chatre, Reinette wrote:
> Hi Joshua and Armin,
> 
> We are seeing installation failures as a result of gummiboot entries 
> not being installed correctly. This is already fixed in master with 
> the commit below. It applies cleanly to fido and dizzy branches 
> since apart from this patch the file being changed has exactly the 
> same git history there as master. Could you please port this fix to 
> the fido and dizzy branches?

This patch is queued in my fido-next branch on poky-contrib[1].

Regards,

Joshua

1. http://git.yoctoproject.org/cgit/cgit.cgi/poky
-contrib/log/?h=joshuagl/fido-next

> commit fc15878af46c09512fc3cb73480359fcbb22e627
> Author: Reinette Chatre <reinette.chatre@intel.com>
> Date:   Tue Apr 14 11:49:37 2015 -0700
> 
>     init-install-efi.sh: fix gummiboot entry installation
>     
>     After selecting the "install" gummiboot option of a Live image 
> we are
>     seeing boot failure resulting from the gummiboot entries not 
> being
>     installed correctly. This seems to be a problem in this init
> -install-efi.sh
>     script where it incorrectly installs the gummiboot entries into 
> the root
>     filesystem, not the boot partition. We fix it by installing the 
> entries in
>     the boot partition.
>     
>     (From OE-Core rev: c9b06c79ed8a082d1b385e9f61721aeeda9bf1af)
>     
>     Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
>     Acked-by: Darren Hart <dvhart@linux.intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> >
> 
> Thank you very much
> 
> Reinette

