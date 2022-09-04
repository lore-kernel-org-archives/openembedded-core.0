Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B15C6FA82
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 06:58:14 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.11135.1662274688827785176
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 23:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GPDaH+tJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 130so3178216ybz.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 23:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=6CprlwiOa0MHE7/rYgw9D3vxiYtzRLNe/UfDaF+TiCY=;
        b=GPDaH+tJGEWpW2EDgQlmZBezpHUd/aTLQfGXaypRUMV2kawion8C35g2bW8GzVKxj5
         PE0JSaiG2VEKqBR3WoDg1LB+yt4zB1RhD7q+TAW/pkCzYxJzHMzxfamxDQcPl8odfA99
         IVovvcRMUdhw2hyJU+KLR6XgvD0CIQpnHS19HH976kqIZYXQxsX0ZgjgvUXBeYfrdxDX
         j+ibfGzxna0+H3Ard3WtCHjY5v5YqRC7onMi4oX32B0yqlXgwLuHN+jbouXPWhHGXZMN
         jrmxOhPW+HhIktW9MQE/HpCF07u1RKSDToHo4wnymfz9jBNax35Q9Py7C1Ub3BvLc7cb
         DVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6CprlwiOa0MHE7/rYgw9D3vxiYtzRLNe/UfDaF+TiCY=;
        b=gurrvR4SgomDQhoJXXhiyelaVDb9+wXAaycSv6LmNM5jbanMWPxA+dFQm8LdXUNCku
         dIStObuFeE8kbU4KTM54o7IWSTxP1Vzq2JKStYn8+vX1Sl8+uMkwa8mmv1p8gmu/skwF
         vdpEwGq70e4MrViJcK30f8Wn4228e+qdGmVXiYJZxc9OUBib3D2R0eFmvAptl/i07d4y
         xshjwZ0lA/IUGa6Np3Z+NbfL9s6OCTqeZEGvDyYJQ0XTq2njuHm0aC/+kfIbrkXj+/QT
         00fF00wvi5441OPAWhNpSeoiV31OPP4pyc93NY/ciOGKKfiTOKfZ/QTN6BgSk8S7WHZM
         iRCg==
X-Gm-Message-State: ACgBeo0hk8okv1Y12CofhRqzSgq1mXyNGHP5wG2pj8KlEyuv12r6pI64
	W7Z+s7qjxJw69D+cTNsMxziuJ8HMERyYh7aSGcw=
X-Google-Smtp-Source: 
 AA6agR6DIHOMaztj748oUXru/YhW7m6sYkg3evr7vIrX2iiD2dJimuHjOiICT/t+b75Bu0iZhvEEHiEmFsS3xgdIVJ8=
X-Received: by 2002:a25:b986:0:b0:671:a73:1ea6 with SMTP id
 r6-20020a25b986000000b006710a731ea6mr27666120ybg.405.1662274687883; Sat, 03
 Sep 2022 23:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220903174558.66575-1-raj.khem@gmail.com>
 <CANNYZj_uku5yuHL_4k+Kr_sFCWOYAJB5-4VdVTMp_013itMykw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_uku5yuHL_4k+Kr_sFCWOYAJB5-4VdVTMp_013itMykw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Sep 2022 23:57:41 -0700
Message-ID: 
 <CAMKF1spd3WJBcrtjL-wqZKW0xyotG3waOPKq4dsnX8Xo-LZRyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-lxml: Add recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 06:58:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170275

On Sat, Sep 3, 2022 at 9:44 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> But why move the recipe to core? Why not meta-oe?

We could do that as well, don't see a big difference. I briefly looked
at vulkan related recipes
in core, but they don't yet use lxml like cts ones in meta-oe,
secondly systemd could use it
but it's optional as of now. So perhaps keeping it in meta-oe is fine for now.

>
> Alex
>
> On Sat 3. Sep 2022 at 19.46, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Import this recipe from meta-python, as it is needed by many recipes
>> from different layers e.g. wireplumber from meta-multimedia,
>> opengl-es-cts and vulkan-cts in meta-oe, yelp-tools in meta-gnome to
>> name a few, the real issue is that newer vulkan-cts has added this
>> dependency which is in meta-oe, and meta-oe can not depend on
>> meta-python
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/conf/distro/include/maintainers.inc      |  1 +
>>  .../python/python3-lxml_4.9.1.bb              | 42 +++++++++++++++++++
>>  2 files changed, 43 insertions(+)
>>  create mode 100644 meta/recipes-devtools/python/python3-lxml_4.9.1.bb
>>
>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>> index 3c80a3a617..fee4e52b10 100644
>> --- a/meta/conf/distro/include/maintainers.inc
>> +++ b/meta/conf/distro/include/maintainers.inc
>> @@ -626,6 +626,7 @@ RECIPE_MAINTAINER:pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfound
>>  RECIPE_MAINTAINER:pn-python3-jsonpointer = "Bruce Ashfield <bruce.ashfield@gmail.com>"
>>  RECIPE_MAINTAINER:pn-python3-jsonschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
>>  RECIPE_MAINTAINER:pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
>> +RECIPE_MAINTAINER:pn-python3-lxml = "Khem Raj <raj.khem@gmail.com>"
>>  RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
>>  RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>>  RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
>> diff --git a/meta/recipes-devtools/python/python3-lxml_4.9.1.bb b/meta/recipes-devtools/python/python3-lxml_4.9.1.bb
>> new file mode 100644
>> index 0000000000..92a30f7907
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-lxml_4.9.1.bb
>> @@ -0,0 +1,42 @@
>> +SUMMARY = "Powerful and Pythonic XML processing library combining libxml2/libxslt with the ElementTree API."
>> +DESCRIPTION = "lxml is a Pythonic, mature binding for the libxml2 and \
>> +libxslt libraries. It provides safe and convenient access to these \
>> +libraries using the ElementTree API. It extends the ElementTree API \
>> +significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
>> +C14N and much more."
>> +HOMEPAGE = "https://lxml.de/"
>> +SECTION = "devel/python"
>> +LICENSE = "BSD-3-Clause & GPL-2.0-only & MIT & PSF-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
>> +                    file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
>> +                    file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
>> +                    file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f \
>> +                    file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=2;endline=7;md5=fc85684a8dd5fa272c086bceb0d99e10 \
>> +                    file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;beginline=2;endline=24;md5=cc86b7b2bbc678e13f58ea403eb9929b \
>> +                    file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;beginline=2;endline=7;md5=5b03236d293dc3784205542b409d2f53 \
>> +                    "
>> +
>> +DEPENDS += "libxml2 libxslt"
>> +
>> +SRC_URI[sha256sum] = "fe749b052bb7233fe5d072fcb549221a8cb1a16725c47c37e42b0b9cb3ff2c3f"
>> +
>> +SRC_URI += "${PYPI_SRC_URI}"
>> +inherit pkgconfig pypi setuptools3
>> +
>> +# {standard input}: Assembler messages:
>> +# {standard input}:1488805: Error: branch out of range
>> +DEBUG_OPTIMIZATION:remove:mips = " -Og"
>> +DEBUG_OPTIMIZATION:append:mips = " -O"
>> +BUILD_OPTIMIZATION:remove:mips = " -Og"
>> +BUILD_OPTIMIZATION:append:mips = " -O"
>> +
>> +DEBUG_OPTIMIZATION:remove:mipsel = " -Og"
>> +DEBUG_OPTIMIZATION:append:mipsel = " -O"
>> +BUILD_OPTIMIZATION:remove:mipsel = " -Og"
>> +BUILD_OPTIMIZATION:append:mipsel = " -O"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> +
>> +RDEPENDS:${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
>> +
>> +CLEANBROKEN = "1"
>> --
>> 2.37.3
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#170270): https://lists.openembedded.org/g/openembedded-core/message/170270
>> Mute This Topic: https://lists.openembedded.org/mt/93444245/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

