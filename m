Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id CAB4878998
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 17:33:49 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id k81-v6so14535678oib.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 10:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OO45QE+Ym07S4syZv8Oaqm+FKEYu9+h35dmbMlUsl4o=;
	b=Z9YhQKW5Vskd444+lJU+T444ymWkBE0CSqaPC4ghqBuxnnjjo6Oqig9FMjaY0Wn86U
	4vwqdlAemzdz8Ab0I3kKf7j0U5l+DR1Dz05mTxLY65X+H8ZgEsIzlKYLl3uT2URt4oFm
	LeE9RGQxlD3Oxl9rAvIPuTsnV68wn2/vb2y4PlJL2vYLS3y4+uylg31FLvuEsxyVTIdT
	tFxh7spI3qQnNVO5WNEKg+GtCT22SnmLnbinBsEg4b2XgQoyJroi+gVCRJgU9EcIWHDc
	mUqQMr4AqoIqe40ZMxVyhFlnIaIWq2ZIR+5hFe6j5SP79l2wpmiOLpkTISPoZcEm4JJS
	cFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OO45QE+Ym07S4syZv8Oaqm+FKEYu9+h35dmbMlUsl4o=;
	b=uiSpHl28PVIQDqLvMUgvSvGhBjJZqrsjAY4mhppuKkFrbS0G1+SG+NuzsK87iY0Cea
	pQQ3tYDJjKyu0tlTKTzMs88mXnBqozFvWaWlPHhSwpuzOhLvXtg9TDZBD/GffrjLhbj+
	c99KKpWDo1zk5o09g61xJ8fd1+2ZqG8jSu6PkVAl3EhxnA296ebuUNsVe/ymjzV/oSrQ
	tMrdS3Wu50wAOjtbE4W5c9sxqnMesoyBjahLrno4MuwKoLyB6eauBAsklQmofDJPAYOY
	XUVbd+9MVRCpuUzptgatj26Ox2EdTqe5JbVB5GaPyebxwiXHFFbiHvicxPmepH4EvY7+
	i82w==
X-Gm-Message-State: AOUpUlF0TGyZ8DrKxcjUn2WOCE0jKNdvR5hHDr5+xOM3/wVkvyUJCapF
	UHjHxZ2sLvGZ+8UVIqJ6ykbL590ZX3XCvlK+hYA=
X-Google-Smtp-Source: AAOMgpcwnsIGi5cIWoEHbewL6f2ArqpKHh26LEJXdQwB7zmhCUflE2FGMBU+/hvK1vid5BcCXILNsNYT9phSAKsnAhI=
X-Received: by 2002:aca:3d4:: with SMTP id
	203-v6mr10524330oid.321.1532799230562; 
	Sat, 28 Jul 2018 10:33:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Sat, 28 Jul 2018 10:33:50
	-0700 (PDT)
In-Reply-To: <1532734081-24485-1-git-send-email-armccurdy@gmail.com>
References: <1532734081-24485-1-git-send-email-armccurdy@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 28 Jul 2018 19:33:50 +0200
Message-ID: <CANNYZj-i+TTnMA8NG8+YQZ-PTFdBE2V16HXrpLxGFwp5Sqzy8g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] openssl_1.0: drop obsolete ca.patch
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
X-List-Received-Date: Sat, 28 Jul 2018 17:33:49 -0000
Content-Type: text/plain; charset="UTF-8"

Andre, do take a look at 1.1 as well. As soon as the final openssl
1.1.1 is released (and I get the powerful build box my new employer
promised), I'll send a patchset that makes 1.1 the default - I'm not
sure you should put all this effort into a soon obsolete version.

Alex

2018-07-28 1:27 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
> This patch adds a second line to the -help output of the CA.pl script
> (which lists almost the same command line options as the line above
> it but in a slightly different order). Although it's tagged as a
> Debian backport, there's no patch like it in recent Debian patch sets
> for openssl 1.0.2.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  .../openssl/openssl-1.0.2o/debian/ca.patch         | 22 ----------------------
>  .../recipes-connectivity/openssl/openssl_1.0.2o.bb |  1 -
>  2 files changed, 23 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch
> deleted file mode 100644
> index fb745e4..0000000
> --- a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Upstream-Status: Backport [debian]
> -
> -Index: openssl-0.9.8m/apps/CA.pl.in
> -===================================================================
> ---- openssl-0.9.8m.orig/apps/CA.pl.in  2006-04-28 00:28:51.000000000 +0000
> -+++ openssl-0.9.8m/apps/CA.pl.in       2010-02-27 00:36:51.000000000 +0000
> -@@ -65,6 +65,7 @@
> - foreach (@ARGV) {
> -       if ( /^(-\?|-h|-help)$/ ) {
> -           print STDERR "usage: CA -newcert|-newreq|-newreq-nodes|-newca|-sign|-signcert|-verify\n";
> -+          print STDERR "usage: CA -signcert certfile keyfile|-newcert|-newreq|-newca|-sign|-verify\n";
> -           exit 0;
> -       } elsif (/^-newcert$/) {
> -           # create a certificate
> -@@ -165,6 +166,7 @@
> -       } else {
> -           print STDERR "Unknown arg $_\n";
> -           print STDERR "usage: CA -newcert|-newreq|-newreq-nodes|-newca|-sign|-verify\n";
> -+          print STDERR "usage: CA -signcert certfile keyfile|-newcert|-newreq|-newca|-sign|-verify\n";
> -           exit 1;
> -       }
> - }
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
> index 9e5e7ec..ee1c1f7 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
> @@ -23,7 +23,6 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://engines-install-in-libdir-ssl.patch \
>             file://debian1.0.2/block_diginotar.patch \
>             file://debian1.0.2/block_digicert_malaysia.patch \
> -           file://debian/ca.patch \
>             file://debian/c_rehash-compat.patch \
>             file://debian/debian-targets.patch \
>             file://debian/man-dir.patch \
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

