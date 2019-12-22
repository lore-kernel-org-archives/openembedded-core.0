Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id BE6FC7FAC4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 16:00:36 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q10so14078577wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 08:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4Q48yA0FJLJVUvIPnV7mCCogNd/U4yUoX0WaJjJTsLA=;
	b=VxDckZiGDO1ELBePS0w6oLVLkvQ711K2JMoStFAXxPp6mn4LvAhcR4zi6Mhkdis90Y
	LeudpP/NXVb2Fvdjsey09c9mv52y50ZaHR8xwZQwHj3yPWraJNRV7ld3ugCPcuoTOOxv
	HnEq0CPWzFIJVsbk/wOS7Tbeml1kjGU1/hk9zU4blNlUX/HkVyMmhDPirT4ruQ/3CWRG
	bEvQ//Ek3PlHtlMDyyAuc+YEn20iudVM2WngVJJi4aYEbdF+E/AhaL6Vh2LV1CGLj/y8
	MA2sjP76Hd2CNywJqEf29nEYyAOUyGVmgSAu/vug0Lp47Jdww0P/nDtBIMXrmJ01107Q
	pBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4Q48yA0FJLJVUvIPnV7mCCogNd/U4yUoX0WaJjJTsLA=;
	b=WzDl7xB03zbwRiN4Ivyetfuc89Z+dXmYM7GywXAUraaEMHUQM63U3A0W2h8EtXBRW4
	DhMp8o8DBtbl7hN36ZXNJrJEdocqCzsk0Ato+sms5cAF0M/BohtW1s9fneP42ZN2l4cx
	DHZMZZFfKMH10KXFc63I6RzxPpLR+k1NDlW/7t0i0QEKXuaiMY1p3RS/raIBOjDW3caJ
	i3ALX8lNINFveRP34AZjpeswWuoceWqFeeLiynx8p1XvOo9Sbp/q4Nj4gHA3MoORWWsI
	Jy5UuaD9nQVsEXuFMk6hOovhLwG0CLqs74KKleOlAK6tdzPMpE3la0Rg8DyJ1fA0cILV
	b84g==
X-Gm-Message-State: APjAAAUTeoto50S3WhSl/yBZ1rdm90V4fC+/KDAk6EOOEJpG9sXnj5rZ
	Oqe0GvsRQNOUUWOtHCvKa7ec1bI7n9q1SwtB60Oj9A==
X-Google-Smtp-Source: APXvYqyAJQMISjH0GBtk0mtOrFJY7HziWJ6JKLUjc7Q4CHqbG9cJUX/lnx6XCcIxaqDist7JgHRpCWIZfrOjQW1fA8M=
X-Received: by 2002:a5d:6802:: with SMTP id w2mr25370257wru.353.1577030437283; 
	Sun, 22 Dec 2019 08:00:37 -0800 (PST)
MIME-Version: 1.0
References: <ce6615e19c75117b5d4458334af60107fba830a6.camel@linuxfoundation.org>
	<f92e77c992efa93542732e335a99177b5903a11f.camel@linuxfoundation.org>
	<a73ba44d3f16704691971ebfede683de21b2e65d.camel@linuxfoundation.org>
In-Reply-To: <a73ba44d3f16704691971ebfede683de21b2e65d.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 22 Dec 2019 10:00:25 -0600
Message-ID: <CAJdd5GYZydn+kxHw3jP9AuJWWv60nxYwFPYWtrSGi1-q4NJNiQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Debug from failing hashequiv builds - server side problem?
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
X-List-Received-Date: Sun, 22 Dec 2019 16:00:37 -0000
Content-Type: multipart/alternative; boundary="00000000000003aa56059a4d034f"

--00000000000003aa56059a4d034f
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 22, 2019, 6:49 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2019-12-22 at 12:08 +0000, Richard Purdie wrote:
> > On Sun, 2019-12-22 at 10:54 +0000, Richard Purdie wrote:
> > > I did a little digging on the weird hash equiv failure. I've
> > > attached two logs, one is the simplified console output, the other
> > > is the reams of debug.
>
> I did a bit more thinking about this. These hashes represent m4-native.
>
> We do have a problem that a given input hash for m4-native can
> represent two different output states depending on the architecture it
> was built on.
>
> For the same input hash, the output hash of these two things will never
> match. Nor will there ever be present sstate for them to trigger the
> report equiv mechanism.
>
> At query time in a clean build, the hashserver cannot know which of the
> two output hashes it needs to return the value for.
>

In the case of multiple taskhashes mapping to different output hashes, the
server is supposed to simply return the oldest unihash. If it's not doing
that, there might be a bug.


> I can think of two possible options:
>
> a) When we report after running a task, we check if that input hash
> already has a value and then reuse it for the output hash mapping.
>

I don't quite follow this one, can you be a little more precise with what
hashes you are referring to (e.g. taskhash, unihash, outhash)?




> b) We start adding some kind of suffix to the reported hashes for
> native output which is used within the hash equiv server but not
> sstate.
>

Just for clarification, this is because "native" can either be x86_64 or
aarch64 but the actual arch (HOST_ARCH ?) isn't part of the taskhash
calculation?

This sounds related to the gcc-cross issues we had with the eSDK.

Is there a reason that the host arch isn't part of the taskhash?

I think it might be possible to report additional inputs in the hashes
reported to the server. The server doesn't really care if it's the exact
taskhash, as long as the client is consistent. Perhaps that would help with
the gcc-cross issue as well?



> I freely admit this needs much more thought...
>
> Cheers,
>
> Richard
>
>

--00000000000003aa56059a4d034f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Dec 22, 2019, 6:49 AM Richard Purdie &lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank" rel=3D"n=
oreferrer">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Sun, 2019-12-22 at 12:08 +0000, Richard Purdie=
 wrote:<br>
&gt; On Sun, 2019-12-22 at 10:54 +0000, Richard Purdie wrote:<br>
&gt; &gt; I did a little digging on the weird hash equiv failure. I&#39;ve<=
br>
&gt; &gt; attached two logs, one is the simplified console output, the othe=
r<br>
&gt; &gt; is the reams of debug.<br>
<br>
I did a bit more thinking about this. These hashes represent m4-native.<br>
<br>
We do have a problem that a given input hash for m4-native can<br>
represent two different output states depending on the architecture it<br>
was built on.<br>
<br>
For the same input hash, the output hash of these two things will never<br>
match. Nor will there ever be present sstate for them to trigger the<br>
report equiv mechanism.<br>
<br>
At query time in a clean build, the hashserver cannot know which of the<br>
two output hashes it needs to return the value for.<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">In the case of multiple =
taskhashes mapping to different output hashes, the server is supposed to si=
mply return the oldest unihash. If it&#39;s not doing that, there might be =
a bug.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
<br>
I can think of two possible options:<br>
<br>
a) When we report after running a task, we check if that input hash<br>
already has a value and then reuse it for the output hash mapping.<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I don&#39=
;t quite follow this one, can you be a little more precise with what hashes=
 you are referring to (e.g. taskhash, unihash, outhash)?</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
b) We start adding some kind of suffix to the reported hashes for<br>
native output which is used within the hash equiv server but not<br>
sstate.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Just for clarification, this is because &quot;native&quot; can eithe=
r be x86_64 or aarch64 but the actual arch (HOST_ARCH ?) isn&#39;t part of =
the taskhash calculation?</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">This sounds related to the gcc-cross issues we had with the eSDK.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Is there a reason that the host=
 arch isn&#39;t part of the taskhash?</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">I think it might be possible to report additional inputs in t=
he hashes reported to the server. The server doesn&#39;t really care if it&=
#39;s the exact taskhash, as long as the client is consistent. Perhaps that=
 would help with the gcc-cross issue as well?</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<br>
I freely admit this needs much more thought...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div></div>

--00000000000003aa56059a4d034f--
