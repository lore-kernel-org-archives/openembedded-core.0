Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 26B7070619
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 18:23:37 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so2485784wgg.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 11:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=K9AXUW0AXFpdpDRvyiNRotI/QlFgCawFziM71t3UaNo=;
	b=uUmaxqWRmuCrJTEs8bj7+ROYDqexFth7r4AS9jhZY7gui3MKfEC09b8t5D68Gf2vk9
	0zg820lzVyQdO7gUyrYxYV3y9m8SQXApCMXSCNlEFDBxnK5NjACfnuJFmxquJcFSARrP
	YikLj2eLtxRhrPsh6SRKe2byoOAMyPvJZpuNnOvn7YJuKKJS3MrA2SS1047LvndnFy8l
	9rCxXpyccbwXjdgtwTas0Cri9OaW/NO9fbqiO6kEMjH+jWTg8oIh9CtpAKty54AAGqPd
	V505x0e/CBWXHMaCLFEWjwnHjxEA/dc+yHVEQ+rdeMfjacnmoMedmnwfXQAVIG/ppcJu
	J1iA==
MIME-Version: 1.0
X-Received: by 10.180.206.15 with SMTP id lk15mr24243096wic.43.1405621418839; 
	Thu, 17 Jul 2014 11:23:38 -0700 (PDT)
Received: by 10.194.18.114 with HTTP; Thu, 17 Jul 2014 11:23:38 -0700 (PDT)
In-Reply-To: <CANx9H-BaAyDGhz15XdeGZED9=9inevH_00ctZW_vo05aB8FytA@mail.gmail.com>
References: <CAOLEWZXde+2T1bS4ARKMv0cy4KGEZtXHVhtaab0E--49q6wsHA@mail.gmail.com>
	<CANx9H-BaAyDGhz15XdeGZED9=9inevH_00ctZW_vo05aB8FytA@mail.gmail.com>
Date: Thu, 17 Jul 2014 11:23:38 -0700
Message-ID: <CAOLEWZU20E498Xp-DtZYMRu-M+eW_Qn1E25E4ZRLv4t0Z+kR+w@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libgcrypt workaround
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
X-List-Received-Date: Thu, 17 Jul 2014 18:23:41 -0000
Content-Type: multipart/alternative; boundary=001a11c383ca5bd5ba04fe67bd98

--001a11c383ca5bd5ba04fe67bd98
Content-Type: text/plain; charset=UTF-8

Yeah, I kinda suspected pkgconfig but I guess I was busy/distracted with
the biz stuff and didn't dig any deeper than the one recipe...  Sounds like
this patch won't be needed if the pc stuff is clean.

Steve


On Thu, Jul 17, 2014 at 10:34 AM, Tim Orling <ticotimo@gmail.com> wrote:

> Steve,
>
> That workaround fixes the problem, but I think there is something
> fundamentally wrong deeper in. Looks like the culprit is pkgconfig.patch
> for libgpg-error. Testing and will send patch.
>
>
> On Wed, Jul 16, 2014 at 6:47 PM, Stephen Arnold <
> stephen.arnold42@gmail.com> wrote:
>
>> OE-devs/Tim:
>>
>> Here's the basic recipe patch; not sure if I should submit it formally or
>> not.  Maybe a configure patch is preferred?  Feedback welcome.
>>
>> Thanks, Steve
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>

--001a11c383ca5bd5ba04fe67bd98
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yeah, I kinda suspected pkgconfig but I guess I was b=
usy/distracted with the biz stuff and didn&#39;t dig any deeper than the on=
e recipe...=C2=A0 Sounds like this patch won&#39;t be needed if the pc stuf=
f is clean.<br>
<br></div>Steve<br></div><div class=3D"gmail_extra"><br><br><div class=3D"g=
mail_quote">On Thu, Jul 17, 2014 at 10:34 AM, Tim Orling <span dir=3D"ltr">=
&lt;<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.=
com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Steve,<br><br></div>Th=
at workaround fixes the problem, but I think there is something fundamental=
ly wrong deeper in. Looks like the culprit is pkgconfig.patch for libgpg-er=
ror. Testing and will send patch.<br>

</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote"><div><d=
iv class=3D"h5">On Wed, Jul 16, 2014 at 6:47 PM, Stephen Arnold <span dir=
=3D"ltr">&lt;<a href=3D"mailto:stephen.arnold42@gmail.com" target=3D"_blank=
">stephen.arnold42@gmail.com</a>&gt;</span> wrote:<br>

</div></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5"><div dir=
=3D"ltr"><div><div>OE-devs/Tim:<br><br></div>Here&#39;s the basic recipe pa=
tch; not sure if I should submit it formally or not.=C2=A0 Maybe a configur=
e patch is preferred?=C2=A0 Feedback welcome.<br>

<br></div>Thanks, Steve<br>
</div>
<br></div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></font></span></blockquote></div><br></div>
</blockquote></div><br></div>

--001a11c383ca5bd5ba04fe67bd98--
