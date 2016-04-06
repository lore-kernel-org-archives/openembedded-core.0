Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D675E7705D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 08:42:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Apr 2016 01:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,447,1455004800"; d="scan'208";a="939348257"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.6.103])
	by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2016 01:42:05 -0700
Message-ID: <1459932124.5713.1.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 06 Apr 2016 09:42:04 +0100
In-Reply-To: <57049583.8060608@windriver.com>
References: <cover.1459917622.git.dengke.du@windriver.com>
	<39560f98b94a3d0d24c44c7ff139aa1c605a8498.1459917622.git.dengke.du@windriver.com>
	<57049583.8060608@windriver.com>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] coreutils: correct the case for class-native
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
X-List-Received-Date: Wed, 06 Apr 2016 08:42:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-04-06 at 12:50 +0800, Robert Yang wrote:
> 
> On 04/06/2016 12:45 PM, Dengke Du wrote:
> > 
> > The function of do_install_append_class-native for class-native
> > had alread exist,so exclude the class-native in function
> > do_install_append.
> > 
> > Signed-off-by: Dengke Du <dengke.du@windriver.com>
> > ---
> >   meta/recipes-core/coreutils/coreutils_8.25.bb | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb
> > b/meta/recipes-core/coreutils/coreutils_8.25.bb
> > index 419a693..e8e269a 100644
> > --- a/meta/recipes-core/coreutils/coreutils_8.25.bb
> > +++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
> > @@ -70,6 +70,10 @@ do_compile_prepend () {
> >   }
> > 
> >   do_install_append() {
> > +	if [ "${CLASSOVERRIDE}" = "class-native" ]; then
> > +		return
> > +	fi
> > +

If the do_install_append is only valid for the target it'd be cleaner
to use a target-specific override i.e.

do_install_append_class-target () {
}

Thanks,

Joshua

