Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6A30B7E986
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 16:17:28 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id y11so14118060wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 08:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=75RQBicZCIpLxbP+fUMi1SX0k8nlBWPkoaVzLTEw2c0=;
	b=Ve9Y7/KFISAqqwMYqPPrUctMbR8KlTrU/46uMGbYEmOF8FM+ojUFNJx/+8wGcRYlmN
	6GPoYkNlIzoG1OG+tnXQzOwzZRTNWpJD4oud4Ci6dZCv3JFOCW5/bxBAGThUTcXORqz6
	IcYD+Oe5bT4tAY8HvYghXNeU0Jz+PobdKSMSDp4bR8J4OZvv4PgRWIKoKAv3QUGErSL+
	YX2Za7UVdhTT5lW2Hf1R+oGnjZAoub0UsC5bTvupIdd2YmucDFpq8uUClsg9EK1ciMLi
	Izz9WLU66LYw/LqAfl6+yhoYtEC1aJ2aXnDRk1g2d7qABRFs7ESMO2ePhHi0auY+6LT9
	dIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=75RQBicZCIpLxbP+fUMi1SX0k8nlBWPkoaVzLTEw2c0=;
	b=jKzTZ3s+oV2C/7Mwoy3iudri0mPFWAW3vJ+JhJXPpSi8ky8ykajQys/r3RkTlTyLbM
	J0XjgB+cjaZeCp0lB5orK3oTaWzdAKRqim56Ng+qn6VcVjj+sjt/nuW84WPoLczoXE9I
	1SVKYUDOgWJlmxjxwFtbqU7+wuXAyYBwvEY8iwWGzqg3psj3Xpzjd+5UzgN/nbrYn9mb
	Qrl+8e8PX+rTpgwFlXh9cTSWlKDOSqYXdYSfDPfIEGhJAPMpqckbcMH9tb2/Ukw1YB6Q
	mnReBOO7hqyZCtpK28ZjwjBaUmM67fNDQ1RE76O6cr7UY0+wokEBYFmkIENrDDyi8rEx
	79EA==
X-Gm-Message-State: APjAAAWSk/7Vn6BDV914kcQzM8zpGOULXZ1QO7GlHL1NdFoqrOTxftXL
	nF3/YEkpeZpgvtTMYTljF7LhC7I6iOqXpolFk2c=
X-Google-Smtp-Source: APXvYqx2fjv+aiotgSbRAclPQ4Jw2OGnUDMrG+AO5hohqQvDYzj/SPOo3gJTcYh+RCRMscdKv+uJFusDi6yJfuWec/s=
X-Received: by 2002:a5d:67c7:: with SMTP id n7mr25750990wrw.319.1577031449055; 
	Sun, 22 Dec 2019 08:17:29 -0800 (PST)
MIME-Version: 1.0
References: <ce6615e19c75117b5d4458334af60107fba830a6.camel@linuxfoundation.org>
	<f92e77c992efa93542732e335a99177b5903a11f.camel@linuxfoundation.org>
	<a73ba44d3f16704691971ebfede683de21b2e65d.camel@linuxfoundation.org>
	<CAJdd5GYZydn+kxHw3jP9AuJWWv60nxYwFPYWtrSGi1-q4NJNiQ@mail.gmail.com>
	<cd4a5e26597d3b09392d76edfeb018ea38a368ff.camel@linuxfoundation.org>
In-Reply-To: <cd4a5e26597d3b09392d76edfeb018ea38a368ff.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 22 Dec 2019 10:17:17 -0600
Message-ID: <CAJdd5Ga=vrNMe6hW+SGrJaP=FAQhZBjqa14gXJ3qoQxzOBaaew@mail.gmail.com>
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
X-List-Received-Date: Sun, 22 Dec 2019 16:17:28 -0000
Content-Type: multipart/alternative; boundary="000000000000521715059a4d3fdb"

--000000000000521715059a4d3fdb
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 22, 2019, 10:09 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2019-12-22 at 10:00 -0600, Joshua Watt wrote:
> > On Sun, Dec 22, 2019, 6:49 AM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > On Sun, 2019-12-22 at 12:08 +0000, Richard Purdie wrote:
> > >
> > > At query time in a clean build, the hashserver cannot know which of
> > > the two output hashes it needs to return the value for.
> >
> > In the case of multiple taskhashes mapping to different output
> > hashes, the server is supposed to simply return the oldest unihash.
> > If it's not doing that, there might be a bug.
>
>
> The problem here is a single taskhash mapping to two different outputs.
>
> m4-native:do_populate_sysroot (on aarch64)
> m4-native:do_populate_sysroot (on x86-64)
>
> When we query based on the input hash we'll get the first built.
>
> We then rebuild as its not in sstate and can match a previous task
> output, we then get a new hash.
>
> If we start a new build with no cache, we lookup the input hash and get
> the first built task of the wrong arch again.
>
> > > I can think of two possible options:
> > >
> > > a) When we report after running a task, we check if that input hash
> > > already has a value and then reuse it for the output hash mapping.
> >
> > I don't quite follow this one, can you be a little more precise with
> > what hashes you are referring to (e.g. taskhash, unihash, outhash)?
>
> We lookup a taskhash, get unihash A but its not in sstate (wrong arch).
> We build this thing, send the outhash, currently we get unihash B.
>
> I'm saying we map that outhash to unihash A since the server already
> has an entry for it.
>
> > > b) We start adding some kind of suffix to the reported hashes for
> > > native output which is used within the hash equiv server but not
> > > sstate.
>
> I was thinking about this further and I had a slightly evil idea. What
> if we set the method to XXX:<native arch>"? (where XXX is the current
> value).
>
> This would namespace the two native arches separately and I think then
> avoid the problems?
>
> > Just for clarification, this is because "native" can either be x86_64
> > or aarch64 but the actual arch (HOST_ARCH ?) isn't part of the
> > taskhash calculation?
>
> Correct.
>
> > This sounds related to the gcc-cross issues we had with the eSDK.
>
> The previous problem was on the boundary between cross/native and
> target. This is a pure native (or cross) issue.
>
> > Is there a reason that the host arch isn't part of the taskhash?
>
> Yes. Should the target output depend upon which arch it was built on?
> (answer, no it shouldn't so the native hashes have to match).
>
> > I think it might be possible to report additional inputs in the
> > hashes reported to the server. The server doesn't really care if it's
> > the exact taskhash, as long as the client is consistent. Perhaps that
> > would help with the gcc-cross issue as well?
>
> It won't help the other native/cross to target boundary mapping issue.
>
> See above, I'm wondering if we could abuse the method field to make
> this work? Certainly we could test that...
>

That seems reasonable for a quick test. The method is supposed to be the
output hash calculation method, so my first instinct would be that it is
better in the long run to add another field e.g. "class" or something.


> Cheers,
>
> Richard
>
>
>

--000000000000521715059a4d3fdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Dec 22, 2019, 10:09 AM Richard Purdie &lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfound=
ation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, =
2019-12-22 at 10:00 -0600, Joshua Watt wrote:<br>
&gt; On Sun, Dec 22, 2019, 6:49 AM Richard Purdie &lt;<br>
&gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
" rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Sun, 2019-12-22 at 12:08 +0000, Richard Purdie wrote:<br>
&gt; &gt; <br>
&gt; &gt; At query time in a clean build, the hashserver cannot know which =
of<br>
&gt; &gt; the two output hashes it needs to return the value for.<br>
&gt; <br>
&gt; In the case of multiple taskhashes mapping to different output<br>
&gt; hashes, the server is supposed to simply return the oldest unihash.<br=
>
&gt; If it&#39;s not doing that, there might be a bug.<br>
<br>
<br>
The problem here is a single taskhash mapping to two different outputs.<br>
<br>
m4-native:do_populate_sysroot (on aarch64)<br>
m4-native:do_populate_sysroot (on x86-64)<br>
<br>
When we query based on the input hash we&#39;ll get the first built.<br>
<br>
We then rebuild as its not in sstate and can match a previous task<br>
output, we then get a new hash.<br>
<br>
If we start a new build with no cache, we lookup the input hash and get<br>
the first built task of the wrong arch again.<br>
<br>
&gt; &gt; I can think of two possible options:<br>
&gt; &gt; <br>
&gt; &gt; a) When we report after running a task, we check if that input ha=
sh<br>
&gt; &gt; already has a value and then reuse it for the output hash mapping=
.<br>
&gt; <br>
&gt; I don&#39;t quite follow this one, can you be a little more precise wi=
th<br>
&gt; what hashes you are referring to (e.g. taskhash, unihash, outhash)?<br=
>
<br>
We lookup a taskhash, get unihash A but its not in sstate (wrong arch).<br>
We build this thing, send the outhash, currently we get unihash B.<br>
<br>
I&#39;m saying we map that outhash to unihash A since the server already<br=
>
has an entry for it.<br>
<br>
&gt; &gt; b) We start adding some kind of suffix to the reported hashes for=
<br>
&gt; &gt; native output which is used within the hash equiv server but not<=
br>
&gt; &gt; sstate.<br>
<br>
I was thinking about this further and I had a slightly evil idea. What<br>
if we set the method to XXX:&lt;native arch&gt;&quot;? (where XXX is the cu=
rrent<br>
value).<br>
<br>
This would namespace the two native arches separately and I think then<br>
avoid the problems?<br>
<br>
&gt; Just for clarification, this is because &quot;native&quot; can either =
be x86_64<br>
&gt; or aarch64 but the actual arch (HOST_ARCH ?) isn&#39;t part of the<br>
&gt; taskhash calculation?<br>
<br>
Correct.<br>
<br>
&gt; This sounds related to the gcc-cross issues we had with the eSDK.<br>
<br>
The previous problem was on the boundary between cross/native and<br>
target. This is a pure native (or cross) issue.<br>
<br>
&gt; Is there a reason that the host arch isn&#39;t part of the taskhash?<b=
r>
<br>
Yes. Should the target output depend upon which arch it was built on?<br>
(answer, no it shouldn&#39;t so the native hashes have to match).<br>
<br>
&gt; I think it might be possible to report additional inputs in the<br>
&gt; hashes reported to the server. The server doesn&#39;t really care if i=
t&#39;s<br>
&gt; the exact taskhash, as long as the client is consistent. Perhaps that<=
br>
&gt; would help with the gcc-cross issue as well?<br>
<br>
It won&#39;t help the other native/cross to target boundary mapping issue.<=
br>
<br>
See above, I&#39;m wondering if we could abuse the method field to make<br>
this work? Certainly we could test that...<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">That seems reasonable for a quick=
 test. The method is supposed to be the output hash calculation method, so =
my first instinct would be that it is better in the long run to add another=
 field e.g. &quot;class&quot; or something.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000521715059a4d3fdb--
