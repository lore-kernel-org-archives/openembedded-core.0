Return-Path: <raltherr@google.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id A55FA62135
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 02:51:23 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id c7so57833738itd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 18:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xKduLTH9i71/fessrbdsYvFANzrVVg4Bi/PE+W9//FU=;
	b=W/rbrMY2GeOki/WbCRVxurVgTnUlW1bdotRWzrZXv7fwBOJindI4lUxfvycDTDHF5N
	LvaBuaqomW3Z7sb9XxMlQZxgz+0PkyinrQd5fpt+e5/3G00F6oRMFoU2f/XEk0OGtuKZ
	GDcFgy3+vakxVd/qke7xDoN3RNfHio85372RmCbTiTRP02eZmJpGHp0lrzGZzhr8wSNe
	PKBw4f1xtTiTwKsLJYk2oKtT52fxnWNf8MwclrEOn9rV+uDcS9mBJ6+mJ00L2shKtQ2B
	UQBZFsLj+5ipEpP2BOEcGh9eEYtn5KYEt4FX1CLxMZ35h6QhyMkZmCu2JZS1GXM6Ol/g
	HOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xKduLTH9i71/fessrbdsYvFANzrVVg4Bi/PE+W9//FU=;
	b=cEk80pPOQ0EXCiYXAbt5TVm8pWd5mv15xkFeK5d+n1Z4FwsKFC/36DWKAlEwT6kg9z
	8V37O+9EpNJnJ2uOdAZXNhc18vj/jYUCmZhqbSc4xCa29byMuUBPj3Ooa6LnffDZe2BM
	jIQQSLOAAaAjtaIZEL2HeTf8drN8SG5pUksSTtGEzoQMRKUzbSgwrQpPARITdUrN+pUC
	iQMK/K4nEI9pzgdZBCbkLjsZSazoVM9H0l3mvmqDdb61n03phd0aLsh7xueAQz8PsGgT
	0xQab3OJM7hHAxEjnbBRQ1a3AjW6JEPGdBuKWRXdftew1x08DeK8zjgjCSBe2Q1Pitvh
	IJMA==
X-Gm-Message-State: AMke39n4rNDqv9tGO7x/Xr/S3eURhhJWBUgOJh/UupGgKU2msToemRoiEci72n1iW68kWSHKI2/Vir8xgfjsQAUW
X-Received: by 10.36.84.67 with SMTP id t64mr6648405ita.105.1487127083515;
	Tue, 14 Feb 2017 18:51:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Tue, 14 Feb 2017 18:51:22 -0800 (PST)
In-Reply-To: <CAPLgG==QHocTr1-NtPNNxq7tqADPjdx5jCgch5B1Lr5juBm8nQ@mail.gmail.com>
References: <1487107658-5214-1-git-send-email-nikunj.kela@gmail.com>
	<CAPLgG==0xVya9oqfT3O+CrsMc3HKuv1oCytYY9tCgY0rDOuSXA@mail.gmail.com>
	<CAEbX-xykReaP4VwbfXDUExrKtN0nhw-1GCU3ZreypSTUWofu=Q@mail.gmail.com>
	<CAPLgG=n8x5cqpTkYGdnAjtH8dx_R7EfEdZXLQ8mVDW6LOQQ_mg@mail.gmail.com>
	<CAEbX-xzdeeEUcprPEofr3q_E-XuLxyPNNvVsZOYN9Ky=0L6_Wg@mail.gmail.com>
	<CAPLgG==QHocTr1-NtPNNxq7tqADPjdx5jCgch5B1Lr5juBm8nQ@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 14 Feb 2017 18:51:22 -0800
Message-ID: <CAPLgG=kJh67JZ+6XoB0k4Wga+i82ijm4Q3Edv5nVfC8k3ApD1w@mail.gmail.com>
To: Nikunj Kela <nikunj.kela@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage.bbclass: Allow set/unset load address for FDT
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
X-List-Received-Date: Wed, 15 Feb 2017 02:51:27 -0000
Content-Type: multipart/alternative; boundary=001a1143e0308ce0d4054888c1c6

--001a1143e0308ce0d4054888c1c6
Content-Type: text/plain; charset=UTF-8

At a minimum, please resend with a commit message that correctly describes
the change.

On Tue, Feb 14, 2017 at 4:42 PM, Rick Altherr <raltherr@google.com> wrote:

> Whoops. Dropped the list. Adding it back.
>
> On Feb 14, 2017 4:28 PM, "Nikunj Kela" <nikunj.kela@gmail.com> wrote:
>
>> I do agree that this can be fixed in u-boot however I saw a commit for
>> initrd load/entry addresses that make use of UBOOT_RD_* variables in OE, so
>> I thought of adding one for FDT load address.
>>
>> On Tue, Feb 14, 2017 at 4:24 PM, Rick Altherr <raltherr@google.com>
>> wrote:
>>
>>> I don't see harm in taking this patch but it does encourage a poor
>>> practice.
>>>
>>> They probably set the U-Boot boot command to 'bootm <kernel_addr>
>>> <initrd_addr> <fdt_addr>' which is what you do for legacy images. With FIT,
>>> only the address of the FIT itself is strictly needed.  Instead of pinning
>>> the FDT and initrd to fixed address, the U-Boot boot command can be a HUSH
>>> script that checks the FIT for initrd and FDT and falls back to fixed
>>> address if not found.
>>>
>>> I did this recently in OpenBMC's U-Boot for Aspeed SoCs. I'm on my phone
>>> so I don't have a link handy. The advantage is a more compact RAM layout
>>> since U-Boot only allocates exactly the RAM required for the copies.
>>>
>>> Rick
>>>
>>> On Feb 14, 2017 4:04 PM, "Nikunj Kela" <nikunj.kela@gmail.com> wrote:
>>>
>>>> Recently, on freescale ls1043a reference board, I came across a
>>>> situation where if I don't specify the FDT load address in the fitImage,
>>>> the uboot picks up some address however kernel doesn't boot. I looked at
>>>> the freescale supplied BSP and found that load address is required for
>>>> their FDT.
>>>>
>>>> On Tue, Feb 14, 2017 at 2:41 PM, Rick Altherr <raltherr@google.com>
>>>> wrote:
>>>>
>>>>> The attached patch seems to do exactly the opposite of the commit
>>>>> message.  When no "load" property is set for the fdt node, U-Boot will
>>>>> allocate memory dynamically and copy the fdt to the allocated RAM _if
>>>>> needed_.  With this patch, if UBOOT_FDT_LOADADDRESS is set, U-Boot will
>>>>> _always_ attempt to copy the fdt to the specified address.  I'm surprised
>>>>> you need the FDT at a specific address.  Are you able to share more details
>>>>> about the situation you need this option in?
>>>>>
>>>>> On Tue, Feb 14, 2017 at 1:27 PM, Nikunj Kela <nikunj.kela@gmail.com>
>>>>> wrote:
>>>>>
>>>>>> Allow the load address for the FDT segment in the fitImage. This
>>>>>> allows U-Boot to dynamically decide where to load the FDT.
>>>>>>
>>>>>> UBOOT_FDT_LOADADDRESS - Specifies the load address used by u-boot
>>>>>>                 for the FDT
>>>>>>
>>>>>> Signed-off-by: Nikunj Kela <nikunj.kela@gmail.com>
>>>>>> ---
>>>>>>  meta/classes/kernel-fitimage.bbclass | 6 ++++++
>>>>>>  1 file changed, 6 insertions(+)
>>>>>>
>>>>>> diff --git a/meta/classes/kernel-fitimage.bbclass
>>>>>> b/meta/classes/kernel-fitimage.bbclass
>>>>>> index 1c3b4b7..7f9da49 100644
>>>>>> --- a/meta/classes/kernel-fitimage.bbclass
>>>>>> +++ b/meta/classes/kernel-fitimage.bbclass
>>>>>> @@ -127,6 +127,11 @@ EOF
>>>>>>  fitimage_emit_section_dtb() {
>>>>>>
>>>>>>         dtb_csum="sha1"
>>>>>> +       fdt_loadline=""
>>>>>> +
>>>>>> +       if [ -n "${UBOOT_FDT_LOADADDRESS}" ]; then
>>>>>> +               fdt_loadline="load = <${UBOOT_FDT_LOADADDRESS}>;"
>>>>>> +       fi
>>>>>>
>>>>>>         cat << EOF >> ${1}
>>>>>>                  fdt@${2} {
>>>>>> @@ -135,6 +140,7 @@ fitimage_emit_section_dtb() {
>>>>>>                          type = "flat_dt";
>>>>>>                          arch = "${UBOOT_ARCH}";
>>>>>>                          compression = "none";
>>>>>> +                        ${fdt_loadline}
>>>>>>                          hash@1 {
>>>>>>                                  algo = "${dtb_csum}";
>>>>>>                          };
>>>>>> --
>>>>>> 2.5.0
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>
>>>>>
>>>>>
>>>>
>>

--001a1143e0308ce0d4054888c1c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">At a minimum, please resend with a commit message that cor=
rectly describes the change.</div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Tue, Feb 14, 2017 at 4:42 PM, Rick Altherr <span dir=3D=
"ltr">&lt;<a href=3D"mailto:raltherr@google.com" target=3D"_blank">raltherr=
@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"auto">Whoops. Dropped the list. Adding it back.</div><div class=3D"HOE=
nZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On Feb 14, 2017 4:28 PM, &quot;Nikunj Kela&quot; &lt;<a href=3D"mailt=
o:nikunj.kela@gmail.com" target=3D"_blank">nikunj.kela@gmail.com</a>&gt; wr=
ote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
">I do agree that this can be fixed in u-boot however I saw a commit for in=
itrd load/entry addresses that make use of UBOOT_RD_* variables in OE, so I=
 thought of adding one for FDT load address.</div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Tue, Feb 14, 2017 at 4:24 PM, Rick Alth=
err <span dir=3D"ltr">&lt;<a href=3D"mailto:raltherr@google.com" target=3D"=
_blank">raltherr@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"auto"><div dir=3D"auto"><span style=3D"font-family:san=
s-serif">I don&#39;t see harm in taking this patch but it does encourage a =
poor practice.</span><br></div><div dir=3D"auto"><br></div>They probably se=
t the U-Boot boot command to &#39;bootm &lt;kernel_addr&gt; &lt;initrd_addr=
&gt; &lt;fdt_addr&gt;&#39; which is what you do for legacy images. With FIT=
, only the address of the FIT itself is strictly needed.=C2=A0 Instead of p=
inning the FDT and initrd to fixed address, the U-Boot boot command can be =
a HUSH script that checks the FIT for initrd and FDT and falls back to fixe=
d address if not found.<div dir=3D"auto"><br></div><div dir=3D"auto">I did =
this recently in OpenBMC&#39;s U-Boot for Aspeed SoCs. I&#39;m on my phone =
so I don&#39;t have a link handy. The advantage is a more compact RAM layou=
t since U-Boot only allocates exactly the RAM required for the copies.</div=
><span class=3D"m_4517514727197510404m_6256535771595248298HOEnZb"><font col=
or=3D"#888888"><div dir=3D"auto"><br></div><div dir=3D"auto">Rick</div></fo=
nt></span></div><div class=3D"m_4517514727197510404m_6256535771595248298HOE=
nZb"><div class=3D"m_4517514727197510404m_6256535771595248298h5"><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Feb 14, 2017 4:04 PM, &q=
uot;Nikunj Kela&quot; &lt;<a href=3D"mailto:nikunj.kela@gmail.com" target=
=3D"_blank">nikunj.kela@gmail.com</a>&gt; wrote:<br type=3D"attribution"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div dir=3D"ltr">Recently, on freescale ls1043=
a reference board, I came across a situation where if I don&#39;t specify t=
he FDT load address in the fitImage, the uboot picks up some address howeve=
r kernel doesn&#39;t boot. I looked at the freescale supplied BSP and found=
 that load address is required for their FDT.=C2=A0</div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Tue, Feb 14, 2017 at 2:41 PM, Ri=
ck Altherr <span dir=3D"ltr">&lt;<a href=3D"mailto:raltherr@google.com" tar=
get=3D"_blank">raltherr@google.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div dir=3D"ltr">The attached patch seems to do exactly the=
 opposite of the commit message.=C2=A0 When no &quot;load&quot; property is=
 set for the fdt node, U-Boot will allocate memory dynamically and copy the=
 fdt to the allocated RAM _if needed_.=C2=A0 With this patch, if UBOOT_FDT_=
LOADADDRESS is set, U-Boot will _always_ attempt to copy the fdt to the spe=
cified address.=C2=A0 I&#39;m surprised you need the FDT at a specific addr=
ess.=C2=A0 Are you able to share more details about the situation you need =
this option in?</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te"><div><div class=3D"m_4517514727197510404m_6256535771595248298m_-6674877=
535799084198m_-2811090593725357575h5">On Tue, Feb 14, 2017 at 1:27 PM, Niku=
nj Kela <span dir=3D"ltr">&lt;<a href=3D"mailto:nikunj.kela@gmail.com" targ=
et=3D"_blank">nikunj.kela@gmail.com</a>&gt;</span> wrote:<br></div></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div><div class=3D"m_4517514727197510404m_6256=
535771595248298m_-6674877535799084198m_-2811090593725357575h5">Allow the lo=
ad address for the FDT segment in the fitImage. This<br>
allows U-Boot to dynamically decide where to load the FDT.<br>
<br>
UBOOT_FDT_LOADADDRESS - Specifies the load address used by u-boot<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for the FDT<br>
<br>
Signed-off-by: Nikunj Kela &lt;<a href=3D"mailto:nikunj.kela@gmail.com" tar=
get=3D"_blank">nikunj.kela@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-fitimage.<wbr>bbclass | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/meta/classes/kernel-fitimage<wbr>.bbclass b/meta/classes/kerne=
l-fitimage<wbr>.bbclass<br>
index 1c3b4b7..7f9da49 100644<br>
--- a/meta/classes/kernel-fitimage<wbr>.bbclass<br>
+++ b/meta/classes/kernel-fitimage<wbr>.bbclass<br>
@@ -127,6 +127,11 @@ EOF<br>
=C2=A0fitimage_emit_section_dtb() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_csum=3D&quot;sha1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fdt_loadline=3D&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${UBOOT_FDT_LOADADDRESS}&quot; ];=
 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdt_loadline=3D&quo=
t;load =3D &lt;${UBOOT_FDT_LOADADDRESS}&gt;;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &lt;&lt; EOF &gt;&gt; ${1}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdt@${2} {<br=
>
@@ -135,6 +140,7 @@ fitimage_emit_section_dtb() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0type =3D &quot;flat_dt&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0arch =3D &quot;${UBOOT_ARCH}&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0compression =3D &quot;none&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${fdt_loadline}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0hash@1 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0algo =3D &quot;${dtb_csum}&quo=
t;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0};<br>
</div></div><span class=3D"m_4517514727197510404m_6256535771595248298m_-667=
4877535799084198m_-2811090593725357575HOEnZb"><font color=3D"#888888"><span=
 class=3D"m_4517514727197510404m_6256535771595248298m_-6674877535799084198m=
_-2811090593725357575m_-8897050325125467373HOEnZb"><font color=3D"#888888">=
--<br>
2.5.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></font></span></blockquote></div><br></div>
</blockquote></div><br></div>
</blockquote></div></div>
</div></div></blockquote></div><br></div>
</blockquote></div></div>
</div></div></blockquote></div><br></div>

--001a1143e0308ce0d4054888c1c6--
