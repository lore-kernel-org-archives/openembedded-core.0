Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 50A7C6FF78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 08:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5D8I9TE031450; Mon, 13 Jun 2016 09:18:09 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GNwY8TBlMYjE; Mon, 13 Jun 2016 09:18:09 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5D8I7LD031447
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 13 Jun 2016 09:18:08 +0100
Message-ID: <1465805887.13979.199.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2016 09:18:07 +0100
In-Reply-To: <1465802599.13979.195.camel@linuxfoundation.org>
References: <cover.1465697985.git.Qi.Chen@windriver.com>
	<c7d3b5b5d732304a31a843147fd123eda27a4794.1465697985.git.Qi.Chen@windriver.com>
	<1465802599.13979.195.camel@linuxfoundation.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 4/9] gzip: upgrade to 1.8
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
X-List-Received-Date: Mon, 13 Jun 2016 08:18:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-06-13 at 08:23 +0100, Richard Purdie wrote:
> On Sun, 2016-06-12 at 10:21 +0800, Chen Qi wrote:
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/recipes-extended/gzip/{gzip_1.6.bb => gzip_1.8.bb} | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename meta/recipes-extended/gzip/{gzip_1.6.bb => gzip_1.8.bb}
> > (100%)
> > 
> > diff --git a/meta/recipes-extended/gzip/gzip_1.6.bb b/meta/recipes
> > -extended/gzip/gzip_1.8.bb
> > similarity index 100%
> > rename from meta/recipes-extended/gzip/gzip_1.6.bb
> > rename to meta/recipes-extended/gzip/gzip_1.8.bb
> 
> WARNING: gzip-1.8-r0 do_fetch: Checksum mismatch for local file
> /home/pokybuild/yocto-autobuilder/yocto-worker/build
> -appliance/build/build/downloads/gzip-1.8.tar.gz
> Cleaning and trying again.
> WARNING: gzip-1.8-r0 do_fetch: Renaming /home/pokybuild/yocto
> -autobuilder/yocto-worker/build-appliance/build/build/downloads/gzip
> -1.8.tar.gz to /home/pokybuild/yocto-autobuilder/yocto-worker/build
> -appliance/build/build/downloads/gzip-1.8.tar.gz_bad
> -checksum_732553152814b22dc35aa0267df5286c
> ERROR: gzip-1.8-r0 do_fetch: Checksum failure fetching 
> http://ftp.gnu.org/gnu/gzip/gzip-1.8.tar.gz
> ERROR: gzip-1.8-r0 do_fetch: Function failed: Fetcher failure for
> URL: 'http://ftp.gnu.org/gnu/gzip/gzip-1.8.tar.gz'. Checksum
> mismatch!
> File: '/home/pokybuild/yocto-autobuilder/yocto-worker/build
> -appliance/build/build/downloads/gzip-1.8.tar.gz' has md5 checksum
> 732553152814b22dc35aa0267df5286c when
> 38603cb2843bf5681ff41aab3bcd6a20 was expected
> File: '/home/pokybuild/yocto-autobuilder/yocto-worker/build
> -appliance/build/build/downloads/gzip-1.8.tar.gz' has sha256 checksum
> 1ff7aedb3d66a0d73f442f6261e4b3860df6fd6c94025c2cb31a202c9c60fe0e when
> 97eb83b763d9e5ad35f351fe5517e6b71521d7aac7acf3e3cacdb6b1496d8f7e was
> expected
> If this change is expected (e.g. you have upgraded to a new version
> without updating the checksums) then you can use these lines within
> the recipe:
> SRC_URI[md5sum] = "732553152814b22dc35aa0267df5286c"
> SRC_URI[sha256sum] =
> "1ff7aedb3d66a0d73f442f6261e4b3860df6fd6c94025c2cb31a202c9c60fe0e"
> Otherwise you should retry the download and/or check with upstream to
> determine if the file has become corrupted or otherwise unexpectedly
> modified.

The patch directory also needed renaming. I've merged fixes into 
-next...

Cheers,

Richard

