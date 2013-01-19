Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Twhiz-0008Uf-Ln
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 00:21:21 +0100
Received: by mail-oa0-f43.google.com with SMTP id k1so4996568oag.30
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 15:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=KHvwOO4mXzneH5DFCqqL2ICRDzhx0UHJPwuUETW3zi8=;
	b=Hgolat2JJx6G9AN56xvyW2M1SOx3ejs0Vj18dQLyB7Z0kq11kV+FqR+DW2CgV+pnj6
	lVVkzDIeGRM/qzftUg2421EG7M/xt5vHWVets4yjoJxHiT0ce2Wi8xtygWbk4om5c9nR
	si2+Vt7uwZIeZtstKJ/3Gxd/iiB1dy+1MNH5VudNUE0xeTkAKs1UlWHsDiAHWSdVjuJT
	PklY1uz1V3SU0WwPh/xSBHE6vhlbpHK1Qq23w/X6eXgWfHDvtTispXkfapdV2iCZYBd2
	Bl+ieym2fyjddUYyk2gePb832u3TJGqPbpj5Zs651hQIaPn04Zy0wBqfvrTu+012VeX1
	g3pg==
MIME-Version: 1.0
X-Received: by 10.60.8.65 with SMTP id p1mr10902908oea.4.1358636754707; Sat,
	19 Jan 2013 15:05:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Sat, 19 Jan 2013 15:05:54 -0800 (PST)
In-Reply-To: <cover.1358634922.git.raj.khem@gmail.com>
References: <cover.1358634922.git.raj.khem@gmail.com>
Date: Sat, 19 Jan 2013 21:05:54 -0200
X-Google-Sender-Auth: oEMYq5xiBAgd8Jp0-7nDn1LJzFk
Message-ID: <CAP9ODKqRqVzNM+=jsE0uktcRFaK7Q_Kb5kW0FJ2w03OgzGTeGA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: Khem Raj <kraj@juniper.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] boost, nfs-utils upgrade, drop KERNEL_CC
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
X-List-Received-Date: Sat, 19 Jan 2013 23:21:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jan 19, 2013 at 8:39 PM, Khem Raj <raj.khem@gmail.com> wrote:
> This patchset is about upgrading boost and nfs-utils to latest
> KERNEL_CC is now formed using CC, this patch has been tested fair bit now
>
> The following changes since commit 18bc7b44ef58cbcbe32d45504d71eed54ef695a4:
>
>   guilt: add git 1.8.x support (2013-01-18 13:20:56 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib kraj/misc
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc
>
> Khem Raj (4):
>   kernel.bbclass,module-base.bbclass: Use CC to form KERNEL_CC
>   nfs-utils: Upgrade 1.2.3 -> 1.2.8-rc2
>   consolekit_0.4.5.bb: Package unpackaged systemd files
>   boost: Upgrade 1.51 -> 1.52
>
>  meta/classes/kernel-arch.bbclass                   |   13 +
>  meta/classes/kernel.bbclass                        |   16 +-
>  meta/classes/module-base.bbclass                   |   16 -
>  .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         |   37 +-
>  .../nfs-utils-1.2.1-exp-subtree-warn-off.patch     |   12 +
>  .../nfs-utils/nfs-utils-1.2.1-statdpath-man.patch  |   58 +++
>  .../nfs-utils-1.2.3-sm-notify-res_init.patch       |   21 +
>  .../nfs-utils/nfs-utils-1.2.5-idmap-errmsg.patch   |   12 +
>  .../nfs-utils/nfs-utils-nfsctl-x32-fix.patch       |   30 --
>  .../nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch  |  535 ++++++++++++++++++++
>  .../nfs-utils/nfs-utils.1.2.8.rc2.patch.1          |  535 ++++++++++++++++++++
>  .../{nfs-utils_1.2.3.bb => nfs-utils_1.2.7.bb}     |   28 +-
>  meta/recipes-support/boost/boost.inc               |    2 -
>  .../boost/{boost_1.51.0.bb => boost_1.52.0.bb}     |    8 +-
>  meta/recipes-support/boost/files/hash_enums.patch  |   45 --
>  .../recipes-support/consolekit/consolekit_0.4.5.bb |    2 +-
>  16 files changed, 1228 insertions(+), 142 deletions(-)
>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-exp-subtree-warn-off.patch
>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.1-statdpath-man.patch
>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.5-idmap-errmsg.patch
>  delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-nfsctl-x32-fix.patch
>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch
>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc2.patch.1

Something went wrong here... :)

>  rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.2.3.bb => nfs-utils_1.2.7.bb} (63%)
>  rename meta/recipes-support/boost/{boost_1.51.0.bb => boost_1.52.0.bb} (44%)
>  delete mode 100644 meta/recipes-support/boost/files/hash_enums.patch
>
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


