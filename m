Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QgpKs-0003KQ-0m
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 04:38:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 19:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="25189403"
Received: from unknown (HELO [10.255.13.215]) ([10.255.13.215])
	by orsmga002.jf.intel.com with ESMTP; 12 Jul 2011 19:34:03 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 19:33:57 -0700
In-Reply-To: <4E1CDAE7.3040501@mentor.com>
References: <cover.1310511423.git.josh@linux.intel.com>
	<1314a49d823f6e174ca09773cde0fee7ed0e1306.1310511423.git.josh@linux.intel.com>
	<4E1CDAE7.3040501@mentor.com>
X-Mailer: Evolution 3.0.2 (3.0.2-3.fc15) 
Message-ID: <1310524443.2162.29.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] classes/image_types: add a variable to list	available IMAGE_FSTYPE's
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2011 02:38:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-12 at 16:38 -0700, Tom Rini wrote:
> On 07/12/2011 04:24 PM, Joshua Lock wrote:
> > This is for use in the Hob GUI to enable the user to change the type of the
> > generated image.
> > 
> > Signed-off-by: Joshua Lock <josh@linux.intel.com>
> > ---
> >  meta/classes/image_types.bbclass |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> > 
> > diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> > index 89a745c..29d7a57 100644
> > --- a/meta/classes/image_types.bbclass
> > +++ b/meta/classes/image_types.bbclass
> > @@ -102,3 +102,5 @@ IMAGE_DEPENDS_cpio.xz = "xz-native"
> >  IMAGE_DEPENDS_ubi = "mtd-utils-native"
> >  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
> >  
> > +# This variable is available to request which values are suitable for IMAGE_FSTYPES
> > +IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz squashfs squashfs-lzma ubi ubifs"
> 
> Concept is fine, but please don't list ubi and ubifs just list ubi.
> 

Okey dokes, v2 coming up with only ubi listed. If it's as complex as
skimming this thread seems we probably don't want ubifs in a GUI...

Thanks Tom,

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



