Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBp9z-0000da-2t
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 17:47:27 +0200
Received: by eaad12 with SMTP id d12so819826eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 08:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KwIy7bZKLDXU2YkuiddQOtMYtoVa29oRqAwtSzt+tmc=;
	b=Vr0oQOfl7svDZ8bia4oPoQCT0iyECWat1ReYEGP+jh6NTyiuxRyFkUuGvfuUKCUZ3J
	95nJYjYFKq0etXG/FK/CpD64LaRdQDsAPp603Hd0hoPgMVDtP7xIiYlAfR7X2w7KjtNg
	XNVL8AD1xEIrDgL2TevQwy+2tzw0BMhU/HumaJx4sP3qXTbu8fvmVgfHDjxOC0gTpXb8
	jnbYRpZ7LK+sJPdB7m1AQd+SGGsqPPXIJQTSt4QU5MBLKVzZE4QwbRWcX/h3oYVeaA7A
	Owdo4j1bejKHGkmmN2yDkAZorqrKBeyZ/QP/92Uoa3t8/7E4Bf8I6Ok1mhiUqPYOI99M
	gd/g==
MIME-Version: 1.0
Received: by 10.14.202.71 with SMTP id c47mr32042211eeo.42.1347464094781; Wed,
	12 Sep 2012 08:34:54 -0700 (PDT)
Received: by 10.14.2.5 with HTTP; Wed, 12 Sep 2012 08:34:54 -0700 (PDT)
In-Reply-To: <1347458928.11710.21.camel@ted>
References: <cover.1346905978.git.raj.khem@gmail.com>
	<5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
	<504FF70B.7060701@mlbassoc.com> <1347458928.11710.21.camel@ted>
Date: Wed, 12 Sep 2012 08:34:54 -0700
Message-ID: <CAMKF1so6qUDFMw_aOZTdC4W_Dh=rDiiC1O7pvjaUQS2xkG8xWg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] gcc: Switch SRC_URI to use svn
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 15:47:27 -0000
Content-Type: multipart/alternative; boundary=047d7b343e38b7903f04c982ee3b

--047d7b343e38b7903f04c982ee3b
Content-Type: text/plain; charset=UTF-8

On Wednesday, September 12, 2012, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-09-11 at 20:44 -0600, Gary Thomas wrote:
>> On 2012-09-05 22:35, Khem Raj wrote:
>> > svn tar balls are 96M as compared to 1.3G git tars
>> > its unnessary to suck in that much of data.
>> >
>> > Fixes [YOCTO #2908]
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> What about this patch?   Carrying around a 1.7GB (Sorry, Khem, that's
the size of my tar ball!)
>> is a bit much, especially when that's what I send to my customers...
>
> I've been hoping to find some time to do something with the fetcher to
> try and fix this corner we've ended up pinned into.
>
> Ideally I'd like to see both gcc and eglibc using git, we have git in
> ASSUME_PROVIDED and everything is optimal.
>
> I'm not going to reach the release point without doing something about
> this but I would like to stick with git if we can possibly help it.
>
> Having to build subversion-native for critical path components is a
> major pain and performance issue.
>

I agree but then 1.7 GB is noticeably huge too and it will only become
larger in future so I don't think fetching from git will be a good solution
for gcc ever. I was thinking we could Generate tar ball ourselves and put
it on yp mirror. And in future use up stream release tar balls.
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--047d7b343e38b7903f04c982ee3b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, September 12, 2012, Richard Purdie &lt;<a href=3D"mai=
lto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org<=
/a>&gt; wrote:<br>&gt; On Tue, 2012-09-11 at 20:44 -0600, Gary Thomas wrote=
:<br>
&gt;&gt; On 2012-09-05 22:35, Khem Raj wrote:<br>&gt;&gt; &gt; svn tar ball=
s are 96M as compared to 1.3G git tars<br>&gt;&gt; &gt; its unnessary to su=
ck in that much of data.<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; Fixes [YOCTO #29=
08]<br>
&gt;&gt; &gt;<br>&gt;&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>&gt;&gt;<br>&gt;&gt; Wh=
at about this patch? =C2=A0 Carrying around a 1.7GB (Sorry, Khem, that&#39;=
s the size of my tar ball!)<br>
&gt;&gt; is a bit much, especially when that&#39;s what I send to my custom=
ers...<br>&gt;<br>&gt; I&#39;ve been hoping to find some time to do somethi=
ng with the fetcher to<br>&gt; try and fix this corner we&#39;ve ended up p=
inned into.<br>
&gt;<br>&gt; Ideally I&#39;d like to see both gcc and eglibc using git, we =
have git in<br>&gt; ASSUME_PROVIDED and everything is optimal.<br>&gt;<br>&=
gt; I&#39;m not going to reach the release point without doing something ab=
out<br>
&gt; this but I would like to stick with git if we can possibly help it.<br=
>&gt;<br>&gt; Having to build subversion-native for critical path component=
s is a<br>&gt; major pain and performance issue.<br>&gt;<br><br>I agree but=
 then 1.7 GB is noticeably huge too and it will only become larger in futur=
e so I don&#39;t think fetching from git will be a good solution for gcc ev=
er. I was thinking we could Generate tar ball ourselves and put it on yp mi=
rror. And in future use up stream release tar balls.<br>
&gt; Cheers,<br>&gt;<br>&gt; Richard<br>&gt;<br>&gt;<br>&gt; ______________=
_________________________________<br>&gt; Openembedded-core mailing list<br=
>&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembed=
ded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--047d7b343e38b7903f04c982ee3b--
