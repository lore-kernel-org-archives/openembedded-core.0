Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 037BC605FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 00:47:24 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id w17so216949pgv.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Feb 2018 16:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PZFMF2tNJj0Kp1CR+5cBuZgm7XYhznFF+mEalzoVSrI=;
	b=EyA56g5RMcAQHFZ30oXccC6FpIFQ7JOWXlBuLl8P6M7XahzHJh1VasbXaZTjS09erW
	93k7KJ73h4z9a8gcPLrnXK1VhbDmlUg7JjCjidUN2+p/83AZ5mSKafPn6offWzBdym2J
	LBnozh1xeLC9qAucQfdCssWvs03MuyenHXsP+Fdbnhm69U29TufyxjFhCqxrYLw0c5yr
	jnqICcY4VvhtKjQR4DZBUz4Ze8tgrX7VGo1gyMY071MUZ/QIDwi93+riIoHEi0xrVN7r
	UQU0a7vdCzLOkdFhuvARHY3JTUGMyFcqtmoHwspuYjlCB9rqXtOt6QpZRoCEs+EDRvO8
	lXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PZFMF2tNJj0Kp1CR+5cBuZgm7XYhznFF+mEalzoVSrI=;
	b=r6KekDgPNPYznXvQmu77bKXH8FNHYDd2QPgdzXzVPJL1CdC5AUZy3q8/GtFuugT/IU
	tdy5cn7Gtod6e7wYz27Uj25yjk+BMDYYFSwHW2gAx2ADjtmTI8PLECOFCRu3Ll1IYPbp
	X9BH46T8/TwLZ3vVvIgIppnzzLElFbDv+NKQjcakeb0RbF0SRZQ7wWsZUGOo+ZAGET4A
	tVuECt1JAzQO0EZ2VkqpPWiHpK2n0mA/aX6dXN+d95NdOB+93/cY/DxbUflaCebMqubd
	rt8pWems7Rf64jT2T3N0l3xyyOenPKPJqC1WW3FHdBbI0DQ8vqgypRGUdkDukNKU2996
	xqlQ==
X-Gm-Message-State: APf1xPBdn5fbAZ09bADKSgSSU3cosLZF5rWIzZyWH8vooGt+y0Pxak+R
	h0XOlU4JgRTz1fcDGefyE5pgxyJ5ZhFZcbl8//E=
X-Google-Smtp-Source: AH8x224lxb7Hzfrg9MBh6G6wPtfK+H0cxNX2VnC9pWDOPcGMkT1wjoOTjyssgVhHyma22YDdhmIngQBzAHPnbbMIA+w=
X-Received: by 10.99.111.68 with SMTP id k65mr481983pgc.446.1517878045830;
	Mon, 05 Feb 2018 16:47:25 -0800 (PST)
MIME-Version: 1.0
References: <20171219221234.21699-1-california.l.sullivan@intel.com>
	<8686fa07-e2a8-1080-e646-7380437e7338@intel.com>
	<49611977-aff9-6e13-ab7a-0233208e49b3@intel.com>
	<CAJTo0LZJfZMVoG_WCJYEqJvCH4aBUE1pv=i4HYZmqtTEMKkvVQ@mail.gmail.com>
	<CAJTo0LbA0w+Rq_cPpBjDPe6JOrFN-wsu0sRA37Bdh_8nrW3u6g@mail.gmail.com>
	<a86b178d-3b9f-f967-1fe8-720f238b74ba@intel.com>
In-Reply-To: <a86b178d-3b9f-f967-1fe8-720f238b74ba@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 06 Feb 2018 00:47:14 +0000
Message-ID: <CAMKF1sp=mb4fMEEu0mkPvvYZYRZXiwtjQ=who4RNVNhQv8=X+Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 06 Feb 2018 00:47:25 -0000
Content-Type: multipart/alternative; boundary="94eb2c19d500bbf1e9056480859e"

--94eb2c19d500bbf1e9056480859e
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 5, 2018 at 4:15 PM Cal Sullivan <california.l.sullivan@intel.com>
wrote:

> Looking at the test and the output, its expecting /dev/sda3 to be mounted
> as /media and /dev/sda4 to be mounted as /mnt. With this test result, there
> is no /media, and instead /dev/sda3 is mounted to /mnt.
>
> That seems odd to me unless that partition either wasn't created or went
> entirely undetected.
>
> I'll take a closer look, I think there's more going on here.
>

Udev trigger sometimes get ignored have seem that in past

>
>
> ---
> Cal
>
> On 02/05/2018 03:34 PM, Burton, Ross wrote:
>
> This is causing the qemu boot wic test to fail in oe-selftest:
>
> 2018-02-05 15:08:41,786 - oe-selftest - INFO - FAIL [64.639s]: test_qemu
> (wic.Wic)
> 2018-02-05 15:08:41,786 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> 2018-02-05 15:08:41,786 - oe-selftest - INFO - Traceback (most recent call
> last):
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py",
> line 32, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
> line 58, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
> line 637, in test_qemu
>     self.assertEqual(output, '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3
> /mnt')
> AssertionError: '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3
> /media\r\n/dev/sda4 /mnt' != '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3
> /mnt'
>   /dev/root /
>   /dev/sda1 /boot
> - /dev/sda3 /media
> - /dev/sda4 /mnt?         ^
> + /dev/sda3 /mnt?         ^
>
> Presumably this is the initramfs mounting more stuff automatically?  I
> don't have an opinion right now as to whether this is a problem with the
> initramfs or the test case being too strict...
>
> Ross
>
>
> On 1 February 2018 at 14:03, Burton, Ross <ross.burton@intel.com> wrote:
>
>> Sorry, missed this.  I'll pull it into MUT and throw it at the
>> autobuilder...
>>
>> Ross
>>
>> On 31 January 2018 at 22:53, Cal Sullivan <
>> california.l.sullivan@intel.com> wrote:
>>
>>> Ping.
>>>
>>> ---
>>> Cal
>>>
>>>
>>> On 01/09/2018 05:00 PM, Cal Sullivan wrote:
>>>
>>>> Anything wrong with this? Haven't seen it hit any mut branches.
>>>>
>>>> Thanks,
>>>> Cal
>>>>
>>>> On 12/19/2017 02:12 PM, California Sullivan wrote:
>>>>
>>>>> initramfs-framework is more modular and expandable. This change was
>>>>> proposed in commit 28fc6ba761ed4a47efa7c43e7f7dff5e2fe72b5e
>>>>> "core-image-minimal-initramfs: use initramfs-framework by default" but
>>>>> reverted due to the selftests
>>>>> runqemu.RunqemuTests.test_boot_machine_iso
>>>>> and runqemu.RunqemuTests.test_boot_deploy_hddimg failing. Since then,
>>>>> the kinks have been worked out, and missing functionality that had been
>>>>> missed (non-EFI installation module) has been added.
>>>>>
>>>>> Since the PACKAGE_INSTALL variable was getting so long with all these
>>>>> individual modules getting added, I also introduced a new
>>>>> INITRAMFS_SCRIPTS variable to the core-image-minimal-initramfs recipe.
>>>>> This variable makes the recipe look much cleaner, and also allows
>>>>> easier
>>>>> replacement or additions to the scripts.
>>>>>
>>>>> Fixes [YOCTO #10987].
>>>>>
>>>>> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
>>>>> ---
>>>>>   meta/recipes-core/images/core-image-minimal-initramfs.bb | 10
>>>>> +++++++++-
>>>>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>>> b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>>> index 5794a25952a..a9ba91bd310 100644
>>>>> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>>> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>>>>> @@ -3,7 +3,15 @@ DESCRIPTION = "Small image capable of booting a
>>>>> device. The kernel includes \
>>>>>   the Minimal RAM-based Initial Root Filesystem (initramfs), which
>>>>> finds the \
>>>>>   first 'init' program more efficiently."
>>>>>   -PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install
>>>>> initramfs-live-install-efi ${VIRTUAL-RUNTIME_base-utils} udev base-passwd
>>>>> ${ROOTFS_BOOTSTRAP_INSTALL}"
>>>>> +INITRAMFS_SCRIPTS ?= "\
>>>>> +                      initramfs-framework-base \
>>>>> +                      initramfs-module-setup-live \
>>>>> +                      initramfs-module-udev \
>>>>> +                      initramfs-module-install \
>>>>> +                      initramfs-module-install-efi \
>>>>> +                     "
>>>>> +
>>>>> +PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils}
>>>>> udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
>>>>>     # Do not pollute the initrd image with rootfs features
>>>>>   IMAGE_FEATURES = ""
>>>>>
>>>>
>>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c19d500bbf1e9056480859e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Mon, Feb 5, 2018 a=
t 4:15 PM Cal Sullivan &lt;<a href=3D"mailto:california.l.sullivan@intel.co=
m">california.l.sullivan@intel.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <tt>Looking at the test and the output, its expecting /dev/sda3 to
      be mounted as /media and /dev/sda4 to be mounted as /mnt. With
      this test result, there is no /media, and instead /dev/sda3 is
      mounted to /mnt.<br>
      <br>
      That seems odd to me unless that partition either wasn&#39;t created
      or went entirely undetected.<br>
    </tt><br>
    <tt><tt>I&#39;ll take a closer look, I think there&#39;s more going on =
here.</tt></tt></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Udev trigger sometimes get ignored have seem that in past=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div text=3D"#000000" bgcolor=3D"#FFFFFF"><tt=
><tt></tt><br>
      <br>
      ---<br>
      Cal<br>
    </tt></div><div text=3D"#000000" bgcolor=3D"#FFFFFF"><br>
    <div class=3D"m_3545165834634221937moz-cite-prefix">On 02/05/2018 03:34=
 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div>This is causing the qemu boot wic test to fail in
        oe-selftest:<br>
        <br>
        2018-02-05 15:08:41,786 - oe-selftest - INFO - FAIL [64.639s]:
        test_qemu (wic.Wic)<br>
        2018-02-05 15:08:41,786 - oe-selftest - INFO -
        -------------------------------------------------------------------=
---<br>
        2018-02-05 15:08:41,786 - oe-selftest - INFO - Traceback (most
        recent call last):<br>
        =C2=A0 File
&quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/bu=
ild/meta/lib/oeqa/core/decorator/__init__.py&quot;,
        line 32, in wrapped_f<br>
        =C2=A0 =C2=A0 return func(*args, **kwargs)<br>
        =C2=A0 File
&quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/bu=
ild/meta/lib/oeqa/selftest/cases/wic.py&quot;,
        line 58, in wrapped_f<br>
        =C2=A0 =C2=A0 return func(*args, **kwargs)<br>
        =C2=A0 File
&quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/bu=
ild/meta/lib/oeqa/selftest/cases/wic.py&quot;,
        line 637, in test_qemu<br>
        =C2=A0 =C2=A0 self.assertEqual(output, &#39;/dev/root /\r\n/dev/sda=
1
        /boot\r\n/dev/sda3 /mnt&#39;)<br>
        AssertionError: &#39;/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3
        /media\r\n/dev/sda4 /mnt&#39; !=3D &#39;/dev/root /\r\n/dev/sda1
        /boot\r\n/dev/sda3 /mnt&#39;<br>
        =C2=A0 /dev/root /<br>
        =C2=A0 /dev/sda1 /boot<br>
        - /dev/sda3 /media<br>
        - /dev/sda4 /mnt? =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
        + /dev/sda3 /mnt? =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
        <br>
        Presumably this is the initramfs mounting more stuff
        automatically?=C2=A0 I don&#39;t have an opinion right now as to wh=
ether
        this is a problem with the initramfs or the test case being too
        strict...
        <div><br>
        </div>
        <div>Ross<br>
          <br>
        </div>
      </div>
      <div class=3D"gmail_extra"><br>
        <div class=3D"gmail_quote">On 1 February 2018 at 14:03, Burton,
          Ross <span>&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D=
"_blank">ross.burton@intel.com</a>&gt;</span>
          wrote:<br>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
            <div>Sorry, missed this.=C2=A0 I&#39;ll pull it into MUT
              and throw it at the autobuilder...<span class=3D"m_3545165834=
634221937HOEnZb"><font color=3D"#888888">
                  <div><br>
                  </div>
                  <div>Ross</div>
                </font></span></div>
            <div class=3D"m_3545165834634221937HOEnZb">
              <div class=3D"m_3545165834634221937h5">
                <div class=3D"gmail_extra"><br>
                  <div class=3D"gmail_quote">On 31 January 2018 at 22:53,
                    Cal Sullivan <span>&lt;<a href=3D"mailto:california.l.s=
ullivan@intel.com" target=3D"_blank">california.l.sullivan@intel.com</a>&gt=
;</span>
                    wrote:<br>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ping.<br>
                      <br>
                      ---<br>
                      Cal
                      <div class=3D"m_3545165834634221937m_-903330375789666=
7203HOEnZb">
                        <div class=3D"m_3545165834634221937m_-9033303757896=
667203h5"><br>
                          <br>
                          On 01/09/2018 05:00 PM, Cal Sullivan wrote:<br>
                          <blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
                            Anything wrong with this? Haven&#39;t seen it
                            hit any mut branches.<br>
                            <br>
                            Thanks,<br>
                            Cal<br>
                            <br>
                            On 12/19/2017 02:12 PM, California Sullivan
                            wrote:<br>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
                              initramfs-framework is more modular and
                              expandable. This change was<br>
                              proposed in commit
                              28fc6ba761ed4a47efa7c43e7f7dff5e2fe72b5e<br>
                              &quot;core-image-minimal-initramfs: use
                              initramfs-framework by default&quot; but<br>
                              reverted due to the selftests
                              runqemu.RunqemuTests.test_boot_machine_iso<br=
>
                              and runqemu.RunqemuTests.test_boot_deploy_hdd=
img
                              failing. Since then,<br>
                              the kinks have been worked out, and
                              missing functionality that had been<br>
                              missed (non-EFI installation module) has
                              been added.<br>
                              <br>
                              Since the PACKAGE_INSTALL variable was
                              getting so long with all these<br>
                              individual modules getting added, I also
                              introduced a new<br>
                              INITRAMFS_SCRIPTS variable to the
                              core-image-minimal-initramfs recipe.<br>
                              This variable makes the recipe look much
                              cleaner, and also allows easier<br>
                              replacement or additions to the scripts.<br>
                              <br>
                              Fixes [YOCTO #10987].<br>
                              <br>
                              Signed-off-by: California Sullivan &lt;<a hre=
f=3D"mailto:california.l.sullivan@intel.com" target=3D"_blank">california.l=
.sullivan@intel.com</a>&gt;<br>
                              ---<br>
                              =C2=A0 meta/recipes-core/images/<a href=3D"ht=
tp://core-image-minimal-initramfs.bb" rel=3D"noreferrer" target=3D"_blank">=
core-image-minimal-initramfs.bb</a>
                              | 10 +++++++++-<br>
                              =C2=A0 1 file changed, 9 insertions(+), 1
                              deletion(-)<br>
                              <br>
                              diff --git a/meta/recipes-core/images/<a href=
=3D"http://core-image-minimal-initramfs.bb" rel=3D"noreferrer" target=3D"_b=
lank">core-image-minimal-initramfs.bb</a>
                              b/meta/recipes-core/images/<a href=3D"http://=
core-image-minimal-initramfs.bb" rel=3D"noreferrer" target=3D"_blank">core-=
image-minimal-initramfs.bb</a><br>
                              index 5794a25952a..a9ba91bd310 100644<br>
                              --- a/meta/recipes-core/images/<a href=3D"htt=
p://core-image-minimal-initramfs.bb" rel=3D"noreferrer" target=3D"_blank">c=
ore-image-minimal-initramfs.bb</a><br>
                              +++ b/meta/recipes-core/images/<a href=3D"htt=
p://core-image-minimal-initramfs.bb" rel=3D"noreferrer" target=3D"_blank">c=
ore-image-minimal-initramfs.bb</a><br>
                              @@ -3,7 +3,15 @@ DESCRIPTION =3D &quot;Small
                              image capable of booting a device. The
                              kernel includes \<br>
                              =C2=A0 the Minimal RAM-based Initial Root
                              Filesystem (initramfs), which finds the \<br>
                              =C2=A0 first &#39;init&#39; program more effi=
ciently.&quot;<br>
                              =C2=A0 -PACKAGE_INSTALL =3D &quot;initramfs-l=
ive-boot
                              initramfs-live-install
                              initramfs-live-install-efi
                              ${VIRTUAL-RUNTIME_base-utils} udev
                              base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}&quot;=
<br>
                              +INITRAMFS_SCRIPTS ?=3D &quot;\<br>
                              +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0
                              initramfs-framework-base \<br>
                              +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0
                              initramfs-module-setup-live \<br>
                              +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0
                              initramfs-module-udev \<br>
                              +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0
                              initramfs-module-install \<br>
                              +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0
                              initramfs-module-install-efi \<br>
                              +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &quot;<br>
                              +<br>
                              +PACKAGE_INSTALL =3D &quot;${INITRAMFS_SCRIPT=
S}
                              ${VIRTUAL-RUNTIME_base-utils} udev
                              base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}&quot;=
<br>
                              =C2=A0 =C2=A0 # Do not pollute the initrd ima=
ge with
                              rootfs features<br>
                              =C2=A0 IMAGE_FEATURES =3D &quot;&quot;<br>
                            </blockquote>
                            <br>
                          </blockquote>
                          <br>
                          -- <br>
                          _______________________________________________<b=
r>
                          Openembedded-core mailing list<br>
                          <a href=3D"mailto:Openembedded-core@lists.openemb=
edded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><b=
r>
                          <a href=3D"http://lists.openembedded.org/mailman/=
listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lis=
ts.openembedded.org/mailman/listinfo/openembedded-core</a><br>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                  <br>
                </div>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </div>

--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--94eb2c19d500bbf1e9056480859e--
