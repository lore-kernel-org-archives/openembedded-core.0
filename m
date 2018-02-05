Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 428F9784D2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 23:34:49 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id n206so312373itg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Feb 2018 15:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y3KKfFOXcH9FKpgKWnfKKSApxXikDrTIXJsoY5c4vJs=;
	b=jczQ6eApmoBMWJldEk20ODTzdDPBL8fjLMYwkiEYjvOGC6xxzcd8CtLoAE+H3jEjsZ
	b5UKJKC1Vh9ZvEFXvlaAMCp0CDn1N6DWiNJYoP72JuxxDO7aQ4xrS2dSwiQOqFTIXdmz
	C+xSS1HbTdxCWBhKSOe2/Em2ODTqStoKbvi0BA/7hSLDabVA18jyN7aNCkPmi3PchVj6
	S4AdOx6KTwZkG0yz2+V9GFf54Q2rj1xU3NXD29+tecXtDy5Syfwk8Syr8TEhsc3bpCPq
	VWXUQeeASIFyre/Pagc5R87fLaePivcpPPPAvK3pSF6epij8+wkRYrQCKhu4cyegr3x+
	deMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y3KKfFOXcH9FKpgKWnfKKSApxXikDrTIXJsoY5c4vJs=;
	b=VV3ooTLBpi3ndV86FcfyESC18hjonPccnD4UtQI7PkXqP3C/P4PjwD0CDKDQJbdqqC
	YpXPsp+pID3LjpR0ucFe8WcSzknPuIINF6sU3VFmIUA/vWv/+sZsUDKR94vIdTXAsvaS
	GgngSw08yK+E84Ncc7GZq/BDl7CwRPRU0OQ/WpX7B0aFILfod9bSOzLxkfZTbAotbia4
	HsdDNFnEHqROytQemrv6vDdUQwsvPeZDOxt/uZ+tjS4kn+OaJN4gskZrTln/Q/sxvqyb
	Z2g32EYotz2LVXGKqHlEbnqfP6rZ2/7ejcrKGt76T3TpHCKNEa742D15eOt2yXjwNDHt
	qyPw==
X-Gm-Message-State: APf1xPDGuuG6llBNo58a/NC5oyZ2Qnfs1S/VMeTLjDWCosqMyf/Ea8c/
	iiZvxyCSlK23gvMTQJCBQGjrIDTYs2WTBBg64KsdlTXJ
X-Google-Smtp-Source: AH8x225cYeMRGBYJghQYGhHEPFZA0JCRQyLYz8ygFvcXeR9lb8g+Dm47do2ayJr0jvweC6epSEU+yvsg2xlFtMuqVS8=
X-Received: by 10.36.0.23 with SMTP id 23mr612624ita.53.1517873690454; Mon, 05
	Feb 2018 15:34:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 5 Feb 2018 15:34:29 -0800 (PST)
In-Reply-To: <CAJTo0LZJfZMVoG_WCJYEqJvCH4aBUE1pv=i4HYZmqtTEMKkvVQ@mail.gmail.com>
References: <20171219221234.21699-1-california.l.sullivan@intel.com>
	<8686fa07-e2a8-1080-e646-7380437e7338@intel.com>
	<49611977-aff9-6e13-ab7a-0233208e49b3@intel.com>
	<CAJTo0LZJfZMVoG_WCJYEqJvCH4aBUE1pv=i4HYZmqtTEMKkvVQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Feb 2018 23:34:29 +0000
Message-ID: <CAJTo0LbA0w+Rq_cPpBjDPe6JOrFN-wsu0sRA37Bdh_8nrW3u6g@mail.gmail.com>
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
X-List-Received-Date: Mon, 05 Feb 2018 23:34:49 -0000
Content-Type: multipart/alternative; boundary="001a11c0122e2241bb05647f8217"

--001a11c0122e2241bb05647f8217
Content-Type: text/plain; charset="UTF-8"

This is causing the qemu boot wic test to fail in oe-selftest:

2018-02-05 15:08:41,786 - oe-selftest - INFO - FAIL [64.639s]: test_qemu
(wic.Wic)
2018-02-05 15:08:41,786 - oe-selftest - INFO -
----------------------------------------------------------------------
2018-02-05 15:08:41,786 - oe-selftest - INFO - Traceback (most recent call
last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py",
line 32, in wrapped_f
    return func(*args, **kwargs)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
line 58, in wrapped_f
    return func(*args, **kwargs)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
line 637, in test_qemu
    self.assertEqual(output, '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3
/mnt')
AssertionError: '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3
/media\r\n/dev/sda4 /mnt' != '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3
/mnt'
  /dev/root /
  /dev/sda1 /boot
- /dev/sda3 /media
- /dev/sda4 /mnt?         ^
+ /dev/sda3 /mnt?         ^

Presumably this is the initramfs mounting more stuff automatically?  I
don't have an opinion right now as to whether this is a problem with the
initramfs or the test case being too strict...

Ross


On 1 February 2018 at 14:03, Burton, Ross <ross.burton@intel.com> wrote:

> Sorry, missed this.  I'll pull it into MUT and throw it at the
> autobuilder...
>
> Ross
>
> On 31 January 2018 at 22:53, Cal Sullivan <california.l.sullivan@intel.com
> > wrote:
>
>> Ping.
>>
>> ---
>> Cal
>>
>>
>> On 01/09/2018 05:00 PM, Cal Sullivan wrote:
>>
>>> Anything wrong with this? Haven't seen it hit any mut branches.
>>>
>>> Thanks,
>>> Cal
>>>
>>> On 12/19/2017 02:12 PM, California Sullivan wrote:
>>>
>>>> initramfs-framework is more modular and expandable. This change was
>>>> proposed in commit 28fc6ba761ed4a47efa7c43e7f7dff5e2fe72b5e
>>>> "core-image-minimal-initramfs: use initramfs-framework by default" but
>>>> reverted due to the selftests runqemu.RunqemuTests.test_boot
>>>> _machine_iso
>>>> and runqemu.RunqemuTests.test_boot_deploy_hddimg failing. Since then,
>>>> the kinks have been worked out, and missing functionality that had been
>>>> missed (non-EFI installation module) has been added.
>>>>
>>>> Since the PACKAGE_INSTALL variable was getting so long with all these
>>>> individual modules getting added, I also introduced a new
>>>> INITRAMFS_SCRIPTS variable to the core-image-minimal-initramfs recipe.
>>>> This variable makes the recipe look much cleaner, and also allows easier
>>>> replacement or additions to the scripts.
>>>>
>>>> Fixes [YOCTO #10987].
>>>>
>>>> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
>>>> ---
>>>>   meta/recipes-core/images/core-image-minimal-initramfs.bb | 10
>>>> +++++++++-
>>>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>> b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>> index 5794a25952a..a9ba91bd310 100644
>>>> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>> @@ -3,7 +3,15 @@ DESCRIPTION = "Small image capable of booting a
>>>> device. The kernel includes \
>>>>   the Minimal RAM-based Initial Root Filesystem (initramfs), which
>>>> finds the \
>>>>   first 'init' program more efficiently."
>>>>   -PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install
>>>> initramfs-live-install-efi ${VIRTUAL-RUNTIME_base-utils} udev base-passwd
>>>> ${ROOTFS_BOOTSTRAP_INSTALL}"
>>>> +INITRAMFS_SCRIPTS ?= "\
>>>> +                      initramfs-framework-base \
>>>> +                      initramfs-module-setup-live \
>>>> +                      initramfs-module-udev \
>>>> +                      initramfs-module-install \
>>>> +                      initramfs-module-install-efi \
>>>> +                     "
>>>> +
>>>> +PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils}
>>>> udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
>>>>     # Do not pollute the initrd image with rootfs features
>>>>   IMAGE_FEATURES = ""
>>>>
>>>
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--001a11c0122e2241bb05647f8217
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is causing the qemu boot wic test to fail in oe-selft=
est:<br><br>2018-02-05 15:08:41,786 - oe-selftest - INFO - FAIL [64.639s]: =
test_qemu (wic.Wic)<br>2018-02-05 15:08:41,786 - oe-selftest - INFO - -----=
-----------------------------------------------------------------<br>2018-0=
2-05 15:08:41,786 - oe-selftest - INFO - Traceback (most recent call last):=
<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightl=
y-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py&quot;, line 32=
, in wrapped_f<br>=C2=A0 =C2=A0 return func(*args, **kwargs)<br>=C2=A0 File=
 &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/b=
uild/meta/lib/oeqa/selftest/cases/wic.py&quot;, line 58, in wrapped_f<br>=
=C2=A0 =C2=A0 return func(*args, **kwargs)<br>=C2=A0 File &quot;/home/pokyb=
uild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa=
/selftest/cases/wic.py&quot;, line 637, in test_qemu<br>=C2=A0 =C2=A0 self.=
assertEqual(output, &#39;/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /mnt&#=
39;)<br>AssertionError: &#39;/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /m=
edia\r\n/dev/sda4 /mnt&#39; !=3D &#39;/dev/root /\r\n/dev/sda1 /boot\r\n/de=
v/sda3 /mnt&#39;<br>=C2=A0 /dev/root /<br>=C2=A0 /dev/sda1 /boot<br>- /dev/=
sda3 /media<br>- /dev/sda4 /mnt? =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>+ /dev/sd=
a3 /mnt? =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br><br>Presumably this is the initra=
mfs mounting more stuff automatically?=C2=A0 I don&#39;t have an opinion ri=
ght now as to whether this is a problem with the initramfs or the test case=
 being too strict...<div><br></div><div>Ross<br><br></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 1 February 2018 at 14:03=
, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr">Sorry, missed this.=C2=A0 I&#39;ll=
 pull it into MUT and throw it at the autobuilder...<span class=3D"HOEnZb">=
<font color=3D"#888888"><div><br></div><div>Ross</div></font></span></div><=
div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On 31 January 2018 at 22:53, Cal Sullivan <span dir=
=3D"ltr">&lt;<a href=3D"mailto:california.l.sullivan@intel.com" target=3D"_=
blank">california.l.sullivan@intel.<wbr>com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Ping.<br>
<br>
---<br>
Cal<div class=3D"m_-9033303757896667203HOEnZb"><div class=3D"m_-90333037578=
96667203h5"><br>
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
</div></div></blockquote></div><br></div>

--001a11c0122e2241bb05647f8217--
