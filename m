Return-Path: <tom.zanussi@linux.intel.com>
X-Greylist: delayed 580 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 19 May 2014 14:10:12 UTC
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C510D65FFC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 14:10:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 May 2014 07:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,867,1392192000"; d="scan'208";a="514061595"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2014 07:00:23 -0700
Message-ID: <1400508022.24339.5.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Date: Mon, 19 May 2014 09:00:22 -0500
In-Reply-To: <1400117848-4350-1-git-send-email-joaohf@gmail.com>
References: <1400117848-4350-1-git-send-email-joaohf@gmail.com>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] wic: looking by plugins and .wks file in all layers
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
X-List-Received-Date: Mon, 19 May 2014 14:10:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2014-05-14 at 22:37 -0300, João Henrique Ferreira de Freitas
wrote:
> Hi,
> 
> This introduces a little wic usability enhanced. Now wic has the
> ability to search in all layers looking by .wks files and plugins.
> 
> The aim is to provide the layers a way to keep .wks and plugins that
> they use. Without this patch the user need to inform the full path of .wks, or put it
> in scripts directory. Or, in case of plugins, only putting in scripts directory.
> 
> Example:
> 
> In .wks case, inside my custom layer I have the following files: 
> 
> scripts/lib/image/canned-wks/
>  otns-directdisk-devel.wks
>  otns-directdisk.wks
>  otns-directsdcard-devel.wks
>  otns-directsdcard.wks
>  otns-nobml-directdisk-devel.wks
>  otns-nobml-directsdcard-devel.wks
> 
> So, I do:
> 
>  $ wic list images
>   otns-directdisk-devel                         Create a 'pcbios' direct disk image
>   otns-directdisk                               Create a 'pcbios' direct disk image
>   otns-nobml-directdisk-devel                   Create a 'pcbios' direct disk image
>   otns-nobml-directsdcard-devel                 Create a 'pcbios' direct disk image
>   otns-directsdcard                             Create a 'pcbios' direct disk image
>   otns-directsdcard-devel                       Create a 'pcbios' direct disk image
>   mkefidisk                                     Create an EFI disk image
>   directdisk                                    Create a 'pcbios' direct disk image
> 
> And to plugins case, in another layer, I have:
> 
> scripts/lib/mic/plugins/source/
>  bootimg-pcbios-myplugin.py
> 
> 
> To sum up, this enhanced wic because users could keep .wks and plugins inside their own layers.
> 

Very nice enhancement, makes a lot of sense.

Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>

> I don't know if using the 'scripts/lib/' is the best to keep files in layers. Any suggestion?
> 

I think it's fine and is consistent with the current path.

Tom

> Thanks.
> 
> João Henrique Ferreira de Freitas (2):
>   wic: add support to look in all layers and get .wks file
>   wic: add support to look in all layers and get plugins
> 
>  scripts/lib/image/engine.py | 72 +++++++++++++++++++++++++++------------------
>  scripts/lib/mic/plugin.py   | 28 ++++++++++++++----
>  scripts/wic                 |  6 ++++
>  3 files changed, 72 insertions(+), 34 deletions(-)
> 



