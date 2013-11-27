Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3C66C6C732
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 20:39:38 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id eh20so5446035lab.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 12:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=0DUmkALTna5m38CQlb7fyFatKeRraG2Cq/5YXpwoMnw=;
	b=Yltwlz+FGFyKmFaZry0R+FHV3UWxahM6v4ZATjN16Bk9/8cfbAYKUHqftsqUTvB0KB
	wOdCSsG1pP9wxScZ5iNt7QMEN3zCvS0NkLuQUHghzx0A6LdUNcIJDL/swMUrkWJYllSh
	Q12gyIcbquV/vpNm2pLlC1h73xPlxjY6jN6nZpYLh0NtegteJec2FStcGu7mhmT2BlwS
	74FcIIg5ZTT37Pt8pT7TuKGuo4wUYwxncsCJf+1hKJW4Q5M3NvlYwiXuP+IIEuWR2I+o
	pzQYOeXmi0IfcyVyFakCMt+9ijkBYrrw3ES3NV1kKKBYHqbkDF+XKJ9eVJZsxiVV8ed3
	CDCQ==
X-Received: by 10.152.216.167 with SMTP id or7mr30816041lac.10.1385584777010; 
	Wed, 27 Nov 2013 12:39:37 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Wed, 27 Nov 2013 12:39:16 -0800 (PST)
In-Reply-To: <5898776.30KuBfGzaR@helios>
References: <cover.1385467738.git.paul.eggleton@linux.intel.com>
	<CABcZANkJoSBLjV6Td1eCZFJqOuYY_9+Nepti1zRsJey4q75HWg@mail.gmail.com>
	<5898776.30KuBfGzaR@helios>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 27 Nov 2013 13:39:16 -0700
X-Google-Sender-Auth: bX0wTw8EQNVuXvY__aOn8uNidU0
Message-ID: <CABcZANkqHnWNHXwv34WwH8FgTLwVn3xbOGpDgM4PisUO6Ary0Q@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Image manifest support
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
X-List-Received-Date: Wed, 27 Nov 2013 20:39:40 -0000
Content-Type: multipart/alternative; boundary=001a1135e31870a16204ec2e98f4

--001a1135e31870a16204ec2e98f4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2013 at 1:26 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Wednesday 27 November 2013 12:02:41 Chris Larson wrote:
> > Would you mind summarizing the differences between this and the already
> > emitted image license manifest in deploy/license?
>
> Actually I hadn't appreciated that there is a plain package list in that
> directory now in addition to the license manifest; however with this
> version:
>
> 1) It's right next to the image(s) instead of in another directory
>
> 2) The package version is in the same file next to the package name rathe=
r
> than
> in a separate file where fields are spread over multiple lines (which is
> harder
> to process)
>
> 3) It includes the package architecture
>
> 4) This isn't for licensing purposes, so it doesn't include any license
> information


Understood, thanks. I=E2=80=99ll have to take a look. At Mentor we=E2=80=99=
ve been using
the license manifest coupled with
https://github.com/MentorEmbedded/meta-mentor/blob/master/classes/deploy-li=
cense-manifest.bbclass.
We=E2=80=99ll probably keep both, use yours for more convenient user examin=
ation,
and keep the rest for sending off to legal departments and whatnot.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1135e31870a16204ec2e98f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Nov 27, 2013 at 1:26 PM, Paul Eggleton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@=
linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">On Wednesday 27 November 2013 12:02:41 C=
hris Larson wrote:<br>


&gt; Would you mind summarizing the differences between this and the alread=
y<br>
&gt; emitted image license manifest in deploy/license?<br>
<br>
</div>Actually I hadn&#39;t appreciated that there is a plain package list =
in that<br>
directory now in addition to the license manifest; however with this versio=
n:<br>
<br>
1) It&#39;s right next to the image(s) instead of in another directory<br>
<br>
2) The package version is in the same file next to the package name rather =
than<br>
in a separate file where fields are spread over multiple lines (which is ha=
rder<br>
to process)<br>
<br>
3) It includes the package architecture<br>
<br>
4) This isn&#39;t for licensing purposes, so it doesn&#39;t include any lic=
ense<br>
information</blockquote></div><br>Understood, thanks. I=E2=80=99ll have to =
take a look. At Mentor we=E2=80=99ve been using the license manifest couple=
d with=C2=A0<a href=3D"https://github.com/MentorEmbedded/meta-mentor/blob/m=
aster/classes/deploy-license-manifest.bbclass">https://github.com/MentorEmb=
edded/meta-mentor/blob/master/classes/deploy-license-manifest.bbclass</a>. =
We=E2=80=99ll probably keep both, use yours for more convenient user examin=
ation, and keep the rest for sending off to legal departments and whatnot.<=
br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a1135e31870a16204ec2e98f4--
