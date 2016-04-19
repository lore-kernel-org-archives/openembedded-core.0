Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3874660116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 02:20:56 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id gy3so89208147igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 19:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8i+R0dDVl2zh6mCW/9uOukn+DuMoCOxKFDyejTbiZOY=;
	b=m0XyE9jKjX2aMs5oTwxuUrKGa+EAuwrEXZTr3OzFqsNMAe6VubG/YQsl49H4ar1D0P
	VHtsgI7OG9cXA1LU3QyfnWiQeGULBR0X5cAIPfgNSATYe8W8i6gN/O5tAxZ982f2HBbg
	FXCqhgmFevF1fwzupqNfY+Iy8CjPaH9ghC2z2Dq9OAMxzr/M8YXtXxYGmj+mtsD7goM7
	UI2NMb0hcx3iD+Rxk5JxNZZnnjvq5cI1IiQjDZYEiUY3nGbmWIKDk5TGNgAEz2XSupvu
	btz9jPbBCz9/xjJ/sNKemQcv3b9OgjDN3k5YKqRIAEKCgFRML5P6AwbHMVf9U4JkBpeX
	Rj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8i+R0dDVl2zh6mCW/9uOukn+DuMoCOxKFDyejTbiZOY=;
	b=QXODsgNqWGHD6sMt+XbU809z/MEG17rEuqqxlwWHAAe7y/fMJWSq/v4qWJ1FJE5VVZ
	yrGP1ViXcknsuKc4B+XP9Ls1uFmBvVXcDenPBED0cp94h+1uT2OHl5ckXvT8Jl+EkBu0
	EnTcsN4Sge9TrJcD/D//9+LVZpwcR91H1DtJROpkW2ZKIRhCq7LwU2FU+Ong845ZJhS8
	UQNwhM3jvgibMcSKOFlr5uqayQFfhJtBMYwrbpcRVBUKdmAM3I72S8CzwGQlumUX0ONM
	LfFipaoC8RVPTIY/3Jyy5WqVpjUZwwOGheEv+8N1gn2cH+XEAP1dfwXYGsrGrSyylCXZ
	QuuA==
X-Gm-Message-State: AOPr4FWQNiOV1zF+kd4aiooj8n2crTepEfysc4xVecfKQPTqVhTArSpm0JaewV/EUMcswMc0XDE7fY2leiAgGw==
X-Received: by 10.50.3.66 with SMTP id a2mr5938078iga.87.1461032457720; Mon,
	18 Apr 2016 19:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20160418221455.GJ16135@denix.org>
	<1968586.YaUkzg8nud@peggleto-mobl.ger.corp.intel.com>
	<20160419010127.GK16135@denix.org>
	<1922089.IxRdTHIprx@peggleto-mobl.ger.corp.intel.com>
	<CABcZAN=1WiEymB0HFir+HGk5jqHQSCRGM=pDpGDfo_6gi1XQvg@mail.gmail.com>
In-Reply-To: <CABcZAN=1WiEymB0HFir+HGk5jqHQSCRGM=pDpGDfo_6gi1XQvg@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 19 Apr 2016 02:20:48 +0000
Message-ID: <CABcZANm6RysR2EC9cW9wWj0-fxrC4wY70F04oSAavaZFwZTeoA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Package management DB in old-style SDK
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
X-List-Received-Date: Tue, 19 Apr 2016 02:20:57 -0000
Content-Type: multipart/alternative; boundary=089e013d06e6a5dc470530cd20fd

--089e013d06e6a5dc470530cd20fd
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 18, 2016 at 7:19 PM Christopher Larson <clarson@kergoth.com>
wrote:

> On Mon, Apr 18, 2016 at 6:38 PM Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
>
>> On Mon, 18 Apr 2016 21:01:27 Denys Dmytriyenko wrote:
>> > On Tue, Apr 19, 2016 at 10:35:29AM +1200, Paul Eggleton wrote:
>> > > Hi Denys,
>> > > On Mon, 18 Apr 2016 18:14:55 Denys Dmytriyenko wrote:
>> > > > I'm still using the old-style SDK (meta-toolchain) for our products
>> due
>> > > > to some code customizations in it and some of our use cases rely on
>> the
>> > > > opkg package management database being present in sysroots, so
>> packages
>> > > > can be manipulated in SDK with opkg command. It appears that
>> > > > /var/lib/opkg is now empty and the package database is no longer
>> > > > supplied with the SDK.
>> > > >
>> > > > I know about the new-style populate_sdk and the even newer
>> Extensible
>> > > > SDK, but not yet ready to convert our old use cases to that. Since
>> there
>> > > > were lots of changes around the way SDKs work in OE-Core in the past
>> > > > couple releases, I'm failing to find the change that causes opkg DB
>> to
>> > > > be missing from the old style SDK. I'll appreciate any pointers in
>> > > > helping me debug and/or fix this issue with my SDKs. Thanks.
>> > >
>> > > As far as ipk is concerned I think it was this commit:
>> > >
>> http://cgit.openembedded.org/openembedded-core/commit/?id=c8e0ec2da9ad4c
>> > >   e1c103966906a85f68c15400dd>
>> > > Unfortunately it wasn't made optional.
>> >
>> > Thanks, Paul!
>> >
>> > Unfortunately, the change is in the library, which is quite difficult to
>> > override in another layer...
>>
>
>
> Actually, overriding a library is trivial given the way we do our python
> package. Copy meta/lib/oe/__init__.py into <your layer>/lib/oe/, copy
> meta/lib/oe/sdk.py to <your layer>/lib/oe/ and modify, and make sure your
> layer is prioritized correctly, and your forked version will be used in
> preference.
>
> It's not ideal, for the same reasons it's not ideal to override a class --
> you're stuck keeping it in sync, so for that reason I'd not recommend it,
> but it's not difficult to do the override :)
>

Just as an FYI, we've done this on many occasions in meta-mentor-staging as
a temporary measure while waiting for the fix to propagate to upstream.
It's handy for cases like that, where the lifetime is limited.

--089e013d06e6a5dc470530cd20fd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, Apr 18, 2016 at 7:19 PM Christopher Larson &lt;<a href=3D"mailto:clarson@=
kergoth.com">clarson@kergoth.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Mon, Apr 18, 2016 at 6:38 PM Paul Eggleton &lt;<a href=3D"mailto:paul.eg=
gleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, 18 Apr 2016 21:=
01:27 Denys Dmytriyenko wrote:<br>
&gt; On Tue, Apr 19, 2016 at 10:35:29AM +1200, Paul Eggleton wrote:<br>
&gt; &gt; Hi Denys,<br>
&gt; &gt; On Mon, 18 Apr 2016 18:14:55 Denys Dmytriyenko wrote:<br>
&gt; &gt; &gt; I&#39;m still using the old-style SDK (meta-toolchain) for o=
ur products due<br>
&gt; &gt; &gt; to some code customizations in it and some of our use cases =
rely on the<br>
&gt; &gt; &gt; opkg package management database being present in sysroots, =
so packages<br>
&gt; &gt; &gt; can be manipulated in SDK with opkg command. It appears that=
<br>
&gt; &gt; &gt; /var/lib/opkg is now empty and the package database is no lo=
nger<br>
&gt; &gt; &gt; supplied with the SDK.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I know about the new-style populate_sdk and the even newer E=
xtensible<br>
&gt; &gt; &gt; SDK, but not yet ready to convert our old use cases to that.=
 Since there<br>
&gt; &gt; &gt; were lots of changes around the way SDKs work in OE-Core in =
the past<br>
&gt; &gt; &gt; couple releases, I&#39;m failing to find the change that cau=
ses opkg DB to<br>
&gt; &gt; &gt; be missing from the old style SDK. I&#39;ll appreciate any p=
ointers in<br>
&gt; &gt; &gt; helping me debug and/or fix this issue with my SDKs. Thanks.=
<br>
&gt; &gt;<br>
&gt; &gt; As far as ipk is concerned I think it was this commit:<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"http://cgit.openembedded.org/openembedded-=
core/commit/?id=3Dc8e0ec2da9ad4c" rel=3D"noreferrer" target=3D"_blank">http=
://cgit.openembedded.org/openembedded-core/commit/?id=3Dc8e0ec2da9ad4c</a><=
br>
&gt; &gt;=C2=A0 =C2=A0e1c103966906a85f68c15400dd&gt;<br>
&gt; &gt; Unfortunately it wasn&#39;t made optional.<br>
&gt;<br>
&gt; Thanks, Paul!<br>
&gt;<br>
&gt; Unfortunately, the change is in the library, which is quite difficult =
to<br>
&gt; override in another layer...<br></blockquote><div><br></div><div><br><=
/div></div></div><div dir=3D"ltr"><div class=3D"gmail_quote"><div>Actually,=
 overriding a library is trivial given the way we do our python package. Co=
py meta/lib/oe/__init__.py into &lt;your layer&gt;/lib/oe/, copy meta/lib/o=
e/sdk.py to &lt;your layer&gt;/lib/oe/ and modify, and make sure your layer=
 is prioritized correctly, and your forked version will be used in preferen=
ce.</div><div><br></div><div>It&#39;s not ideal, for the same reasons it&#3=
9;s not ideal to override a class -- you&#39;re stuck keeping it in sync, s=
o for that reason I&#39;d not recommend it, but it&#39;s not difficult to d=
o the override :)</div></div></div></blockquote><div><br></div><div>Just as=
 an FYI, we&#39;ve done this on many occasions in meta-mentor-staging as a =
temporary measure while waiting for the fix to propagate to upstream. It&#3=
9;s handy for cases like that, where the lifetime is limited.=C2=A0</div></=
div></div>

--089e013d06e6a5dc470530cd20fd--
