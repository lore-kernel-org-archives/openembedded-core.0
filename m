Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id F2ADB78536
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 19:06:25 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id t5so5994997pfi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 11:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=0ByAlVPKMxckjbFjv8+LgSw/8T+xrjm/CyxVUUVPjEI=;
	b=j2MRX2huD7znY7+OxPyatHusbifz+CmRHvKYkEYMHMrxmkNrx9/tIbwaTx9aYvMscE
	H1YXc3732ekSO3jOlg7uilyG/v11SxmjMcg6znoDK+Kjg3ksO0A0GSnYGHMEvvEz6XnF
	6u4gmDcjL02UxJskwh4S8jZKakv4yD5KNKBxxTcnfLqbFYgYPg4z8IatfV+hdWtiFw7O
	+ALB32+WLItDW1WxzaJH4ASOSy+y0X1ej95KOwsOc7/ORpqHmmzbhoyGVR8yDv6EROHl
	z8GbHEx6DLYauxiR4SA2/pI7yEUToG4m7+UVNwabwnP0syjEpcgqJoBjSLdO4cCmx5JX
	b38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=0ByAlVPKMxckjbFjv8+LgSw/8T+xrjm/CyxVUUVPjEI=;
	b=ca7NBbzWQva0FrBSdxeOIRoAnBHC1pDkRkbjZo369UBwVNOQARRJsyKfaBtV5M3oCO
	rRu6TprLJR/RP7mjqMMQQEwBaMvBLKario+rO1zlL+Ur+CCRuMfzOs+3yeule2EX+Qki
	bm3oJlda8jvJyOZhzx8NfMvIIgyC0RZGZ5YmM9ebyOgXiUrzGEZc01X/RvJyOMKRazbc
	dZBFkI7mLpqhKaX3t9D20nLiylmKUCFmFF+7yoxlyXVJnLuAMuMGdMFtqAeRMyDQuiOF
	zirtV3XKGjLcet2aq7xJF1ocVhzAUFIccCLXRUUhQ+0by8IG/O1WloltiLzuFEmMHKxl
	moqw==
X-Gm-Message-State: AKwxytf/hIlP+1vnOW+IL3jHRFL0GK/RWkHptfSleaWtsTmrGi5P5dw1
	O4bVeaOPucevSt7OF3Zn48Ul2Q==
X-Google-Smtp-Source: ACJfBos3Ge91NePKKWkE7KVQKr5ThmmDjqEnuyLT1nk0Kwp/BNkINJKgP6VLq8fdgAz+Icx875q5Mg==
X-Received: by 10.101.68.199 with SMTP id g7mr11419683pgs.21.1516215987001;
	Wed, 17 Jan 2018 11:06:27 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:242f:c14a:feac:fa0c?
	([2601:202:4000:1184:242f:c14a:feac:fa0c])
	by smtp.gmail.com with ESMTPSA id
	d20sm9756518pfe.166.2018.01.17.11.06.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 11:06:26 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20161018011619.31677-1-raj.khem@gmail.com>
	<1512175057-78-1-git-send-email-Martin.Jansa@gmail.com>
	<CA+chaQcbgVU+=f5Yg6QrJ0fQyY4LZU3hFAs4L+gw+HVq4sk35w@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <3353088c-10d8-3e8e-3aba-178e2c4e55b3@gmail.com>
Date: Wed, 17 Jan 2018 11:06:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcbgVU+=f5Yg6QrJ0fQyY4LZU3hFAs4L+gw+HVq4sk35w@mail.gmail.com>
Subject: Re: [morty][RESEND][PATCH] gnutls_3.5.3.bb: Fix native build on distro with kernel < 3.4.17
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
X-List-Received-Date: Wed, 17 Jan 2018 19:06:26 -0000
Content-Type: multipart/alternative;
	boundary="------------03A20E1BEB979598AFFFFAE1"
Content-Language: en-US

--------------03A20E1BEB979598AFFFFAE1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 01/15/2018 12:14 AM, Martin Jansa wrote:
> ping
>
> On Sat, Dec 2, 2017 at 1:37 AM, Martin Jansa <martin.jansa@gmail.com
> <mailto:martin.jansa@gmail.com>> wrote:
>
>     From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>

pick up now for stagging.
armin
>
>
>     When using distros which use old kernels gnutls fails to build
>     due to missing SYS_getrandom, therefore we need to check for this
>     before using it.
>     Fixes errorr e.g.
>
>     | ../../../gnutls-3.5.3/lib/nettle/rnd-linux.c: In function
>     'have_getrandom':
>     | ../../../gnutls-3.5.3/lib/nettle/rnd-linux.c:59:42: error:
>     'SYS_getrandom' undeclared (first use in this function)
>     |  #  define getrandom(dst,s,flags) syscall(SYS_getrandom,
>     (void*)dst, (size_t)s, (unsigned int)flags)
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com
>     <mailto:Martin.Jansa@gmail.com>>
>     ---
>      .../gnutls/gnutls/check_SYS_getrandom.patch        | 35
>     ++++++++++++++++++++++
>      meta/recipes-support/gnutls/gnutls_3.5.3.bb
>     <http://gnutls_3.5.3.bb>        |  1 +
>      2 files changed, 36 insertions(+)
>      create mode 100644
>     meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch
>
>     diff --git
>     a/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch
>     b/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch
>     new file mode 100644
>     index 0000000..535c22a
>     --- /dev/null
>     +++ b/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch
>     @@ -0,0 +1,35 @@
>     +From f26c3979ab0325edb2e410d287bc501cf00e0ac0 Mon Sep 17 00:00:00
>     2001
>     +From: Nikos Mavrogiannopoulos <nmav@redhat.com
>     <mailto:nmav@redhat.com>>
>     +Date: Mon, 22 Aug 2016 16:32:34 +0200
>     +Subject: [PATCH] rnd-linux: added check for SYS_getrandom being
>     defined
>     +
>     +This allows to compile the getrandom() code in old Linux systems
>     +which do not have the system call defined.
>     +---
>     +
>     +Upstream-Status: Backport
>     +Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +
>     + lib/nettle/rnd-linux.c | 6 +++++-
>     + 1 file changed, 5 insertions(+), 1 deletion(-)
>     +
>     +diff --git a/lib/nettle/rnd-linux.c b/lib/nettle/rnd-linux.c
>     +index d7f07a6..7a24d05 100644
>     +--- a/lib/nettle/rnd-linux.c
>     ++++ b/lib/nettle/rnd-linux.c
>     +@@ -56,7 +56,11 @@ static dev_t _gnutls_urandom_fd_rdev = 0;
>     + # else
>     + #  include <sys/syscall.h>
>     + #  undef getrandom
>     +-#  define getrandom(dst,s,flags) syscall(SYS_getrandom,
>     (void*)dst, (size_t)s, (unsigned int)flags)
>     ++#  if defined(SYS_getrandom)
>     ++#   define getrandom(dst,s,flags) syscall(SYS_getrandom,
>     (void*)dst, (size_t)s, (unsigned int)flags)
>     ++#  else
>     ++#   define getrandom(dst,s,flags) -1
>     ++#  endif
>     + # endif
>     +
>     + static unsigned have_getrandom(void)
>     +--
>     +libgit2 0.24.0
>     +
>     diff --git a/meta/recipes-support/gnutls/gnutls_3.5.3.bb
>     <http://gnutls_3.5.3.bb>
>     b/meta/recipes-support/gnutls/gnutls_3.5.3.bb <http://gnutls_3.5.3.bb>
>     index b2dbb07..0400588 100644
>     --- a/meta/recipes-support/gnutls/gnutls_3.5.3.bb
>     <http://gnutls_3.5.3.bb>
>     +++ b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
>     <http://gnutls_3.5.3.bb>
>     @@ -4,6 +4,7 @@ SRC_URI +=
>     "file://correct_rpl_gettimeofday_signature.patch \
>                  file://0001-configure.ac-fix-sed-command.patch \
>                  file://use-pkg-config-to-locate-zlib.patch \
>                  file://0001-Use-correct-include-dir-with-minitasn.patch \
>     +            file://check_SYS_getrandom.patch \
>                  file://CVE-2016-7444.patch \
>                 "
>      SRC_URI[md5sum] = "6c2c7f40ddf52933ee3ca474cb8cb63c"
>     --
>     2.7.4
>
>
>
>


--------------03A20E1BEB979598AFFFFAE1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 01/15/2018 12:14 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQcbgVU+=f5Yg6QrJ0fQyY4LZU3hFAs4L+gw+HVq4sk35w@mail.gmail.com">
      <div dir="ltr">ping</div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On Sat, Dec 2, 2017 at 1:37 AM, Martin
          Jansa <span dir="ltr">&lt;<a
              href="mailto:martin.jansa@gmail.com" target="_blank"
              moz-do-not-send="true">martin.jansa@gmail.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Khem
            Raj &lt;<a href="mailto:raj.khem@gmail.com"
              moz-do-not-send="true">raj.khem@gmail.com</a>&gt;<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
    pick up now for stagging.<br>
    armin<br>
    <blockquote type="cite"
cite="mid:CA+chaQcbgVU+=f5Yg6QrJ0fQyY4LZU3hFAs4L+gw+HVq4sk35w@mail.gmail.com">
      <div class="gmail_extra">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <br>
            When using distros which use old kernels gnutls fails to
            build<br>
            due to missing SYS_getrandom, therefore we need to check for
            this<br>
            before using it.<br>
            Fixes errorr e.g.<br>
            <br>
            | ../../../gnutls-3.5.3/lib/<wbr>nettle/rnd-linux.c: In
            function 'have_getrandom':<br>
            | ../../../gnutls-3.5.3/lib/<wbr>nettle/rnd-linux.c:59:42:
            error: 'SYS_getrandom' undeclared (first use in this
            function)<br>
            |  #  define getrandom(dst,s,flags) syscall(SYS_getrandom,
            (void*)dst, (size_t)s, (unsigned int)flags)<br>
            <br>
            Signed-off-by: Khem Raj &lt;<a
              href="mailto:raj.khem@gmail.com" moz-do-not-send="true">raj.khem@gmail.com</a>&gt;<br>
            Signed-off-by: Martin Jansa &lt;<a
              href="mailto:Martin.Jansa@gmail.com"
              moz-do-not-send="true">Martin.Jansa@gmail.com</a>&gt;<br>
            ---<br>
             .../gnutls/gnutls/check_SYS_<wbr>getrandom.patch        |
            35 ++++++++++++++++++++++<br>
             meta/recipes-support/gnutls/<a
              href="http://gnutls_3.5.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gn<wbr>utls_3.5.3.bb</a> 
                  |  1 +<br>
             2 files changed, 36 insertions(+)<br>
             create mode 100644 meta/recipes-support/gnutls/<wbr>gnutls/check_SYS_getrandom.<wbr>patch<br>
            <br>
            diff --git a/meta/recipes-support/gnutls/<wbr>gnutls/check_SYS_getrandom.<wbr>patch
            b/meta/recipes-support/gnutls/<wbr>gnutls/check_SYS_getrandom.<wbr>patch<br>
            new file mode 100644<br>
            index 0000000..535c22a<br>
            --- /dev/null<br>
            +++ b/meta/recipes-support/gnutls/<wbr>gnutls/check_SYS_getrandom.<wbr>patch<br>
            @@ -0,0 +1,35 @@<br>
            +From f26c3979ab0325edb2e410d287bc50<wbr>1cf00e0ac0 Mon Sep
            17 00:00:00 2001<br>
            +From: Nikos Mavrogiannopoulos &lt;<a
              href="mailto:nmav@redhat.com" moz-do-not-send="true">nmav@redhat.com</a>&gt;<br>
            +Date: Mon, 22 Aug 2016 16:32:34 +0200<br>
            +Subject: [PATCH] rnd-linux: added check for SYS_getrandom
            being defined<br>
            +<br>
            +This allows to compile the getrandom() code in old Linux
            systems<br>
            +which do not have the system call defined.<br>
            +---<br>
            +<br>
            +Upstream-Status: Backport<br>
            +Signed-off-by: Khem Raj &lt;<a
              href="mailto:raj.khem@gmail.com" moz-do-not-send="true">raj.khem@gmail.com</a>&gt;<br>
            +<br>
            + lib/nettle/rnd-linux.c | 6 +++++-<br>
            + 1 file changed, 5 insertions(+), 1 deletion(-)<br>
            +<br>
            +diff --git a/lib/nettle/rnd-linux.c
            b/lib/nettle/rnd-linux.c<br>
            +index d7f07a6..7a24d05 100644<br>
            +--- a/lib/nettle/rnd-linux.c<br>
            ++++ b/lib/nettle/rnd-linux.c<br>
            +@@ -56,7 +56,11 @@ static dev_t _gnutls_urandom_fd_rdev =
            0;<br>
            + # else<br>
            + #  include &lt;sys/syscall.h&gt;<br>
            + #  undef getrandom<br>
            +-#  define getrandom(dst,s,flags) syscall(SYS_getrandom,
            (void*)dst, (size_t)s, (unsigned int)flags)<br>
            ++#  if defined(SYS_getrandom)<br>
            ++#   define getrandom(dst,s,flags) syscall(SYS_getrandom,
            (void*)dst, (size_t)s, (unsigned int)flags)<br>
            ++#  else<br>
            ++#   define getrandom(dst,s,flags) -1<br>
            ++#  endif<br>
            + # endif<br>
            +<br>
            + static unsigned have_getrandom(void)<br>
            +--<br>
            +libgit2 0.24.0<br>
            +<br>
            diff --git a/meta/recipes-support/gnutls/<a
              href="http://gnutls_3.5.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true"><wbr>gnutls_3.5.3.bb</a>
            b/meta/recipes-support/gnutls/<a
              href="http://gnutls_3.5.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true"><wbr>gnutls_3.5.3.bb</a><br>
            index b2dbb07..0400588 100644<br>
            --- a/meta/recipes-support/gnutls/<a
              href="http://gnutls_3.5.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true"><wbr>gnutls_3.5.3.bb</a><br>
            +++ b/meta/recipes-support/gnutls/<a
              href="http://gnutls_3.5.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true"><wbr>gnutls_3.5.3.bb</a><br>
            @@ -4,6 +4,7 @@ SRC_URI += "<a class="moz-txt-link-freetext" href="file://correct_rpl_">file://correct_rpl_</a><wbr>gettimeofday_signature.patch
            \<br>
                         <a class="moz-txt-link-freetext" href="file://0001-configure.ac-fix">file://0001-configure.ac-fix</a>-<wbr>sed-command.patch
            \<br>
                         <a class="moz-txt-link-freetext" href="file://use-pkg-config-to">file://use-pkg-config-to</a>-<wbr>locate-zlib.patch
            \<br>
                         <a class="moz-txt-link-freetext" href="file://0001-Use-correct">file://0001-Use-correct</a>-<wbr>include-dir-with-minitasn.<wbr>patch
            \<br>
            +            <a class="moz-txt-link-freetext" href="file://check_SYS_getrandom">file://check_SYS_getrandom</a>.<wbr>patch \<br>
                         <a class="moz-txt-link-freetext" href="file://CVE-2016-7444.patch">file://CVE-2016-7444.patch</a> \<br>
                        "<br>
             SRC_URI[md5sum] = "<wbr>6c2c7f40ddf52933ee3ca474cb8cb6<wbr>3c"<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.7.4<br>
                <br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------03A20E1BEB979598AFFFFAE1--
