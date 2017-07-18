Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8E3C177A63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 18:37:59 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id 12so41468275wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 11:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=efxIpAWeGRhH/fHEiTS+GxpyFsmow8De0XmYWvJUi9A=;
	b=FnWTttJLnRUCetmujqtSA0mXBRzvYqqDGvuA7fOvljuR4TEqPqiX2R1k9gjPoUjKHW
	kvgm66vt1RXfXZOIjMNI3Yk9nfJKZAUcuQa7+zH+sTg8Ds/VmaHeslfF/j9esQlV7pjF
	TSijrsWEZZNprBLvRG0B9STeY5gz/2FblmmqwKn18gPZLIlG54Bz1zrB5vFj6UKqTFHz
	mYfeup+bCrCN3o8VojNSY/SWB693w4ARt1tUYzHKtZqt0nu94weUc26I8XLXCNMB40Sf
	AQpR8dQNdzrJQyk7ouqyewohguQNd3C8yYLAXHFv33gawVvW+Jg4W+SxHP0GhJvxh7/g
	EVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=efxIpAWeGRhH/fHEiTS+GxpyFsmow8De0XmYWvJUi9A=;
	b=C1mxLbxBRpkPXEFmOPEl8fhFLpoAwxLdARMYO8wQKGo/HcsyWsMB0nTtXFXlszSzhL
	aYZZyExrs9rMBoS3GdVgGc217byHv/cn1hj1e5TzKSEZ3JNWPqmJilSX4wS3hS9f/yMM
	fSqYUmv50yoNKu0a6IN8aSh+lAzdZay1NBZk+hgy3dJDOdTE3kxZb4rBK+vC3XW+lsRU
	fKRFcz90XZGmYrU8T1i7ZCoDNyBfrOJPuU0+uLxrF7YipaZPeD1nsrIjRwWgifQwgXuo
	WqcUpEvNpt2eQGYmgDsyERdGH8+eelxiSyq2jQXS3yThBwUQ2AyltfM27RacNcGEyT8F
	YyDw==
X-Gm-Message-State: AIVw111l5d2LAnW2hg0cZjoGx12g4ITmFiD1qkcgEWBkXzZgREWcmEFG
	/qdb7kSXE5M0x+BJBVOScJDIgCi0PA==
X-Received: by 10.80.146.154 with SMTP id k26mr3070670eda.23.1500403080104;
	Tue, 18 Jul 2017 11:38:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Tue, 18 Jul 2017 11:37:29 -0700 (PDT)
In-Reply-To: <1e22fdac-d41a-ff88-a208-e321b9820e9b@xevo.com>
References: <20170718002129.8704-1-mkelly@xevo.com>
	<CAMKF1spT18TdH6FbS+L0xLrRRxofpUwhLtNQtA3PKxFTRoNCUg@mail.gmail.com>
	<1e22fdac-d41a-ff88-a208-e321b9820e9b@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jul 2017 14:37:29 -0400
Message-ID: <CAMKF1spqOVtRF=LYmnL=NAf6BLB0+HVXO_vdLAZiTNjnDyekDw@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-python: add new recipe
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
X-List-Received-Date: Tue, 18 Jul 2017 18:37:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 18, 2017 at 12:21 PM, Martin Kelly <mkelly@xevo.com> wrote:
> On 07/17/2017 07:47 PM, Khem Raj wrote:
>>
>> On Mon, Jul 17, 2017 at 8:21 PM, Martin Kelly <mkelly@xevo.com> wrote:
>>>
>>> Previously, we had a gst-python recipe, but it supported only GStreamer
>>> 0.1. After GStreamer switched the Python bindings to use GObject
>>> introspection, we were no longer able to build the bindings, and they
>>> were dropped in this patch:
>>>
>>> https://patchwork.openembedded.org/patch/93793/
>>>
>>> However, at this point, we have a gobject-introspection class, so we can
>>> use the bindings again, this time with GStreamer 1.0.
>>>
>>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>>> ---
>>>  .../gstreamer/gstreamer1.0-python.inc              | 35
>>> ++++++++++++++++++++++
>>>  .../gstreamer/gstreamer1.0-python_1.10.4.bb        |  7 +++++
>>>  2 files changed, 42 insertions(+)
>>>  create mode 100644
>>> meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
>>>  create mode 100644
>>> meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
>>
>>
>> I think everything in single file would be better
>>
>
> I'm fine with that, but I was just following the convention that the rest of
> the gstreamer packaging uses; all the recipes in
> meta/recipes-multimedia/gstreamer use the same convention. I figured it's
> cleaner to keep all of it consistent. Would you prefer I diverge anyway?
>

I dont have strong preference here.

>>>
>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
>>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
>>> new file mode 100644
>>> index 0000000000..3299b89daa
>>> --- /dev/null
>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
>>> @@ -0,0 +1,35 @@
>>> +SUMMARY = "Python bindings for GStreamer 1.0"
>>> +HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-python/"
>>> +SECTION = "multimedia"
>>> +LICENSE = "LGPLv2"
>>> +
>>
>>
>> this should be 2.1 most probably
>>
>
> Yes you're right, I'll change it.
>
>
>>> +DEPENDS = "gstreamer1.0 python3-pygobject"
>>> +RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
>>> +
>>> +PNREAL = "gst-python"
>>> +
>>> +SRC_URI =
>>> "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
>>> +
>>> +S = "${WORKDIR}/${PNREAL}-${PV}"
>>> +
>>> +inherit autotools pkgconfig distutils3-base upstream-version-is-even
>>> gobject-introspection
>>> +
>>> +do_install_append() {
>>> +    # gstpythonplugin hardcodes the location of the libpython from the
>>> build
>>> +    # workspace and then fails at runtime. We can override it using
>>> +    # --with-libpython-dir=${libdir}, but it still fails because it
>>> looks for a
>>> +    # symlinked library ending in .so instead of the actually library
>>> with
>>> +    # LIBNAME.so.MAJOR.MINOR. Although we could patch the code to use
>>> the path
>>> +    # we want, it will break again if the library version ever changes.
>>> We need
>>> +    # to think about the best way of handling this and possibly consult
>>> +    # upstream.
>>> +    #
>>> +    # Note that this particular find line is taken from the Debian
>>> packaging for
>>> +    # gst-python1.0.
>>> +    find "${D}" \
>>> +        -name '*.pyc' -o \
>>> +        -name '*.pyo' -o \
>>> +        -name '*.la' -o \
>>> +        -name 'libgstpythonplugin*' \
>>> +        -delete
>>> +}
>>> diff --git
>>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
>>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
>>> new file mode 100644
>>> index 0000000000..1365f7c6dd
>>> --- /dev/null
>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
>>> @@ -0,0 +1,7 @@
>>> +require gstreamer1.0-python.inc
>>> +
>>> +SRC_URI =
>>> "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
>>> +SRC_URI[md5sum] = "adcdb74f713e28d0b22a0a1e4f831573"
>>> +SRC_URI[sha256sum] =
>>> "59508174b8bc86c05290aa9a7c5d480ac556a6f36306ddbc1d0eacf4f7868212"
>>> +
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
>>> --
>>> 2.11.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

