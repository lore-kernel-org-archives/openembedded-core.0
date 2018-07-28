Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 493E978CA9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 21:01:00 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id y10-v6so5531448uao.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 14:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hPURo53ykV9i9zdw7uebEtVTqssNZK1e7b+/Azmk4uA=;
	b=iJ7HL2GBi/fwV4Q4gzIKTe/JxGra/DPPbuzbarTKEfX3IjrO8spsWcoS+uJcgKMN9y
	tY/BGKdj8x8BOPz5U7zloSoA62vF+ZFgrnTtKnFCh23gUKYqoW+4tyBAgz7kivom8U1E
	EM46zE8fSWwSdLcnT7OGNdw7gVsmS6H7dj7hcRLPQrMoVo+QGu0EwZC35xD/gZmFgNPX
	wXNZzx6M/FkUlTFc3i5GvBfyAko88dN5kpBAGtgHAp/rgsAo0ZVZX9aBBUwnazPJ4TpW
	NdUjWMf4GkDKJqU9DQSW3Nse+LIwJRNFaPEAm+o0CYVvq/fmR2qaTBWld/H6kfioCIvx
	L2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hPURo53ykV9i9zdw7uebEtVTqssNZK1e7b+/Azmk4uA=;
	b=JVXWi/yU/fGj2f4DZRYnXV9ENyekRbF4r96ZSEd+FO7aYnEkmudKc7IcgehgDvY6oE
	pM+fFBvuBdqfDRkJdei187rffpjePQlH6Om3p5Jhszsb8deXXDYsocq0LJ0hytGTPEqx
	ZVxTkvhpQ9IpUth0cyvsbXwT6xzguMFd/UMKKphzwwi7ff77RphITbcv3i40Y+sbjy2e
	5KUJU7WblBhcZOoDYsa4CGT5bWjJnPeBHU1u0DT6uWcrYMWnp/iwXuLk9eIz3DQzfE0P
	huxD3jXCKY8RHC729mKAOUKJnBHofRoCc6zKEaEIyZPQgp6KfzSXw9o4wp/ZrvwnpPk0
	LUkQ==
X-Gm-Message-State: AOUpUlFgmwwJchYqGTVphp3w5e8q1DhW1iUedIQtSmEaDbswcZkh6EJd
	qxxwPfmPUxFhE/KE3YV0rJcFw+Jv0keUilpIT4k=
X-Google-Smtp-Source: AAOMgpermphSuUeQqwK1kLZg4Opo1/SHYS6FIDG7dQXKP49Y9lUWpqB/jbVfzKNBI/l3deSZU4I4pY0atEIAI3lpwEs=
X-Received: by 2002:ab0:15ac:: with SMTP id
	i41-v6mr8828703uae.150.1532811661031; 
	Sat, 28 Jul 2018 14:01:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Sat, 28 Jul 2018 14:01:00 -0700 (PDT)
In-Reply-To: <CANNYZj-i+TTnMA8NG8+YQZ-PTFdBE2V16HXrpLxGFwp5Sqzy8g@mail.gmail.com>
References: <1532734081-24485-1-git-send-email-armccurdy@gmail.com>
	<CANNYZj-i+TTnMA8NG8+YQZ-PTFdBE2V16HXrpLxGFwp5Sqzy8g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 28 Jul 2018 14:01:00 -0700
Message-ID: <CAJ86T=VZkdqViOaO41GczR=zqys2fL8zoH6aajvN_zcrGRe6hA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
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
X-List-Received-Date: Sat, 28 Jul 2018 21:01:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 28, 2018 at 10:33 AM, Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
> Andre, do take a look at 1.1 as well. As soon as the final openssl
> 1.1.1 is released (and I get the powerful build box my new employer
> promised), I'll send a patchset that makes 1.1 the default - I'm not
> sure you should put all this effort into a soon obsolete version.

I will certainly look at the 1.1 recipe too, but any work on cleaning
up the 1.0 recipe won't go to waste. I work with a silicon supplier
who's current SDK is based on daisy (they are in the process of
updating to morty). Their silicon and daisy based firmware images ship
in literally millions of products (all of them with a high speed
internet connection). Having a more robust openssl 1.0 recipe in
master gives me something I can more easily backport to the older OE
releases used in these SDKs.

> 2018-07-28 1:27 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
>> This patch adds a second line to the -help output of the CA.pl script
>> (which lists almost the same command line options as the line above
>> it but in a slightly different order). Although it's tagged as a
>> Debian backport, there's no patch like it in recent Debian patch sets
>> for openssl 1.0.2.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  .../openssl/openssl-1.0.2o/debian/ca.patch         | 22 ----------------------
>>  .../recipes-connectivity/openssl/openssl_1.0.2o.bb |  1 -
>>  2 files changed, 23 deletions(-)
>>  delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch
>> deleted file mode 100644
>> index fb745e4..0000000
>> --- a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch
>> +++ /dev/null
>> @@ -1,22 +0,0 @@
>> -Upstream-Status: Backport [debian]
>> -
>> -Index: openssl-0.9.8m/apps/CA.pl.in
>> -===================================================================
>> ---- openssl-0.9.8m.orig/apps/CA.pl.in  2006-04-28 00:28:51.000000000 +0000
>> -+++ openssl-0.9.8m/apps/CA.pl.in       2010-02-27 00:36:51.000000000 +0000
>> -@@ -65,6 +65,7 @@
>> - foreach (@ARGV) {
>> -       if ( /^(-\?|-h|-help)$/ ) {
>> -           print STDERR "usage: CA -newcert|-newreq|-newreq-nodes|-newca|-sign|-signcert|-verify\n";
>> -+          print STDERR "usage: CA -signcert certfile keyfile|-newcert|-newreq|-newca|-sign|-verify\n";
>> -           exit 0;
>> -       } elsif (/^-newcert$/) {
>> -           # create a certificate
>> -@@ -165,6 +166,7 @@
>> -       } else {
>> -           print STDERR "Unknown arg $_\n";
>> -           print STDERR "usage: CA -newcert|-newreq|-newreq-nodes|-newca|-sign|-verify\n";
>> -+          print STDERR "usage: CA -signcert certfile keyfile|-newcert|-newreq|-newca|-sign|-verify\n";
>> -           exit 1;
>> -       }
>> - }
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>> index 9e5e7ec..ee1c1f7 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
>> @@ -23,7 +23,6 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>>             file://engines-install-in-libdir-ssl.patch \
>>             file://debian1.0.2/block_diginotar.patch \
>>             file://debian1.0.2/block_digicert_malaysia.patch \
>> -           file://debian/ca.patch \
>>             file://debian/c_rehash-compat.patch \
>>             file://debian/debian-targets.patch \
>>             file://debian/man-dir.patch \
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

