Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3FA297807A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 12:03:08 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id v10so7385435wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 04:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1ckyEVjRpPNzko3i178yrpSvCaNQ3VRTdzqaHP4EwME=;
	b=fGeL6TE7YH5KmOxVt/6LEx+N6MvXrYAFoXaummbFaCH9IEE7/pkBSOn2wAjAf8XCan
	JiUDSC7RgH2gMwee1ps06dAAtth/25e5JnAincsekXDGk/6yIXHh4iC5kRK4yXVbSj+k
	DqwZcS8hvfXPKQBdBMwQmbxvcaEGancAS2PO/rK5EXFPycAzf9sL/xfu7E1Bzif0nbA0
	MC/0ipAzXcu/TG9Eo47RFgNyzTpdGYLDPKUIWN3PstLv+wq7rgs+0zPxbvuV3DA4Z0Dq
	gQeD0V9Q9Ltz353DJxAlMfE+yc7y+qffVJke8A3H7vpO7Gmr1mywGhavJAxOqjWGvapf
	Hk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1ckyEVjRpPNzko3i178yrpSvCaNQ3VRTdzqaHP4EwME=;
	b=dhtVRrXN38RMKFIDgHSotv1ue92oxMlzAkaR7IObyflyvdNRLpfaFo5XZqjV6beHXh
	W3cxCZr3Zpq+hsxW4MXw2TgzATz23Syux9LhyNlgzS13ODO14iNLJ4u0WPPOjhJVUSDq
	oX6PAH+rPYYt1rv0+B8dMJAF0tOsavXWdQp+kBYLtOr/a98u4uRNdQrpA/UYEEoiySB/
	h64X5nfxUQq9/lwSKXiXdoVnbW0zeZCcrOzUgSf3Gg0h2Pl4ZEdNiU/iks0EVDyQU6RY
	jBxNJbeat2q7kS6KsHEpHa5oHhyvS8aWGOePOB2N6WlzDt8OTqrgKlJ11K7XUytWI/hf
	+nuw==
X-Gm-Message-State: APf1xPAYhLf6tssnFxf0EgsR0e3oO9DajziXIWHhOALjsiLJJ+RpvcQt
	xM2gK4RsiezVqMyUiERJgCQSR2atNMkAiBfn6K8=
X-Google-Smtp-Source: AH8x226SsKufX2URPzpztDKWMuzIrTXVIF0EWmmXOA5GeGBQyzMRZNImb1bSR/pyr+hGFDYpEZ2agnZGiWS/gjBex7s=
X-Received: by 10.28.8.137 with SMTP id 131mr7530458wmi.79.1518868989785; Sat,
	17 Feb 2018 04:03:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sat, 17 Feb 2018 04:03:09 -0800 (PST)
In-Reply-To: <CA+chaQdGobLWVzZ_YSpdWozrF3ZrYzBNAVusUMFgGFbAX+w90w@mail.gmail.com>
References: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
	<CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
	<20180216115147.2869fdf2@seebsdell>
	<CA+chaQf=OMV60V7S=C6zaJ3sd_FwQkiojKY5EqAb6gTxXAQmXw@mail.gmail.com>
	<20180216132531.3a1c2398@seebsdell>
	<60cc88e3-577e-de47-e5da-b3cf93c74a2c@linux.intel.com>
	<CA+chaQdGobLWVzZ_YSpdWozrF3ZrYzBNAVusUMFgGFbAX+w90w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 17 Feb 2018 13:03:09 +0100
Message-ID: <CA+chaQeNhb=nPaYz3XZdh_ceQopFKJvEq5Ximu83PykTjoHJWA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: update to latest master
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
X-List-Received-Date: Sat, 17 Feb 2018 12:03:09 -0000
Content-Type: multipart/alternative; boundary="001a1144260098bc8d0565673e8d"

--001a1144260098bc8d0565673e8d
Content-Type: text/plain; charset="UTF-8"

> Without this change (pseudo at 'Handle O_TMPFILE more better') things
work flawlessly, with epoll enabled.

Your
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/pseudo-1.9.0
is using this change with SRCREV b6a015aa91d7ab84c2f5466f3b5704f501129cbc.

Does it mean that the change you sent to the ML doesn't work flawlessly and
to make it work you need to downgrade SRCREV
from b6a015aa91d7ab84c2f5466f3b5704f501129cbc
to 23f089f480e04ca1b88df8fe1f46b864fee2a0b8 (while I did upgrade
from b6a015aa91d7ab84c2f5466f3b5704f501129cbc
to 26e30fa2e1a0fe4e885d7eea3f55d23cd2c3158f after Seebs reply)?

docker-shr @ ~/projects/pseudo $ git log --oneline yp/master  | head -n 5
26e30fa Allow closing client 0
b6a015a Handle O_TMPFILE more better
23f089f Fix openat flag #ifdef typo
449c234 Half-undo FASTOP
d107418 1.9.0


On Sat, Feb 17, 2018 at 12:56 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On ubuntu-14.04 I'm seeing SIGABRT in couple do_install tasks even after
> reverting both pseudo changes (the upgrade from Alex as well as SRCREV bump
> to latest commit from Seebs).
>
> So there might be different root cause for SIGABRT unrelated to pseudo
> which I haven't seen before, because pseudo locked-up in never ending loop
> before it reached that point. I kind of suspect the icecc changes as
> nothing else in last oe-core upgrade looked suspicious to cause such issues
> in unrelated components (like tzdata, update-rc.d do_install).
>
> On ubuntu-18.04 with both changes included I've reproduced the lock-up and
> endless 100% CPU spin without pseudo.log growing in size.
>
> I'll try to revert icecc changes to verify if it makes SIGABRT go away,
> then will try to upgrade pseudo again on 14.04 to see if it will spin or
> not.
>
> Regards,
>
> On Sat, Feb 17, 2018 at 12:22 PM, Alexander Kanavin <
> alexander.kanavin@linux.intel.com> wrote:
>
>> On 02/16/2018 09:25 PM, Seebs wrote:
>>
>>> On Fri, 16 Feb 2018 20:11:48 +0100
>>> Martin Jansa <martin.jansa@gmail.com> wrote:
>>>
>>> I didn't get to the logs yet, but with this change added I see many
>>>> do_install tasks failing with exit code '134'.
>>>>
>>>
>>> Huh, that's SIGABRT. I'll see if I can reproduce.
>>>
>>
>> My experience is again radically different to that of Martin. Without
>> this change (pseudo at 'Handle O_TMPFILE more better') things work
>> flawlessly, with epoll enabled.
>>
>> With this change (pseudo at 'Allow closing client 0), pseudo again locks
>> up and goes into endless 100% CPU spin. There's nothing useful in
>> pseudo.log, and it does not grow in size.
>>
>> I think we need someone else to try this, perhaps on the autobuilder, to
>> have more than two data points. I rebased my patch on top of latest poky
>> master, but did not bump it to latest pseudo master:
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?
>> h=akanavin/pseudo-1.9.0
>>
>>
>> Alex
>>
>
>

--001a1144260098bc8d0565673e8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0Without this change (pseudo at &#39;Handle O_TMP=
FILE more better&#39;) things work flawlessly, with epoll enabled.<div><br>=
</div><div>Your <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-c=
ontrib/log/?h=3Dakanavin/pseudo-1.9.0">http://git.yoctoproject.org/cgit/cgi=
t.cgi/poky-contrib/log/?h=3Dakanavin/pseudo-1.9.0</a> is using this change =
with SRCREV=C2=A0b6a015aa91d7ab84c2f5466f3b5704f501129cbc.</div><div><br></=
div><div>Does it mean that the change you sent to the ML doesn&#39;t work f=
lawlessly and to make it work you need to downgrade SRCREV from=C2=A0b6a015=
aa91d7ab84c2f5466f3b5704f501129cbc to=C2=A023f089f480e04ca1b88df8fe1f46b864=
fee2a0b8 (while I did upgrade from=C2=A0b6a015aa91d7ab84c2f5466f3b5704f5011=
29cbc to=C2=A026e30fa2e1a0fe4e885d7eea3f55d23cd2c3158f after Seebs reply)?<=
/div><div><br></div><div><div>docker-shr @ ~/projects/pseudo $ git log --on=
eline yp/master=C2=A0 | head -n 5</div><div>26e30fa Allow closing client 0<=
/div><div>b6a015a Handle O_TMPFILE more better</div><div>23f089f Fix openat=
 flag #ifdef typo</div><div>449c234 Half-undo FASTOP</div><div>d107418 1.9.=
0</div></div><div><br></div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Sat, Feb 17, 2018 at 12:56 PM, Martin Jansa <span dir=
=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">ma=
rtin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div dir=3D"ltr">On ubuntu-14.04 I&#39;m seeing SIGABRT in couple do_inst=
all tasks even after reverting both pseudo changes (the upgrade from Alex a=
s well as SRCREV bump to latest commit from Seebs).<div><br></div><div>So t=
here might be different root cause for SIGABRT unrelated to pseudo which I =
haven&#39;t seen before, because pseudo locked-up in never ending loop befo=
re it reached that point. I kind of suspect the icecc changes as nothing el=
se in last oe-core upgrade looked suspicious to cause such issues in unrela=
ted components (like tzdata, update-rc.d do_install).</div><div><br></div><=
div>On ubuntu-18.04 with both changes included I&#39;ve reproduced the lock=
-up and endless 100% CPU spin without pseudo.log growing in size.</div><div=
><br></div><div>I&#39;ll try to revert icecc changes to verify if it makes =
SIGABRT go away, then will try to upgrade pseudo again on 14.04 to see if i=
t will spin or not.</div><div><br></div><div>Regards,</div></div><div class=
=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Sat, Feb 17, 2018 at 12:22 PM, Alexander Kanavin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D=
"_blank">alexander.kanavin@linux.<wbr>intel.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><span>On 02/16/2018 09:25 PM, Seebs wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Fri, 16 Feb 2018 20:11:48 +0100<br>
Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank=
">martin.jansa@gmail.com</a>&gt; wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I didn&#39;t get to the logs yet, but with this change added I see many<br>
do_install tasks failing with exit code &#39;134&#39;.<br>
</blockquote>
<br>
Huh, that&#39;s SIGABRT. I&#39;ll see if I can reproduce.<br>
</blockquote>
<br></span>
My experience is again radically different to that of Martin. Without this =
change (pseudo at &#39;Handle O_TMPFILE more better&#39;) things work flawl=
essly, with epoll enabled.<br>
<br>
With this change (pseudo at &#39;Allow closing client 0), pseudo again lock=
s up and goes into endless 100% CPU spin. There&#39;s nothing useful in pse=
udo.log, and it does not grow in size.<br>
<br>
I think we need someone else to try this, perhaps on the autobuilder, to ha=
ve more than two data points. I rebased my patch on top of latest poky mast=
er, but did not bump it to latest pseudo master:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3D=
akanavin/pseudo-1.9.0" rel=3D"noreferrer" target=3D"_blank">http://git.yoct=
oproject.org/cg<wbr>it/cgit.cgi/poky-contrib/log/?<wbr>h=3Dakanavin/pseudo-=
1.9.0</a><br>
<br>
<br>
Alex<br>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a1144260098bc8d0565673e8d--
