Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SZ0dV-000086-GW
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 16:09:29 +0200
Received: by yhjj56 with SMTP id j56so1665652yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2012 06:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=4yjQmkywL5LEEUZ4APGtj8FjsZ73MFYMABXgndSuoEk=;
	b=Yn4fDbH3KAEOhiBKv3ViDrpoOcVdaek9cB6bZGC1CKEmrm/YLD8ReVeh3lAk6RopKs
	UP7lOcmwr2m8Uhq5HUWGvZCmy5Tfu1bzcOUjssyZIyhHG47oltOTDhsnCV7cQGHQN1TP
	BPRhWjYck5wI5mCUMUesyez6j5hX8ttwmliRkUDanaRLWoYLvIlzbaTcYTOzI7CyTHAG
	TblCWPId016VmNpXPDGrZGdXzoy6iMIhOm52s2xYbi+sM++xLdAV55BorlFj/BoOhhvJ
	YTPtEw3AWc7/0lMN0jDltPx1KBTnNGzAERJPaupzma5KjW6QCL/RO0gXOQ64fDzonkV1
	RGtw==
Received: by 10.43.69.12 with SMTP id ya12mr4362836icb.50.1338213552884; Mon,
	28 May 2012 06:59:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.28.147 with HTTP; Mon, 28 May 2012 06:58:52 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1338212677.20169.75.camel@ted>
References: <CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com>
	<4FC35FAD.7090505@intel.com> <4FC35FBA.2060200@gherzan.ro>
	<4FC37C81.6080200@intel.com>
	<CAK18fxFpx-X-V465UJN7ziqmN6Fj6bz6YkckjhztTkqX5q2KwA@mail.gmail.com>
	<CAJTo0LZ5WuTMA=yuLm65PX-sp2Rx_L8UAg4JL1j5JcHvLC=o9A@mail.gmail.com>
	<1338212677.20169.75.camel@ted>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 28 May 2012 16:58:52 +0300
Message-ID: <CAK18fxFNrZPCZK2Ny6vr2qz6oHDFvtAA4Jw9SjjAb0djcxN7SQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm25jY3a/RyB7RVuD/iudqgZVdGNfQmj2z4V89+3ZycNlb2GsvWJU4txHxxRQBB/XNr4xuz
Subject: Re: [PATCH 0/3] Package Updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 May 2012 14:09:29 -0000
Content-Type: multipart/alternative; boundary=bcaec51d29c2740d5204c1191fd1

--bcaec51d29c2740d5204c1191fd1
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 28, 2012 at 4:44 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2012-05-28 at 14:30 +0100, Burton, Ross wrote:
> > On 28 May 2012 14:26, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > > There is an internal test suite for dbus. You can enable building those
> > > tests in configure:
> > > "--enable-tests"
> >
> > Is there a good reason why these shouldn't be always ran when building
> dbus?
>
> Well, we're cross compiling so it depends how they're written and
> whether they can run in a cross environment. We've also taken steps to
> reduce our build time so if these need something like perl or python,
> adding those into the dependency chain is problematic.
>
>
The fact that these tests are not compiled by default it's good. As a
normal user of dbus i don't need those. But while doing an update a compile
with tests i think it's necessary.

@g

--bcaec51d29c2740d5204c1191fd1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, May 28, 2012 at 4:44 PM, Richard Purdie =
<span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
 target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">

<div class=3D"im">On Mon, 2012-05-28 at 14:30 +0100, Burton, Ross wrote:<br=
>
&gt; On 28 May 2012 14:26, Andrei Gherzan &lt;<a href=3D"mailto:andrei@gher=
zan.ro">andrei@gherzan.ro</a>&gt; wrote:<br>
&gt; &gt; There is an internal test suite for dbus. You can enable building=
 those<br>
&gt; &gt; tests in configure:<br>
&gt; &gt; &quot;--enable-tests&quot;<br>
&gt;<br>
&gt; Is there a good reason why these shouldn&#39;t be always ran when buil=
ding dbus?<br>
<br>
</div>Well, we&#39;re cross compiling so it depends how they&#39;re written=
 and<br>
whether they can run in a cross environment. We&#39;ve also taken steps to<=
br>
reduce our build time so if these need something like perl or python,<br>
adding those into the dependency chain is problematic.<br>
<br></blockquote><div><br></div><div>The fact that these tests are not comp=
iled by default it&#39;s good. As a normal user of dbus i don&#39;t need th=
ose. But while doing an update a compile with tests i think it&#39;s necess=
ary.=A0</div>

<div>=A0</div><div>@g</div></div>

--bcaec51d29c2740d5204c1191fd1--
