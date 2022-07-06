Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A1BCCA473
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 15:54:44 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.7969.1657122883306661864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 08:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ii69DT9T;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id k129so9111989wme.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 08:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lkuCBasngf5G0wvZY/ty9sZDzC1W/NApbhLiKjS4Z1Q=;
        b=ii69DT9TB+Hjr+n44dWqAEWF8AHekU45HuzB8i3xSkWJjZcFNGYaCfV3n9KBXCVCSm
         e9H6PPHU5QlaVRcVQOWraoQYF0uioXe+Qoc6iwBB1vOtRZgO0HE4tOPMw0px0AlzFIvu
         zaygMHEsRuHZWacUaT0dcHuFXWJlfljuR0XKiGQxNh6YnDaJdJ+1GB5i8TFM4A0t1WmM
         lqt0KUUMMqMS1nOt+HGVjmyo6WZOoQficM1flCgGCTjvVIOUdCVco6fLpS6MJzx0TLQZ
         MWaUbkl7WGkCiOILcposA44rFcZMg3rD0V/zxoKIoUhYjkdROojZ1MXQ3wuu2VavhnKW
         belg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lkuCBasngf5G0wvZY/ty9sZDzC1W/NApbhLiKjS4Z1Q=;
        b=V2dUAWvm72/0dkEgprkCvLESF/RCCwOoFNzVynO2waN1ayeHo5OANrg8t2QcTdVBcE
         yvQgAr+Z5z0q9n9B9ukDofMVX0XiiOtcR5virk2/Qoj9eJxODJH6vHdSwGneYlLecijS
         TcRAorIQ79C/bGL8WcFdz4DyBVGtpTR1oNFYxVTsm0wn1by7FskzT4mJqmYm64gQNgmQ
         erg7/jcltZAY56kkGKlxWZYZtCmXXYnpQGOhHJqPbdbl3ejjUMC3i1ErDBipT9fpICbj
         Bmt4oOYZPxwO/jZ74kiu3lMr7rUaLDXkUu0UgcAZqQ2AbNRmD0SPf4strbJCBHmlCiNv
         zBGg==
X-Gm-Message-State: AJIora/jjrOE89em5llP/1PE0MHtkw/FHsRlJvYbwHASo5DuK+kpD5ap
	u91/RSKRDqL/L7yDdPuKImkclAnXi4CyhGFJuEw=
X-Google-Smtp-Source: 
 AGRyM1v08YVlCBkxjuV/9mC7/IYpkIQ/umsD/eB76kx9DJWaIA3an1S060AIFlZQM8JlojGPUlWN8JTfOqdSKkYf1+w=
X-Received: by 2002:a1c:770c:0:b0:3a0:37ec:bbb9 with SMTP id
 t12-20020a1c770c000000b003a037ecbbb9mr46399109wmi.2.1657122881681; Wed, 06
 Jul 2022 08:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <16D467EAE661BF11.21797@lists.openembedded.org>
 <CANPvuRn8mgL6FMWj0143ZTPXY5VyzHfA81kJruqFEq0xdpBgnQ@mail.gmail.com>
In-Reply-To: 
 <CANPvuRn8mgL6FMWj0143ZTPXY5VyzHfA81kJruqFEq0xdpBgnQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 6 Jul 2022 17:54:26 +0200
Message-ID: 
 <CA+chaQesUNm2tKAVLH2jx_NY_QXJXwqb597=HTv9HANfQFKnnQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icecc.bbclass: enable networking in all tasks
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b63d1205e324fc55"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 15:54:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167731

--000000000000b63d1205e324fc55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW: I have noticed yesterday that some of our builds were able to fetch
external dependencies in do_configure again and found that it was caused by
this commit.

I understand why this was needed to make icecc.bbclass working again.

Our (LGE) use-case is a bit special, because we inherit icecc by default
(through INHERIT_DISTRO) even when most builders might have it disabled
with ICECC_DISABLED - it's set this way, so that jenkins builders with
icecc enabled produce sstate-cache which can be re-used in local build
machines where icecc might be disabled.

So to support this I've changed icecc.bbclass to respect ICECC_DISABLED
when setting network varFlag:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/ki=
rkstone&id=3D5bbb735c3285a16bf2ec9548a58b887f93f4900e

but that requires expand to be True in bitbake-worker as in:
https://git.openembedded.org/bitbake-contrib/commit/?h=3Djansa/2.0&id=3D4a6=
c8e61a545152776c0c76304c4225f79de94d2

But that has parsing performance penalty as discussed with RP on #yocto,
here is relevant part:

16:03 < JaMa> RP: do you remember if there was specific reason for using
expand=3DFalse for network varFlag in
https://git.openembedded.org/bitbake/commit/?id=3D0746b6a2a32fec4c18bf1a52b=
1454ca4c04bf543
? I wanted to change

https://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&id=3D2=
5ea276a13a6ac2342c2b0945c8fafe878d56095
to enable network only when ICECC_DISABLED isn't set
16:24 < RP> JaMa: it was efficiency
16:24 < RP> JaMa: saved any expansion call
16:24 < RP> and any processing to determine if the value was true or false
16:26 < JaMa> RP: and would it be acceptable to enable to support
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/ki=
rkstone&id=3D5bbb735c3285a16bf2ec9548a58b887f93f4900e
?
16:28 < JaMa> I guess I can delVarFlag when ICECC_DISABLED is set, but then
it would delete it even where it was explicitly enabled in the recipe
16:32 < RP> JaMa: well, I'd prefer not to as all these things mount up to
increase parsing time but I'm starting to feel like I should just not care.
I'm tired of saying no
16:33 < RP> JaMa: you could just equally set or delete those in anon python
I guess. I really just don't know what to do for the best any more
16:34 < JaMa> RP: yes delVarFlag in anon python was my backup plan if the
price for expand is too high, thanks
16:35 < RP> JaMa: it is sad in that "0" won't work in there are a value
today either but I really don't know what price people want to pay on
parsing speed vs usability and consistency
16:37 < JaMa> understood, thanks
16:39 < RP> JaMa: memories are paging back in, I think I did this to see
whether anyone complained which they now have. It isn't unreasonable to
properly check it :/
16:40 < RP> it is a bit like the cleandirs change for externalsrc. It will
slow things down a lot :/

Does anyone have some strong opinion either way or some other idea how to
support this without parsing time penalty?

Regards,

On Mon, Feb 28, 2022 at 5:10 PM Jose Quaresma <quaresma.jose@gmail.com>
wrote:

> This patch can't be the right fix but currently the icecc.bbclass doesn't
> work on master.
>
> Jose
>
> Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
> gmail.com@lists.openembedded.org> escreveu no dia quarta, 16/02/2022 =C3=
=A0(s)
> 23:27:
>
>> The icecc.bbclass needs network access to work properly.
>>
>> Currently I build with icecc inside a container with network isolation a=
nd
>> my icecc daemon runs outside of the build container in my host.
>> The only thing I need to do for using the icecc inside my build containe=
r
>> is
>> mounting the unix socket /var/run/icecc/iceccd.socket inside the
>> container.
>>
>> I think we need something like this mount functionality to have access t=
o
>> some sockets connections inside the tasks that runs on the new namespace
>> created with unshare system call.
>>
>> This patch is not a the real solution for the problem and is more like
>> an hack so we can use the icecc.bbclass again.
>>
>> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>> ---
>>  meta/classes/icecc.bbclass | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
>> index 3bbd2645af..68415b04c7 100644
>> --- a/meta/classes/icecc.bbclass
>> +++ b/meta/classes/icecc.bbclass
>> @@ -428,18 +428,22 @@ set_icecc_env() {
>>      bbnote "Using icecc tarball: $ICECC_VERSION"
>>  }
>>
>> +do_configure[network] =3D "1"
>>  do_configure:prepend() {
>>      set_icecc_env
>>  }
>>
>> +do_compile[network] =3D "1"
>>  do_compile:prepend() {
>>      set_icecc_env
>>  }
>>
>> +do_compile_kernelmodules[network] =3D "1"
>>  do_compile_kernelmodules:prepend() {
>>      set_icecc_env
>>  }
>>
>> +do_install[network] =3D "1"
>>  do_install:prepend() {
>>      set_icecc_env
>>  }
>> --
>> 2.35.1
>>
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162509):
> https://lists.openembedded.org/g/openembedded-core/message/162509
> Mute This Topic: https://lists.openembedded.org/mt/89198407/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b63d1205e324fc55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>FWIW: I have noticed yesterday that some of our build=
s were able to fetch external dependencies in do_configure again and found =
that it was caused by this commit.</div><div><br></div><div>I understand wh=
y this was needed to make icecc.bbclass working again.</div><div><br></div>=
<div>Our (LGE) use-case is a bit special, because we inherit icecc by defau=
lt (through INHERIT_DISTRO) even when most builders might have it disabled =
with ICECC_DISABLED - it&#39;s set this way, so that jenkins builders with =
icecc enabled produce sstate-cache which can be re-used in local build mach=
ines where icecc might be disabled.</div><div><br></div><div>So to support =
this I&#39;ve changed icecc.bbclass to respect=C2=A0ICECC_DISABLED when set=
ting network varFlag:</div><div><a href=3D"https://git.openembedded.org/ope=
nembedded-core-contrib/commit/?h=3Djansa/kirkstone&amp;id=3D5bbb735c3285a16=
bf2ec9548a58b887f93f4900e">https://git.openembedded.org/openembedded-core-c=
ontrib/commit/?h=3Djansa/kirkstone&amp;id=3D5bbb735c3285a16bf2ec9548a58b887=
f93f4900e</a><br></div><div><br></div><div>but that requires expand to be T=
rue in bitbake-worker as in:</div><div><a href=3D"https://git.openembedded.=
org/bitbake-contrib/commit/?h=3Djansa/2.0&amp;id=3D4a6c8e61a545152776c0c763=
04c4225f79de94d2">https://git.openembedded.org/bitbake-contrib/commit/?h=3D=
jansa/2.0&amp;id=3D4a6c8e61a545152776c0c76304c4225f79de94d2</a><br></div><d=
iv><br></div><div>But that has parsing performance penalty as discussed wit=
h RP on #yocto, here is relevant part:</div><div><br></div><div>16:03 &lt; =
JaMa&gt; RP: do you remember if there was specific reason for using expand=
=3DFalse for network varFlag in <a href=3D"https://git.openembedded.org/bit=
bake/commit/?id=3D0746b6a2a32fec4c18bf1a52b1454ca4c04bf543">https://git.ope=
nembedded.org/bitbake/commit/?id=3D0746b6a2a32fec4c18bf1a52b1454ca4c04bf543=
</a> ? I wanted to change <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <a href=3D"https://git.openembedded.org/openembedded-core/commit/?h=3Dk=
irkstone&amp;id=3D25ea276a13a6ac2342c2b0945c8fafe878d56095">https://git.ope=
nembedded.org/openembedded-core/commit/?h=3Dkirkstone&amp;id=3D25ea276a13a6=
ac2342c2b0945c8fafe878d56095</a> to enable network only when ICECC_DISABLED=
 isn&#39;t set<br></div><div>16:24 &lt; RP&gt; JaMa: it was efficiency<br>1=
6:24 &lt; RP&gt; JaMa: saved any expansion call<br>16:24 &lt; RP&gt; and an=
y processing to determine if the value was true or false<br>16:26 &lt; JaMa=
&gt; RP: and would it be acceptable to enable to support <a href=3D"https:/=
/git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/kirkstone=
&amp;id=3D5bbb735c3285a16bf2ec9548a58b887f93f4900e">https://git.openembedde=
d.org/openembedded-core-contrib/commit/?h=3Djansa/kirkstone&amp;id=3D5bbb73=
5c3285a16bf2ec9548a58b887f93f4900e</a> ?<br></div><div>16:28 &lt; JaMa&gt; =
I guess I can delVarFlag when ICECC_DISABLED is set, but then it would dele=
te it even where it was explicitly enabled in the recipe<br></div><div>16:3=
2 &lt; RP&gt; JaMa: well, I&#39;d prefer not to as all these things mount u=
p to increase parsing time but I&#39;m starting to feel like I should just =
not care. I&#39;m tired of saying no<br>16:33 &lt; RP&gt; JaMa: you could j=
ust equally set or delete those in anon python I guess. I really just don&#=
39;t know what to do for the best any more<br></div><div>16:34 &lt; JaMa&gt=
; RP: yes delVarFlag in anon python was my backup plan if the price for exp=
and is too high, thanks<br></div><div>16:35 &lt; RP&gt; JaMa: it is sad in =
that &quot;0&quot; won&#39;t work in there are a value today either but I r=
eally don&#39;t know what price people want to pay on parsing speed vs usab=
ility and consistency<br></div><div>16:37 &lt; JaMa&gt; understood, thanks<=
br>16:39 &lt; RP&gt; JaMa: memories are paging back in, I think I did this =
to see whether anyone complained which they now have. It isn&#39;t unreason=
able to properly check it :/<br></div><div>16:40 &lt; RP&gt; it is a bit li=
ke the cleandirs change for externalsrc. It will slow things down a lot :/<=
br></div><div><br></div><div>Does anyone have some strong opinion either wa=
y or some other idea how to support this without parsing time penalty?</div=
><div><br></div><div>Regards,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Feb 28, 2022 at 5:10 PM Jose Quaresma=
 &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div>This patch can&#39;t be the right=C2=A0fix but currently =
the icecc.bbclass doesn&#39;t work on master.<br></div><div><br></div><div>=
Jose</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">Jose Quaresma via <a href=3D"http://lists.openembedded.org" target=3D"_=
blank">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedd=
ed.org</a>&gt; escreveu no dia quarta, 16/02/2022 =C3=A0(s) 23:27:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">The icecc.bbclass needs =
network access to work properly.<br>
<br>
Currently I build with icecc inside a container with network isolation and<=
br>
my icecc daemon runs outside of the build container in my host.<br>
The only thing I need to do for using the icecc inside my build container i=
s<br>
mounting the unix socket /var/run/icecc/iceccd.socket inside the container.=
<br>
<br>
I think we need something like this mount functionality to have access to<b=
r>
some sockets connections inside the tasks that runs on the new namespace<br=
>
created with unshare system call.<br>
<br>
This patch is not a the real solution for the problem and is more like<br>
an hack so we can use the icecc.bbclass again.<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/icecc.bbclass | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass<br>
index 3bbd2645af..68415b04c7 100644<br>
--- a/meta/classes/icecc.bbclass<br>
+++ b/meta/classes/icecc.bbclass<br>
@@ -428,18 +428,22 @@ set_icecc_env() {<br>
=C2=A0 =C2=A0 =C2=A0bbnote &quot;Using icecc tarball: $ICECC_VERSION&quot;<=
br>
=C2=A0}<br>
<br>
+do_configure[network] =3D &quot;1&quot;<br>
=C2=A0do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0set_icecc_env<br>
=C2=A0}<br>
<br>
+do_compile[network] =3D &quot;1&quot;<br>
=C2=A0do_compile:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0set_icecc_env<br>
=C2=A0}<br>
<br>
+do_compile_kernelmodules[network] =3D &quot;1&quot;<br>
=C2=A0do_compile_kernelmodules:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0set_icecc_env<br>
=C2=A0}<br>
<br>
+do_install[network] =3D &quot;1&quot;<br>
=C2=A0do_install:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0set_icecc_env<br>
=C2=A0}<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#162509): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/162509" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/162509</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89198407/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89198407/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b63d1205e324fc55--

