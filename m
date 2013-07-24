Return-Path: <giuseppe.condorelli@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id B603360629
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 09:43:05 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id 16so12256544obc.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pLLfV9Qxo9g3O8V/TeYEzyW7PAUZDeiNfvBUPAsO/CE=;
	b=QFhSoQ/ilmPzDVJfH6z+yY3kCOdVU0Xvgdmejg06lgUNqyjgjZcoXDQFAUAfe+Hxur
	ulqw/yVPB/qzcBM634LaTf1BgM2chc/UUWb4bbQnNIoqdqeUIBbDhDyneXhGaXVaieVv
	mSFk9t0umBKx+iKpjDVJY4pPKCkMb7ifHygBUewixY9HNiqwW/y7A2EOMX+zSYWSgxVK
	zbrD3UBoRYtJXeS3XQz1FCIj4hOqJDKi4CCQVAfehGqtcHnDR+VTBEHcgRDJ2uNo1Yhn
	QkBY+o/ZlUvAn58HVD9pSDYqULt9PkmIW99a45X5Y6m2s+ATWsxNcEVEgGOqnZhiRLJw
	Vdew==
MIME-Version: 1.0
X-Received: by 10.60.123.10 with SMTP id lw10mr35542079oeb.102.1374658985861; 
	Wed, 24 Jul 2013 02:43:05 -0700 (PDT)
Received: by 10.182.142.65 with HTTP; Wed, 24 Jul 2013 02:43:05 -0700 (PDT)
In-Reply-To: <CANyK_8eXoSMdsQFGwzPmnxZrgN_bmFejxoLdLAXqmis=rQ7Cmw@mail.gmail.com>
References: <CAOHjBZuDPPjk9dySzOTtGjXzy5yisjdumag=22qV5U-aW2hj4A@mail.gmail.com>
	<1374652108.28370.6.camel@firebird.rb.intel.com>
	<CAOHjBZvycJUgtJc0sZdkENH51YHvSGj5P50uMALU95T3+W_RPA@mail.gmail.com>
	<CANyK_8eXoSMdsQFGwzPmnxZrgN_bmFejxoLdLAXqmis=rQ7Cmw@mail.gmail.com>
Date: Wed, 24 Jul 2013 11:43:05 +0200
Message-ID: <CAOHjBZtoXxaHXFammidVFGwGQz6pCJBKhZe5233Us+bDQPQ9QQ@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to solve the make 3.82 issue at sanity check time?
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
X-List-Received-Date: Wed, 24 Jul 2013 09:43:06 -0000
Content-Type: multipart/alternative; boundary=047d7b5d49ce8a28c104e23ebc17

--047d7b5d49ce8a28c104e23ebc17
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,

I saw it early this morning (reading the previous thread)
but I've not put it in the right attention I think.
Now I've installed the sdk using that script and a run is still ongoing.
I'll let you know.
I ask the same to you: are you sure the FC17 and ahead have solved the make
issue?

Many thanks,
Cheers.
Giuseppe
2013/7/24 Paul Barker <paul@paulbarker.me.uk>

> On 24 July 2013 09:47, Giuseppe Condorelli
> <giuseppe.condorelli@gmail.com> wrote:
> > Many thanks for the quick reply Stefan,
> >
> > For completion, I'm working on FC16.
> > Indeed (before sending the mail) I tried downloading the make rpm for
> FC17
> > (rpmfind.net) and to use it
> > (accordingly unpackaged under my personal directory, updating the PATH)
> with
> > the same failure.
> > Can this sound strange for you?
> > As you know, which are the make versions Fedora has released for the
> > FC17/18?
> >
> > I think at the moment the build of the buildtools-tarball will be the way
> > I'll follow, temporary disabling the sanity check.
> >
> > Cheers,
> > Giuseppe
> >
>
> As stated in a previous thread, there's a snapshot of the buildtools
> at http://autobuilder.yoctoproject.org/pub/nightly/CURRENT/buildtools/
> which might work for you. It should install a known good set of tools
> including make. This could be a good test for it.
>
> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk
>

--047d7b5d49ce8a28c104e23ebc17
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi Paul,</div><div>=A0</div><div>I saw=A0it early this morning (readin=
g the previous thread)</div><div>but I&#39;ve not put it in the right atten=
tion I think.</div><div>Now I&#39;ve installed the sdk using that script an=
d a run is still ongoing.</div>
<div>I&#39;ll let you know.</div><div>I ask the same to you: are you sure t=
he FC17 and ahead have solved the make issue?</div><div>=A0</div><div>Many =
thanks,</div><div>Cheers.</div><div>Giuseppe<br></div><div class=3D"gmail_q=
uote">
2013/7/24 Paul Barker <span dir=3D"ltr">&lt;<a href=3D"mailto:paul@paulbark=
er.me.uk" target=3D"_blank">paul@paulbarker.me.uk</a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">On 24 July 2013 09:47, Giuseppe Condorelli<br>
<div>&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com" target=3D"_blank"=
>giuseppe.condorelli@gmail.com</a>&gt; wrote:<br>
&gt; Many thanks for the quick reply Stefan,<br>
&gt;<br>
&gt; For completion, I&#39;m working on FC16.<br>
&gt; Indeed (before sending the mail) I tried downloading the make rpm for =
FC17<br>
&gt; (<a href=3D"http://rpmfind.net" target=3D"_blank">rpmfind.net</a>) and=
 to use it<br>
&gt; (accordingly unpackaged under my personal directory, updating the PATH=
) with<br>
&gt; the same failure.<br>
&gt; Can this sound strange for you?<br>
&gt; As you know, which are the make versions Fedora has released for the<b=
r>
&gt; FC17/18?<br>
&gt;<br>
&gt; I think at the moment the build of the buildtools-tarball will be the =
way<br>
&gt; I&#39;ll follow, temporary disabling the sanity check.<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Giuseppe<br>
&gt;<br>
<br>
</div>As stated in a previous thread, there&#39;s a snapshot of the buildto=
ols<br>
at <a href=3D"http://autobuilder.yoctoproject.org/pub/nightly/CURRENT/build=
tools/" target=3D"_blank">http://autobuilder.yoctoproject.org/pub/nightly/C=
URRENT/buildtools/</a><br>
which might work for you. It should install a known good set of tools<br>
including make. This could be a good test for it.<br>
<br>
--<br>
Paul Barker<br>
<br>
Email: <a href=3D"mailto:paul@paulbarker.me.uk" target=3D"_blank">paul@paul=
barker.me.uk</a><br>
<a href=3D"http://www.paulbarker.me.uk" target=3D"_blank">http://www.paulba=
rker.me.uk</a><br>
</blockquote></div><br>

--047d7b5d49ce8a28c104e23ebc17--
