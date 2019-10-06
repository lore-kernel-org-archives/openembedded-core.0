Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 763026BBE6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Oct 2019 17:31:42 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id y22so7139085pfr.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Oct 2019 10:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=h9Lf4u8WqzQ5umsGEpVrsLtX8S+wNqVu/jcP+buXB80=;
	b=WbiRyuz7LahFWYEVRb3xMBC+7Oknoq67TOoZcbPHIuVSO0RCazjtKzbCJEmkhc92Cf
	3kpMTP3X/sIsu/IzRtvRqfoCcIJHeYpeScK6nOOtqXjwA48snuUNvblXB8GxMuUeKQ2Q
	anRVrT9Al2UdL8UhS7f3r42IKNkV1CvnNZIn99nlKYrdYzTGFIAr4QaYK5pM12T7vHU3
	q5kydxFp4SJVJZ1oaQL3wnUB7n+ymAjJEXHplU81OCcmAmO5rWGZ8vxQUqCOyaFS6R4X
	Hmswkt9Ugvngl+rXkzgo9Kf3BEG2jltYFJcOpIifa7InzDa9tn7JrmvZXl9A960MBbAK
	FX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=h9Lf4u8WqzQ5umsGEpVrsLtX8S+wNqVu/jcP+buXB80=;
	b=Qp3cR5bexEuxYJeIMkoU5gMl/jLHE3isNMaGipDOKokkLLb0xV/d3BIiFapmXt/5fD
	Fx5r97F/ng6nre+vH4fqPwXSUns80Qh9mI0GlN+611jfL2gZb+VojVkK0eVzhbOkMwkj
	7tXp//w447uFqO2KDGoBjdR+v9ffqHY5KwwXa8PdU6AIFwPWQPt/k0lrgP40kEwXuuzW
	WETWWycmKpec29DLTdxtvwG+eU8LO8EqvuOFq7Y/RJlCERLL89+/ApaO/I2//JtZyJAO
	uFXTnIKmggjgYxPxfdywoLc9R2BuXCs29C3B9FfzsNYCE2I7e2Cm5/depLl6l0GV5VeY
	CURQ==
X-Gm-Message-State: APjAAAU8Zmfo4vbsDkiZq7jGvhaJWQ5w+lR0HsJyiMxEToSqTwnQdaGX
	vrTvkLPbV7RDvOIc9Rh/cuDEKvMfYIk=
X-Google-Smtp-Source: APXvYqy3/cdoiEg+vhILCuFB2ql2GKAlyq7LB1/NI5x5gPfUg7+zuhFdpQ/DqQ5P0ScWQ22cm0xT8A==
X-Received: by 2002:a63:5d0e:: with SMTP id r14mr26598387pgb.15.1570383103123; 
	Sun, 06 Oct 2019 10:31:43 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:65e8:7322:d189:1d85?
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	y7sm12160774pfn.142.2019.10.06.10.31.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Oct 2019 10:31:42 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1570375187.git.akuster808@gmail.com>
	<CA+chaQdc5=7MgKwr673FdhJZ8RBKj=nA_sUy_uJRpzZqmM6MjQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <a1ee452f-ccdf-3b1c-19ea-bec682a253ed@gmail.com>
Date: Sun, 6 Oct 2019 10:31:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdc5=7MgKwr673FdhJZ8RBKj=nA_sUy_uJRpzZqmM6MjQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [warrior] 0/8] Patch review
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
X-List-Received-Date: Sun, 06 Oct 2019 17:31:42 -0000
Content-Type: multipart/alternative;
	boundary="------------071125A1C0A6FA38B8636DFB"
Content-Language: en-US

--------------071125A1C0A6FA38B8636DFB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 10/6/19 9:38 AM, Martin Jansa wrote:
> Can you please add:
> http://git.openembedded.org/openembedded-core/commit/?id=f7a470531d4bcc2888cbb9a7b197b86174f3aba2
>
> it does apply cleanly in warrior.

queued up.

thanks

>
> Thanks
>
> On Sun, Oct 6, 2019 at 5:24 PM Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Next series to review.
>
>     Please comment by Monday.
>     All these have already been sent to the list so short review period.
>
>
>     The following changes since commit
>     acc0f4a6a99fe9367e57a5c2a4f995b6f4db4a9f:
>
>       runqemu: Add support for kvm on aarch64 (2019-10-01 10:48:46 +0100)
>
>     are available in the git repository at:
>
>       git://git.openembedded.org/openembedded-core-contrib
>     <http://git.openembedded.org/openembedded-core-contrib>
>     stable/warrior-nmut
>       http://cgit.openembedded.org//log/?h=stable/warrior-nmut
>
>     Adrian Bunk (1):
>       json-c: Don't --enable-rdrand
>
>     Alexander Kanavin (1):
>       python: update to 3.7.3
>
>     Andrii Bordunov via Openembedded-core (1):
>       classes/image-live.bbclass: Don't hardcode cpio.gz
>
>     Anuj Mittal (1):
>       python3: upgrade 3.7.3 -> 3.7.4
>
>     Armin Kuster (2):
>       qemu: Fix CVE-2019-8934
>       qemu: fix build issue on new hosts with glibc 2.30
>
>     Dan Tran (1):
>       unzip: Fix CVE-2019-13232
>
>     Jan Klare (1):
>       systemd: update SRCREV for systemd v241-stable
>
>      meta/classes/image-live.bbclass                    |   2 +-
>      meta/recipes-core/systemd/systemd.inc              |   2 +-
>      meta/recipes-devtools/json-c/json-c_0.13.1.bb
>     <http://json-c_0.13.1.bb>      |   2 -
>      ...ysconfig-append-STAGING_LIBDIR-python-sys.patch |   2 +-
>      ...2-distutils-prefix-is-inside-staging-area.patch |   2 +-
>      .../python/python3/CVE-2018-20852.patch            | 124 -------
>      .../python/python3/CVE-2019-9636.patch             | 154 ---------
>      .../python/python3/CVE-2019-9740.patch             | 151 ---------
>      .../python/{python3_3.7.2.bb <http://python3_3.7.2.bb> =>
>     python3_3.7.4.bb <http://python3_3.7.4.bb>}  |   9 +-
>      meta/recipes-devtools/qemu/qemu.inc                |   3 +
>      ...nux-user-assume-__NR_gettid-always-exists.patch |  49 +++
>      ...rename-gettid-to-sys_gettid-to-avoid-clas.patch |  95 ++++++
>      .../recipes-devtools/qemu/qemu/CVE-2019-8934.patch | 215
>     +++++++++++++
>      .../unzip/unzip/CVE-2019-13232_p1.patch            |  33 ++
>      .../unzip/unzip/CVE-2019-13232_p2.patch            | 356
>     +++++++++++++++++++++
>      .../unzip/unzip/CVE-2019-13232_p3.patch            | 121 +++++++
>      meta/recipes-extended/unzip/unzip_6.0.bb <http://unzip_6.0.bb>   
>            |   3 +
>      17 files changed, 882 insertions(+), 441 deletions(-)
>      delete mode 100644
>     meta/recipes-devtools/python/python3/CVE-2018-20852.patch
>      delete mode 100644
>     meta/recipes-devtools/python/python3/CVE-2019-9636.patch
>      delete mode 100644
>     meta/recipes-devtools/python/python3/CVE-2019-9740.patch
>      rename meta/recipes-devtools/python/{python3_3.7.2.bb
>     <http://python3_3.7.2.bb> => python3_3.7.4.bb
>     <http://python3_3.7.4.bb>} (97%)
>      create mode 100644
>     meta/recipes-devtools/qemu/qemu/0001-linux-user-assume-__NR_gettid-always-exists.patch
>      create mode 100644
>     meta/recipes-devtools/qemu/qemu/0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch
>      create mode 100644
>     meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
>      create mode 100644
>     meta/recipes-extended/unzip/unzip/CVE-2019-13232_p1.patch
>      create mode 100644
>     meta/recipes-extended/unzip/unzip/CVE-2019-13232_p2.patch
>      create mode 100644
>     meta/recipes-extended/unzip/unzip/CVE-2019-13232_p3.patch
>
>     -- 
>     2.7.4
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------071125A1C0A6FA38B8636DFB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 10/6/19 9:38 AM, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQdc5=7MgKwr673FdhJZ8RBKj=nA_sUy_uJRpzZqmM6MjQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Can you please add:
        <div><a
href="http://git.openembedded.org/openembedded-core/commit/?id=f7a470531d4bcc2888cbb9a7b197b86174f3aba2"
            moz-do-not-send="true">http://git.openembedded.org/openembedded-core/commit/?id=f7a470531d4bcc2888cbb9a7b197b86174f3aba2</a><br>
        </div>
        <div><br>
        </div>
        <div>it does apply cleanly in warrior.</div>
      </div>
    </blockquote>
    <br>
    queued up.<br>
    <br>
    thanks<br>
    <br>
    <blockquote type="cite"
cite="mid:CA+chaQdc5=7MgKwr673FdhJZ8RBKj=nA_sUy_uJRpzZqmM6MjQ@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Thanks</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Sun, Oct 6, 2019 at 5:24 PM
          Armin Kuster &lt;<a href="mailto:akuster808@gmail.com"
            moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Next
          series to review.<br>
          <br>
          Please comment by Monday.<br>
          All these have already been sent to the list so short review
          period.<br>
          <br>
          <br>
          The following changes since commit
          acc0f4a6a99fe9367e57a5c2a4f995b6f4db4a9f:<br>
          <br>
            runqemu: Add support for kvm on aarch64 (2019-10-01 10:48:46
          +0100)<br>
          <br>
          are available in the git repository at:<br>
          <br>
            git://<a
            href="http://git.openembedded.org/openembedded-core-contrib"
            rel="noreferrer" target="_blank" moz-do-not-send="true">git.openembedded.org/openembedded-core-contrib</a>
          stable/warrior-nmut<br>
            <a
            href="http://cgit.openembedded.org//log/?h=stable/warrior-nmut"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://cgit.openembedded.org//log/?h=stable/warrior-nmut</a><br>
          <br>
          Adrian Bunk (1):<br>
            json-c: Don't --enable-rdrand<br>
          <br>
          Alexander Kanavin (1):<br>
            python: update to 3.7.3<br>
          <br>
          Andrii Bordunov via Openembedded-core (1):<br>
            classes/image-live.bbclass: Don't hardcode cpio.gz<br>
          <br>
          Anuj Mittal (1):<br>
            python3: upgrade 3.7.3 -&gt; 3.7.4<br>
          <br>
          Armin Kuster (2):<br>
            qemu: Fix CVE-2019-8934<br>
            qemu: fix build issue on new hosts with glibc 2.30<br>
          <br>
          Dan Tran (1):<br>
            unzip: Fix CVE-2019-13232<br>
          <br>
          Jan Klare (1):<br>
            systemd: update SRCREV for systemd v241-stable<br>
          <br>
           meta/classes/image-live.bbclass                    |   2 +-<br>
           meta/recipes-core/systemd/systemd.inc              |   2 +-<br>
           meta/recipes-devtools/json-c/<a
            href="http://json-c_0.13.1.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">json-c_0.13.1.bb</a> 
              |   2 -<br>
           ...ysconfig-append-STAGING_LIBDIR-python-sys.patch |   2 +-<br>
           ...2-distutils-prefix-is-inside-staging-area.patch |   2 +-<br>
           .../python/python3/CVE-2018-20852.patch            | 124
          -------<br>
           .../python/python3/CVE-2019-9636.patch             | 154
          ---------<br>
           .../python/python3/CVE-2019-9740.patch             | 151
          ---------<br>
           .../python/{<a href="http://python3_3.7.2.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">python3_3.7.2.bb</a>
          =&gt; <a href="http://python3_3.7.4.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">python3_3.7.4.bb</a>} 
          |   9 +-<br>
           meta/recipes-devtools/qemu/qemu.inc                |   3 +<br>
           ...nux-user-assume-__NR_gettid-always-exists.patch |  49 +++<br>
           ...rename-gettid-to-sys_gettid-to-avoid-clas.patch |  95
          ++++++<br>
           .../recipes-devtools/qemu/qemu/CVE-2019-8934.patch | 215
          +++++++++++++<br>
           .../unzip/unzip/CVE-2019-13232_p1.patch            |  33 ++<br>
           .../unzip/unzip/CVE-2019-13232_p2.patch            | 356
          +++++++++++++++++++++<br>
           .../unzip/unzip/CVE-2019-13232_p3.patch            | 121
          +++++++<br>
           meta/recipes-extended/unzip/<a href="http://unzip_6.0.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">unzip_6.0.bb</a> 
                   |   3 +<br>
           17 files changed, 882 insertions(+), 441 deletions(-)<br>
           delete mode 100644
          meta/recipes-devtools/python/python3/CVE-2018-20852.patch<br>
           delete mode 100644
          meta/recipes-devtools/python/python3/CVE-2019-9636.patch<br>
           delete mode 100644
          meta/recipes-devtools/python/python3/CVE-2019-9740.patch<br>
           rename meta/recipes-devtools/python/{<a
            href="http://python3_3.7.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">python3_3.7.2.bb</a>
          =&gt; <a href="http://python3_3.7.4.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">python3_3.7.4.bb</a>}
          (97%)<br>
           create mode 100644
meta/recipes-devtools/qemu/qemu/0001-linux-user-assume-__NR_gettid-always-exists.patch<br>
           create mode 100644
meta/recipes-devtools/qemu/qemu/0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch<br>
           create mode 100644
          meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch<br>
           create mode 100644
          meta/recipes-extended/unzip/unzip/CVE-2019-13232_p1.patch<br>
           create mode 100644
          meta/recipes-extended/unzip/unzip/CVE-2019-13232_p2.patch<br>
           create mode 100644
          meta/recipes-extended/unzip/unzip/CVE-2019-13232_p3.patch<br>
          <br>
          -- <br>
          2.7.4<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a href="mailto:Openembedded-core@lists.openembedded.org"
            target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
          <a
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------071125A1C0A6FA38B8636DFB--
