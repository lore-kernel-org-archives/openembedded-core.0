Return-Path: <scott.branden@broadcom.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2A460D8A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 22:26:24 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 4so475596pfz.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 14:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=NBh9SXHJK4Yj8B56lLSmO+OgaLuURpYFpB+p+QTG0Xo=;
	b=Y35QT9ExDOM+i7iHATV2L8hZajTtoPxzd8JtnutNNees5620/2W7ECkma/pJQtyV97
	xCMUzshbCXpPf3CZEZkLqzrtQEVQlzRZDLlswOlfLmD2DxMS4xxjdp8ZYtVx8zSmpiTr
	NQwAYbvavJofoZNgCYFTA2reabNYDT0SFoDqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=NBh9SXHJK4Yj8B56lLSmO+OgaLuURpYFpB+p+QTG0Xo=;
	b=dFRn4bhHLxOCguzg0XAGQbt3Ics+qICAfNEAWzaaAFDdwhYtgAsOPLimpx8eTswDFz
	fQDrMtMaXpwGdcQC8Z1pxIg1DY9P/C/3pJXUpkDIPf9oddsSz3ESxNe49wk+/MJ5ciTh
	+6NTN1vmeBx1InT9uok5fXJtmIhP08Zt+hbn8i/uJrQ4hgm9VyzfjzVTU2vdaAeky+CY
	AKt8V4UXFratCQ9+tcDGcdy9bRj85JPWbHMhzjttcrdpostv8yw53FmfvTj0iJkt3+07
	m2pnNb9ojjs2qCj2jJ7A0MK2sQ/6NVqr/h7SmSVuvG1ylDGyni+ew9geZN78fBZq+/Kc
	rdSg==
X-Gm-Message-State: APjAAAVKGxGTbD9ay7ksq4qO9LQAlwLFZeVme/Xep+pRPL5dEaTZGdLV
	QdMEqSq9/LvSfaj5gLtr9c4Izx3vj0RSCJwCOqbWbQDGpcuXiMkv6UVBDNydOfySL2HBoiKrGct
	B7VzQJd0Mzg6oi0Pe+8XdF9/G9C3nabueDQ6a9Ke2V5o6ozwtZq4Froqhp76+mU9jxBwaM6KwLZ
	RBl5b6bDqm/avPeoyTvUPoX83X
X-Google-Smtp-Source: APXvYqx3t/kWLY4QuKl0+cChGoc9rQZDGf6+7RntKWODhiPouni6l249lC8k1WrhPZuXm8V1r+GxaA==
X-Received: by 2002:aa7:9f90:: with SMTP id z16mr1051719pfr.161.1581114385312; 
	Fri, 07 Feb 2020 14:26:25 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	q66sm4328065pfq.27.2020.02.07.14.26.24
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 07 Feb 2020 14:26:24 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200207213440.10462-1-scott.branden@broadcom.com>
	<CANNYZj9JY0joj=ddZKPzq0QyPquu_riHbAKkZOb1oEy9VQrqNw@mail.gmail.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <073d103e-a32e-ff07-1223-220f9f97dcec@broadcom.com>
Date: Fri, 7 Feb 2020 14:26:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj9JY0joj=ddZKPzq0QyPquu_riHbAKkZOb1oEy9VQrqNw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x265: add x265 recipe
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
X-List-Received-Date: Fri, 07 Feb 2020 22:26:25 -0000
Content-Type: multipart/alternative;
	boundary="------------C8E5579FA51848631EB02D4B"
Content-Language: en-US

--------------C8E5579FA51848631EB02D4B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

HI Alex,

On 2020-02-07 2:09 p.m., Alexander Kanavin wrote:
> Can you also enable x265 in ffmpeg and gstreamer plugins recipes, so 
> there would be actual users of the codec in oe-core?
I do have a patch for ffmpeg and have tested that works.  I'll add that 
to the patch series.
>
> Also, x265 git repo does have tagged releases, and so PV/SRCREV in 
> recipe should be set to match a release tag.
You'll have to help me out a little here on exactly what you want.

This is based off the stable tag.
I already specified the SRCREV in the recipe.

Do you want PV to be:
PV = "stable+git${SRCPV}"

?
>
> Alex
>
> On Fri, 7 Feb 2020 at 22:35, Scott Branden via Openembedded-core 
> <openembedded-core@lists.openembedded.org 
> <mailto:openembedded-core@lists.openembedded.org>> wrote:
>
>     Add x265 recipe from latest revision of stable branch.
>
>     Signed-off-by: Scott Branden <scott.branden@broadcom.com
>     <mailto:scott.branden@broadcom.com>>
>     ---
>      meta/recipes-multimedia/x265/x265_git.bb <http://x265_git.bb> |
>     21 +++++++++++++++++++++
>      1 file changed, 21 insertions(+)
>      create mode 100644 meta/recipes-multimedia/x265/x265_git.bb
>     <http://x265_git.bb>
>
>     diff --git a/meta/recipes-multimedia/x265/x265_git.bb
>     <http://x265_git.bb> b/meta/recipes-multimedia/x265/x265_git.bb
>     <http://x265_git.bb>
>     new file mode 100644
>     index 0000000000..7c230e2b1e
>     --- /dev/null
>     +++ b/meta/recipes-multimedia/x265/x265_git.bb <http://x265_git.bb>
>     @@ -0,0 +1,21 @@
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
>     +DEPENDS = "nasm-native"
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


--------------C8E5579FA51848631EB02D4B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    HI Alex,<br>
    <br>
    <div class="moz-cite-prefix">On 2020-02-07 2:09 p.m., Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj9JY0joj=ddZKPzq0QyPquu_riHbAKkZOb1oEy9VQrqNw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>Can you also enable x265 in ffmpeg and gstreamer plugins
          recipes, so there would be actual users of the codec in
          oe-core?</div>
      </div>
    </blockquote>
    I do have a patch for ffmpeg and have tested that works.  I'll add
    that to the patch series.<br>
    <blockquote type="cite"
cite="mid:CANNYZj9JY0joj=ddZKPzq0QyPquu_riHbAKkZOb1oEy9VQrqNw@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Also, x265 git repo does have tagged releases, and so
          PV/SRCREV in recipe should be set to match a release tag.<br>
        </div>
      </div>
    </blockquote>
    You'll have to help me out a little here on exactly what you want. 
    <br>
    <br>
    This is based off the stable tag.<br>
    I already specified the SRCREV in the recipe.<br>
    <br>
    Do you want PV to be:<br>
    PV = "stable+git${SRCPV}"<br>
    <br>
    ?<br>
    <blockquote type="cite"
cite="mid:CANNYZj9JY0joj=ddZKPzq0QyPquu_riHbAKkZOb1oEy9VQrqNw@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, 7 Feb 2020 at 22:35,
          Scott Branden via Openembedded-core &lt;<a
            href="mailto:openembedded-core@lists.openembedded.org"
            moz-do-not-send="true">openembedded-core@lists.openembedded.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add
          x265 recipe from latest revision of stable branch.<br>
          <br>
          Signed-off-by: Scott Branden &lt;<a
            href="mailto:scott.branden@broadcom.com" target="_blank"
            moz-do-not-send="true">scott.branden@broadcom.com</a>&gt;<br>
          ---<br>
           meta/recipes-multimedia/x265/<a href="http://x265_git.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">x265_git.bb</a>
          | 21 +++++++++++++++++++++<br>
           1 file changed, 21 insertions(+)<br>
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
          index 0000000000..7c230e2b1e<br>
          --- /dev/null<br>
          +++ b/meta/recipes-multimedia/x265/<a
            href="http://x265_git.bb" rel="noreferrer" target="_blank"
            moz-do-not-send="true">x265_git.bb</a><br>
          @@ -0,0 +1,21 @@<br>
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
          +DEPENDS = "nasm-native"<br>
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
    </blockquote>
    <br>
  </body>
</html>

--------------C8E5579FA51848631EB02D4B--
