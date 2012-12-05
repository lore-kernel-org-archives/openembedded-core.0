Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TgHA4-0007Ye-EY for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 16:45:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB5FUwjs019291;
	Wed, 5 Dec 2012 15:30:58 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18639-05; Wed,  5 Dec 2012 15:30:54 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB5FUpve019285
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 5 Dec 2012 15:30:52 GMT
Message-ID: <1354721441.25268.117.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 05 Dec 2012 15:30:41 +0000
In-Reply-To: <CAP9ODKpZjFRF3FYWzf3BMWYuEBzbb1YrXyG3zpj5OJVdkrNEYw@mail.gmail.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
	<02baf1072c98ba7c93c92bda589a1500ebbadba6.1354626535.git.laurentiu.palcu@intel.com>
	<CAP9ODKpZjFRF3FYWzf3BMWYuEBzbb1YrXyG3zpj5OJVdkrNEYw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches, about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] rootfs generation: export two new variables to postinst scriptlets
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
X-List-Received-Date: Wed, 05 Dec 2012 15:45:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-12-04 at 13:07 -0200, Otavio Salvador wrote:
> 
> 
> 
> On Tue, Dec 4, 2012 at 11:59 AM, Laurentiu Palcu
> <laurentiu.palcu@intel.com> wrote:
>         In order for the postinst scriptlets to be able to run once we
>         need to
>         export the location of the intercept scripts and also the
>         location of
>         native sysrootfs. The gdk-pixbuf binaries will need the latter
>         because
>         in order to generate the loaders.cache it will need to scan
>         some shared
>         libraries that must be native. Even though the output is a
>         text file.
>         
>         Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>         ---
>          meta/classes/package_rpm.bbclass |    2 ++
>          meta/classes/rootfs_deb.bbclass  |    2 ++
>          meta/classes/rootfs_ipk.bbclass  |    2 ++
>          3 files changed, 6 insertions(+)
>         
>         diff --git a/meta/classes/package_rpm.bbclass
>         b/meta/classes/package_rpm.bbclass
>         index 1ff92ce..c7ac07a 100644
>         --- a/meta/classes/package_rpm.bbclass
>         +++ b/meta/classes/package_rpm.bbclass
>         @@ -475,6 +475,8 @@ export D="${target_rootfs}"
>          export OFFLINE_ROOT="\$D"
>          export IPKG_OFFLINE_ROOT="\$D"
>          export OPKG_OFFLINE_ROOT="\$D"
>         +export INTERCEPT_DIR="${WORKDIR}/intercept_scripts"
>         +export NATIVE_ROOT=${STAGING_DIR_NATIVE}
> 
> 
> The NATIVE_ROOT seems a duplication, I'd prefer you to use
> STAGING_DIR_NATIVE in code as this is a known variable name and makes
> it easy to understand.
 
I'm going to disagree on that, I think this does make sense in the
context of the functions we're changing here.

On the other hand I'd love to simplify the whole *OFFLINE_ROOT mess but
that is for a different patch...

Cheers,

Richard




