Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D8DECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:05:14 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.11232.1662275112664459252
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mWyVynHI;
 spf=pass (domain: gmail.com, ip: 209.85.219.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 130so3190016ybz.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=kot44i5YsfltmjXaG+DI4kZovZdymE229A/dCrrdg6c=;
        b=mWyVynHIF0h19+DJ3UqTJsF1iMAn2B/lrbmvMbvrHr+TkJSqJVRttVXKJJof0nP7D0
         vs4hl5qfrc7DVLlnzh7R5b2NSNP0FEqBh4ng+CbMQ7Ii5mKKP0Fr2hZtvzVCxQyN6UUy
         37PtUoX51+UbYQlDmIDN/HwovmEPYTRH8Y/9UW3xOrh82DtKCGGWvRtABGAu8gwKSqkH
         59wOrteI7N+2/tIYYWMOkeq4gNNBHrJI3189dvBxLcvC2LnJJWHSGThiGUL2Ww0+tr9d
         bPmxMa1U2Q+WGyXr+shhkyaYYjjBs8vpuFodTbTZuDOSZJpYrfPHkucoelVJyesosFTj
         cjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=kot44i5YsfltmjXaG+DI4kZovZdymE229A/dCrrdg6c=;
        b=TW5yFp/S6WlYF235+EwcdVizudP0bP3E6SIrlWyJxmLi9mw1XQUKwK0eUR71MtB0cv
         owMio9kDYYvyekr33iMkV+m8IBRmMkW4apl+ZTg2bcdPrFpD4juVDJHmY1hhyKHvqwaV
         CukIoK9sOuM5lF+/8JxZTDvgzk+PHjNnJh1tOBVkjnsn3DRcODhtvm2z5C+CiOaKzy6Q
         vn7yp7QmqH+hVC9p1UnCX7qC4+2v4de6FbuCk/sBWL3lvfA/vHuXEBT+FVYyhaXVmFl9
         cpD03ARIVqXESiWQPw310Xc/3xfUYOCdN0Lp8bWa9yQyfe1+A8NH8mvx63pzXUu6HbIf
         epZA==
X-Gm-Message-State: ACgBeo3IaGIOcp9lTna8QrqlHauVvuQ+q3EJeSOmU1AJzjuf+E1Hk6jx
	vZJSZ6DYRVUeOPL8GPgn8QwWEYUcgdeo+9ELUBSs96VmlCY=
X-Google-Smtp-Source: 
 AA6agR4Is0jGH/chxl/SAm1/E6yaI5vVhAVdPQLX9LaRb8bnYH7hebheIanXeRDFp8jBxW9JYwp/q4rPpJSYCj1U0iw=
X-Received: by 2002:a05:6902:192:b0:695:7e89:ed5b with SMTP id
 t18-20020a056902019200b006957e89ed5bmr27641740ybh.226.1662275111666; Sun, 04
 Sep 2022 00:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220903174558.66575-1-raj.khem@gmail.com>
 <CANNYZj_uku5yuHL_4k+Kr_sFCWOYAJB5-4VdVTMp_013itMykw@mail.gmail.com>
 <CAMKF1spd3WJBcrtjL-wqZKW0xyotG3waOPKq4dsnX8Xo-LZRyA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spd3WJBcrtjL-wqZKW0xyotG3waOPKq4dsnX8Xo-LZRyA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Sep 2022 00:04:45 -0700
Message-ID: 
 <CAMKF1sp8cVqKw8bMEy6K6U=RoO52_80jhWCs6-42Zu-nf_Y-wA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-lxml: Add recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 07:05:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170277

On Sat, Sep 3, 2022 at 11:57 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Sep 3, 2022 at 9:44 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > But why move the recipe to core? Why not meta-oe?
>
> We could do that as well, don't see a big difference. I briefly looked
> at vulkan related recipes
> in core, but they don't yet use lxml like cts ones in meta-oe,
> secondly systemd could use it
> but it's optional as of now. So perhaps keeping it in meta-oe is fine for now.
>

Well, there is another compelling reason, that I forgot to mention,
meta-python does not depend on meta-oe as of now
if we move this recipe to meta-oe then meta-python will have to start
depending on
meta-oe and there are a bunch of python recipes in meta-python which depend on
this recipe. I think its a good setup to keep these layers independent
as they have been

> >
> > Alex
> >
> > On Sat 3. Sep 2022 at 19.46, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Import this recipe from meta-python, as it is needed by many recipes
> >> from different layers e.g. wireplumber from meta-multimedia,
> >> opengl-es-cts and vulkan-cts in meta-oe, yelp-tools in meta-gnome to
> >> name a few, the real issue is that newer vulkan-cts has added this
> >> dependency which is in meta-oe, and meta-oe can not depend on
> >> meta-python
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta/conf/distro/include/maintainers.inc      |  1 +
> >>  .../python/python3-lxml_4.9.1.bb              | 42 +++++++++++++++++++
> >>  2 files changed, 43 insertions(+)
> >>  create mode 100644 meta/recipes-devtools/python/python3-lxml_4.9.1.bb
> >>
> >> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> >> index 3c80a3a617..fee4e52b10 100644
> >> --- a/meta/conf/distro/include/maintainers.inc
> >> +++ b/meta/conf/distro/include/maintainers.inc
> >> @@ -626,6 +626,7 @@ RECIPE_MAINTAINER:pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfound
> >>  RECIPE_MAINTAINER:pn-python3-jsonpointer = "Bruce Ashfield <bruce.ashfield@gmail.com>"
> >>  RECIPE_MAINTAINER:pn-python3-jsonschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
> >>  RECIPE_MAINTAINER:pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
> >> +RECIPE_MAINTAINER:pn-python3-lxml = "Khem Raj <raj.khem@gmail.com>"
> >>  RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
> >>  RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> >>  RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >> diff --git a/meta/recipes-devtools/python/python3-lxml_4.9.1.bb b/meta/recipes-devtools/python/python3-lxml_4.9.1.bb
> >> new file mode 100644
> >> index 0000000000..92a30f7907
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/python/python3-lxml_4.9.1.bb
> >> @@ -0,0 +1,42 @@
> >> +SUMMARY = "Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API."
> >> +DESCRIPTION = "lxml is a Pythonic, mature binding for the libxml2 and \
> >> +libxslt libraries. It provides safe and convenient access to these \
> >> +libraries using the ElementTree API. It extends the ElementTree API \
> >> +significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
> >> +C14N and much more."
> >> +HOMEPAGE = "https://lxml.de/"
> >> +SECTION = "devel/python"
> >> +LICENSE = "BSD-3-Clause & GPL-2.0-only & MIT & PSF-2.0"
> >> +LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
> >> +                    file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
> >> +                    file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
> >> +                    file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f \
> >> +                    file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=2;endline=7;md5=fc85684a8dd5fa272c086bceb0d99e10 \
> >> +                    file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;beginline=2;endline=24;md5=cc86b7b2bbc678e13f58ea403eb9929b \
> >> +                    file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;beginline=2;endline=7;md5=5b03236d293dc3784205542b409d2f53 \
> >> +                    "
> >> +
> >> +DEPENDS += "libxml2 libxslt"
> >> +
> >> +SRC_URI[sha256sum] = "fe749b052bb7233fe5d072fcb549221a8cb1a16725c47c37e42b0b9cb3ff2c3f"
> >> +
> >> +SRC_URI += "${PYPI_SRC_URI}"
> >> +inherit pkgconfig pypi setuptools3
> >> +
> >> +# {standard input}: Assembler messages:
> >> +# {standard input}:1488805: Error: branch out of range
> >> +DEBUG_OPTIMIZATION:remove:mips = " -Og"
> >> +DEBUG_OPTIMIZATION:append:mips = " -O"
> >> +BUILD_OPTIMIZATION:remove:mips = " -Og"
> >> +BUILD_OPTIMIZATION:append:mips = " -O"
> >> +
> >> +DEBUG_OPTIMIZATION:remove:mipsel = " -Og"
> >> +DEBUG_OPTIMIZATION:append:mipsel = " -O"
> >> +BUILD_OPTIMIZATION:remove:mipsel = " -Og"
> >> +BUILD_OPTIMIZATION:append:mipsel = " -O"
> >> +
> >> +BBCLASSEXTEND = "native nativesdk"
> >> +
> >> +RDEPENDS:${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
> >> +
> >> +CLEANBROKEN = "1"
> >> --
> >> 2.37.3
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#170270): https://lists.openembedded.org/g/openembedded-core/message/170270
> >> Mute This Topic: https://lists.openembedded.org/mt/93444245/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>

