Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id C365A7E9BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 16:19:59 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id k20so5992927ios.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 09:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Kv+JtZU+4scCBjJpqcTxIynhN2YJzwezPcDnU6gBUQM=;
	b=aXXQHm9SWjwnkiU9j/cYsv97+i7JwfeaZJIRrW8onCuh2enVrvJlpV8GJc/2KuhhtN
	5Q0M1bTQ3oI+O0vEVTqahfuKvCkBHniCCBYJSZB+ZkBWhJuBPfchcWrz93HH8czsW7fu
	CwqGcOK03XMhWrb8ra164p7B8dNeIX1zyZwf+f7nTaA5T/IDpxo8vilFxW6f3GnTEaOc
	HCZ0DOWqv0PleFJ/8yVzPSsNvAVoN/XB2XE7h1f67o5Jeh2hdenOqDCRRlWIrPwc/kfV
	jO0unuLXuZg/uf/8AozeTv1rpKraVimNOtX1eqSY0fJb3d/sUjzrRe7ZgpGFu9sAGxY8
	tQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Kv+JtZU+4scCBjJpqcTxIynhN2YJzwezPcDnU6gBUQM=;
	b=ActxHQ5V9KmYnkHTzlbocTi1lyg8OX2yMLpYSIcQuv5m69Va7JzdnxKffsHsRAGIdD
	igGylBF0Bdl3eksq/oSkLXdTtoTRW92DdSWsU7uLp8K3YXrkOponb4yCYEoxqDLRqEq5
	kl4Mrzv51nEjjT5tubs9FMdNMOTRai89nx1kUNVC2Psx3NuBzWQ85+C7i0rpZccCuqiF
	Q29ja6frZIhSVgg1w0Nu2nBu/S8JXUO2hU3SWJsYI4f8RcxyaOJXn8+2pZPEWLGBkD9+
	Keooepi9U9WLylbre64xC1+TesMxls91iQqz9z7rFxdsp0aO09Kz9UA59uX9nzNm5O8x
	BPmA==
X-Gm-Message-State: APjAAAUfd/yBoSqP+oLv0JVSXWGkm6/TK68zkQ2qlTJKDMdW8WhzBvUl
	bjRRXf6nWDMGcmk+dwgZH4fOPGzpWibGX+VO3OReZg==
X-Google-Smtp-Source: APXvYqyfHd3keZXiIBKCA+oDuVZBl6gDKfNIhsTQd80QXDQRBwt99SVQ9IWNg5qsPltMV+GSPkRl9rIKJks1ycd7uVY=
X-Received: by 2002:a6b:38c3:: with SMTP id f186mr5361942ioa.187.1561652400799;
	Thu, 27 Jun 2019 09:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190627135440.15815-1-JPEWhacker@gmail.com>
In-Reply-To: <20190627135440.15815-1-JPEWhacker@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 27 Jun 2019 17:19:49 +0100
Message-ID: <CAJTo0LZkKvgOCmDiWaRCnRV4bvMdtZba8sDEMHdJxtGxTZkisQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix locale DEPENDS
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
X-List-Received-Date: Thu, 27 Jun 2019 16:19:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Jun 2019 at 14:55, Joshua Watt <jpewhacker@gmail.com> wrote:
> gettext is required to generate the glibc locales in do_compile. If not
> present, glibc will skip the generation which isn't reproducible.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc_2.29.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
> index 073d1533e37..c400ee10b0f 100644
> --- a/meta/recipes-core/glibc/glibc_2.29.bb
> +++ b/meta/recipes-core/glibc/glibc_2.29.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=cfc0ed77a9f62fa62eded042ebe31d72 \
>        file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
>        file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
>
> -DEPENDS += "gperf-native bison-native make-native"
> +DEPENDS += "gperf-native bison-native make-native gettext-native"

Dont we want this to respect the NLS flag or similar?

Ross

