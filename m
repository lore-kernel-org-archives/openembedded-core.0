Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3695C7FAAE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 16:22:39 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id c9so14130589wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 08:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WhcoCm02WvNHsH+bB7M1Y2w8Phft7cxy9Fe87yMslaU=;
	b=uU9iF20TgKOvvEHs44TUB6uMT0bjp+JrRyfouXDtjfDqGjc91QcA1ULJdN/wnbkRbk
	6ZPNvOaa8iGSNB678CNtUaKD5yjs2vtr5MnFh2J3z6L5jJQYDcLW1WPQyrZSNUzwceV0
	fqwrYZQJd4mI0AQ+wY3K2fNSHlxl1ukX/4fsD8sOCY+15ELWY8UhpVywGDEsa4X29rHc
	VB5qiDnchgwKtAfWsA6odpvRmtlAPzuJqijmRbVeo/EDP0fRH/c4v5YzhF5SMaYhaSAr
	YKgTZSlC53CvKwiOvpQ2wZ6arm1PphfpPMOOv7rtGobF8qnDveAAFvTql+kCecav6rJX
	gBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WhcoCm02WvNHsH+bB7M1Y2w8Phft7cxy9Fe87yMslaU=;
	b=MHlxWwLeQP9naqVn5jpwSmoIt7UeOgzrg2sNAZ9qQ0CQU+DUOFwb3r0CaGZhMMC+Wd
	gwak3WSe/lKDzQJbmGXAcqezZCThAWjyt2gmAHB+SpUTvgIToyYs17ZC7/hQSJ1rtgyf
	oOUeLZ0qjwS91UU8UMLxc5PIVBxWDaVOzOy2gmXhm/wBXVuOHm/y3N9ZLLvd3YcOvTM+
	lGQQWblH72VfXy5antTNxAq9N+1duLk6vOHBlmC6H5m/y6ZrEylZTJfXwzaC7izkiuMj
	iCgTP21YmkjWBm7CJmaIyUMqFwuAwCl6Bg+2HjFkt1xxSDj7g6wcEh2o74/MgBcXyREv
	0Vnw==
X-Gm-Message-State: APjAAAXuIZLfhEnqRXB7wcgs6yDyzL9+KgQqhLt4nyVPXSiKY5HW3zwy
	3pYq8/C9dB73aOFwFX7XaNntQxHvy96BzjfNv5I=
X-Google-Smtp-Source: APXvYqxW7rjFwnPzQQbVAtnjep4CV9Juf6tfONWzLbZwu6pWs4VyM7Rj3m8nyJu5psQLrF9KielEGDHd7yms1oOaDlc=
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr24512508wrk.53.1577031760155; 
	Sun, 22 Dec 2019 08:22:40 -0800 (PST)
MIME-Version: 1.0
References: <ce6615e19c75117b5d4458334af60107fba830a6.camel@linuxfoundation.org>
	<f92e77c992efa93542732e335a99177b5903a11f.camel@linuxfoundation.org>
	<a73ba44d3f16704691971ebfede683de21b2e65d.camel@linuxfoundation.org>
	<CAJdd5GYZydn+kxHw3jP9AuJWWv60nxYwFPYWtrSGi1-q4NJNiQ@mail.gmail.com>
	<cd4a5e26597d3b09392d76edfeb018ea38a368ff.camel@linuxfoundation.org>
	<CAJdd5Ga=vrNMe6hW+SGrJaP=FAQhZBjqa14gXJ3qoQxzOBaaew@mail.gmail.com>
In-Reply-To: <CAJdd5Ga=vrNMe6hW+SGrJaP=FAQhZBjqa14gXJ3qoQxzOBaaew@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 22 Dec 2019 10:22:28 -0600
Message-ID: <CAJdd5Gbbmv45-q0G1FSDgfNLNQG+xHArorf=F=-wZtdOPU85xA@mail.gmail.com>
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
X-List-Received-Date: Sun, 22 Dec 2019 16:22:40 -0000
Content-Type: multipart/alternative; boundary="000000000000dd1a4c059a4d51d4"

--000000000000dd1a4c059a4d51d4
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 22, 2019, 10:17 AM Joshua Watt <jpewhacker@gmail.com> wrote:

>
>
> On Sun, Dec 22, 2019, 10:09 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Sun, 2019-12-22 at 10:00 -0600, Joshua Watt wrote:
>> > On Sun, Dec 22, 2019, 6:49 AM Richard Purdie <
>> > richard.purdie@linuxfoundation.org> wrote:
>> > > On Sun, 2019-12-22 at 12:08 +0000, Richard Purdie wrote:
>> > >
>> > > At query time in a clean build, the hashserver cannot know which of
>> > > the two output hashes it needs to return the value for.
>> >
>> > In the case of multiple taskhashes mapping to different output
>> > hashes, the server is supposed to simply return the oldest unihash.
>> > If it's not doing that, there might be a bug.
>>
>>
>> The problem here is a single taskhash mapping to two different outputs.
>>
>> m4-native:do_populate_sysroot (on aarch64)
>> m4-native:do_populate_sysroot (on x86-64)
>>
>> When we query based on the input hash we'll get the first built.
>>
>> We then rebuild as its not in sstate and can match a previous task
>> output, we then get a new hash.
>>
>> If we start a new build with no cache, we lookup the input hash and get
>> the first built task of the wrong arch again.
>>
>> > > I can think of two possible options:
>> > >
>> > > a) When we report after running a task, we check if that input hash
>> > > already has a value and then reuse it for the output hash mapping.
>> >
>> > I don't quite follow this one, can you be a little more precise with
>> > what hashes you are referring to (e.g. taskhash, unihash, outhash)?
>>
>> We lookup a taskhash, get unihash A but its not in sstate (wrong arch).
>> We build this thing, send the outhash, currently we get unihash B.
>>
>> I'm saying we map that outhash to unihash A since the server already
>> has an entry for it.
>>
>> > > b) We start adding some kind of suffix to the reported hashes for
>> > > native output which is used within the hash equiv server but not
>> > > sstate.
>>
>> I was thinking about this further and I had a slightly evil idea. What
>> if we set the method to XXX:<native arch>"? (where XXX is the current
>> value).
>>
>> This would namespace the two native arches separately and I think then
>> avoid the problems?
>>
>> > Just for clarification, this is because "native" can either be x86_64
>> > or aarch64 but the actual arch (HOST_ARCH ?) isn't part of the
>> > taskhash calculation?
>>
>> Correct.
>>
>> > This sounds related to the gcc-cross issues we had with the eSDK.
>>
>> The previous problem was on the boundary between cross/native and
>> target. This is a pure native (or cross) issue.
>>
>> > Is there a reason that the host arch isn't part of the taskhash?
>>
>> Yes. Should the target output depend upon which arch it was built on?
>> (answer, no it shouldn't so the native hashes have to match).
>>
>> > I think it might be possible to report additional inputs in the
>> > hashes reported to the server. The server doesn't really care if it's
>> > the exact taskhash, as long as the client is consistent. Perhaps that
>> > would help with the gcc-cross issue as well?
>>
>> It won't help the other native/cross to target boundary mapping issue.
>>
>> See above, I'm wondering if we could abuse the method field to make
>> this work? Certainly we could test that...
>>
>
> That seems reasonable for a quick test. The method is supposed to be the
> output hash calculation method, so my first instinct would be that it is
> better in the long run to add another field e.g. "class" or something.
>

Perhaps based on ${NATIVELSBSTRING} like sstate.bbclass path? That has nice
congruency with sstate file paths, which I like


>
>> Cheers,
>>
>> Richard
>>
>>
>>

--000000000000dd1a4c059a4d51d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Dec 22, 2019, 10:17 AM Joshua Watt &lt;<a href=
=3D"mailto:jpewhacker@gmail.com">jpewhacker@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div><br><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 22, 2019=
, 10:09 AM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoundatio=
n.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, 2019-1=
2-22 at 10:00 -0600, Joshua Watt wrote:<br>
&gt; On Sun, Dec 22, 2019, 6:49 AM Richard Purdie &lt;<br>
&gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org" rel=3D"noreferre=
r noreferrer" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; =
wrote:<br>
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
 field e.g. &quot;class&quot; or something.</div></div></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Perhaps based on ${NATIV=
ELSBSTRING} like sstate.bbclass path? That has nice congruency with sstate =
file paths, which I like</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto=
"><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div></div>
</blockquote></div></div></div>

--000000000000dd1a4c059a4d51d4--
