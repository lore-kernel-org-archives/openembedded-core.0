Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 45072789F1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 08:39:32 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id n136so4207028itg.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Mar 2018 00:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=thp8E15L1MRr9MIFpwdZMlzJVEi8rKNEW5OYeRH5mEw=;
	b=Vr+/5JCC4Y/cxkHPP3vG1SozR6+w2+r/E78wU4G+m7cutRzE/MvZyckvhOqY2A7RPD
	HpuEUhKEF7mAZMO/F3LgbeUF7zJey7bopF32DVnthsEUjN6kaQavAO0iyY4Oa6x5uLlm
	Vb3G0SvbsSNqhUi00mBYenuDTdG6zU12DKR2MLovkTntFPf/HllmeaKUVRVPrF0dgPxr
	DxK9KrIVIrFG8T0m04RZSNg0sOELQIsTWWzGAs4Dqzk1mH2EF6ikajvuKPX8Zz4e+x/k
	7CDGsoKAsEc+DcaAXmOUNX2IQXkmZLHu1aCgxGVGCPmqWflJhznc3UwfyEYRB/NhOuLe
	elRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=thp8E15L1MRr9MIFpwdZMlzJVEi8rKNEW5OYeRH5mEw=;
	b=OHtohOdR/ZiJNEmixmm2v8wRV3QAMwPFBxg2fuExgJqEF6oZFFY2h88n/e43NHG0eX
	Ut+aqJi8LAETE+UrvXl1yoTiR+ZjdfnNo+/+8BXqgm5kiYD6Upmta146WDbKbKqJ15Wv
	uidXIUriE9uXwlcTWUiT5riNTuNGkROh/p8Y4exIinDgkrRAIxJKAwhNurt+9lU4vDYT
	YI5oN13O9Z9uvoZ8Dx6DeHrjPTPDXoEUA1G+ix/GtBuH63ehuDFTrTltJGzzPG/6kxzK
	1wytYmdd7rm45ZrfoXyQ5Hvx2xTOoGLCzsOXAUqN+LZS5nMbWGXu/TBhaHa9pAw1uYJq
	lJIw==
X-Gm-Message-State: AElRT7EGCvgstlTl/lx/Uqfx+0ywY2MDjtw7Ud4r/Pwxqn2mFCf/1cI2
	K2Fjzy6oKxW4v+KQAL1AfQgmgrj0tTzrVDVZF78=
X-Google-Smtp-Source: AG47ELsD8cibrrrI9ddTKjnp6GSfzw2c4NzhlUja2vxT58+glXGj5iMprbWrN46sP/KJdSkL7CudL28SCZM7sdQtSno=
X-Received: by 10.36.122.3 with SMTP id a3mr26384375itc.119.1520498374050;
	Thu, 08 Mar 2018 00:39:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.96.23 with HTTP; Thu, 8 Mar 2018 00:39:13 -0800 (PST)
In-Reply-To: <d3e216a8-65c8-6ad8-1514-2b04dd53fa38@xilinx.com>
References: <1520479851-22522-1-git-send-email-vineethchowz.chowdary@xilinx.com>
	<d3e216a8-65c8-6ad8-1514-2b04dd53fa38@xilinx.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Thu, 8 Mar 2018 09:39:13 +0100
Message-ID: <CAB2nKc9tBJW_zFJFEq=CT4DqnQfLQsKTLuBjW1yDveVoYzpZ5w@mail.gmail.com>
To: Vineeth Karumanchi <vineethchowz.chowdary@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-fitimage.bbclass: Deploy fitImage without Initramfs
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
X-List-Received-Date: Thu, 08 Mar 2018 08:39:33 -0000
Content-Type: multipart/alternative; boundary="001a1144dbba7787a20566e29d13"

--001a1144dbba7787a20566e29d13
Content-Type: text/plain; charset="UTF-8"

Hi Vineeth,

I think it's because this class can be found in those two repos and error
log tells it should be based on first one:

http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fitimage.bbclass
http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/classes/kernel-fitimage.bbclass

Best regards,
Vincent

2018-03-08 5:39 GMT+01:00 Vineeth Karumanchi <
vineethchowz.chowdary@xilinx.com>:

> Hi,
>
> I am getting the patch failure error saying unable to apply.
> https://patchwork.openembedded.org/series/11297/
>
>
> I did these steps:
>
> - git clone git://git.yoctoproject.org/poky  ( master is at
> 83cd2b3e775235942dd4201622dc5cc2d4328994 )
>
> - Applied this patch, it went well.
>
>
> Can you please let me know what is the mistake .
> I was sending patch on master.
>
> Thanks
> Vineeth
>
>
>
> On 03/08/2018 09:00 AM, Vineeth Chowdary Karumanchi wrote:
>
>> This patch deploys fitImage (linux.bin + dtb ).
>> The use case is to have 2 partioned sd card, with
>> FAT partition having bootloader + fitImage and
>> ext4 partion having rootfs.
>>
>> Signed-off-by: Vineeth Chowdary Karumanchi <vineethchowz.chowdary@xilinx.
>> com>
>> ---
>> v2: Proper signed off
>> ---
>>   meta/classes/kernel-fitimage.bbclass | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/classes/kernel-fitimage.bbclass
>> b/meta/classes/kernel-fitimage.bbclass
>> index 50a91e1..25884d5 100644
>> --- a/meta/classes/kernel-fitimage.bbclass
>> +++ b/meta/classes/kernel-fitimage.bbclass
>> @@ -464,6 +464,10 @@ kernel_do_deploy_append() {
>>                 linux_bin_base_name="fitImage-
>> linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
>>                 linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
>>                 install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_
>> name}.bin
>> +               fitimage_base_name="fitImage-
>> ${PV}-${PR}-${MACHINE}-${DATETIME}"
>> +               fitimage_symlink_name=fitImage-${MACHINE}
>> +               install -m 0644 arch/${ARCH}/boot/fitImage
>> ${DEPLOYDIR}/${fitimage_base_name}.bin
>> +
>>                 if [ -n "${INITRAMFS_IMAGE}" ]; then
>>                         echo "Copying fit-image-${INITRAMFS_IMAGE}.its
>> source file..."
>> @@ -478,6 +482,7 @@ kernel_do_deploy_append() {
>>                 cd ${DEPLOYDIR}
>>                 ln -sf ${its_base_name}.its ${its_symlink_name}.its
>>                 ln -sf ${linux_bin_base_name}.bin
>> ${linux_bin_symlink_name}.bin
>> +               ln -sf ${fitimage_base_name}.bin
>> ${fitimage_symlink_name}.bin
>>                 if [ -n "${INITRAMFS_IMAGE}" ]; then
>>                         ln -sf ${its_initramfs_base_name}.its
>> ${its_initramfs_symlink_name}.its
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144dbba7787a20566e29d13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Vineeth,=C2=A0<div><br></div><div>I think it&#39;s beca=
use this class can be found in those two repos and error log tells it shoul=
d be based on first one:</div><div><br></div><div><a href=3D"http://git.ope=
nembedded.org/openembedded-core/tree/meta/classes/kernel-fitimage.bbclass">=
http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fiti=
mage.bbclass</a><br></div><div><a href=3D"http://git.yoctoproject.org/cgit.=
cgi/poky/tree/meta/classes/kernel-fitimage.bbclass">http://git.yoctoproject=
.org/cgit.cgi/poky/tree/meta/classes/kernel-fitimage.bbclass</a><br></div><=
div><br></div><div>Best regards,</div><div>Vincent</div></div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">2018-03-08 5:39 GMT+01:00 Vine=
eth Karumanchi <span dir=3D"ltr">&lt;<a href=3D"mailto:vineethchowz.chowdar=
y@xilinx.com" target=3D"_blank">vineethchowz.chowdary@xilinx.com</a>&gt;</s=
pan>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
I am getting the patch failure error saying unable to apply.<br>
<a href=3D"https://patchwork.openembedded.org/series/11297/" rel=3D"norefer=
rer" target=3D"_blank">https://patchwork.openembedded<wbr>.org/series/11297=
/</a><br>
<br>
<br>
I did these steps:<br>
<br>
- git clone git://<a href=3D"http://git.yoctoproject.org/poky" rel=3D"noref=
errer" target=3D"_blank">git.yoctoproject.org/pok<wbr>y</a>=C2=A0 ( master =
is at 83cd2b3e775235942dd4201622dc5c<wbr>c2d4328994 )<br>
<br>
- Applied this patch, it went well.<br>
<br>
<br>
Can you please let me know what is the mistake .<br>
I was sending patch on master.<br>
<br>
Thanks<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Vineeth</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
On 03/08/2018 09:00 AM, Vineeth Chowdary Karumanchi wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This patch deploys fitImage (linux.bin + dtb ).<br>
The use case is to have 2 partioned sd card, with<br>
FAT partition having bootloader + fitImage and<br>
ext4 partion having rootfs.<br>
<br>
Signed-off-by: Vineeth Chowdary Karumanchi &lt;<a href=3D"mailto:vineethcho=
wz.chowdary@xilinx.com" target=3D"_blank">vineethchowz.chowdary@xilinx.<wbr=
>com</a>&gt;<br>
---<br>
v2: Proper signed off<br>
---<br>
=C2=A0 meta/classes/kernel-fitimage.b<wbr>bclass | 5 +++++<br>
=C2=A0 1 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/classes/kernel-fitimage<wbr>.bbclass b/meta/classes/kerne=
l-fitimage<wbr>.bbclass<br>
index 50a91e1..25884d5 100644<br>
--- a/meta/classes/kernel-fitimage<wbr>.bbclass<br>
+++ b/meta/classes/kernel-fitimage<wbr>.bbclass<br>
@@ -464,6 +464,10 @@ kernel_do_deploy_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux_bin_base_name=
=3D&quot;fitImage-<wbr>linux.bin-${PV}-${PR}-${MACHIN<wbr>E}-${DATETIME}&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux_bin_symlink_n=
ame=3DfitImag<wbr>e-linux.bin-${MACHINE}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 lin=
ux.bin ${DEPLOYDIR}/${linux_bin_base_<wbr>name}.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fitimage_base_name=
=3D&quot;fitImage-<wbr>${PV}-${PR}-${MACHINE}-${DATET<wbr>IME}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fitimage_symlink_na=
me=3DfitImag<wbr>e-${MACHINE}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 arc=
h/${ARCH}/boot/fitImage ${DEPLOYDIR}/${fitimage_base_n<wbr>ame}.bin<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${INI=
TRAMFS_IMAGE}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;Copying fit-image-${INITRAMFS_IMAGE}.i<wbr>ts source =
file...&quot;<br>
@@ -478,6 +482,7 @@ kernel_do_deploy_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${DEPLOYDIR}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${its_base_n=
ame}.its ${its_symlink_name}.its<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${linux_bin_=
base_name}.bin ${linux_bin_symlink_name}.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${fitimage_b=
ase_name}.bin ${fitimage_symlink_name}.bin<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${INI=
TRAMFS_IMAGE}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ln -sf ${its_initramfs_base_name}.its ${its_initramfs_symlink_na=
me}.<wbr>its<br>
<br>
</blockquote>
<br>
-- <br></div></div><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1144dbba7787a20566e29d13--
