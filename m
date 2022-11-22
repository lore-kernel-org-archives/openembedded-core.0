Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675ECC433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 10:22:39 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.15320.1669112550509836795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 02:22:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=peRby7AZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id z24so17439280ljn.4
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 02:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/A+8kJXiYbdte2qspM+53xaOUEMWvhQSkiBXcwn0kiE=;
        b=peRby7AZqYdFeIOVO+/+QaG/NT6d4mCzHWct67X51cRXZxiN7GMYQvO/TDnx/RkAee
         R9DHLsFcOUCansnpj7Pw+xCNW1Ll5KeEuWM+8gjPpKzoW3zaPsojb5rrV6eniyf5S1GS
         b53LWLnNZA9ieTjQZ//otrr2IiRhfyvzcHFwPtetgtdYogf3H+Xy0qsxDoeOxB7nEoJ/
         vNEpRQjMLazy31cImnhH2/QAspcSgRgNM/r9N6LS+TKiScmGw7Mq2ObMIc2r4d8Kk7H0
         6AvZZ5yXV1R79S2hjt66oCMsiLNciF0XruXp/ndsHNeeabcGkIlkUCRBmOa9zVdVGCbJ
         SBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/A+8kJXiYbdte2qspM+53xaOUEMWvhQSkiBXcwn0kiE=;
        b=QogCSAJKzIUw6/LWLFyDs6CC5NadQ7AqGAYu7rrgLVldCG48QVBr/GlR7NvVJYEIxx
         MX25glH6/MbIARgzebm/9qmjd2v97aODkIHTsMLkMI0ICDGD7pqWNwu21FyhqaTTgu73
         CgYQfmMoTU+DXR3wjXBq0FHoDWAa96Ji0y+mUxxqn9tqPuXJNxQLHdubyUAa2rftCBFy
         3F59uMhHsw6cGfcfA3I8JteuviWPEImqITe8DeBHTxMjxrDWc+FDGP0l+KUiYHjiblZl
         /GAJJO4UQVLpfvx+C3gMTxxUD1c4kDKZt8FUrpAH3Jnf6mEY8u5yoWUkgvGYDhSUVa+3
         sUaA==
X-Gm-Message-State: ANoB5pkLB9j055mxiOvpTuKH2J9FbxV7NS5Z5FbgmEoE5CaheBoZwFEk
	IdQcHGLT857ML7veO3k6whOi6DvpOYu/fzwu5FLelaUijm0=
X-Google-Smtp-Source: AA0mqf7tXSVANYly/PDLH0pG3bCsbVfmqRt2JrlqPjIZWNGVIwenztwUdmxGQOypdjATEu5M/gxs63fLScbsxtqgo5Y=
X-Received: by 2002:a05:651c:10b8:b0:277:2217:c7e1 with SMTP id
 k24-20020a05651c10b800b002772217c7e1mr996830ljn.407.1669112548147; Tue, 22
 Nov 2022 02:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20221117041155.22632-1-Qi.Chen@windriver.com> <CANPvuRmp3+krC+Uj0ZmG7VF_L54ywUQt-FUkKxDBXVMB7iZVZA@mail.gmail.com>
 <CO6PR11MB56029334B200E9D3C5D055B9ED099@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB56029334B200E9D3C5D055B9ED099@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 22 Nov 2022 10:22:08 +0000
Message-ID: <CANPvuR=TskDiQecfUnneokVZuG-Eht8F89zXDcN-QWcbcAfnEQ@mail.gmail.com>
Subject: Re: [OE-core][master][kirkstone][PATCH V2] kernel.bbclass: make
 KERNEL_DEBUG_TIMESTAMPS work at rebuild
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000085c8b405ee0c8c3c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 10:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173673

--00000000000085c8b405ee0c8c3c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Qi,

Chen, Qi <Qi.Chen@windriver.com> escreveu no dia sexta, 18/11/2022 =C3=A0(s=
)
14:06:

> Hi Jose,
>
>
>
> Thanks a lot for your review. I=E2=80=99d like to explain the case in mor=
e details.
>
>
>
> * indeterministic (not reproducible) issue
>
> The use case is: the user wants to disable reproducible build for kernel,
> and wants to get the actual build time of kernel. In other words, we want
> it to be indeterministic. This is actually what KERNEL_DEBUG_TIMESTAMPS i=
s
> expected to do.
>

I don't fully understand the use case when looking at the patch as one of
the primary intentions is make it not reproducible.


>
>
> * state cache issue
>
> I think if the kernel is taken from the sstate cache and not rebuilt, it=
=E2=80=99s
> acceptable. The timestamp in /proc/version (or `uname -a` output) is
> reflecting the actual kernel build time.
>
> The situation that really confuses users is that when kernel do_compile i=
s
> re-executed, the timestamp is not updated, even if we want it to (by
> enabling KERNEL_DEBUG_TIMESTAMPS).
>
> It=E2=80=99s complained that even do_compile is forced to re-run, the tim=
estamp is
> not updated.
>

Understand so the main idea is to get the timestamp of the last do_compile
task running time even when they will come from the sstate, when it comes
from the sstate the timestamp is the same one that was taken when the
do_compile runs.


> In such case, I only see two choices:
>
> 1. delete the compile.h in do_compile (I have to admit that I didn=E2=80=
=99t try
> this method out)
>
> 2. set KBUILD_BUILD_TIMESTAMP explicitly
>
> I chose the second one because I wanted to output the value of
> KBUILD_BUILD_TIMESTAMP just like when KERNEL_DEBUG_TIMESTAMPS is disabled=
.
>
> Also, `date` will be run in one way or another. It will either be run in
> mkcompile_h or be run in do_compile.
>
>
>
> * DATETIME
>
> The DATETIME=E2=80=99s value is the time when bitbake.conf is parsed. By =
using
> DATETIME + varexclude, it=E2=80=99s basically achieving the same result a=
s using
> `date` directly.
>
> The ssate cache issue you mentioned remains the same, although I think
> it=E2=80=99s actually the expected behavior as explained above. And when =
source
> code/config changes and do_compile is re-run, KBUILD_BUILD_TIMESTAMP is s=
et
> to a different value from the previous run.
>
> The only difference is that DATETIME reflects the time bitbake.conf is
> parsed, and `date` reflects the time kernel=E2=80=99s do_compile is execu=
ted.
>

This suggestion is only to be more bitbake friendly and use a variable that
already exists, using `data` will provide the same and is maybe better in
this case as it does not need the varexclude.


>
>
> Does my explanation make some sense? If I still miss something, please le=
t
> me know.
>

Thanks for explaining the full picture.

Best regards,
Jose


> Thanks again for your review. Have a good weekend =F0=9F=98=8A
>
>
>
> Regards,
>
> Qi
>
>
>
> *From:* Jose Quaresma <quaresma.jose@gmail.com>
> *Sent:* Friday, November 18, 2022 7:11 PM
> *To:* Chen, Qi <Qi.Chen@windriver.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core][master][kirkstone][PATCH V2] kernel.bbclass:
> make KERNEL_DEBUG_TIMESTAMPS work at rebuild
>
>
>
>
>
>
>
> Chen Qi <Qi.Chen@windriver.com> escreveu no dia quinta, 17/11/2022 =C3=A0=
(s)
> 04:12:
>
> Currently, the KERNEL_DEBUG_TIMESTAMPS is not working as expected
> at rebuild. That is, even if we set it to "1", the kernel build time
> is not changed. The problem could be reproduced by the following steps.
>   1. bitbake core-image-minimal; start image and check `uname -a` output.
>   2. set in local.conf: KERNEL_DEBUG_TIMESTAMPS =3D "1"
>   3. bitbake core-image-minimal; start image and check `uname -a` output.
>
> It's expected that after enabling KERNEL_DEBUG_TIMESTAMPS, the kernel
> build time will be set to current date. But it's not. This is because
> the compile.h was not re-generated when do_compile task was re-executed.
>
> In mkcompile_h, we have:
> """
>  # Only replace the real compile.h if the new one is different,
>  # in order to preserve the timestamp and avoid unnecessary
>  # recompilations.
>  # We don't consider the file changed if only the date/time changed,
>  # unless KBUILD_BUILD_TIMESTAMP was explicitly set (e.g. for
>  # reproducible builds with that value referring to a commit timestamp).
>  # A kernel config change will increase the generation number, thus
>  # causing compile.h to be updated (including date/time) due to the
>  # changed comment in the
>  # first line.
> """
> It has made it very clear that it will not be re-generated unless
> we have KBUILD_BUILD_TIMESTAMP set explicitly. So we set this variable
> explicitly in do_compile to fix this issue.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 3834a42fb9..3f6b40907f 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -367,6 +367,10 @@ kernel_do_compile() {
>                 export KBUILD_BUILD_TIMESTAMP=3D"$ts"
>                 export KCONFIG_NOTIMESTAMP=3D1
>                 bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +       else
> +               ts=3D`LC_ALL=3DC date`
> +               export KBUILD_BUILD_TIMESTAMP=3D"$ts"
> +               bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
>         fi
>         # The $use_alternate_initrd is only set from
>         # do_bundle_initramfs() This variable is specifically for the
> @@ -412,6 +416,10 @@ do_compile_kernelmodules() {
>                 export KBUILD_BUILD_TIMESTAMP=3D"$ts"
>                 export KCONFIG_NOTIMESTAMP=3D1
>                 bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +       else
> +               ts=3D`LC_ALL=3DC date`
> +               export KBUILD_BUILD_TIMESTAMP=3D"$ts"
> +               bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
>         fi
>         if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config); then
>                 oe_runmake -C ${B} ${PARALLEL_MAKE} modules
> ${KERNEL_EXTRA_ARGS}
> --
> 2.17.1
>
>
>
> Hi Chen,
>
> I think this only works on the first time you run it and after that if th=
e
> kernel can be taken from the sstate-cache this timestamp will be bypassed=
.
> To generate a new timestamp you need to invalidate the stamp and run the
> task again with:
>
> bitbake virtual/linux -C do_compile
>
> Another possible issue is this will make this task indeterministic (not
> reproducible) as it uses the command 'date' that generates a
> different output in each run.
>
>
> IMO the bitbake DATETIME is better and it is deterministic:
>
> export KBUILD_BUILD_TIMESTAMP=3D"$DATETIME"
>
> This also maybe introduces a new variable dependency exclusion on the
> tasks that uses this variable:
>
>
> kernel_do_compile[vardepsexclude] +=3D DATETIME
>
> do_compile_kernelmodules[vardepsexclude] +=3D DATETIME
>
> Jose
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173401):
> https://lists.openembedded.org/g/openembedded-core/message/173401
> <https://urldefense.com/v3/__https:/lists.openembedded.org/g/openembedded=
-core/message/173401__;!!AjveYdw8EvQ!fB6p0AH069Vo-AVee7wFlAtEYf7mk5iseFIxw2=
QmL7Zr3UD9hP_vy_yAKs2N-InQPVv6rWGLb7ZaCmGE7pHmHz74$>
> Mute This Topic: https://lists.openembedded.org/mt/95083712/5052612
> <https://urldefense.com/v3/__https:/lists.openembedded.org/mt/95083712/50=
52612__;!!AjveYdw8EvQ!fB6p0AH069Vo-AVee7wFlAtEYf7mk5iseFIxw2QmL7Zr3UD9hP_vy=
_yAKs2N-InQPVv6rWGLb7ZaCmGE7nBibunR$>
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> <https://urldefense.com/v3/__https:/lists.openembedded.org/g/openembedded=
-core/unsub__;!!AjveYdw8EvQ!fB6p0AH069Vo-AVee7wFlAtEYf7mk5iseFIxw2QmL7Zr3UD=
9hP_vy_yAKs2N-InQPVv6rWGLb7ZaCmGE7qAoD1Gm$>
> [quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
>
> --
>
> Best regards,
>
>
> Jos=C3=A9 Quaresma
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000085c8b405ee0c8c3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Qi,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Chen, Qi &lt;<a href=3D"mailto:Qi.Chen@windri=
ver.com">Qi.Chen@windriver.com</a>&gt; escreveu no dia sexta, 18/11/2022 =
=C3=A0(s) 14:06:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div class=3D"msg6035313025628754585">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_6035313025628754585WordSection1">
<p class=3D"MsoNormal">Hi Jose,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks a lot for your review. I=E2=80=99d like to ex=
plain the case in more details.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">* indeterministic (not reproducible) issue<u></u><u>=
</u></p>
<p class=3D"MsoNormal">The use case is: the user wants to disable reproduci=
ble build for kernel, and wants to get the actual build time of kernel. In =
other words, we want it to be indeterministic. This is actually what KERNEL=
_DEBUG_TIMESTAMPS is expected to do.</p></div></div></div></blockquote><div=
><br>I don&#39;t fully understand=C2=A0the use case when looking at the pat=
ch as one of the primary intentions is make it not reproducible.<br>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg603=
5313025628754585"><div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">=
<div class=3D"m_6035313025628754585WordSection1"><p class=3D"MsoNormal"><u>=
</u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">* state cache issue<u></u><u></u></p>
<p class=3D"MsoNormal">I think if the kernel is taken from the sstate cache=
 and not rebuilt, it=E2=80=99s acceptable. The timestamp in /proc/version (=
or `uname -a` output) is reflecting the actual kernel build time.<u></u><u>=
</u></p>
<p class=3D"MsoNormal">The situation that really confuses users is that whe=
n kernel do_compile is re-executed, the timestamp is not updated, even if w=
e want it to (by enabling KERNEL_DEBUG_TIMESTAMPS).<u></u><u></u></p>
<p class=3D"MsoNormal">It=E2=80=99s complained that even do_compile is forc=
ed to re-run, the timestamp is not updated.</p></div></div></div></blockquo=
te><div><br></div><div>Understand so=C2=A0the=C2=A0main idea is to get the =
timestamp of the last do_compile task running time even when they will come=
 from the sstate, when it comes from the sstate the timestamp is the same o=
ne that was taken when the do_compile runs.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg60353130256287545=
85"><div lang=3D"EN-US" style=3D"overflow-wrap: break-word;"><div class=3D"=
m_6035313025628754585WordSection1"><p class=3D"MsoNormal"><u></u><u></u></p=
>
<p class=3D"MsoNormal">In such case, I only see two choices:<u></u><u></u><=
/p>
<p class=3D"MsoNormal">1. delete the compile.h in do_compile (I have to adm=
it that I didn=E2=80=99t try this method out)<u></u><u></u></p>
<p class=3D"MsoNormal">2. set KBUILD_BUILD_TIMESTAMP explicitly<u></u><u></=
u></p>
<p class=3D"MsoNormal">I chose the second one because I wanted to output th=
e value of KBUILD_BUILD_TIMESTAMP just like when KERNEL_DEBUG_TIMESTAMPS is=
 disabled.<u></u><u></u></p>
<p class=3D"MsoNormal">Also, `date` will be run in one way or another. It w=
ill either be run in mkcompile_h or be run in do_compile.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">* DATETIME<u></u><u></u></p>
<p class=3D"MsoNormal">The DATETIME=E2=80=99s value is the time when bitbak=
e.conf is parsed. By using DATETIME + varexclude, it=E2=80=99s basically ac=
hieving the same result as using `date` directly.<u></u><u></u></p>
<p class=3D"MsoNormal">The ssate cache issue you mentioned remains the same=
, although I think it=E2=80=99s actually the expected behavior as explained=
 above. And when source code/config changes and do_compile is re-run, KBUIL=
D_BUILD_TIMESTAMP is set to a different value
 from the previous run.<u></u><u></u></p>
<p class=3D"MsoNormal">The only difference is that DATETIME reflects the ti=
me bitbake.conf is parsed, and `date` reflects the time kernel=E2=80=99s do=
_compile is executed.</p></div></div></div></blockquote><div><br></div><div=
>This suggestion=C2=A0is only to be more bitbake friendly and use a variabl=
e that already exists, using `data` will provide the same and is maybe bett=
er in this case as it does not need the varexclude.</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg603531302=
5628754585"><div lang=3D"EN-US" style=3D"overflow-wrap: break-word;"><div c=
lass=3D"m_6035313025628754585WordSection1"><p class=3D"MsoNormal"><u></u><u=
></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Does my explanation make some sense? If I still miss=
 something, please let me know.</p></div></div></div></blockquote><div><br>=
Thanks for explaining the full picture.<br><br>Best regards,<br>Jose<br>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"ms=
g6035313025628754585"><div lang=3D"EN-US" style=3D"overflow-wrap: break-wor=
d;"><div class=3D"m_6035313025628754585WordSection1"><p class=3D"MsoNormal"=
><u></u><u></u></p>
<p class=3D"MsoNormal">Thanks again for your review. Have a good weekend <s=
pan style=3D"font-family:&quot;Segoe UI Emoji&quot;,sans-serif">
=F0=9F=98=8A</span><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Qi<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Jose Quaresma &lt;<a href=3D"mailto:qua=
resma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; <br=
>
<b>Sent:</b> Friday, November 18, 2022 7:11 PM<br>
<b>To:</b> Chen, Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"=
_blank">Qi.Chen@windriver.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core][master][kirkstone][PATCH V2] kernel.bbclass: =
make KERNEL_DEBUG_TIMESTAMPS work at rebuild<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com"=
 target=3D"_blank">Qi.Chen@windriver.com</a>&gt; escreveu no dia quinta, 17=
/11/2022 =C3=A0(s) 04:12:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<p class=3D"MsoNormal">Currently, the KERNEL_DEBUG_TIMESTAMPS is not workin=
g as expected<br>
at rebuild. That is, even if we set it to &quot;1&quot;, the kernel build t=
ime<br>
is not changed. The problem could be reproduced by the following steps.<br>
=C2=A0 1. bitbake core-image-minimal; start image and check `uname -a` outp=
ut.<br>
=C2=A0 2. set in local.conf: KERNEL_DEBUG_TIMESTAMPS =3D &quot;1&quot;<br>
=C2=A0 3. bitbake core-image-minimal; start image and check `uname -a` outp=
ut.<br>
<br>
It&#39;s expected that after enabling KERNEL_DEBUG_TIMESTAMPS, the kernel<b=
r>
build time will be set to current date. But it&#39;s not. This is because<b=
r>
the compile.h was not re-generated when do_compile task was re-executed.<br=
>
<br>
In mkcompile_h, we have:<br>
&quot;&quot;&quot;<br>
=C2=A0# Only replace the real compile.h if the new one is different,<br>
=C2=A0# in order to preserve the timestamp and avoid unnecessary<br>
=C2=A0# recompilations.<br>
=C2=A0# We don&#39;t consider the file changed if only the date/time change=
d,<br>
=C2=A0# unless KBUILD_BUILD_TIMESTAMP was explicitly set (e.g. for<br>
=C2=A0# reproducible builds with that value referring to a commit timestamp=
).<br>
=C2=A0# A kernel config change will increase the generation number, thus<br=
>
=C2=A0# causing compile.h to be updated (including date/time) due to the<br=
>
=C2=A0# changed comment in the<br>
=C2=A0# first line.<br>
&quot;&quot;&quot;<br>
It has made it very clear that it will not be re-generated unless<br>
we have KBUILD_BUILD_TIMESTAMP set explicitly. So we set this variable<br>
explicitly in do_compile to fix this issue.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 3834a42fb9..3f6b40907f 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -367,6 +367,10 @@ kernel_do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export KBUILD_BUILD=
_TIMESTAMP=3D&quot;$ts&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export KCONFIG_NOTI=
MESTAMP=3D1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote &quot;KBUILD=
_BUILD_TIMESTAMP: $ts&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts=3D`LC_ALL=3DC da=
te`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export KBUILD_BUILD=
_TIMESTAMP=3D&quot;$ts&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote &quot;KBUILD=
_BUILD_TIMESTAMP: $ts&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The $use_alternate_initrd is only set from<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # do_bundle_initramfs() This variable is specif=
ically for the<br>
@@ -412,6 +416,10 @@ do_compile_kernelmodules() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export KBUILD_BUILD=
_TIMESTAMP=3D&quot;$ts&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export KCONFIG_NOTI=
MESTAMP=3D1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote &quot;KBUILD=
_BUILD_TIMESTAMP: $ts&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts=3D`LC_ALL=3DC da=
te`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export=C2=A0KBUILD_=
BUILD_TIMESTAMP=3D&quot;$ts&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote &quot;KBUILD=
_BUILD_TIMESTAMP: $ts&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grep -q -i -e &#39;^CONFIG_MODULES=3Dy$&#39=
; ${B}/.config); then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C ${B} =
${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}<br>
-- <br>
2.17.1<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Hi Chen,<br>
<br>
I think this only works on the first time you run it and after that if the =
kernel can be taken from the sstate-cache this timestamp will be bypassed.<=
br>
To generate a new timestamp you need to invalidate the stamp and run the ta=
sk again with:<br>
<br>
bitbake virtual/linux -C do_compile<br>
<br>
Another possible issue is this will make this task indeterministic (not rep=
roducible) as it uses the command &#39;date&#39; that generates=C2=A0a diff=
erent=C2=A0output=C2=A0in each run.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><br>
IMO the bitbake DATETIME is better and it is deterministic:<br>
<br>
export KBUILD_BUILD_TIMESTAMP=3D&quot;$DATETIME&quot;<br>
<br>
This also maybe introduces a new variable dependency exclusion on the tasks=
 that uses this variable:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><br>
kernel_do_compile[vardepsexclude] +=3D DATETIME<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">do_compile_kernelmodules[vardepsexclude] +=3D=C2=A0D=
ATETIME<br>
<br>
Jose<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#173401): <a href=3D"https://urldefense.com/v3/__https:/=
lists.openembedded.org/g/openembedded-core/message/173401__;!!AjveYdw8EvQ!f=
B6p0AH069Vo-AVee7wFlAtEYf7mk5iseFIxw2QmL7Zr3UD9hP_vy_yAKs2N-InQPVv6rWGLb7Za=
CmGE7pHmHz74$" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/173401</a><br>
Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/lists.openem=
bedded.org/mt/95083712/5052612__;!!AjveYdw8EvQ!fB6p0AH069Vo-AVee7wFlAtEYf7m=
k5iseFIxw2QmL7Zr3UD9hP_vy_yAKs2N-InQPVv6rWGLb7ZaCmGE7nBibunR$" target=3D"_b=
lank">
https://lists.openembedded.org/mt/95083712/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/lists.openembedd=
ed.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!fB6p0AH069Vo-AVee7wFlAtEYf=
7mk5iseFIxw2QmL7Zr3UD9hP_vy_yAKs2N-InQPVv6rWGLb7ZaCmGE7qAoD1Gm$" target=3D"=
_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>=
]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></p>
</blockquote>
</div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal">-- <u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Best regards,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><br>
Jos=C3=A9 Quaresma<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>J=
os=C3=A9 Quaresma</div></div></div></div>

--00000000000085c8b405ee0c8c3c--

