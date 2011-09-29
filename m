Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9LU1-0002mX-Jm for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 20:37:22 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TIcFPK011909; Thu, 29 Sep 2011 19:38:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id useQ2spEv11F; Thu, 29 Sep 2011 19:38:15 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TIcCmn011899
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 29 Sep 2011 19:38:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 19:31:46 +0100
In-Reply-To: <CAEsOVNeCOnucpJEcdwGxdGMcF7uaH45wKMk-TG2+GbJFs3DaEg@mail.gmail.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
	<1317270070-14250-12-git-send-email-msm@freescale.com>
	<1317311572.12332.101.camel@ted>
	<CAEsOVNeCOnucpJEcdwGxdGMcF7uaH45wKMk-TG2+GbJFs3DaEg@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317321113.12332.108.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 12/16] Fix flac build on e500mc cores
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
X-List-Received-Date: Thu, 29 Sep 2011 18:37:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-29 at 18:10 +0000, McClintock Matthew-B29882 wrote:
> On Thu, Sep 29, 2011 at 10:52 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2011-09-28 at 23:21 -0500, Matthew McClintock wrote:
> >> This core does not have altivec, so we disable it in the build,
> >> also reestablish the config option to enable/disable building
> >> with altivec
> >>
> >> If SPE is not detected we always build with altivec which is wrong. This
> >> will check to make sure altivec is enabled and pass build options
> >> through accordingly
> >>
> >> Signed-off-by: Matthew McClintock <msm@freescale.com>
> >> ---
> >>  .../flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch   |    4 +++-
> >>  meta/recipes-multimedia/flac/flac_1.2.1.bb         |    5 ++++-
> >>  2 files changed, 7 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch b/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
> >> index 658e190..5ca8b35 100644
> >> --- a/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
> >> +++ b/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
> >> @@ -39,15 +39,17 @@ diff --git a/src/libFLAC/Makefile.am b/src/libFLAC/Makefile.am
> >
> > No patch header...
> 
> This is patching a patch with a patch header. Do I need to make any
> further documentation?

No, I missed the fact the patch already existed, sorry!

I'll merge this one.

Cheers,

Richard



