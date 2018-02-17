Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id CD39A77E87
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 11:56:31 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id t74so7446773wme.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 03:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZBB0bLx+jkNLLJxwolXFtASUSv/zU8yoW+Ri0hJmLO4=;
	b=RGuwt4q6RQurXQ8xRLExUYBtU/Zwg61oy0GE8joNNS31g2nfABYrB5xOONoXwFG5CT
	0o6Op89MU/DoAgxBK0sllCZuZWTx5AE9DXKSfsHoWrNXEFWx+ylscM+6iyU0XHFVexJ+
	Jhskbi0H4KMGqDwVKSvFWlcQvtwO1fitaJfXkKAu1KozYXqwidYvZcH9jkgO+MtZl7Y4
	audORjwEFdIPa3Mmt3ti4w15ck6AEuI1sy73p8gGb5yz0f19iU8Ny0kcoAjUtCjldzJ1
	mneNzggZ6cti9BUlPnW0RDoiomwihSa4v89heyIb06s48j1qHhobWQjGVXtVlcNcVp1B
	qVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZBB0bLx+jkNLLJxwolXFtASUSv/zU8yoW+Ri0hJmLO4=;
	b=HRpefV4V3z3sWJwAJycrLNFXRayL4F12kv6E39fQXY2JJ9f7ZaJHsZ36C28Xsvu3Bz
	2B/OIgpkGiMZDwZCbDVWUFI9cfkchGPfI64qv1cduP22J+QOThwnFa2e7+YO/jeAANZS
	xU0bR4Sd9WuHJgM/nTzR+tokFIXCcHrhB9mo1K25jS45kXr8QBjO/xJhHWCvRJNL0gQl
	VLBF2X5a7uCEZt9p4LoSd5k2jMInmZ7H9lb7IjNz7nmFclXxEkKK4tc/hhVfZSClKkHF
	0973T+cL37llww5Y8ReQ+E2S40G6+IhUq2yRsevgT0NlyCi/j+cgYIKlzXtUPCGGp+3d
	ZttA==
X-Gm-Message-State: APf1xPAuMzF9HL3Fsw6RzT0iLYqYXycbHsKlmUpDPtorNKUWlLfWM4E0
	pSqz8nBYuzmbaocTRFLSKZ9SYdoQPof3iFy6Nno=
X-Google-Smtp-Source: AH8x225d3wcHI+JmCDjnPg+PBT5HJb/LW566qPKAKdDK0w5gcPkYOTPAD5XHbOFHXbIdgwJpXV4uXrQPFKKZvRpTOYQ=
X-Received: by 10.28.85.194 with SMTP id j185mr6710436wmb.60.1518868592712;
	Sat, 17 Feb 2018 03:56:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sat, 17 Feb 2018 03:56:31 -0800 (PST)
In-Reply-To: <60cc88e3-577e-de47-e5da-b3cf93c74a2c@linux.intel.com>
References: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
	<CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
	<20180216115147.2869fdf2@seebsdell>
	<CA+chaQf=OMV60V7S=C6zaJ3sd_FwQkiojKY5EqAb6gTxXAQmXw@mail.gmail.com>
	<20180216132531.3a1c2398@seebsdell>
	<60cc88e3-577e-de47-e5da-b3cf93c74a2c@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 17 Feb 2018 12:56:31 +0100
Message-ID: <CA+chaQdGobLWVzZ_YSpdWozrF3ZrYzBNAVusUMFgGFbAX+w90w@mail.gmail.com>
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
X-List-Received-Date: Sat, 17 Feb 2018 11:56:32 -0000
Content-Type: multipart/alternative; boundary="001a1141e4d4ede4c30565672634"

--001a1141e4d4ede4c30565672634
Content-Type: text/plain; charset="UTF-8"

On ubuntu-14.04 I'm seeing SIGABRT in couple do_install tasks even after
reverting both pseudo changes (the upgrade from Alex as well as SRCREV bump
to latest commit from Seebs).

So there might be different root cause for SIGABRT unrelated to pseudo
which I haven't seen before, because pseudo locked-up in never ending loop
before it reached that point. I kind of suspect the icecc changes as
nothing else in last oe-core upgrade looked suspicious to cause such issues
in unrelated components (like tzdata, update-rc.d do_install).

On ubuntu-18.04 with both changes included I've reproduced the lock-up and
endless 100% CPU spin without pseudo.log growing in size.

I'll try to revert icecc changes to verify if it makes SIGABRT go away,
then will try to upgrade pseudo again on 14.04 to see if it will spin or
not.

Regards,

On Sat, Feb 17, 2018 at 12:22 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 02/16/2018 09:25 PM, Seebs wrote:
>
>> On Fri, 16 Feb 2018 20:11:48 +0100
>> Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> I didn't get to the logs yet, but with this change added I see many
>>> do_install tasks failing with exit code '134'.
>>>
>>
>> Huh, that's SIGABRT. I'll see if I can reproduce.
>>
>
> My experience is again radically different to that of Martin. Without this
> change (pseudo at 'Handle O_TMPFILE more better') things work flawlessly,
> with epoll enabled.
>
> With this change (pseudo at 'Allow closing client 0), pseudo again locks
> up and goes into endless 100% CPU spin. There's nothing useful in
> pseudo.log, and it does not grow in size.
>
> I think we need someone else to try this, perhaps on the autobuilder, to
> have more than two data points. I rebased my patch on top of latest poky
> master, but did not bump it to latest pseudo master:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?
> h=akanavin/pseudo-1.9.0
>
>
> Alex
>

--001a1141e4d4ede4c30565672634
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On ubuntu-14.04 I&#39;m seeing SIGABRT in couple do_instal=
l tasks even after reverting both pseudo changes (the upgrade from Alex as =
well as SRCREV bump to latest commit from Seebs).<div><br></div><div>So the=
re might be different root cause for SIGABRT unrelated to pseudo which I ha=
ven&#39;t seen before, because pseudo locked-up in never ending loop before=
 it reached that point. I kind of suspect the icecc changes as nothing else=
 in last oe-core upgrade looked suspicious to cause such issues in unrelate=
d components (like tzdata, update-rc.d do_install).</div><div><br></div><di=
v>On ubuntu-18.04 with both changes included I&#39;ve reproduced the lock-u=
p and endless 100% CPU spin without pseudo.log growing in size.</div><div><=
br></div><div>I&#39;ll try to revert icecc changes to verify if it makes SI=
GABRT go away, then will try to upgrade pseudo again on 14.04 to see if it =
will spin or not.</div><div><br></div><div>Regards,</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, Feb 17, 2018 at 12:=
22 PM, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.=
kanavin@linux.intel.com" target=3D"_blank">alexander.kanavin@linux.intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=
On 02/16/2018 09:25 PM, Seebs wrote:<br>
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

--001a1141e4d4ede4c30565672634--
