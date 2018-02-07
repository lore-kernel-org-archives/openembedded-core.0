Return-Path: <carlos.rodriguez@ridgerun.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id D2F0878441
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 23:40:06 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id g83so1686297vki.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Feb 2018 15:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ridgerun-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=zIo2qevlpeDhFE+7TU+Z0OwIypIr9S9sfHV7VTXaTmI=;
	b=G5PIxd5kcdiYe+FHQHrdybjzhzdlY/TiBsdnpiPRidSykfK/8YqfIe9wbboNBYuXnR
	PtjxhdgmI+GjYGOdms/4G1ilr31yF8mcYEaob1d/vQrfVlJFV7T5FmEYDsLSJH8gi3AO
	1jCj5HDeskhcZh8tkCkCOCOjxKg7Mw6SB3QLJZZMPzW4d6fzzicKobFQGMDjSeXurZJD
	1vSSXJkUgYCtVkze3lhFWbIKisD4nTOAKKBQqjV7Rc4eDu9AIqANQdPFW92jv+JXXrlt
	A4uUq5CZlS/oIZqkUStnd3p1rUEPW0OSHvD1UUzLgbyb05vLkhms3573HQ1+nMyAz/zC
	w5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=zIo2qevlpeDhFE+7TU+Z0OwIypIr9S9sfHV7VTXaTmI=;
	b=RhZIHQpFa+Tk3wl/IsiMwuTGauwYNDONsLZUhEzAd/EpbceDb3oiU1iKBzcgog+DYn
	gs6bCXeZ4Wz7pu8YyB6A/TiVBIHA22Np5l0weTVN9k/fvSmULGxvLiA8mFrpq7BbYrBM
	QlIMY6bnPwsskk22aCX/EGQTz+8fFBxjfa8eW/ylI7afJmzgJL3w/FrMJBoKUTPKEiEd
	EvuY7FM8s62snO8oxCQOAFek/RuOTTMUKHBwQHbMnq6OTEbgC2szfSyfOQibk11TaHXb
	4jLRvIK/G5i6XTVHFHSHaCkXcvdKU8/4Tdoc32mIK+tlKN+qv81UEpVrxmCdcQM9sY9g
	YPhg==
X-Gm-Message-State: APf1xPAzFJWWsSTiqDZzLwG5fSIs3sYVNQ99Lbdv/iyWCTf2ySnpggTa
	Uv2neYm2dHzmmaDS69Vz3ZJiGYesO4E=
X-Google-Smtp-Source: AH8x227jhS5f0VKcH+IzFY+qOTemrJ604XETEOjwcV1RI2h03vOfoB7WIdqfSOwH2mdgbCkRhzKHsg==
X-Received: by 10.31.237.68 with SMTP id l65mr6607444vkh.30.1518046807285;
	Wed, 07 Feb 2018 15:40:07 -0800 (PST)
Received: from [10.251.101.85] ([201.206.221.6])
	by smtp.gmail.com with ESMTPSA id u5sm2387844uaf.7.2018.02.07.15.40.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Feb 2018 15:40:06 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1518039023-29531-1-git-send-email-carlos.rodriguez@ridgerun.com>
	<CAJTo0LZpMogpg6sBUtbL+-BJ+Cf6C-HG6P3um-HjUaCct52YXA@mail.gmail.com>
From: Carlos <carlos.rodriguez@ridgerun.com>
Message-ID: <16827076-8e50-dd0a-cb2f-6fee4ac54c70@ridgerun.com>
Date: Wed, 7 Feb 2018 17:40:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZpMogpg6sBUtbL+-BJ+Cf6C-HG6P3um-HjUaCct52YXA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gst-shark: Add Gst-Shark recipe
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
X-List-Received-Date: Wed, 07 Feb 2018 23:40:07 -0000
Content-Type: multipart/alternative;
	boundary="------------5445E9DFC665920DA57134F1"
Content-Language: en-US

--------------5445E9DFC665920DA57134F1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Ok thanks for the feedback. Will create the patches for meta-multimedia.

If you have any other suggestion please let me know.

On 07/02/2018 17:29, Burton, Ross wrote:
> I'd be inclined to say these are a good fit for meta-multimedia, but 
> not oe-core.
>
> Ross
>
> On 7 February 2018 at 21:30, Carlos Rodriguez 
> <carlos.rodriguez@ridgerun.com <mailto:carlos.rodriguez@ridgerun.com>> 
> wrote:
>
>     Gst-Shark is a set of tracers used as Benchmarks and
>     profiling tools for GStreamer. It includes tracers for
>     generating debug information plus some tools to analyze
>     the debug information. GstShark provides easy to use and
>     useful tracers, paired with analysis tools to enable
>     straightforward optimizations.
>
>     Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com
>     <mailto:carlos.rodriguez@ridgerun.com>>
>     ---
>      meta/recipes-multimedia/gstreamer/gst-shark.inc    | 36
>     ++++++++++++++++++++++
>      .../gstreamer/gst-shark_0.2.1.bb <http://gst-shark_0.2.1.bb>    
>                  |  3 ++
>      2 files changed, 39 insertions(+)
>      create mode 100644 meta/recipes-multimedia/gstreamer/gst-shark.inc
>      create mode 100644
>     meta/recipes-multimedia/gstreamer/gst-shark_0.2.1.bb
>     <http://gst-shark_0.2.1.bb>
>
>     diff --git a/meta/recipes-multimedia/gstreamer/gst-shark.inc
>     b/meta/recipes-multimedia/gstreamer/gst-shark.inc
>     new file mode 100644
>     index 0000000..1841d30
>     --- /dev/null
>     +++ b/meta/recipes-multimedia/gstreamer/gst-shark.inc
>     @@ -0,0 +1,36 @@
>     +DESCRIPTION = "RidgeRun Gst-Shark Tracers"
>     +SUMMARY = "Benchmarks and profiling tools for GStreamer"
>     +HOMEPAGE =
>     "https://developer.ridgerun.com/wiki/index.php?title=GstShark
>     <https://developer.ridgerun.com/wiki/index.php?title=GstShark>"
>     +SECTION = "multimedia"
>     +LICENSE = "GPLv2+"
>     +
>     +DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base
>     gstreamer1.0-plugins-bad "
>     +
>     +SRCBRANCH ?= "master"
>     +
>     +SRCREV_base = "a60b3996fe3376d42334fc89014e9d6f6af62899"
>     +SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
>     +
>     +SRC_URI = " \
>     +   
>     git://git@github.com/RidgeRun/gst-shark.git;protocol=https;branch=${SRCBRANCH};name=base
>     <http://git@github.com/RidgeRun/gst-shark.git;protocol=https;branch=$%7BSRCBRANCH%7D;name=base>
>     \
>     +   
>     git://anongit.freedesktop.org/git/gstreamer/common.git;protocol=https;destsuffix=git/common;name=common
>     <http://anongit.freedesktop.org/git/gstreamer/common.git;protocol=https;destsuffix=git/common;name=common>;
>     \
>     +    "
>     +
>     +S = "${WORKDIR}/git"
>     +
>     +PACKAGECONFIG_CONFARGS = " \
>     +       --disable-graphviz \
>     +       --enable-gtk-doc=no \
>     +"
>     +
>     +FILES_${PN} += "\
>     +       ${libdir}/gstreamer-1.0/libgstsharktracers.so \
>     +       ${libdir}/gstreamer-1.0/libgstsharktracers.la
>     <http://libgstsharktracers.la> \
>     +"
>     +
>     +inherit autotools gettext
>     +
>     +do_configure() {
>     +${S}/autogen.sh --noconfigure
>     +oe_runconf
>     +}
>     diff --git a/meta/recipes-multimedia/gstreamer/gst-shark_0.2.1.bb
>     <http://gst-shark_0.2.1.bb>
>     b/meta/recipes-multimedia/gstreamer/gst-shark_0.2.1.bb
>     <http://gst-shark_0.2.1.bb>
>     new file mode 100644
>     index 0000000..637bd0e
>     --- /dev/null
>     +++ b/meta/recipes-multimedia/gstreamer/gst-shark_0.2.1.bb
>     <http://gst-shark_0.2.1.bb>
>     @@ -0,0 +1,3 @@
>     +require gst-shark.inc
>     +
>     +LIC_FILES_CHKSUM =
>     "file://COPYING;md5=e1caa368743492879002ad032445fa97"
>     \ No newline at end of file
>     --
>     1.9.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------5445E9DFC665920DA57134F1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Ok thanks for the feedback. Will create the patches for
    meta-multimedia.<br>
    <br>
    If you have any other suggestion please let me know.<br>
    <br>
    <div class="moz-cite-prefix">On 07/02/2018 17:29, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LZpMogpg6sBUtbL+-BJ+Cf6C-HG6P3um-HjUaCct52YXA@mail.gmail.com">
      <div dir="ltr">I'd be inclined to say these are a good fit for
        meta-multimedia, but not oe-core.
        <div><br>
        </div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 7 February 2018 at 21:30, Carlos
          Rodriguez <span dir="ltr">&lt;<a
              href="mailto:carlos.rodriguez@ridgerun.com"
              target="_blank" moz-do-not-send="true">carlos.rodriguez@ridgerun.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Gst-Shark
            is a set of tracers used as Benchmarks and<br>
            profiling tools for GStreamer. It includes tracers for<br>
            generating debug information plus some tools to analyze<br>
            the debug information. GstShark provides easy to use and<br>
            useful tracers, paired with analysis tools to enable<br>
            straightforward optimizations.<br>
            <br>
            Signed-off-by: Carlos Rodriguez &lt;<a
              href="mailto:carlos.rodriguez@ridgerun.com"
              moz-do-not-send="true">carlos.rodriguez@ridgerun.com</a><wbr>&gt;<br>
            ---<br>
             meta/recipes-multimedia/<wbr>gstreamer/gst-shark.inc    |
            36 ++++++++++++++++++++++<br>
             .../gstreamer/<a href="http://gst-shark_0.2.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">gst-shark_0.2.1.<wbr>bb</a> 
                             |  3 ++<br>
             2 files changed, 39 insertions(+)<br>
             create mode 100644 meta/recipes-multimedia/<wbr>gstreamer/gst-shark.inc<br>
             create mode 100644 meta/recipes-multimedia/<wbr>gstreamer/<a
              href="http://gst-shark_0.2.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gst-shark_0.2.1.bb</a><br>
            <br>
            diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gst-shark.inc
            b/meta/recipes-multimedia/<wbr>gstreamer/gst-shark.inc<br>
            new file mode 100644<br>
            index 0000000..1841d30<br>
            --- /dev/null<br>
            +++ b/meta/recipes-multimedia/<wbr>gstreamer/gst-shark.inc<br>
            @@ -0,0 +1,36 @@<br>
            +DESCRIPTION = "RidgeRun Gst-Shark Tracers"<br>
            +SUMMARY = "Benchmarks and profiling tools for GStreamer"<br>
            +HOMEPAGE = "<a
              href="https://developer.ridgerun.com/wiki/index.php?title=GstShark"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://developer.ridgerun.<wbr>com/wiki/index.php?title=<wbr>GstShark</a>"<br>
            +SECTION = "multimedia"<br>
            +LICENSE = "GPLv2+"<br>
            +<br>
            +DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base
            gstreamer1.0-plugins-bad "<br>
            +<br>
            +SRCBRANCH ?= "master"<br>
            +<br>
            +SRCREV_base = "<wbr>a60b3996fe3376d42334fc89014e9d<wbr>6f6af62899"<br>
            +SRCREV_common = "<wbr>b64f03f6090245624608beb5d2fff3<wbr>35e23a01c0"<br>
            +<br>
            +SRC_URI = " \<br>
            +    git://<a
href="http://git@github.com/RidgeRun/gst-shark.git;protocol=https;branch=$%7BSRCBRANCH%7D;name=base"
              rel="noreferrer" target="_blank" moz-do-not-send="true">git@github.com/RidgeRun/<wbr>gst-shark.git;protocol=https;<wbr>branch=${SRCBRANCH};name=base</a>
            \<br>
            +    git://<a
href="http://anongit.freedesktop.org/git/gstreamer/common.git;protocol=https;destsuffix=git/common;name=common"
              rel="noreferrer" target="_blank" moz-do-not-send="true">anongit.freedesktop.org/<wbr>git/gstreamer/common.git;<wbr>protocol=https;destsuffix=git/<wbr>common;name=common</a>;
            \<br>
            +    "<br>
            +<br>
            +S = "${WORKDIR}/git"<br>
            +<br>
            +PACKAGECONFIG_CONFARGS = " \<br>
            +       --disable-graphviz \<br>
            +       --enable-gtk-doc=no \<br>
            +"<br>
            +<br>
            +FILES_${PN} += "\<br>
            +       ${libdir}/gstreamer-1.0/<wbr>libgstsharktracers.so 
            \<br>
            +       ${libdir}/gstreamer-1.0/<a
              href="http://libgstsharktracers.la" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libgst<wbr>sharktracers.la</a>
            \<br>
            +"<br>
            +<br>
            +inherit autotools gettext<br>
            +<br>
            +do_configure() {<br>
            +${S}/autogen.sh --noconfigure<br>
            +oe_runconf<br>
            +}<br>
            diff --git a/meta/recipes-multimedia/<wbr>gstreamer/<a
              href="http://gst-shark_0.2.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gst-shark_0.2.1.bb</a>
            b/meta/recipes-multimedia/<wbr>gstreamer/<a
              href="http://gst-shark_0.2.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gst-shark_0.2.1.bb</a><br>
            new file mode 100644<br>
            index 0000000..637bd0e<br>
            --- /dev/null<br>
            +++ b/meta/recipes-multimedia/<wbr>gstreamer/<a
              href="http://gst-shark_0.2.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">gst-shark_0.2.1.bb</a><br>
            @@ -0,0 +1,3 @@<br>
            +require gst-shark.inc<br>
            +<br>
            +LIC_FILES_CHKSUM = "<a class="moz-txt-link-freetext" href="file://COPYING;md5=">file://COPYING;md5=</a><wbr>e1caa368743492879002ad032445fa<wbr>97"<br>
            \ No newline at end of file<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                1.9.1<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------5445E9DFC665920DA57134F1--
