Return-Path: <scott.branden@broadcom.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 74155608BE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 04:02:45 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k11so1165292wrd.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 20:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=gSFaXpN7g+oxkuUJoVlQeRzjZqB6jtsi7gNm4o4AXus=;
	b=HIAr+q1eYKAsSdqfmNEBUmHw3cUb32JcjfuZElXjm8rA/heDiVBE7cPAmmWvxzJikU
	nXqQHAqY/NENeLWYcVFrDJpTjg+vAJUUAbEruP7CMb6L0zUq1qpCH6gQ0WF3xH6S7zdk
	6HtV8jRWu9n5uxZ3XI5//WEVGtwWTaPSGS2aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=gSFaXpN7g+oxkuUJoVlQeRzjZqB6jtsi7gNm4o4AXus=;
	b=DCWGnKI6XBVIrXHI6Ws1mpIKHMgUgIAxuDU6dPJp5OgQc4zD1dNNrSCZA0dw+f2R7b
	y19cSw8y21wTpqqqg02ARzLIs5bTVPrUs2EpWVC0VsmtJWhxCMLwwIUmUsaKw6KPv99O
	MSpq1b5SSBDRLe2hty+u4fkyh4KErjHqC9oHQiKx0zQLkWa1xXmtLCI37NgmU1BAqO2s
	gQIOiD8CYTZyJ8N+ZLNS47Yy2TpTap94U/qUZenOEF6E7D4OfrJR1tWnK1aE+NtuRY/w
	t6pHhSgOwm7lADQRinhmfO/NahT++ER1egc1/ET1DseaRvwo08YFdA3pet5MQ0CVKJ4u
	KWxg==
X-Gm-Message-State: APjAAAVRfyl0hkEX+SjEyGjYwJQ1Ur+21zRDtRoC6xJIUJwxV/FDehJ4
	DzRcQhy4IkYNoc35EdvGSCIsRDwdG5OKL5gs/W7iAuv0AkQJ2c9UpIuL2RdrujJSyLqziB/XztG
	fHYgcYC26uQr9HKIzknLTBmvi8bZbKtpJTcvILdrILo2PoGUQESfdC2KUl4LrxddJ3CivlNgdr4
	M/GXBjsErP+Jg6TO0uo+0m8iY/
X-Google-Smtp-Source: APXvYqzztxKL2+6l1wz8+UrEUavlAz0gUrI45adqXnbdj9tSDyVhkrkbknNYZDVYcRCKE1gk4kQN2A==
X-Received: by 2002:adf:ea85:: with SMTP id s5mr2735177wrm.75.1581134565583;
	Fri, 07 Feb 2020 20:02:45 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	m21sm5782225wmi.27.2020.02.07.20.02.43
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 07 Feb 2020 20:02:44 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <20200208000110.29065-1-scott.branden@broadcom.com>
	<CAMKF1spdaO+wpwowYzfu=vigB+tSJPtwS46eimFenj=0hmhLFA@mail.gmail.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <55bb9c66-a419-c43d-111b-e5442db8df91@broadcom.com>
Date: Fri, 7 Feb 2020 20:02:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spdaO+wpwowYzfu=vigB+tSJPtwS46eimFenj=0hmhLFA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] x265: add x265 recipe
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
X-List-Received-Date: Sat, 08 Feb 2020 04:02:45 -0000
Content-Type: multipart/alternative;
	boundary="------------43BCF2D63A109A8E43B6406E"
Content-Language: en-US

--------------43BCF2D63A109A8E43B6406E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

On 2020-02-07 5:12 p.m., Khem Raj wrote:
>
>
> On Fri, Feb 7, 2020 at 4:01 PM Scott Branden via Openembedded-core 
> <openembedded-core@lists.openembedded.org 
> <mailto:openembedded-core@lists.openembedded.org>> wrote:
>
>     Add x265 recipe from latest revision of stable branch.
>
>
> I wonder if it belongs to core are there deps on it that we need in 
> common metadata
I simply followed where x264 recipe is located and placed x265 beside it.
Both are needed when enabled in ffmpeg.

I don't know if that answers your question as to where they should be 
located.
>
>
>
>     Signed-off-by: Scott Branden <scott.branden@broadcom.com
>     <mailto:scott.branden@broadcom.com>>
>     ---
>      meta/recipes-multimedia/x265/x265_git.bb <http://x265_git.bb> |
>     20 ++++++++++++++++++++
>      1 file changed, 20 insertions(+)
>      create mode 100644 meta/recipes-multimedia/x265/x265_git.bb
>     <http://x265_git.bb>
>
>     diff --git a/meta/recipes-multimedia/x265/x265_git.bb
>     <http://x265_git.bb> b/meta/recipes-multimedia/x265/x265_git.bb
>     <http://x265_git.bb>
>     new file mode 100644
>     index 0000000000..796fbbc13a
>     --- /dev/null
>     +++ b/meta/recipes-multimedia/x265/x265_git.bb <http://x265_git.bb>
>     @@ -0,0 +1,20 @@
>     +SUMMARY = "H.265/HEVC video encoder"
>     +DESCRIPTION = "A free software library and application for
>     encoding video streams into the H.265/HEVC format."
>     +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
>     +
>     +LICENSE = "GPLv2"
>     +LICENSE_FLAGS = "commercial"
>     +LIC_FILES_CHKSUM =
>     "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
>     +
>     +DEPENDS = "gnutls zlib libpcre"
>     +
>     +SRC_URI = "git://github.com/videolan/x265;branch=stable
>     <http://github.com/videolan/x265;branch=stable> \
>     +          "
>     +
>     +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
>     +
>     +S = "${WORKDIR}/git/source"
>     +
>     +inherit lib_package pkgconfig cmake
>     +
>     +AS[unexport] = "1"
>     -- 
>     2.17.1
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------43BCF2D63A109A8E43B6406E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi Khem,<br>
    <br>
    <div class="moz-cite-prefix">On 2020-02-07 5:12 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1spdaO+wpwowYzfu=vigB+tSJPtwS46eimFenj=0hmhLFA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, Feb 7, 2020 at 4:01
            PM Scott Branden via Openembedded-core &lt;<a
              href="mailto:openembedded-core@lists.openembedded.org"
              moz-do-not-send="true">openembedded-core@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Add x265
            recipe from latest revision of stable branch.</blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">I wonder if it belongs to core are there deps
            on it that we need in common metadata <br>
          </div>
        </div>
      </div>
    </blockquote>
    I simply followed where x264 recipe is located and placed x265
    beside it.<br>
    Both are needed when enabled in ffmpeg.<br>
    <br>
    I don't know if that answers your question as to where they should
    be located.<br>
    <blockquote type="cite"
cite="mid:CAMKF1spdaO+wpwowYzfu=vigB+tSJPtwS46eimFenj=0hmhLFA@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            <br>
            Signed-off-by: Scott Branden &lt;<a
              href="mailto:scott.branden@broadcom.com" target="_blank"
              moz-do-not-send="true">scott.branden@broadcom.com</a>&gt;<br>
            ---<br>
             meta/recipes-multimedia/x265/<a href="http://x265_git.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">x265_git.bb</a>
            | 20 ++++++++++++++++++++<br>
             1 file changed, 20 insertions(+)<br>
             create mode 100644 meta/recipes-multimedia/x265/<a
              href="http://x265_git.bb" rel="noreferrer" target="_blank"
              moz-do-not-send="true">x265_git.bb</a><br>
            <br>
            diff --git a/meta/recipes-multimedia/x265/<a
              href="http://x265_git.bb" rel="noreferrer" target="_blank"
              moz-do-not-send="true">x265_git.bb</a>
            b/meta/recipes-multimedia/x265/<a href="http://x265_git.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">x265_git.bb</a><br>
            new file mode 100644<br>
            index 0000000000..796fbbc13a<br>
            --- /dev/null<br>
            +++ b/meta/recipes-multimedia/x265/<a
              href="http://x265_git.bb" rel="noreferrer" target="_blank"
              moz-do-not-send="true">x265_git.bb</a><br>
            @@ -0,0 +1,20 @@<br>
            +SUMMARY = "H.265/HEVC video encoder"<br>
            +DESCRIPTION = "A free software library and application for
            encoding video streams into the H.265/HEVC format."<br>
            +HOMEPAGE = "<a
              href="http://www.videolan.org/developers/x265.html"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://www.videolan.org/developers/x265.html</a>"<br>
            +<br>
            +LICENSE = "GPLv2"<br>
            +LICENSE_FLAGS = "commercial"<br>
            +LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091">"file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"</a><br>
            +<br>
            +DEPENDS = "gnutls zlib libpcre"<br>
            +<br>
            +SRC_URI = "git://<a
              href="http://github.com/videolan/x265;branch=stable"
              rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/videolan/x265;branch=stable</a>
            \<br>
            +          "<br>
            +<br>
            +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"<br>
            +<br>
            +S = "${WORKDIR}/git/source"<br>
            +<br>
            +inherit lib_package pkgconfig cmake<br>
            +<br>
            +AS[unexport] = "1"<br>
            -- <br>
            2.17.1<br>
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
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------43BCF2D63A109A8E43B6406E--
