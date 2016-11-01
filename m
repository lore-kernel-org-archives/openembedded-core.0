Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id D917460123
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 11:46:24 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id o68so195716166qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 04:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JYBLTJmMxcE8q7wbV5VRAGS8aSmV9PWnla1u6FjoCww=;
	b=W/ymjpxOeU7fHOnp3SeGpNs/L2sADZhJPJqqIrSOSf066uxRlPPygNxkL5faIwn9Cj
	g958KGjkEqVEEBpBYrhfocyUoWZP2GkA5TnGBHfb3uq5+k5XOSlpVmiGL1nV8OSjp1FW
	sPsiAStMg4V0nDdySgWU3+M6DgkxJ9LJY+K2L5JMVTE6bOKtnueRJ9vr8SHGSDSw2k5M
	9/BPJIZHeDVhcbzZg0cHiZOzuDM19n9F1EIYfkmGZo0LVmd4s0VZ0BzboySk0cUDN3p1
	PdXgn27bdWtSOTwWTjqwvDOhVw43wpF28fvZLx+Wneuj8ouZupmXfz5nBPDkiL8QgOxQ
	prRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JYBLTJmMxcE8q7wbV5VRAGS8aSmV9PWnla1u6FjoCww=;
	b=NY6ALqvUT4ybGylw+SXoV1g87IHQgReuE5jUfoI+HUrKhx2SoX+77N1GQFLeByAzVE
	cZ5RLBeDTvpc/R1bdzrSWf7gwkGYQ5t+frQTqFY9oY3QNMFpPaqrpbvnsmgplvVtXA+d
	nQGQhlYp6k7HgAwiLN2Jbfynvz3m/Fwghj5i3zAe/1gUIKzBUUDkeaSjZIoKXLp2rYk1
	UXC9Ifkjg0AI+n9liXrxcFqvvWUIs4bI/WnEjr7jIWQ//qpUII8jN7Rtyb8ozrk0VWAl
	5JA5rOaXK6VF67tmN/doq7xzrjSYAEispQ9b/oQNO9bB2I+ffEiuXhLHfRUyy0HTSSzt
	DVfw==
X-Gm-Message-State: ABUngvdeJ2kEcn15S7DIiu7uZS4TpUTGDrDkDX7OBPrFtoDSjnCKzfK3cWpQ6Y0abJzICdJB9kTL+9Vx9TOKFNLM
X-Received: by 10.55.130.7 with SMTP id e7mr32617826qkd.121.1478000785714;
	Tue, 01 Nov 2016 04:46:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Tue, 1 Nov 2016 04:46:05 -0700 (PDT)
In-Reply-To: <c64cf308-d847-eac0-a2f7-bc8e686c2262@gmail.com>
References: <c64cf308-d847-eac0-a2f7-bc8e686c2262@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Nov 2016 11:46:05 +0000
Message-ID: <CAJTo0LbR6gQYppuR6EPo30xnADd7-mfG6wg3Nf_r7a2-xgHgrw@mail.gmail.com>
To: Lukasz Nowak <lnowak.tyco@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: fix bad file descriptor initialisation
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
X-List-Received-Date: Tue, 01 Nov 2016 11:46:25 -0000
Content-Type: multipart/alternative; boundary=94eb2c074bdacf857d05403bdf54

--94eb2c074bdacf857d05403bdf54
Content-Type: text/plain; charset=UTF-8

On 1 November 2016 at 08:50, Lukasz Nowak <lnowak.tyco@gmail.com> wrote:

> From: Lukasz Nowak <lnowak@tycoint.com>
>
> Import a patch from upstream, which fixes a connman daemon freeze
> under certain conditions (multiple active interfaces, no r/w storage).
>
> Signed-off-by: Lukasz Nowak <lnowak@tycoint.com>
> ---
>

Is this a resent of your earlier patch, or a v2?

Ross

--94eb2c074bdacf857d05403bdf54
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 1 November 2016 at 08:50, Lu=
kasz Nowak <span dir=3D"ltr">&lt;<a href=3D"mailto:lnowak.tyco@gmail.com" t=
arget=3D"_blank">lnowak.tyco@gmail.com</a>&gt;</span> wrote:<br><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1bl" class=3D"a=
3s aXjCH m1581f1bb526c4978">From: Lukasz Nowak &lt;<a href=3D"mailto:lnowak=
@tycoint.com">lnowak@tycoint.com</a>&gt;<br>
<br>
Import a patch from upstream, which fixes a connman daemon freeze<br>
under certain conditions (multiple active interfaces, no r/w storage).<br>
<br>
Signed-off-by: Lukasz Nowak &lt;<a href=3D"mailto:lnowak@tycoint.com">lnowa=
k@tycoint.com</a>&gt;<br>
---</div></blockquote></div><br>Is this a resent of your earlier patch, or =
a v2?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--94eb2c074bdacf857d05403bdf54--
