Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id EA3536DC01
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 02:42:52 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id u14so9307943lbd.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2013 18:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=crNzNhJSRUTaUI1Nbyhl8Dk/Me/pz/Re2arX5brqjFk=;
	b=p65zF1UAmP3YvGQB9JFHuvb8YUG9cIvD00TSuufrG4HB0/oL78FBoL5QUoSohlhuFz
	NJ6mv0xqPpS+i+sQNa1VlFBiK+qau4LptzgoD5n3DT1nVAgZLReVPwdw5T0ovHg0bSHR
	aO3CfXNe3AE/FJhXCxYuI46aSrM1f1CNX9rQYfFr0+o4yYVW0Wt+qizq9FyV+NxyzO3C
	sCrAHjqnyP6Cba+NRzFUXNML2PVhxBz6+lz53QWWRVwXwQ+oEIxeNMKZWeFwJDrdQh8t
	rD1lcpoG1odBJwTCUGzCwYvMpkWdtxjyNhaGXd4sYo0lu2Ccb97JyPA43EIWAGFYA94P
	RwXA==
X-Received: by 10.112.199.164 with SMTP id jl4mr1729lbc.62.1386124971573; Tue,
	03 Dec 2013 18:42:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.176.201 with HTTP; Tue, 3 Dec 2013 18:42:31 -0800 (PST)
In-Reply-To: <529E9594.3020201@windriver.com>
References: <cover.1385575572.git.kergoth@gmail.com>
	<CABcZAN=RUKdQcxE=9aQoXcap2LYA9F5begiT5jD2-JFY-h-NYw@mail.gmail.com>
	<1386110407.4463.148.camel@ted> <529E9594.3020201@windriver.com>
From: Chris Larson <kergoth@gmail.com>
Date: Tue, 3 Dec 2013 19:42:31 -0700
Message-ID: <CABcZAN=9gFhPsp00oQM0n998gDyr2VZr2ggi+e1L0c=cvMTAsg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Random fixes from the Mentor Graphics push queue
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
X-List-Received-Date: Wed, 04 Dec 2013 02:42:54 -0000
Content-Type: multipart/alternative; boundary=001a11c25d968b865d04ecac5e45

--001a11c25d968b865d04ecac5e45
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2013 at 7:38 PM, Bruce Ashfield <bruce.ashfield@windriver.co=
m
> wrote:

> On 12/3/2013, 5:40 PM, Richard Purdie wrote:
>
>> On Tue, 2013-12-03 at 11:40 -0700, Chris Larson wrote:
>>
>>> On Wed, Nov 27, 2013 at 11:07 AM, Christopher Larson
>>> <kergoth@gmail.com> wrote:
>>>          The following changes since commit
>>>          f991d2d60b74f5ebd990f77aecd3324b1a4533e9:
>>>
>>>            libpng: set reasonable SUMMARY (2013-11-27 11:51:08 +0000)
>>>
>>>          are available in the git repository at:
>>>
>>>            https://github.com/kergoth/oe-core.git random-fixes
>>>            https://github.com/kergoth/oe-core/tree/random-fixes
>>>
>>>          Christopher Larson (7):
>>>            update-rc.d: process symlinks recursively
>>>            perf: remove /usr/local/include from default makefile
>>>          includes
>>>            pulseaudio: fix RDEPENDS traversal for consolekit
>>>
>>> Were there issues with these, or was it just that further testing was
>>> necessary? I noticed this series was partially applied.
>>>
>>
>> On the most part just being cautious for M1.
>>
>> The perf one does worry me as we keep going around in circles on it
>> where we change one thing, it breaks something else, we fix that,
>> something else breaks, we fix that and we end up back where we started.
>> The commit history and/or the mailing list should have details about
>> what happened there. CC'ing Bruce since I know he has opinions on the
>> perf fix. Bruce, did we get a fix for that upstream in the end?
>>
>
> My favourite topic. I'm working on the upstream fix, which was that we
> shouldn't be using CFLAGS and LDFLAGS to pass build values into perf,
> but instead use EXTRA_CLFAGS (which exists) and EXTRA_LDFLAGS (Which
> doesn't exist yet, and that's the patch I have queued).
>
> Looking at Chris' posted patch, I can't actually tell what it was fixing,
> since INCLUDES isn't directly used by the perf Makefiles and on
> a really quick check, I can't see what CONFIG_INCLUDES is set to either.
>
> I'm sure I'm just being dense (long day) and I'm missing something, so
> I can't map the short log's intent to what the patch is actually doing.
>
> The patch won't undo anything that we are working to fix/change
> upstream, but since something is whizzing over my head, I can't be sure
> about side effects.


*shrug*, it=E2=80=99s possible it was to fix warnings only with older kerne=
ls, as
we use our own BSPs in some cases. I=E2=80=99m not opposed to you dropping =
that
patch, it was only a warning fix for us anyway :)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c25d968b865d04ecac5e45
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Dec 3, 2013 at 7:38 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@=
windriver.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"h5">=
On 12/3/2013, 5:40 PM, Richard Purdie wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Tue, 2013-12-03 at 11:40 -0700, Chris Larson wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wed, Nov 27, 2013 at 11:07 AM, Christopher Larson<br>
&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.co=
m</a>&gt; wrote:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The following changes since commit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f991d2d60b74f5ebd990f77aecd332<u></u>4b1a=
4533e9:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libpng: set reasonable SUMMARY (20=
13-11-27 11:51:08 +0000)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0are available in the git repository at:<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/kerg=
oth/oe-core.git" target=3D"_blank">https://github.com/kergoth/oe-<u></u>cor=
e.git</a> random-fixes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/kerg=
oth/oe-core/tree/random-fixes" target=3D"_blank">https://github.com/kergoth=
/oe-<u></u>core/tree/random-fixes</a><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Christopher Larson (7):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update-rc.d: process symlinks recu=
rsively<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perf: remove /usr/local/include fr=
om default makefile<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0includes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pulseaudio: fix RDEPENDS traversal=
 for consolekit<br>
<br>
Were there issues with these, or was it just that further testing was<br>
necessary? I noticed this series was partially applied.<br>
</blockquote>
<br>
On the most part just being cautious for M1.<br>
<br>
The perf one does worry me as we keep going around in circles on it<br>
where we change one thing, it breaks something else, we fix that,<br>
something else breaks, we fix that and we end up back where we started.<br>
The commit history and/or the mailing list should have details about<br>
what happened there. CC&#39;ing Bruce since I know he has opinions on the<b=
r>
perf fix. Bruce, did we get a fix for that upstream in the end?<br>
</blockquote>
<br></div></div>
My favourite topic. I&#39;m working on the upstream fix, which was that we<=
br>
shouldn&#39;t be using CFLAGS and LDFLAGS to pass build values into perf,<b=
r>
but instead use EXTRA_CLFAGS (which exists) and EXTRA_LDFLAGS (Which<br>
doesn&#39;t exist yet, and that&#39;s the patch I have queued).<br>
<br>
Looking at Chris&#39; posted patch, I can&#39;t actually tell what it was f=
ixing, since INCLUDES isn&#39;t directly used by the perf Makefiles and on<=
br>
a really quick check, I can&#39;t see what CONFIG_INCLUDES is set to either=
.<br>
<br>
I&#39;m sure I&#39;m just being dense (long day) and I&#39;m missing someth=
ing, so<br>
I can&#39;t map the short log&#39;s intent to what the patch is actually do=
ing.<br>
<br>
The patch won&#39;t undo anything that we are working to fix/change<br>
upstream, but since something is whizzing over my head, I can&#39;t be sure=
<br>
about side effects.</blockquote></div><br>*shrug*, it=E2=80=99s possible it=
 was to fix warnings only with older kernels, as we use our own BSPs in som=
e cases. I=E2=80=99m not opposed to you dropping that patch, it was only a =
warning fix for us anyway :)<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c25d968b865d04ecac5e45--
