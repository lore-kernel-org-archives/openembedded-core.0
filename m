Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T3m9i-0001Zd-4t for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 12:57:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7LAjnnu012398;
	Tue, 21 Aug 2012 11:45:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32616-07; Tue, 21 Aug 2012 11:45:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7LAjgsQ012392
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 21 Aug 2012 11:45:43 +0100
Message-ID: <1345545943.3907.62.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Tue, 21 Aug 2012 11:45:43 +0100
In-Reply-To: <CAMZjud2SANYM29NkPB+JO45tO2Bm402SEKGo9410tK7FfnXDNA@mail.gmail.com>
References: <1343834167-2572-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMZjud2SANYM29NkPB+JO45tO2Bm402SEKGo9410tK7FfnXDNA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python-dbus: updated to 1.1.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 10:57:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-21 at 11:40 +0300, Marinescu, Bogdan A wrote:
> Resending.
> 
> On Wed, Aug 1, 2012 at 6:16 PM, Bogdan Marinescu
> <bogdan.a.marinescu@intel.com> wrote:
>         Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>         ---
>          .../{python-dbus_1.1.0.bb => python-dbus_1.1.1.bb} |    4
>         ++--
>          1 file changed, 2 insertions(+), 2 deletions(-)
>          rename meta/recipes-devtools/python/{python-dbus_1.1.0.bb =>
>         python-dbus_1.1.1.bb} (83%)
>         
>         diff --git a/meta/recipes-devtools/python/python-dbus_1.1.0.bb
>         b/meta/recipes-devtools/python/python-dbus_1.1.1.bb
>         similarity index 83%
>         rename from meta/recipes-devtools/python/python-dbus_1.1.0.bb
>         rename to meta/recipes-devtools/python/python-dbus_1.1.1.bb
>         index a10fda3..51d5bc2 100644
>         --- a/meta/recipes-devtools/python/python-dbus_1.1.0.bb
>         +++ b/meta/recipes-devtools/python/python-dbus_1.1.1.bb
>         @@ -8,8 +8,8 @@ PR = "r0"
>         
>          SRC_URI =
>         "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
>         
>         -SRC_URI[md5sum] = "41a459bbbb5fd92eeebd632623af0bd7"
>         -SRC_URI[sha256sum] =
>         "2dc30b53cdb2e20f8d0265af3be878e9da68745cf9ccc72f75de869094c4fc60"
>         +SRC_URI[md5sum] = "742c7432ad0f7c3f98291d58fa2e35dc"
>         +SRC_URI[sha256sum] =
>         "8917ca4fb8f4d693aee18d200cbad166b2c938dfb88c03bb4ab3d90a7c915e88"
>          S = "${WORKDIR}/dbus-python-${PV}"

This is in master:
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=516ce2fc8d2a6a330e8662921929aaf947daecb1 

?

Cheers,

Richard





