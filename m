Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 74EEA6FF9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 03:03:56 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id j9so24574122obd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 20:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=2BucOlMz58e8NIHth3gpjBon3dKvRgVXtNOv1/Wr2wg=;
	b=fKzjvL9DSLJKafoWTEMnx2aW71QqZSCi8/CXQ6kgSV4NhKsi/YgM1uqlMP6OjtB6Mr
	wvKsZhPJcaz6gCu3fbRkskfqXlZhmyn3+KF4lqmqTnK3IZVPQDeyApufFTHsWl8KRSMZ
	wAG5TI75uDC81LoqNeo0urNh1h1x8NUxWiMnCVV4VjaK90dcufc26gGfDzGiGupfSetU
	6SaHLzXybisBUEyMTpJoOYqN49HIaI2lG1eFNBWwQWKGOYsdWti98CgZb2L414SSeoYx
	OkWh3ahsOSZOFn1h4GJvw8dhtoAb04JfQuXTV+koaAupmGrqQBKRAq+FoDvlckoTGgnP
	ugDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=2BucOlMz58e8NIHth3gpjBon3dKvRgVXtNOv1/Wr2wg=;
	b=AnydjJOMo7Yj9fm77o8RLQ5z6BR2Og1OrafNsiTG+XddT1bhGy2J32qXAJzKT3Hjod
	RnYmBN2vtfKdfWM6b3SFDy2Qox1bXwW/zSU4rlrg4Uq5uMGqWOpGYb7Vh0a6u00SXOgY
	IgjaW9hqsfq7N6XuUSyOQTE6fSU65GdWXMrbCibDLw7KrB0PmmmiciLT432j+rdDoeio
	CyxtWHDK3CzHxw077CCtSAsBaGtQBD/WuRnFCabzkhUMVidIGDKpR9btjq2XI407mfce
	6CsPYtAYvoURe3sOFPT9rA8LCfErJo+F5XYUFvtqiHLojkInld1vjPdje0Bbgyt48JHE
	DMQQ==
X-Gm-Message-State: AOPr4FUFJO7Mg/eFXbdB3UY5ocHtNqlW9KWgbuGgVGUW0RxKA3NishvbQFwN1ic/k3M1uC/RSuJXeEA8SPbiXw==
MIME-Version: 1.0
X-Received: by 10.182.110.198 with SMTP id ic6mr3305116obb.15.1460516636948;
	Tue, 12 Apr 2016 20:03:56 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Tue, 12 Apr 2016 20:03:56 -0700 (PDT)
In-Reply-To: <570DB5CD.5050107@windriver.com>
References: <cover.1460513113.git.liezhi.yang@windriver.com>
	<CADkTA4PH7Vw8hGjpkBi0rsSgTXZf0KGZXR3XfiQAKyftBdV3ig@mail.gmail.com>
	<570DB5CD.5050107@windriver.com>
Date: Tue, 12 Apr 2016 23:03:56 -0400
Message-ID: <CADkTA4OHE2V-ftLNQVEnjoqqjTORzcrv9ag00sNZgoMk4RNUhw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] linux-yocto-tiny: update SRCREV_meta to support /proc/sys
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
X-List-Received-Date: Wed, 13 Apr 2016 03:03:57 -0000
Content-Type: multipart/alternative; boundary=089e0112c0da557f760530550755

--089e0112c0da557f760530550755
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 12, 2016 at 10:58 PM, Robert Yang <liezhi.yang@windriver.com>
wrote:

>
>
> On 04/13/2016 10:53 AM, Bruce Ashfield wrote:
>
>>
>>
>> On Tue, Apr 12, 2016 at 10:07 PM, Robert Yang <liezhi.yang@windriver.com
>> <mailto:liezhi.yang@windriver.com>> wrote:
>>
>>     Hi RP,
>>     I'm sorry to say that I didn't send this yesterday was because I have
>> to
>>     wait until the kernel's part get merged (now it is done), otherwise I
>>     can't have the correct SRCREV.
>>
>>
>> You shouldn't be bumping the SRCREV at all. That's something that I do
>> when queuing
>> changes.
>>
>> In fact, I already have this done and have it under test.
>>
>> So please, don't merge this. I have it here and have it stacked with
>> other commits,
>> which will all come out tomorrow when my testing completes.
>>
>> This SRCREV bump is for more than the single change .. hence why I need
>> to do
>> the update.
>>
>
> Got it, then please drop this.
>
>
Thanks, and I won't hold you up. I'll be sending my queue out first thing
in the morning.

Cheers,

Bruce


> // Robert
>
>
>> Bruce
>>
>>
>>     // Robert
>>
>>     The following changes since commit
>> b3afe7d9bd25a943e947de3ec064ea245173c5a8:
>>
>>        archiver: Ensure sstate-inputdir directory is created (2016-04-12
>>     22:46:48 +0100)
>>
>>     are available in the git repository at:
>>
>>        git://git.openembedded.org/openembedded-core-contrib
>>     <http://git.openembedded.org/openembedded-core-contrib> rbt/sys
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/sys
>>
>>     Robert Yang (1):
>>        linux-yocto-tiny: update SRCREV_meta to support /proc/sys
>>
>>       meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
>>     <http://linux-yocto-tiny_4.1.bb> | 2 +-
>>       meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
>>     <http://linux-yocto-tiny_4.4.bb> | 2 +-
>>       2 files changed, 2 insertions(+), 2 deletions(-)
>>
>>     --
>>     2.8.0
>>
>>     --
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its
>> end"
>>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--089e0112c0da557f760530550755
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 12, 2016 at 10:58 PM, Robert Yang <span dir=3D"ltr">&lt;<a =
href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@win=
driver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D""><br>
<br>
On 04/13/2016 10:53 AM, Bruce Ashfield wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
<br>
<br>
On Tue, Apr 12, 2016 at 10:07 PM, Robert Yang &lt;<a href=3D"mailto:liezhi.=
yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a><br></sp=
an><span class=3D"">
&lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">l=
iezhi.yang@windriver.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 Hi RP,<br>
=C2=A0 =C2=A0 I&#39;m sorry to say that I didn&#39;t send this yesterday wa=
s because I have to<br>
=C2=A0 =C2=A0 wait until the kernel&#39;s part get merged (now it is done),=
 otherwise I<br>
=C2=A0 =C2=A0 can&#39;t have the correct SRCREV.<br>
<br>
<br>
You shouldn&#39;t be bumping the SRCREV at all. That&#39;s something that I=
 do when queuing<br>
changes.<br>
<br>
In fact, I already have this done and have it under test.<br>
<br>
So please, don&#39;t merge this. I have it here and have it stacked with ot=
her commits,<br>
which will all come out tomorrow when my testing completes.<br>
<br>
This SRCREV bump is for more than the single change .. hence why I need to =
do<br>
the update.<br>
</span></blockquote>
<br>
Got it, then please drop this.<br>
<br></blockquote><div><br></div><div>Thanks, and I won&#39;t hold you up. I=
&#39;ll be sending my queue out first thing in the morning.</div><div><br><=
/div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
// Robert<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">
<br>
Bruce<br>
<br>
<br>
=C2=A0 =C2=A0 // Robert<br>
<br>
=C2=A0 =C2=A0 The following changes since commit b3afe7d9bd25a943e947de3ec0=
64ea245173c5a8:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0archiver: Ensure sstate-inputdir directory is cr=
eated (2016-04-12<br>
=C2=A0 =C2=A0 22:46:48 +0100)<br>
<br>
=C2=A0 =C2=A0 are available in the git repository at:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.openembedded.org/ope=
nembedded-core-contrib" rel=3D"noreferrer" target=3D"_blank">git.openembedd=
ed.org/openembedded-core-contrib</a><br></span>
=C2=A0 =C2=A0 &lt;<a href=3D"http://git.openembedded.org/openembedded-core-=
contrib" rel=3D"noreferrer" target=3D"_blank">http://git.openembedded.org/o=
penembedded-core-contrib</a>&gt; rbt/sys<span class=3D""><br>
=C2=A0 =C2=A0 <a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded=
-core-contrib/log/?h=3Drbt/sys" rel=3D"noreferrer" target=3D"_blank">http:/=
/cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Drbt/sys<=
/a><br>
<br>
=C2=A0 =C2=A0 Robert Yang (1):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-yocto-tiny: update SRCREV_meta to support =
/proc/sys<br>
<br>
=C2=A0 =C2=A0 =C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yoct=
o-tiny_4.1.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_4.1.bb=
</a><br></span>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.1.bb" rel=3D"norefer=
rer" target=3D"_blank">http://linux-yocto-tiny_4.1.bb</a>&gt; | 2 +-<br>
=C2=A0 =C2=A0 =C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yoct=
o-tiny_4.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_4.4.bb=
</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://linux-yocto-tiny_4.4.bb" rel=3D"norefer=
rer" target=3D"_blank">http://linux-yocto-tiny_4.4.bb</a>&gt; | 2 +-<span c=
lass=3D""><br>
=C2=A0 =C2=A0 =C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 2.8.0<br>
<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 _______________________________________________<br>
=C2=A0 =C2=A0 Openembedded-core mailing list<br>
=C2=A0 =C2=A0 <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openembedded.org</a><br></span>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembe=
dded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a>&gt=
;<span class=3D""><br>
=C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/mailman/listinfo/openembedded-core</a><br>
<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its<br>
end&quot;<br>
</span></blockquote>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--089e0112c0da557f760530550755--
