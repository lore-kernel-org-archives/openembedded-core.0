Return-Path: <ryan.harkin@linaro.org>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8637379403
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 17:11:49 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id y17-v6so1993110ljy.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 10:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DaBsZm7D+W8+sruqg4F+0W88yglRhYCrkkuFmwVVsqg=;
	b=Vs5HHteRoCfGIyp3qovqjrLWmyvWBsuBpyWzCDLGEP/aFqEZ3Fwr/m2NyXA7W00vOq
	w1s9dJJwG4Tbu1pxAWXbt+c9XVqkrZqErA1H1NmeHUxZTCzqoXfAVrUYuE8yujH7RYJl
	vpjHIprqqeIw4W0NedVn2vLV6J0doPavVVmXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DaBsZm7D+W8+sruqg4F+0W88yglRhYCrkkuFmwVVsqg=;
	b=DbHH8nzHLQkksaRpmn5jxwGa1NrhOwX9Jk1E9fgxfSxFqILD5WPGEBk/LoqT0hlTKZ
	HCeqcIGjpBrfh7S/lXwpHcweKoEwz9bkT/c1jbc1+H4gzgIrMuJ5e/n1u6aeP138qrk6
	rw+qKMIcVglOCBZFSZFYYJB4Wg0YsxDUVBLKfuALKJbyqkYgoXYnwhPy5phrFshjR6vZ
	q+oLec5enVWlkU40xSUhLL8403MqZaeyJ6u3ZcPlNRvPDvii1UKr4tM6JW5tbUeBl7EC
	qGfFKiW/vkqMGav5lsQBdTZmz4A5YiC2+FQpMChf67pOo+t9Tjgv5uUlwelfAGFIvzJQ
	+xHw==
X-Gm-Message-State: APzg51ATgyQuix9uKcDYmo0zYBi23HHZ6+JIt8nGgKk/8XiafJeylgD0
	+Up9SW1Hnluuk6ZsfdGOxUYocwYzuxN48978XePfhg==
X-Google-Smtp-Source: ANB0VdY2Bs2Uu5DSAKsaZiidHxuacn7riAn7iD8CXvgeqPIUy8H8QO8O+olEbqJvTQ/VDIiedX/3hqBOh/pwUpWn8DA=
X-Received: by 2002:a2e:5f93:: with SMTP id
	x19-v6mr3211812lje.60.1534957910108; 
	Wed, 22 Aug 2018 10:11:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:1bc7:0:0:0:0:0 with HTTP; Wed, 22 Aug 2018 10:11:49
	-0700 (PDT)
In-Reply-To: <CA+chaQezPDFAP1L0NYCaoFDjPfriUt3_wh9QKTaa0ZwWBHtKYQ@mail.gmail.com>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-hLEPce-+gJcBcqQHFPkiHr1CPBEvaM6s1f1VTkEzpNnfQ@mail.gmail.com>
	<CA+chaQezPDFAP1L0NYCaoFDjPfriUt3_wh9QKTaa0ZwWBHtKYQ@mail.gmail.com>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Wed, 22 Aug 2018 18:11:49 +0100
Message-ID: <CAD0U-hJHddn43O0WVxDqUft74RoHxfCQBb9XV-pG+GYqNU0iVQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: daiane.angolini@nxp.com, Patch Tracking <patches@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 3/3] linux-firmware: MACHINEOVERRIDES for BCM43430 NVRAM
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
X-List-Received-Date: Wed, 22 Aug 2018 17:11:50 -0000
Content-Type: multipart/alternative; boundary="000000000000fa40c10574093c6e"

--000000000000fa40c10574093c6e
Content-Type: text/plain; charset="UTF-8"

This is curious!

On 22 August 2018 at 17:56, Martin Jansa <martin.jansa@gmail.com> wrote:

> cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
> brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt
>
> is the same as
>
> ln -sf brcmfmac43430-sdio.AP6212.txt ${D}${nonarch_base_libdir}/fir
> mware/brcm/brcmfmac43430-sdio.txt
>

On my system, this is what happens when I'm in the root of the
linux-firmware repo:

$ ls -al brcm/*.txt
-rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08 brcm/brcmfmac43430-sdio.AP6212.txt
-rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48 brcm/brcmfmac43430-sdio.MUR1DX.txt

$ ln -sf brcm/brcmfmac43430-sdio.AP6212.txt brcm/brcmfmac43430-sdio.txt

$ ls -al brcm/*.txt
-rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08 brcm/brcmfmac43430-sdio.AP6212.txt
-rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48 brcm/brcmfmac43430-sdio.MUR1DX.txt
lrwxrwxrwx 1 ryan ryan  34 Aug 22 18:08 brcm/brcmfmac43430-sdio.txt ->
brcm/brcmfmac43430-sdio.AP6212.txt

And the file is not valid.

$ cat brcm/brcmfmac43430-sdio.txt
cat: brcm/brcmfmac43430-sdio.txt: No such file or directory

So perhaps I'm doing something wrong. I tried your suggestion originally
and it didn't work for me. Maybe I made a typo or something?



> On Wed, Aug 22, 2018 at 6:47 PM Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
>
>>
>>
>> On 22 August 2018 at 17:41, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>>> The "cd ${D}${nonarch_base_libdir}/firmware/brcm/" doesn't seem to be
>>> needed, just include the path in 2nd ln parameter.
>>>
>>
>> I don't think that works, or at least, it doesn't work for me, so I may
>> be doing something wrong. I'm also copying the example used in the
>> do_install() a few lines up as I figured that would be the preferred style
>> for this recipe.
>>
>>
>>> On Wed, Aug 22, 2018 at 6:30 PM Ryan Harkin <ryan.harkin@linaro.org>
>>> wrote:
>>>
>>>> The Linux kernel currently expects a single NVRAM file for BCM43430
>>>> named brcmfmac43430-sdio.txt.
>>>>
>>>> Allow the machine to specify an override to link its module specific
>>>> NVRAM to the filename expected by the kernel.
>>>>
>>>> Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
>>>> ---
>>>>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 12
>>>> ++++++++++++
>>>>  1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>>> b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>>> index 8c54f28..b647abc 100644
>>>> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
>>>> @@ -226,6 +226,18 @@ do_install() {
>>>>         ( cd ${D}${nonarch_base_libdir}/firmware ; ln -sf
>>>> ti-connectivity/* . )
>>>>  }
>>>>
>>>> +# Adding bcm43430-nvram-{module type} to MACHINEOVERRIDES will create a
>>>> +# softlink for the module specific NVRAM file to the filename expected
>>>> +# by the Linux kernel
>>>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-mur1dx = "
>>>> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
>>>> +do_install_append_bcm43430-nvram-mur1dx() {
>>>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
>>>> brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
>>>> +}
>>>> +FILES_${PN}-bcm43430-nvram_append_bcm43430-nvram-ap6212 =
>>>> "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt"
>>>> +do_install_append_bcm43430-nvram-ap6212() {
>>>> +       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
>>>> brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt)
>>>> +}
>>>> +
>>>>
>>>>  PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>>>>               ${PN}-mt7601u-license ${PN}-mt7601u \
>>>> --
>>>> 2.7.4
>>>>
>>>>
>>

--000000000000fa40c10574093c6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is curious!<br><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On 22 August 2018 at 17:56, Martin Jansa <span dir=3D"l=
tr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.=
jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><span class=3D"gmail-"><span style=3D"colo=
r:rgb(80,0,80)">cd ${D}${nonarch_base_libdir}/fir</span><span style=3D"colo=
r:rgb(80,0,80)"><wbr>mware/brcm/ ; ln -sf brcmfmac43430-sdio.AP6212.txt brc=
mfmac43430-sdio.txt</span><br><div><span style=3D"color:rgb(80,0,80)"><br><=
/span></div></span><div><span style=3D"color:rgb(80,0,80)">is the same as</=
span></div><div><span style=3D"color:rgb(80,0,80)"><br></span></div><div><s=
pan style=3D"color:rgb(80,0,80)">ln -sf=C2=A0</span><span style=3D"color:rg=
b(80,0,80)">brcmfmac43430-sdio.AP6212.<wbr>txt=C2=A0</span><span style=3D"c=
olor:rgb(80,0,80)">${D}${nonarch_base_libdir}<wbr>/fir</span><span style=3D=
"color:rgb(80,0,80)">mware/brcm/</span><span style=3D"color:rgb(80,0,80)">b=
rcmfmac43430-<wbr>sdio.txt</span></div></div></blockquote><div><br></div><d=
iv>On my system, this is what happens when I&#39;m in the root of the linux=
-firmware repo:<br></div><div><br></div><div style=3D"font-size:small;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial">$ ls -al brcm/*.txt<br></div><div style=3D"font-size:small;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial">-rw-rw-r-- 1 ryan ryan 875 Aug 22 18:08 brcm/brcmfmac434=
30-sdio.AP6212.txt</div><div style=3D"font-size:small;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial">-=
rw-rw-r-- 1 ryan ryan 831 Aug 21 14:48 brcm/brcmfmac43430-sdio.MUR1DX.txt</=
div><br class=3D"gmail-Apple-interchange-newline"><div>$ ln -sf brcm/brcmfm=
ac43430-sdio.AP6212.txt brcm/brcmfmac43430-sdio.txt<br></div><div><br></div=
><div>$ ls -al brcm/*.txt<br></div><div>-rw-rw-r-- 1 ryan ryan 875 Aug 22 1=
8:08 brcm/brcmfmac43430-sdio.AP6212.txt</div><div>-rw-rw-r-- 1 ryan ryan 83=
1 Aug 21 14:48 brcm/brcmfmac43430-sdio.MUR1DX.txt</div><div>lrwxrwxrwx 1 ry=
an ryan=C2=A0 34 Aug 22 18:08 brcm/brcmfmac43430-sdio.txt -&gt; brcm/brcmfm=
ac43430-sdio.AP6212.txt</div><div><br></div><div>And the file is not valid.=
</div><div><br></div><div>$ cat brcm/brcmfmac43430-sdio.txt</div><div>cat: =
brcm/brcmfmac43430-sdio.txt: No such file or directory</div><div><br></div>=
<div>So perhaps I&#39;m doing something wrong. I tried your suggestion orig=
inally and it didn&#39;t work for me. Maybe I made a typo or something?</di=
v><div><br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Wed, Aug 22, 2018 at 6:47 PM Ryan Hark=
in &lt;<a href=3D"mailto:ryan.harkin@linaro.org" target=3D"_blank">ryan.har=
kin@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On 22 August 2018 at 17:41, Martin Jansa <span dir=3D"ltr=
">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.ja=
nsa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr">The &quot;cd ${D}${nonarch_base_libdir}/<wbr=
>firmware/brcm/&quot; doesn&#39;t seem to be needed, just include the path =
in 2nd ln parameter.</div></blockquote><div><br></div><div>I don&#39;t thin=
k that works, or at least, it doesn&#39;t work for me, so I may be doing so=
mething wrong. I&#39;m also copying the example used in the do_install() a =
few lines up as I figured that would be the preferred style for this recipe=
.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v class=3D"gmail-m_5502182029538994976m_-6311599830852990523HOEnZb"><div cl=
ass=3D"gmail-m_5502182029538994976m_-6311599830852990523h5"><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Wed, Aug 22, 2018 at 6:30 PM Ryan Hark=
in &lt;<a href=3D"mailto:ryan.harkin@linaro.org" target=3D"_blank">ryan.har=
kin@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">The Linux kernel currently expects a single NVRAM file for BC=
M43430<br>
named brcmfmac43430-sdio.txt.<br>
<br>
Allow the machine to specify an override to link its module specific<br>
NVRAM to the filename expected by the kernel.<br>
<br>
Signed-off-by: Ryan Harkin &lt;<a href=3D"mailto:ryan.harkin@linaro.org" ta=
rget=3D"_blank">ryan.harkin@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux-<wbr>firmware/<a href=3D"http://linux-firmw=
are_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a> =
| 12 ++++++++++++<br>
=C2=A01 file changed, 12 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux-<wbr>firmware/<a href=3D"http://linu=
x-firmware_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.=
bb</a> b/meta/recipes-kernel/linux-<wbr>firmware/<a href=3D"http://linux-fi=
rmware_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</=
a><br>
index 8c54f28..b647abc 100644<br>
--- a/meta/recipes-kernel/linux-<wbr>firmware/<a href=3D"http://linux-firmw=
are_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><=
br>
+++ b/meta/recipes-kernel/linux-<wbr>firmware/<a href=3D"http://linux-firmw=
are_git.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_git.bb</a><=
br>
@@ -226,6 +226,18 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ( cd ${D}${nonarch_base_libdir}/<wbr>firmware ;=
 ln -sf ti-connectivity/* . )<br>
=C2=A0}<br>
<br>
+# Adding bcm43430-nvram-{module type} to MACHINEOVERRIDES will create a<br=
>
+# softlink for the module specific NVRAM file to the filename expected<br>
+# by the Linux kernel<br>
+FILES_${PN}-bcm43430-nvram_<wbr>append_bcm43430-nvram-mur1dx =3D &quot; ${=
nonarch_base_libdir}/<wbr>firmware/brcm/brcmfmac43430-<wbr>sdio.txt&quot;<b=
r>
+do_install_append_bcm43430-<wbr>nvram-mur1dx() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${D}${nonarch_base_libdir}/<wbr>firmware/b=
rcm/ ; ln -sf brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)<br>
+}<br>
+FILES_${PN}-bcm43430-nvram_<wbr>append_bcm43430-nvram-ap6212 =3D &quot;${n=
onarch_base_libdir}/<wbr>firmware/brcm/brcmfmac43430-<wbr>sdio.txt&quot;<br=
>
+do_install_append_bcm43430-<wbr>nvram-ap6212() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${D}${nonarch_base_libdir}/<wbr>firmware/b=
rcm/ ; ln -sf brcmfmac43430-sdio.AP6212.txt brcmfmac43430-sdio.txt)<br>
+}<br>
+<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-ralink-license ${PN}-ralink \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-mt7601u-license ${PN=
}-mt7601u \<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div>
</div></div></blockquote></div><br></div></div>
</blockquote></div>
</div></div></blockquote></div><br></div></div>

--000000000000fa40c10574093c6e--
