Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 758DC6B063
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 02:51:34 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id g11-v6so12900518ljk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Dec 2018 18:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wmtolE6aEo5MKGXlXwMrVBQLU5xf8yz1f+Z2/ZwEGr0=;
	b=luFqWl9KNw3o21zFKinpftckV+SwdAKwQFbj7VRV2Ye/Lh+vyg1pn5tbQ7KlMQWGk7
	Ev7cPToWVncMSnx2VwwR5/Knq5RXRTwhzfqAwicsOG0rxjAQjbcfzSoE6nH+1PcjkWu9
	IeadKU/ZtTH2j3WPdEcmOjWsxlRTyDQiILT8DA9HoFd5RS9m34ODyfWXEOJKxhY8Umtk
	VdZaJMoB/wMLBmWvWc5tMNKnm36lvaIOQxcxvHzUZm/USMGaUlibJyz3TtsrPfeifnNf
	W9G20VU89bjgkKBjtBJKkC0d8MBYVG5ie+ppRdOEJEYZNvid/SYnLPTNQ/f99oYdmBSO
	Po0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wmtolE6aEo5MKGXlXwMrVBQLU5xf8yz1f+Z2/ZwEGr0=;
	b=G7TmY8w2G75so7/DvEnOuGDUK/Np7ykKY/xlSOVA9weQY99mngsAEFwEqc9u5v4u/h
	vNVNSg0khaUmSfUxq/ZPge7JaslBxkKEQgRzupF+rf4LxmnvTIjgdEeRsyEZavYOXdJa
	UfkDNZzmM0ZkKTtdeVoO28rBcqR0dyFhyvtwIJYkNi9CRJTK6I7prQFBDutpkTLdPOK6
	8PtC+chLDVOWlV0xnsp36VuSpMSCyreuQe8AjGw2SzzT5nM9MS8dP7//HagDgPBKYXTP
	MM/dmdAH3MCp7SbfkvVFrxN8W0qnjLlxQGYF0DgX5p5h/N9oGgI1hrqRbWFu9Ijg4QGT
	vszw==
X-Gm-Message-State: AJcUukdhV1Z2VFuDc4mdPNhy8b2G11wRa8sO3CoplTBRPzRzb7WFNzQm
	T6a8WPJD7HihFQ/8Wh0tWw88Smm0LxKm2NeAt0JbUA==
X-Google-Smtp-Source: AFSGD/XIQWUNOC7f6d5JHsaJMeKcw56cDW2uJNAY4cf3vWpvuwUlBt+kWN9rI6QPIt4JNU1+GMgp/4AdKQs1+NgSOk4=
X-Received: by 2002:a2e:8596:: with SMTP id
	b22-v6mr10459178lji.122.1545792694745; 
	Tue, 25 Dec 2018 18:51:34 -0800 (PST)
MIME-Version: 1.0
References: <20181226014544.1991-1-zhe.he@windriver.com>
In-Reply-To: <20181226014544.1991-1-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Dec 2018 22:51:30 -0400
Message-ID: <CADkTA4Mc0hBFbW8xXzc6rT_avYobrX_pDyMA81=_kDcgSq4NRw@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: Fix build failure with fixed input and output files instead of pipe
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
X-List-Received-Date: Wed, 26 Dec 2018 02:51:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have 4.19 queued for an update to libc-headers. I'll pull this into
my queue, update it to 4.19 and submit with the rest of my changes.

Bruce

On Tue, Dec 25, 2018 at 9:46 PM He Zhe <zhe.he@windriver.com> wrote:
>
> This is an amendment for
> 2322dc4 "linux-libc-headers: Fix build failure by using fixed temporary f=
ile instead of pipe"
> which moves just the temporary input file from /tmp to build directory. B=
ut the
> build directory may not in the same file system with the output file,
> /dev/null, either and thus make it possible to trigger that bug, 67f846b,=
 in
> binutil v2.31.
>
> This patch puts both the input and output files into build directory for =
good.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  ...fixed-input-and-output-files-instead-of-.patch} | 22 ++++++++++------=
------
>  .../linux-libc-headers/linux-libc-headers_4.18.bb  |  2 +-
>  2 files changed, 11 insertions(+), 13 deletions(-)
>  rename meta/recipes-kernel/linux-libc-headers/linux-libc-headers/{0001-s=
cripts-Use-fixed-temporary-file-instead-of-pipe-for.patch =3D> 0001-scripts=
-Use-fixed-input-and-output-files-instead-of-.patch} (83%)
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/00=
01-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch b/meta/recipe=
s-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input=
-and-output-files-instead-of-.patch
> similarity index 83%
> rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers/000=
1-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
> rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-=
scripts-Use-fixed-input-and-output-files-instead-of-.patch
> index 0d8fa80939..9ba1c076e8 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scri=
pts-Use-fixed-temporary-file-instead-of-pipe-for.patch
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scri=
pts-Use-fixed-input-and-output-files-instead-of-.patch
> @@ -1,7 +1,7 @@
> -From 3bbea65e11918f8753e8006a2198b999cdb0af58 Mon Sep 17 00:00:00 2001
> +From 694eba7bb974f6b8bd308804cb24350150108b2b Mon Sep 17 00:00:00 2001
>  From: He Zhe <zhe.he@windriver.com>
>  Date: Wed, 21 Nov 2018 15:12:43 +0800
> -Subject: [PATCH] scripts: Use fixed temporary file instead of pipe for
> +Subject: [PATCH] scripts: Use fixed input and output files instead of pi=
pe for
>   here-doc
>
>  There was a bug of "as" in binutils that when it checks if the input fil=
e and
> @@ -40,31 +40,29 @@ Upstream-Status: Inappropriate [A work around for bin=
utils v2.31]
>
>  Signed-off-by: He Zhe <zhe.he@windriver.com>
>  ---
> - scripts/gcc-goto.sh | 7 ++++++-
> - 1 file changed, 6 insertions(+), 1 deletion(-)
> + scripts/gcc-goto.sh | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
>
>  diff --git a/scripts/gcc-goto.sh b/scripts/gcc-goto.sh
> -index 083c526..0aaf1b4 100755
> +index 083c526..8dfac55 100755
>  --- a/scripts/gcc-goto.sh
>  +++ b/scripts/gcc-goto.sh
> -@@ -3,7 +3,9 @@
> +@@ -3,7 +3,7 @@
>   # Test for gcc 'asm goto' support
>   # Copyright (C) 2010, Jason Baron <jbaron@redhat.com>
>
>  -cat << "END" | $@ -x c - -c -o /dev/null >/dev/null 2>&1 && echo "y"
> -+TMPFILE=3D`mktemp -p .`
> -+
> -+cat << "END" > ${TMPFILE}
> ++cat << "END" > ./input
>   int main(void)
>   {
>   #if defined(__arm__) || defined(__aarch64__)
> -@@ -20,3 +22,6 @@ entry:
> +@@ -20,3 +20,6 @@ entry:
>         return 0;
>   }
>   END
>  +
> -+$@ -x c ${TMPFILE} -c -o /dev/null && echo "y"
> -+rm ${TMPFILE}
> ++$@ -x c ./input -c -o ./output && echo "y"
> ++rm ./input ./output
>  --
>  2.7.4
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.=
18.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
> index 00420aa6f7..229a0027d7 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
> @@ -10,7 +10,7 @@ SRC_URI_append_libc-musl =3D "\
>     "
>
>  SRC_URI_append =3D "\
> -    file://0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.pat=
ch \
> +    file://0001-scripts-Use-fixed-input-and-output-files-instead-of-.pat=
ch \
>  "
>
>  SRC_URI[md5sum] =3D "bee5fe53ee1c3142b8f0c12c0d3348f9"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

