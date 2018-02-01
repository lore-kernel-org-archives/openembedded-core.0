Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 101FF783C9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 14:03:46 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id 72so19244041iom.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 06:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qZ0oc4CQlI5RY+Es8azjZ2a+8BjBOy2mOX+POSFtRRc=;
	b=fZ+r7Adajy5SyjAUDOd/jz5nV5lPTXSsQS4EAI/tCTSLKJWmPbINnULFPqsxM53H2T
	wUwbmPL9V1fNRWU0tCdx1L3eefuTUN+nb3sf18HWTlb9niNjdETZeFEN57jWjfYiPS2C
	R0OXwW2GQw5/kZja2+Z4dclQlDAbtY33jtEDSV8N/UmtBpA0cyc/NFWRvU1VBFDETpqc
	dKq/OwVzPF7opSKd7xRoGoJyAM1YfYBpiXCxgS4ftJB9trEkVCv4emKdenK15DHqjo7Z
	cjpn1NrNeOijGd+5eFcWJLJOOUNIYx11txTBxDekas9bHf3lTzBqTwgw82R33vcVx5Ca
	heLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qZ0oc4CQlI5RY+Es8azjZ2a+8BjBOy2mOX+POSFtRRc=;
	b=sUj+Z7QiGOKlnGx+3FwGSFU8IjZGSm2LyVVtViwDuMb/CntkyV43sVN00G0yq5qB+G
	RfZz+mc2Qcg09NEwkCV/cK41Jaihg4uc6R70WYRYhMd5+zXhKhOkRP7QUifY1U5wSITk
	TwMsNoXpNQnP9EH4/IMPw8B/Q/mCw72cd+S116fem9IuEM+NDxHvZjZTG7Mb/RwX12im
	1gcZE3Q1wUAvYuh++VUuX8DTu3QcyAvXMs5dk7ftBJxcTgnr/+/GxDRc52TwqjXW5P7c
	oTmMo45oOfpXMbuK42s85R9SaI1GFR+d+RKWJFCJl3iwLkFTKD2YrFLJUC+VANpqplMJ
	1bMw==
X-Gm-Message-State: AKwxytcGg+AItM4fFP399IVhewf/YZXGNp0aXl9g6TOhdJqlslpx8iCU
	3dULUua2DO0XCUAyHfx+4yym8VrwXZE5BOahg/4Msw==
X-Google-Smtp-Source: AH8x226H5iAd3Rj7ebXNzT0CWmTwI5HRSevxn6Ip+qLAY9XEiOspCSsi739mIVGShUL3v+s1TaIBKe7TuqCC69O/7uQ=
X-Received: by 10.107.186.86 with SMTP id k83mr37959650iof.208.1517493828489; 
	Thu, 01 Feb 2018 06:03:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Thu, 1 Feb 2018 06:03:28 -0800 (PST)
In-Reply-To: <49611977-aff9-6e13-ab7a-0233208e49b3@intel.com>
References: <20171219221234.21699-1-california.l.sullivan@intel.com>
	<8686fa07-e2a8-1080-e646-7380437e7338@intel.com>
	<49611977-aff9-6e13-ab7a-0233208e49b3@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Feb 2018 14:03:28 +0000
Message-ID: <CAJTo0LZJfZMVoG_WCJYEqJvCH4aBUE1pv=i4HYZmqtTEMKkvVQ@mail.gmail.com>
To: Cal Sullivan <california.l.sullivan@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core-image-minimal-initramfs: use initramfs-framework for initialization
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
X-List-Received-Date: Thu, 01 Feb 2018 14:03:49 -0000
Content-Type: multipart/alternative; boundary="94eb2c076a7098c70c0564271048"

--94eb2c076a7098c70c0564271048
Content-Type: text/plain; charset="UTF-8"

Sorry, missed this.  I'll pull it into MUT and throw it at the
autobuilder...

Ross

On 31 January 2018 at 22:53, Cal Sullivan <california.l.sullivan@intel.com>
wrote:

> Ping.
>
> ---
> Cal
>
>
> On 01/09/2018 05:00 PM, Cal Sullivan wrote:
>
>> Anything wrong with this? Haven't seen it hit any mut branches.
>>
>> Thanks,
>> Cal
>>
>> On 12/19/2017 02:12 PM, California Sullivan wrote:
>>
>>> initramfs-framework is more modular and expandable. This change was
>>> proposed in commit 28fc6ba761ed4a47efa7c43e7f7dff5e2fe72b5e
>>> "core-image-minimal-initramfs: use initramfs-framework by default" but
>>> reverted due to the selftests runqemu.RunqemuTests.test_boot_machine_iso
>>> and runqemu.RunqemuTests.test_boot_deploy_hddimg failing. Since then,
>>> the kinks have been worked out, and missing functionality that had been
>>> missed (non-EFI installation module) has been added.
>>>
>>> Since the PACKAGE_INSTALL variable was getting so long with all these
>>> individual modules getting added, I also introduced a new
>>> INITRAMFS_SCRIPTS variable to the core-image-minimal-initramfs recipe.
>>> This variable makes the recipe look much cleaner, and also allows easier
>>> replacement or additions to the scripts.
>>>
>>> Fixes [YOCTO #10987].
>>>
>>> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
>>> ---
>>>   meta/recipes-core/images/core-image-minimal-initramfs.bb | 10
>>> +++++++++-
>>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>> b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>> index 5794a25952a..a9ba91bd310 100644
>>> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>> @@ -3,7 +3,15 @@ DESCRIPTION = "Small image capable of booting a device.
>>> The kernel includes \
>>>   the Minimal RAM-based Initial Root Filesystem (initramfs), which finds
>>> the \
>>>   first 'init' program more efficiently."
>>>   -PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install
>>> initramfs-live-install-efi ${VIRTUAL-RUNTIME_base-utils} udev base-passwd
>>> ${ROOTFS_BOOTSTRAP_INSTALL}"
>>> +INITRAMFS_SCRIPTS ?= "\
>>> +                      initramfs-framework-base \
>>> +                      initramfs-module-setup-live \
>>> +                      initramfs-module-udev \
>>> +                      initramfs-module-install \
>>> +                      initramfs-module-install-efi \
>>> +                     "
>>> +
>>> +PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils}
>>> udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
>>>     # Do not pollute the initrd image with rootfs features
>>>   IMAGE_FEATURES = ""
>>>
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c076a7098c70c0564271048
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, missed this.=C2=A0 I&#39;ll pull it into MUT and th=
row it at the autobuilder...<div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 31 January 2018 at 22:53=
, Cal Sullivan <span dir=3D"ltr">&lt;<a href=3D"mailto:california.l.sulliva=
n@intel.com" target=3D"_blank">california.l.sullivan@intel.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Ping.<br>
<br>
---<br>
Cal<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 01/09/2018 05:00 PM, Cal Sullivan wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Anything wrong with this? Haven&#39;t seen it hit any mut branches.<br>
<br>
Thanks,<br>
Cal<br>
<br>
On 12/19/2017 02:12 PM, California Sullivan wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
initramfs-framework is more modular and expandable. This change was<br>
proposed in commit 28fc6ba761ed4a47efa7c43e7f7dff<wbr>5e2fe72b5e<br>
&quot;core-image-minimal-initramfs: use initramfs-framework by default&quot=
; but<br>
reverted due to the selftests runqemu.RunqemuTests.test_boot<wbr>_machine_i=
so<br>
and runqemu.RunqemuTests.test_boot<wbr>_deploy_hddimg failing. Since then,<=
br>
the kinks have been worked out, and missing functionality that had been<br>
missed (non-EFI installation module) has been added.<br>
<br>
Since the PACKAGE_INSTALL variable was getting so long with all these<br>
individual modules getting added, I also introduced a new<br>
INITRAMFS_SCRIPTS variable to the core-image-minimal-initramfs recipe.<br>
This variable makes the recipe look much cleaner, and also allows easier<br=
>
replacement or additions to the scripts.<br>
<br>
Fixes [YOCTO #10987].<br>
<br>
Signed-off-by: California Sullivan &lt;<a href=3D"mailto:california.l.sulli=
van@intel.com" target=3D"_blank">california.l.sullivan@intel.c<wbr>om</a>&g=
t;<br>
---<br>
=C2=A0 meta/recipes-core/images/<a href=3D"http://core-image-minimal-initra=
mfs.bb" rel=3D"noreferrer" target=3D"_blank">core-<wbr>image-minimal-initra=
mfs.bb</a> | 10 +++++++++-<br>
=C2=A0 1 file changed, 9 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/images/<a href=3D"http://core-image-minimal-=
initramfs.bb" rel=3D"noreferrer" target=3D"_blank">cor<wbr>e-image-minimal-=
initramfs.bb</a> b/meta/recipes-core/images/<a href=3D"http://core-image-mi=
nimal-initramfs.bb" rel=3D"noreferrer" target=3D"_blank">cor<wbr>e-image-mi=
nimal-initramfs.bb</a><br>
index 5794a25952a..a9ba91bd310 100644<br>
--- a/meta/recipes-core/images/<a href=3D"http://core-image-minimal-initram=
fs.bb" rel=3D"noreferrer" target=3D"_blank">cor<wbr>e-image-minimal-initram=
fs.bb</a><br>
+++ b/meta/recipes-core/images/<a href=3D"http://core-image-minimal-initram=
fs.bb" rel=3D"noreferrer" target=3D"_blank">cor<wbr>e-image-minimal-initram=
fs.bb</a><br>
@@ -3,7 +3,15 @@ DESCRIPTION =3D &quot;Small image capable of booting a dev=
ice. The kernel includes \<br>
=C2=A0 the Minimal RAM-based Initial Root Filesystem (initramfs), which fin=
ds the \<br>
=C2=A0 first &#39;init&#39; program more efficiently.&quot;<br>
=C2=A0 -PACKAGE_INSTALL =3D &quot;initramfs-live-boot initramfs-live-instal=
l initramfs-live-install-efi ${VIRTUAL-RUNTIME_base-utils} udev base-passwd=
 ${ROOTFS_BOOTSTRAP_INSTALL}&quot;<br>
+INITRAMFS_SCRIPTS ?=3D &quot;\<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 initramfs-framework-=
base \<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 initramfs-module-set=
up-live \<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 initramfs-module-ude=
v \<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 initramfs-module-ins=
tall \<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 initramfs-module-ins=
tall-efi \<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;<br>
+<br>
+PACKAGE_INSTALL =3D &quot;${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-util=
s} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}&quot;<br>
=C2=A0 =C2=A0 # Do not pollute the initrd image with rootfs features<br>
=C2=A0 IMAGE_FEATURES =3D &quot;&quot;<br>
</blockquote>
<br>
</blockquote>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c076a7098c70c0564271048--
