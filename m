Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 32C9B78787
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 14:39:03 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id 72so2365100iom.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 06:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=a4eqwxrl7iiCIukCxuXpbUoavpd6OsPf47lDSmSbeMQ=;
	b=lQFS5iPG//iI1a8WyVOh2JhzKE0A/3uyR8kqNOOTQQgsKicTTVeIPbij8B08Nqxwsk
	1R+fLLYnZqvZOCnW+DnKuolb89OWgfo3/1iCsUG4Ochm+wvHMcX6+q6R8KGh9YISeZwX
	8/4wa1lOkmyqYtjQJIN+OOwuYCFQD28AtwQUWM14VnmSOlo9v7J5QZjAFNEMOrGrDGBG
	y4nte4uh90g0j2Tw7SdmuUriikSmf6VJX0+DGXGScnRUL8FpA5LKua7H3DAT/m3osjBh
	FsOBPZMIHwPdRfIZKM/k/FxgW9XKZMyy3+n/urIo0MKSQO6Q01QENruvxrAumR/SezX4
	83iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=a4eqwxrl7iiCIukCxuXpbUoavpd6OsPf47lDSmSbeMQ=;
	b=fK9BRbg53EeVOgfg7D8Xf7SetIeryZfaK3YWgBGM60/OkduSUqbD2z8JgyxK+WcjDp
	9XFVtVJmNjkXwMVL7EugBtw8a1LJtY735VGqw9lZBm/06LWdu8AXq7RiaIywvCyxsjt3
	Ozpnz5ZMqSlKEqbvz7zr3nCbvLz4JfyUSkRrcJw1J5H390cmtUkzZX3lrKj3ApO8Y531
	WXqCfjQXQCrbnClqQM3KIeSan7REttwlUjrQisi2NLrzvCmDSCbAf52xuQXPyuq5k0vX
	9rDmUkIETV2sIv+7udf814wqy9keyIT5F37wo7nLHBUlqPSKb+y0EyTRjNgO5pr+dHC2
	YZ2Q==
X-Gm-Message-State: AKwxyteznJZFGrzaszG5jH3foeBfy9CHqPgEcIohHgBEa4zDMhY3+ksV
	A0iTiQ8Kt6jitn4V65CA3UIildN3to00P/RNR+zvWw==
X-Google-Smtp-Source: ACJfBouBLUEVmx0ORxyOLuEhq0CrtXw8wtp1UC8kfVBnUDlYA/fDAlKVNK6qgVzmZ3+w36ZWwRoz/4svQeRX5CCSmgM=
X-Received: by 10.107.32.19 with SMTP id g19mr1934094iog.217.1516372744493;
	Fri, 19 Jan 2018 06:39:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 19 Jan 2018 06:38:44 -0800 (PST)
In-Reply-To: <trinity-a2598054-f7f8-4685-86a2-0f76b33ad6a7-1516371816638@3c-app-mailcom-lxa10>
References: <1516370069-9287-1-git-send-email-ole2mail@mail.com>
	<CAJTo0LbBLdJi0S+s-fRMT9b+JJZShTBgJ0kmCuMYiiK6KZp+Vw@mail.gmail.com>
	<trinity-a2598054-f7f8-4685-86a2-0f76b33ad6a7-1516371816638@3c-app-mailcom-lxa10>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Jan 2018 14:38:44 +0000
Message-ID: <CAJTo0LYJqBKH_JNHCXoii0DV9yn7uHKDZ1QDxoOcNvLtQE9LWA@mail.gmail.com>
To: Oleg Kokorin <ole2mail@mail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: remove double hashtable iterator definition
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
X-List-Received-Date: Fri, 19 Jan 2018 14:39:04 -0000
Content-Type: multipart/alternative; boundary="001a1141a2a4c8867c0563220ae4"

--001a1141a2a4c8867c0563220ae4
Content-Type: text/plain; charset="UTF-8"

On 19 January 2018 at 14:23, Oleg Kokorin <ole2mail@mail.com> wrote:

> hello Ross
>
> the whole patch supply procedure these days is completely messed-up IMHO.
>
> if I'm not sending to upstream, then why the damn patch being e-mailed? or
> perhaps
> just because I can't understand the difference in between "pending"
> (where?), "submitted" (definitely is),
> "accepted" (by who?), "backport" (to where?), "denied" (do you really
> assume someone will push the patch with the flag "denied" in it?
>
> you've added too much complexity requirements to apply inside the patch
> file.
> how could I know what means for you "sending or not" to upstream?
>
> from the wiki point, it's completely unclear what kind of status should I
> apply for the patch by default.
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> so what do you want for "Upstream-Status:" instead of pending?
>

"Upstream" in distribution-builder-land means "the maintainer of the
package that I'm trying to build".  So in this case, the mtd-utils
maintainers.  If you've got a patch and cannot  be bothered to submit it
upstream, Pending is correct. Submitted means you've submitted it to the
maintainers.  Accepted means they've accepted it.  Backport means you've
backported the patch from the upstream source.  Denied means upstream have
refused the patch but we need it for some reason.


> and by the way, a robot refused my patch again, because it's not in sync
> with whatever the new stuff is in.
> if "git pull --rebase" is not enough, it would be WAY better to mention
> this command specifically in the WIKI about.
> I see a lot of completely useless text in the wiki but it helped not at
> all to push the patch an easy and more important the fast way.
>

That should be sufficient, I can confirm that your patch doesn't apply to
master, and the last time this file was modified was in December, so maybe
you're not working from the right branch?

and, GIT know's well who is signign and what is the commit message, so if
> you need patches with the git log attached ahead of each, why not to
> mention in wiki special command about injecting log message inside patch
> file. this definitely will simplify patches submission.
>

It's entirely appropriate for the patch to have a much longer explanatory
message than the commit.  Also I can send a patch to oe-core which contains
a patch that someone else has authored, in which case copying it
automatically wouldn't be correct.

All we're asking is that any patches added say what they do, if they're
upstream, and who wrote it.

Ross

--001a1141a2a4c8867c0563220ae4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 January 2018 at 14:23, Oleg Kokorin <span dir=3D"ltr=
">&lt;<a href=3D"mailto:ole2mail@mail.com" target=3D"_blank">ole2mail@mail.=
com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div><div style=3D"font-family:Verda=
na;font-size:12.0px"><div>
<div>hello Ross</div>

<div>=C2=A0</div>

<div>the whole patch supply procedure these days is completely messed-up IM=
HO.</div>

<div>=C2=A0</div>

<div>if I&#39;m not sending to upstream, then why the damn patch being e-ma=
iled? or perhaps</div>

<div>just because I can&#39;t understand the difference in between &quot;pe=
nding&quot; (where?), &quot;submitted&quot; (definitely is),</div>

<div>&quot;accepted&quot; (by who?), &quot;backport&quot; (to where?), &quo=
t;denied&quot; (do you really assume someone will push the patch with the f=
lag &quot;denied&quot; in it?</div>

<div>=C2=A0</div>

<div>you&#39;ve added too much complexity requirements to apply inside the =
patch file.</div>

<div>how could I know what means for you &quot;sending or not&quot; to upst=
ream?</div>

<div>=C2=A0</div>

<div>from the=C2=A0wiki point, it&#39;s completely unclear what kind of sta=
tus should I apply for the patch by default.</div>

<div><a href=3D"https://www.openembedded.org/wiki/Commit_Patch_Message_Guid=
elines" target=3D"_blank">https://www.openembedded.org/<wbr>wiki/Commit_Pat=
ch_Message_<wbr>Guidelines</a></div>

<div>so what do you want for &quot;Upstream-Status:&quot;=C2=A0instead of p=
ending?</div>

<div></div></div></div></div></blockquote><div><br></div><div>&quot;Upstrea=
m&quot; in distribution-builder-land means &quot;the maintainer of the pack=
age that I&#39;m trying to build&quot;.=C2=A0 So in this case, the mtd-util=
s maintainers.=C2=A0 If you&#39;ve got a patch and cannot =C2=A0be bothered=
 to submit it upstream, Pending is correct. Submitted means you&#39;ve subm=
itted it to the maintainers.=C2=A0 Accepted means they&#39;ve accepted it.=
=C2=A0 Backport means you&#39;ve backported the patch from the upstream sou=
rce.=C2=A0 Denied means upstream have refused the patch but we need it for =
some reason.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div s=
tyle=3D"font-family:Verdana;font-size:12.0px"><div>=C2=A0</div>

<div>and by the way, a robot refused my patch again, because it&#39;s not i=
n sync with whatever the new stuff is in.</div>

<div>if &quot;git pull --rebase&quot; is not enough, it would be WAY better=
 to mention this command specifically in the WIKI about.</div>

<div>I see a lot of completely useless text in the wiki but it helped not a=
t all to push the patch an easy and more important the fast way.</div></div=
></div></blockquote><div><br></div><div>That should be sufficient, I can co=
nfirm that your patch doesn&#39;t apply to master, and the last time this f=
ile was modified was in December, so maybe you&#39;re not working from the =
right branch?</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><di=
v style=3D"font-family:Verdana;font-size:12.0px">

<div>and, GIT know&#39;s well who is signign and what is the commit message=
, so if you need patches with the git log attached ahead of each, why not t=
o mention in wiki special command about injecting log message inside patch =
file. this definitely will simplify patches submission.</div></div></div></=
blockquote><div><br></div><div>It&#39;s entirely appropriate for the patch =
to have a much longer explanatory message than the commit.=C2=A0 Also I can=
 send a patch to oe-core which contains a patch that someone else has autho=
red, in which case copying it automatically wouldn&#39;t be correct.</div><=
div><br></div><div>All we&#39;re asking is that any patches added say what =
they do, if they&#39;re upstream, and who wrote it.=C2=A0</div><div><br></d=
iv><div>Ross</div></div></div></div>

--001a1141a2a4c8867c0563220ae4--
