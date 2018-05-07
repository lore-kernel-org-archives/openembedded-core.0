Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5DEF6747CD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 16:04:18 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id a10-v6so34600844ioc.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2018 09:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MpZ3MkJren1ilgqGXRk0ekXi3CdAgKCiNpv8nFGIgXg=;
	b=JY//RCaK3+bTwdbMMWFt3dRmtr620olgdK5Dr7vViSYxApwpsmfPWOCayhVUgVGK4L
	/lcGOjli6+IfoRaPX5TcJoewldXr3Oa03DOlbMCWfAhjztwaLUSD4bVoRgNhpZyA2OnK
	mhb2hmX25CcNWZoWWOywtrfLDgtVXPiMo4qLGVj5s/64vOOuyISkb3wbYtQzPY2HW9s2
	nTZsJoCYeWgHR6cn8qpnY38YTsvy51MzRF5NFIaiRD9v+/HshUqtaUrByI9G72VeOr/a
	vhK7AqViP50lv9Vacbw9nyhnvVyrmo0wO9YNk7VGXm31M91knaqcThLcGdrit0bjSrDZ
	baWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MpZ3MkJren1ilgqGXRk0ekXi3CdAgKCiNpv8nFGIgXg=;
	b=op/uEvu3e+9GnshdWSfZjYYBYsvwAa9PBwYva+SAr5+Lt603dOu+dgsKhsYavj/eln
	OedcY+2hiCE5X6MfcNQFcC+p4VriKsJ8iBoO/9kPKhVwrfia2+tD/pJlrRy8m0PcvRl2
	0tmCNjzK7w/iBUDT0OZ346wcsQ6Mw4jynYgFNBLO2uYx1igoR0ye01YPkEU4AkKAsG1Y
	nemY1tLJuuFfm/EQPMSWuc+trT/B5ahqe0ZjJMPsdYV0NJ91uWsSamwLyMXF1nMGTX1x
	4AAO6tpnmV8BEwgMzFHiOjUwScPVkRJ5vKMa3mYAkDo+oOcr4QGX1I7CR5xLp0g9XrHe
	Ch5w==
X-Gm-Message-State: ALQs6tAl09Jz5Il6PHX4Vg4AYA9Md28WY025tRvvpKWo7UyCDdaoley3
	347fLt//3p/6pZTWbsnC3p6AM8fcmsSSWUu7tQQ=
X-Google-Smtp-Source: AB8JxZr5SAgVoEwya+rtbMXDTmOPrbVfwpIbyQpgstN5jaLsQA8WWYqHh2wNVA2X/Yys8/ISe6PqnFrgRzra7w/EhIg=
X-Received: by 2002:a63:6245:: with SMTP id
	w66-v6mr30509838pgb.55.1525709059707; 
	Mon, 07 May 2018 09:04:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.159.145 with HTTP; Mon, 7 May 2018 09:03:49 -0700 (PDT)
In-Reply-To: <afc2163b-7940-5868-84a3-adc515b1f9bf@pseudoterminal.org>
References: <20180503081758.4661-1-anuj.mittal@intel.com>
	<CAMKF1sowEveYKrjFkNi9SmrtWYxtEqasXcbR0QFbs_V8hcw6hw@mail.gmail.com>
	<CAJTo0LbXVMbEAseGtawGOUqb2EL9=8EnfZxhgVoRa-U_Jw3xxg@mail.gmail.com>
	<afc2163b-7940-5868-84a3-adc515b1f9bf@pseudoterminal.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 May 2018 09:03:49 -0700
Message-ID: <CAMKF1spdpmSTjmFXeQtec_Ne_CE7B6tS45mz-hVM8Y7Md4pSWw@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] gstreamer1.0: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Mon, 07 May 2018 16:04:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 7, 2018 at 5:40 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> True. But it should stay as close to oe-core as possible. I already
> committed updates to meta-gstreamer1.0, so I am not sure what to think of
> this.
>

I would suggest you review the changes and see it does not regress meta-gstremer
and does not cause extra work for you.

>
> On 2018-05-04 12:23, Burton, Ross wrote:
>
> meta-gstreamer ships its own inc files (as it should).
>
> Ross
>
> On 3 May 2018 at 23:49, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> On Thu, May 3, 2018 at 1:18 AM Anuj Mittal <anuj.mittal@intel.com> wrote:
>>>
>>> * For changes, please see:
>>> https://gstreamer.freedesktop.org/releases/1.14/
>>> * Merge inc and bb file since we only have one version now.
>>
>>
>> Threre is meta gstreamer can you check if this is not going to affect that
>> layer
>>>
>>>
>>>
>>> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>>> ---
>>>  meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb   | 14
>>> --------------
>>>  .../gstreamer/{gstreamer1.0.inc => gstreamer1.0_1.14.0.bb} | 12
>>> +++++++++++-
>>>  2 files changed, 11 insertions(+), 15 deletions(-)
>>>  delete mode 100644
>>> meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
>>>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0.inc =>
>>> gstreamer1.0_1.14.0.bb} (84%)
>>>
>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
>>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
>>> deleted file mode 100644
>>> index 01b2396513..0000000000
>>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
>>> +++ /dev/null
>>> @@ -1,14 +0,0 @@
>>> -require gstreamer1.0.inc
>>> -
>>> -LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d
>>> \
>>> -
>>> file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
>>> -
>>> -SRC_URI = " \
>>> -
>>> http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
>>> -"
>>> -SRC_URI[md5sum] = "9d268f2e891cce1ac0832f1cc467d4ea"
>>> -SRC_URI[sha256sum] =
>>> "5a8704aa4c2eeb04da192c4a9942f94f860ac1a585de90d9f914bac26a970674"
>>> -
>>> -S = "${WORKDIR}/gstreamer-${PV}"
>>> -
>>> -CVE_PRODUCT = "gstreamer"
>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
>>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
>>> similarity index 84%
>>> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
>>> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
>>> index c2df1f3258..b4398c8111 100644
>>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
>>> @@ -14,11 +14,19 @@ inherit autotools pkgconfig gettext
>>> upstream-version-is-even gobject-introspecti
>>>  # (it has a custom INTROSPECTION_INIT macro, and so must be used instead
>>> of our common introspection.m4 file)
>>>  acpaths = "-I ${S}/common/m4 -I ${S}/m4"
>>>
>>> -SRC_URI_append = " \
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d
>>> \
>>> +
>>> file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
>>> +
>>> +S = "${WORKDIR}/gstreamer-${PV}"
>>> +
>>> +SRC_URI = " \
>>> +
>>> http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
>>>
>>> file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
>>>      file://gtk-doc-tweaks.patch \
>>>
>>> file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
>>>  "
>>> +SRC_URI[md5sum] = "63c7cbfb86aa28c4522e374dc5555b96"
>>> +SRC_URI[sha256sum] =
>>> "fc361367f0d4b780a868a8833f9f30b9c9f4ac9faea4e6b251db8b4b0398466e"
>>>
>>>  PACKAGECONFIG ??= ""
>>>
>>> @@ -59,3 +67,5 @@ do_configure[prefuncs] += "delete_pkg_m4_file"
>>>  do_compile_prepend() {
>>>          export
>>> GIR_EXTRA_LIBS_PATH="${B}/gst/.libs:${B}/libs/gst/base/.libs"
>>>  }
>>> +
>>> +CVE_PRODUCT = "gstreamer"
>>> --
>>> 2.14.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

