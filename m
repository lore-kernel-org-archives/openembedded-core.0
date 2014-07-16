Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 20AAC7036A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 09:11:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6G9BTPd024026; Wed, 16 Jul 2014 10:11:30 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4od_8sMfken7; Wed, 16 Jul 2014 10:11:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6G9BQXZ024023
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 10:11:28 +0100
Message-ID: <1405501880.20402.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster@mvista.com>
Date: Wed, 16 Jul 2014 10:11:20 +0100
In-Reply-To: <1405388483-30716-1-git-send-email-akuster@mvista.com>
References: <1405388483-30716-1-git-send-email-akuster@mvista.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] V2 lz4: update to latest version
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
X-List-Received-Date: Wed, 16 Jul 2014 09:11:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-07-14 at 18:41 -0700, Armin Kuster wrote:
> update to version r119
> Use github instead of svn

I'm still a little concerned about this change from svn to git. Which is
the definitive source? It looks like the svn repo is active too?

I just don't want to end up in a position where we're pulling from
someone's hack'n'dev version of lz4 rather than the place considered the
real "master" source...

Cheers,

Richard


> LICENSE md5sum changed since it was updated in r117
> FIxes CVE-2014-4611
> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-support/lz4/lz4_git.bb | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta/recipes-support/lz4/lz4_git.bb
> 
> diff --git a/meta/recipes-support/lz4/lz4_git.bb b/meta/recipes-support/lz4/lz4_git.bb
> new file mode 100644
> index 0000000..3978d76
> --- /dev/null
> +++ b/meta/recipes-support/lz4/lz4_git.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Extremely Fast Compression algorithm"
> +DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
> +
> +SRCREV = "28fd251bc7b42e5cde15f9a2d78fc53b3b575558"
> +SRC_URI= "git://github.com/Cyan4973/lz4.git;branch=master"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
> +
> +do_install() {
> +	oe_runmake install
> +}
> +
> +BBCLASSEXTEND += "native nativesdk"
> -- 
> 1.9.1
> 



