Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9bHx-0005mU-LP for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 13:29:59 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UBUkxe013503 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:30:46 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nxJmk09MvmJj
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:30:46 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UBUiPV013492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:30:45 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 12:24:18 +0100
In-Reply-To: <206cf15c98897c551720e9510ff58f644b2cd304.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
	<206cf15c98897c551720e9510ff58f644b2cd304.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317381864.12332.163.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 04/13] libx11: upgrade to 1.4.4
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
X-List-Received-Date: Fri, 30 Sep 2011 11:29:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-30 at 09:27 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../xorg-lib/libx11-1.4.4/keysymdef_include.patch  |   19 +++++++
>  .../libx11-1.4.4/x11_disable_makekeys.patch        |   29 +++++++++++
>  meta/recipes-graphics/xorg-lib/libx11.inc          |   52 ++++++++++++--------
>  meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb     |   14 +++++
>  4 files changed, 94 insertions(+), 20 deletions(-)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_include.patch
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.patch
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb

This isn't an upgrade, its an addition of a new version with changes to
the core include file which likely break the previous version?

+# Below option is added to overcome the GCC bug on ARM
+# see http://gcc.gnu.org/PR42981 for further details.
+# We could potentially take it off when its fixed in gcc 4.5
+
+CFLAGS_append_arm = " -fforward-propagate "

This shouldn't really be here, it should be in the toolchain config
file, only applied for gcc 4.5 with something like:

CFLAGS_append_arm_pn-libx11 = " -fforward-propagate "

Also, there is a lot of whitespace churn in variables being added and
removed in different orders. Can we reduce that please?

Cheers,

Richard



