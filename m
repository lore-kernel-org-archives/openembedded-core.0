Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3662D71A23
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 23:02:47 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id o68so36912023qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 16:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uV2mnoIoWjwlrjE5iEGr1PHRK4kp/xDN71sTSkEiNMw=;
	b=Xlzd1jzU3LiMgMVGgIzoz2i7sAj+zGzwUgkEn1zP4lpObHh9UR5fOv96h/6euD74n8
	Np3BSed0P5Rcq+VrysgOfbuOld7A+bSwJlqHlUMY689SWN7uZOwdRQs0H14FbRyiXPBV
	z82mDtHhWZ0vnks5JUcS91mod1fqRbSPSHvMwPChJAzdyHpxz3W2L3pG2/6JTW3I5xaT
	ngX9I42d6GCsHak3pWuQXrneNpLdC9GY4I16ldIyRLOTBqax4iIA90kk0/1/pQ9GAL7T
	IJbQ5Au9cz/gMN2AI2O1wwaPnsOe/H+FLCC80ypTxHvn7h06sk/SDKBtQa2xB7CsdZMa
	/P4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uV2mnoIoWjwlrjE5iEGr1PHRK4kp/xDN71sTSkEiNMw=;
	b=Ht3kXAZihPI9DQmuDQrWONbg4SbK+afuS3b4aV38gH4cncFarqiD6/vxKEbEca+9Hf
	5TkBUKN1BmqBkN0XsBYe21pNgiePUOA2GSZazy0WSyTxenuw9lYvSU4AvlKMSVHuGgr2
	cjIu57qlTfAhpjdzxzHxB8LRdDQsAagEHHTHJ2MF4xuZG0CyuZEj42F0kiNoZP+Wu8Bs
	SHvJwToDg7cIF+pR9W/KRpvQC37il3osbVdgO7eb3S8ZQYBVULj1yjgsHnWKJ1oCBsLO
	WWJRTCXQArZBDMuK0KwK9pb5MFxu3YXeRZZG0CA+tAz/C1vG1NuwaJb3tAo1m4Tyu1QN
	51uA==
X-Gm-Message-State: ABUngvfO1a1ugGUk43ug8xhWvaYfo32ylNJ+p68SwvipZbbiQdEU6WPCfqReSwEzgTmWkUi7NbNESGnPBPsJqHEe
X-Received: by 10.55.5.145 with SMTP id 139mr5218493qkf.77.1478127769094; Wed,
	02 Nov 2016 16:02:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 2 Nov 2016 16:02:28 -0700 (PDT)
In-Reply-To: <CAJ86T=Wp0B_kpgD20y2q89cL=C8hfy5AT0jF42-hiSDE-L+wKA@mail.gmail.com>
References: <CAJ86T=Wp0B_kpgD20y2q89cL=C8hfy5AT0jF42-hiSDE-L+wKA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Nov 2016 23:02:28 +0000
Message-ID: <CAJTo0LZdGvZ2wvuwQR6v-daF8yHyq9+hTrNNAgxj2GHwMEZnBA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: version of gdb in morty
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
X-List-Received-Date: Wed, 02 Nov 2016 23:02:48 -0000
Content-Type: multipart/alternative; boundary=001a114c8f849c21240540597094

--001a114c8f849c21240540597094
Content-Type: text/plain; charset=UTF-8

On 2 November 2016 at 20:41, Andre McCurdy <armccurdy@gmail.com> wrote:

> It looks like morty (and master) are building gdb from git (ie cloning
> a ~660MB repo) with the git revision set to a snapshot mid-way between
> the 7.11 and 7.11.1 release tags.
>
> Was that the intention? Or is there a patch somewhere to switch to
> building from the official 7.11.1 tar file?
>

That was introduced by Khem with the commit message of "gdb: Upgrade to
7.11", so clearly we should have validated that the hash matches the tag
and that there wasn't the option of a tarball.

For master we can obviously take a 7.11.1 upgrade, for morty there is a
case to be made that a git clone is sufficiently huge and inconvenient for
users who are not tracking master that an upgrade to get the tarball is
reasonable.

Ross

--001a114c8f849c21240540597094
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 November 2016 at 20:41, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><div id=3D"gmail-:1pb" class=3D"gmail-a3s=
 gmail-aXjCH gmail-m15826ca1830035d4">It looks like morty (and master) are =
building gdb from git (ie cloning<br>
a ~660MB repo) with the git revision set to a snapshot mid-way between<br>
the 7.11 and 7.11.1 release tags.<br>
<br>
Was that the intention? Or is there a patch somewhere to switch to<br>
building from the official 7.11.1 tar file?<br></div></blockquote><div><br>=
</div><div>That was introduced by Khem with the commit message of &quot;gdb=
: Upgrade to 7.11&quot;, so clearly we should have validated that the hash =
matches the tag and that there wasn&#39;t the option of a tarball.</div><di=
v><br></div><div>For master we can obviously take a 7.11.1 upgrade, for mor=
ty there is a case to be made that a git clone is sufficiently huge and inc=
onvenient for users who are not tracking master that an upgrade to get the =
tarball is reasonable.</div><div><br></div><div>Ross</div></div></div></div=
>

--001a114c8f849c21240540597094--
