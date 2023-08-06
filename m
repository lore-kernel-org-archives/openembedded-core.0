Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2D3C0015E
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 19:15:38 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.17361.1691349328856187893
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 12:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OgTLAwfB;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fe3c7f16bbso6020784e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 12:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691349327; x=1691954127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LDeVR6GFa5mLImdKbzdXfR8l4pmrTjSTWWmwuXG/nfw=;
        b=OgTLAwfB9HC/XA0y4LdaQOK1nCAhLKrDqwaE+gfzIXZkw8uw+NPCNaQ1wcsuFKC2WL
         qAMHOoGuD9WN5Bb3RMKsdmrJ14mEYmPvbflg3HXCyNnwiwFmWAzE/loXTzwFSlJcpOUp
         zLxoILrKlf0jikRqmmvFWDnBSMmeI32coKnfjb11E96n7s1bli4RfSLbDlzWBQyJacGn
         Ta9PxK5MeRXx7lUqSFKkeleSlcAHsjEg4T71gQfZsxQvdAYNWaN83kaR/TLt2wVVOPN2
         wS5zUB02+f67UjZl/SPXUfGTchniyuOyusrh1omFhGkMJH4yz/SzUwclAwamhvijs+1b
         z4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691349327; x=1691954127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDeVR6GFa5mLImdKbzdXfR8l4pmrTjSTWWmwuXG/nfw=;
        b=NIdRf6SKPCZpbu11GIwZ6X2ef2i2dGlZHPjIJwe4L1HFsnnQXBR5Qspg8guUBbFNNY
         3721T8nAKVt3MhRETLAzZo2PbIVb1jCfms9I+IOrEecgpMvz5viJbC1vEloOryxnvoAx
         yk0MHzWo07kBT2R/MP1/wOc96UI4/SdoS5STrIfXnwCl4uD7h9wgwSKrNi2/R1k53Pmm
         9wNZBX/PcQqqJs7EZ4WRg3CQzBMukXvcZDWg2qI2fssrsQxh63XaJ7NJBdumeHY42ADZ
         25g0jb3/m2ZM7VfdaDCmfzEo6gk86FyyQVE9Tf4oakNWPHh1nhlq/XjxlLRldaho7P8e
         l8BQ==
X-Gm-Message-State: AOJu0Yyi2BBI8ZhKgC0OftKMuTqUTbIO2sQnB1Zt08sSzdE1F32ocs18
	9hFA/4P9m/tJv8zZig+IdSuZcMD56Eg9w+YfiEY=
X-Google-Smtp-Source: AGHT+IG5ahGBR8aNFcC0SHDQAOBDIH7IXyOmqKqsDPj2+w35kchpYi16102AhQ3vFroE8dHBNgGs/pUHeOSJS7Rzc30=
X-Received: by 2002:a05:6512:603:b0:4fd:d75f:21fd with SMTP id
 b3-20020a056512060300b004fdd75f21fdmr3631798lfe.17.1691349326681; Sun, 06 Aug
 2023 12:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <88B62901-053C-4E95-9896-868EE16A4467@getmailspring.com>
In-Reply-To: <88B62901-053C-4E95-9896-868EE16A4467@getmailspring.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 6 Aug 2023 13:15:14 -0600
Message-ID: <CAJdd5GayZMQscBprpoqXW8JgixQKpVkAhNRJVPDD0Pffqj6Tvw@mail.gmail.com>
Subject: Re: [OE] help with Equivalence Server
To: Maksim Chichikalov <max.chichikalov@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cedde8060245f3a5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 19:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185572

--000000000000cedde8060245f3a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 5, 2023 at 7:54=E2=80=AFPM Maksim Chichikalov <max.chichikalov@=
gmail.com>
wrote:

> Hi Joshua.
>
> My name is Max; nice to e-meet you. I need your help with Equivalence
> Server :)
> I watched your presentation on Youtube - it 100% helped me to understand
> the logic better and debug the issue we are facing. Thank you for all you=
r
> input into OE development.
>
> I found in OE repo that you introduced "def OEOuthashBasic()", so I
> decided to write to you first before opening the topic on an email list.
>
> *The problem:*
>
> Input data are propagated to the output hash generation function, which
> generates a different out-hash.
>
> *Description:*
>
> All "_git.bb" recipes have to append SRCPV to PV. As a result, PV is
> different on each commit.
>
> The OEOuthashBasic function includes SSTATE_PKGSPEC to generate hash,
> which contains PV (PV contains git hash). As a result, there is no way to
> generate the same out-hash even if changes introduced within a commit wer=
e
> trivial.
>

Right, this is sort of on purpose, because the hash equivalence is
basically trying to say that an sstate object can be used in place of
another one, even when the task hashes aren't the same (but the output
hashes are). However, the sstate code itself will only look for sstate
object with a certain name (which include PV); hash equivalency does have
_some_ control over the file name sstate looks for, since it will replace
the taskhash portion of the name with the unified hash, but it doesn't have
complete control.


>
> In our codebase, our components have API part, which is managed by an
> independent recipe per component. The described above problem caused the
> recompilation of all components dependent on API, even in cases when API
> was not changed. CI for pull requests recompiles mostly the entire code
> base, I need to do something with it.  (sorry, quite hard for me to expla=
in
> it in a nutshell, let me know if you like to know slightly more details)
>

Ya, sounds like a typical mono-repo design?


>
> I see a couple of options for us:
>
>    - Add a custom implementation of out-hash generated function and
>    overwrite SSTATE_HASHEQUIV_METHOD.
>    - Better understand why it's mandatory to append SRCPV to PV, and
>    maybe it's flexible in our cases to do it.
>
>
This might be the best option, at least for your recipes, but I've CC'd the
list for additional feedback


>
>    - Propose a patch to fix OEOuthashBasic().
>
> In my humble opinion, the commit's hash shouldn't be included in out-hash
> generation, it doesn't make sense. Unless I'm missing something important=
 -
> What are your thoughts?
>

Yes and no. It's not intentional, but a side effect of hash equivalency
trying to make sure that the things it's marking as equivalent can actually
be found in sstate (basically, because sstate include the commit hash, hash
equivalency kinda has to include it).


>
> I appreciate it if you reply with your thoughts; many thanks for
> considering my request.
>
> What makes you *smile* today?
>
> Sincerely, Max Chichikalov
>

--000000000000cedde8060245f3a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 5, 2023 at 7:54=E2=80=AFP=
M Maksim Chichikalov &lt;<a href=3D"mailto:max.chichikalov@gmail.com">max.c=
hichikalov@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div>Hi Joshua.</div><br><div>My name is Max; nice to e=
-meet you. I need your help with Equivalence Server :)</div><div>I watched =
your presentation on Youtube - it 100% helped me to understand the logic be=
tter and debug the issue we are facing. Thank you for all your input into O=
E development.</div><br><div>I found in OE repo that you introduced &quot;d=
ef OEOuthashBasic()&quot;, so I decided to write to you first before openin=
g the topic on an email list.</div><br><div><b>The problem:</b></div><br><d=
iv>Input data are propagated to the output hash generation function, which =
generates a different out-hash.</div><br><div><b>Description:</b></div><br>=
<div>All &quot;_<a href=3D"http://git.bb" target=3D"_blank">git.bb</a>&quot=
; recipes have to append SRCPV to PV. As a result, PV is different on each =
commit.</div><br><div>The OEOuthashBasic function includes SSTATE_PKGSPEC t=
o generate hash, which contains PV (PV contains git hash). As a result, the=
re is no way to generate the same out-hash even if changes introduced withi=
n a commit were trivial.</div></blockquote><div><br></div><div>Right, this =
is sort of on purpose, because the hash equivalence is basically trying to =
say that an sstate object can be used in place of another one, even when th=
e task hashes aren&#39;t the same (but the output hashes are). However, the=
 sstate code itself will only look for sstate object with a certain name (w=
hich include PV); hash equivalency does have _some_ control over the file n=
ame sstate looks for, since it will replace the taskhash portion of the nam=
e with the unified hash, but it doesn&#39;t have complete control.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br><div>In=
 our codebase, our components have API part, which is managed by an indepen=
dent recipe per component. The described above problem caused the recompila=
tion of all components dependent on API, even in cases when API was not cha=
nged. CI for pull requests recompiles mostly the entire code base, I need t=
o do something with it.=C2=A0 (sorry, quite hard for me to explain it in a =
nutshell, let me know if you like to know slightly more details)=C2=A0</div=
></blockquote><div><br></div><div>Ya, sounds like a typical mono-repo desig=
n?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br><div>I see a couple of options for us:</div><ul><li><div>Add a cust=
om implementation of out-hash generated function and overwrite SSTATE_HASHE=
QUIV_METHOD.</div></li><li><div>Better understand why it&#39;s mandatory to=
 append SRCPV to PV, and maybe it&#39;s flexible in our cases to do it.</di=
v></li></ul></blockquote><div><br></div><div>This might be the best option,=
 at least for your recipes, but I&#39;ve CC&#39;d the list for additional f=
eedback<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><ul><li><div>Propose a patch to fix OEOuthashBasic().</div></li>=
</ul></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>In=
 my humble opinion, the commit&#39;s hash shouldn&#39;t be included in out-=
hash generation, it doesn&#39;t make sense. Unless I&#39;m missing somethin=
g important - What are your thoughts?</div></blockquote><div><br></div><div=
>Yes and no. It&#39;s not intentional, but a side effect of hash equivalenc=
y trying to make sure that the things it&#39;s marking as equivalent can ac=
tually be found in sstate (basically, because sstate include the commit has=
h, hash equivalency kinda has to include it).<br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><br><div>I appreciate it if =
you reply with your thoughts; many thanks for considering my request.</div>=
<br><div><u></u><table cellpadding=3D"0" cellspacing=3D"0"><tbody><tr><td s=
tyle=3D"vertical-align:top"></td><td><div style=3D"font-size:0.9em;border-t=
op:1px solid gray;min-width:450px;max-width:600px"></div><div style=3D"font=
-size:1.2em">What makes you <b>smile</b> today?</div><br><div style=3D"font=
-size:1.2em">Sincerely, Max Chichikalov</div><div style=3D"font-size:0.9em;=
border-top:1px solid gray;min-width:450px;max-width:600px;margin-top:4px;pa=
dding-top:4px"></div></td></tr></tbody></table><u></u></div></blockquote></=
div></div>

--000000000000cedde8060245f3a5--

