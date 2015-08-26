Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6C56176B7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 14:20:48 +0000 (UTC)
Received: by igfj19 with SMTP id j19so38079547igf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 07:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=iwXtSB+eLJgb8rSFLszc508Zk4R/G+9NX3tACQxuHuY=;
	b=NkJ+fpRsiCxwYYIG2Hubh6pgr/dezrJZzCBmFPCkgI4cTLcjp1TjEevnqar0Y+jpDz
	D2dYL7vvARs4m1f5b5+9VcSpeOoqJQblE6eRTNuMjzcd8skfOX3b+fIBpg/wngN9nTOH
	0iuv9wfc3JRWgyK7ecO6j/Oc3mJQ/5WaZzAn28alkX07PyaxJusKrKtfg4CqBEHCiwi3
	ahkLVZCaZ4JzNQb0N4C4HCDog5nBfkzbnOKt1OpUdf7zdikFsHyVOo4pYBBbJGpaM/6p
	ikn4tuNNjN2ytQxJCviXvckLpjnH4nTHuJuQB84JTObsBTt2tlJ+qpIs/xp7VSCWIjeV
	fBNQ==
X-Received: by 10.50.138.76 with SMTP id qo12mr4253684igb.38.1440598848959;
	Wed, 26 Aug 2015 07:20:48 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Wed, 26 Aug 2015 07:20:29 -0700 (PDT)
In-Reply-To: <CABcZANk_tgWL0VSvRCsA=_X7Yz25OQcgfAgek98WOWmZ7J5tug@mail.gmail.com>
References: <19f46bb2f6951eca80f159b612b407e3df0b6ea1.1440454290.git.chris_larson@mentor.com>
	<3843d76235f7517207f9aa178d70c731f2b2d51e.1440454290.git.chris_larson@mentor.com>
	<55DD7C88.4080305@collabora.co.uk>
	<CAJTo0LaO2RSxb_RC-aDUo46dQAoQPwArNJNDCOkkTdEKVUwZhw@mail.gmail.com>
	<CABcZANk_tgWL0VSvRCsA=_X7Yz25OQcgfAgek98WOWmZ7J5tug@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 26 Aug 2015 07:20:29 -0700
X-Google-Sender-Auth: f8P11SKPwLfZKVZy0bE873iHZZE
Message-ID: <CABcZAN=zY7JoSk+btg7=GLxnqaX_ZXwvj1Nv5Dz10RnqGNPDGg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] insane.bbclass: add host-user-contaminated test
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
X-List-Received-Date: Wed, 26 Aug 2015 14:20:50 -0000
Content-Type: multipart/alternative; boundary=001a1134b964a7fa84051e378e32

--001a1134b964a7fa84051e378e32
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 26, 2015 at 7:19 AM, Christopher Larson <clarson@kergoth.com>
wrote:

> On Wed, Aug 26, 2015 at 4:01 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
>> On 26 August 2015 at 09:44, Joshua Lock <joshua.lock@collabora.co.uk>
>> wrote:
>>
>>> I do all of my builds on a separate partition in a directory hierarchy
>>> which is owned by my user - if I'm understanding this correctly I'll get QA
>>> WARNINGS for all of my builds with this change?
>>>
>>
>> The paths are prefixed with ${D} so pretend the commit log says "in
>> packages".
>
>
> Heh, indeed, it's a package QA test. do_install runs under pseudo, so any
> newly created files there, or files chown'd to root, will be fine. If,
> however, a recipe does a cp -a or so to install without doing a chown,
> you'll end up with files in your rootfs owned by the user that did the
> build -- not good.


I can re-submit with that commit message clarification, if needed? I rather
thought the fact that it was in insane.bbclass, not sanity.bbclass, carried
the necessary implication.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1134b964a7fa84051e378e32
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Aug 26, 2015 at 7:19 AM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><=
div class=3D"gmail_quote">On Wed, Aug 26, 2015 at 4:01 AM, Burton, Ross <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blan=
k">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><span><div class=3D"gmail_quote">On 26 August 2015 at 09:44, Joshua L=
ock <span dir=3D"ltr">&lt;<a href=3D"mailto:joshua.lock@collabora.co.uk" ta=
rget=3D"_blank">joshua.lock@collabora.co.uk</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div style=3D"overflow:hidden">I do all of my buil=
ds on a separate partition in a directory hierarchy which is owned by my us=
er - if I&#39;m understanding this correctly I&#39;ll get QA WARNINGS for a=
ll of my builds with this change?<br></div></blockquote></div><br></span>Th=
e paths are prefixed with ${D} so pretend the commit log says &quot;in pack=
ages&quot;.</blockquote></div><br></span>Heh, indeed, it&#39;s a package QA=
 test. do_install runs under pseudo, so any newly created files there, or f=
iles chown&#39;d to root, will be fine. If, however, a recipe does a cp -a =
or so to install without doing a chown, you&#39;ll end up with files in you=
r rootfs owned by the user that did the build -- not good.</blockquote></di=
v><br>I can re-submit with that commit message clarification, if needed? I =
rather thought the fact that it was in insane.bbclass, not sanity.bbclass, =
carried the necessary implication.<br>-- <br><div class=3D"gmail_signature"=
>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, Ope=
nEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Me=
ntor Graphics</div>
</div></div>

--001a1134b964a7fa84051e378e32--
