Return-Path: <giuseppe.condorelli@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id 56B2860FEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 07:40:28 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id i4so3571064oah.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 00:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=a+0FhwYNLrNOs8ZqD3z+sWZ+EEtbyhSbpjYcrRn2ogs=;
	b=MAhEEprEJBXe4yPMsHTCQFvoaXmZpO15QYLwDTW3Dv4eyMNoZS1btqXo09jLEXXUFu
	eHYV5gCtaCwKMZOSXnlyeTttABayK5q7QJ0TlcBJGEWXh59dMq7cha2kSTgXRgPA0rv2
	uoswGC5TVLrH9Iyr7mwDAHrS6bzs5Sjp88fOFuHXaoS8p+KdOzjv9LrqmQI1rgd2IW8X
	5jlFotSQovRTJET3SjywxsXA50vF6N7KhaTLAhjPKUuzX9jPIbs3SXpflfNW2n63V9ab
	0EW2LSONu00k9uigkcBrKvvkJLfde4MWHm/M+Wu/9qafa/3Lqs9wwGZ+m4iChus3FqWj
	N7/w==
MIME-Version: 1.0
X-Received: by 10.182.128.103 with SMTP id nn7mr34124256obb.104.1374738028310; 
	Thu, 25 Jul 2013 00:40:28 -0700 (PDT)
Received: by 10.182.142.65 with HTTP; Thu, 25 Jul 2013 00:40:28 -0700 (PDT)
In-Reply-To: <1374660286.28370.15.camel@firebird.rb.intel.com>
References: <CAOHjBZuDPPjk9dySzOTtGjXzy5yisjdumag=22qV5U-aW2hj4A@mail.gmail.com>
	<1374652108.28370.6.camel@firebird.rb.intel.com>
	<CAOHjBZvycJUgtJc0sZdkENH51YHvSGj5P50uMALU95T3+W_RPA@mail.gmail.com>
	<CANyK_8eXoSMdsQFGwzPmnxZrgN_bmFejxoLdLAXqmis=rQ7Cmw@mail.gmail.com>
	<CAOHjBZtoXxaHXFammidVFGwGQz6pCJBKhZe5233Us+bDQPQ9QQ@mail.gmail.com>
	<1374660286.28370.15.camel@firebird.rb.intel.com>
Date: Thu, 25 Jul 2013 09:40:28 +0200
Message-ID: <CAOHjBZuwd2ZOMQ85jButDc7y+KNvCrmxrR84MShN4Euwku=rVw@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
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
X-List-Received-Date: Thu, 25 Jul 2013 07:40:28 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1cf1ad637b004e25123a3

--e89a8ff1cf1ad637b004e25123a3
Content-Type: text/plain; charset=ISO-8859-1

Well,
further information for Stefan and Paul.

1) installing the make-3.82-14.fc18.x86_64  the problem disappeared.
Previuosly I downloaded and installed the -9 release and it was not
enough...
2) trying with the script Paul suggested all was built right. I only
catched a warning at the end of the build due to a wrong path that
obviously doesn't exist in my machine.

======================
warning: templates not found
/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/buildtools/build/build/tmp/sysroots/x86_64-linux/usr/share/git-core/templates
======================

Thanks all for the support,

Cheers.
Giuseppe
2013/7/24 Stanacar, StefanX <stefanx.stanacar@intel.com>

>
>
> On Wed, 2013-07-24 at 11:43 +0200, Giuseppe Condorelli wrote:
> > Hi Paul,
> >
> > I saw it early this morning (reading the previous thread)
> > but I've not put it in the right attention I think.
> > Now I've installed the sdk using that script and a run is still
> > ongoing.
> > I'll let you know.
> > I ask the same to you: are you sure the FC17 and ahead have solved the
> > make issue?
> >
>
> I'm running F19 and didn't ran into any problems.
>
> I also have an F18 machine that works which has
> make-3.82-14.fc18.x86_64 (this was the update that fixed the problem,
> pushed two weeks ago).
>
> And according to
>
> https://admin.fedoraproject.org/updates/FEDORA-2013-11295/make-3.82-14.fc17?_csrf_token=9e2949b0095b56c00b217d0b00e77e28df2bb7ba
> and
>
> https://admin.fedoraproject.org/updates/make?_csrf_token=9e2949b0095b56c00b217d0b00e77e28df2bb7ba
>
> the same patch was pushed for F17 make on the same day as F18, so that
> should work too.
>
> Cheers,
> Stefan
>
>
> > Many thanks,
> > Cheers.
> > Giuseppe
> >
> > 2013/7/24 Paul Barker <paul@paulbarker.me.uk>
> >         On 24 July 2013 09:47, Giuseppe Condorelli
> >         <giuseppe.condorelli@gmail.com> wrote:
> >         > Many thanks for the quick reply Stefan,
> >         >
> >         > For completion, I'm working on FC16.
> >         > Indeed (before sending the mail) I tried downloading the
> >         make rpm for FC17
> >         > (rpmfind.net) and to use it
> >         > (accordingly unpackaged under my personal directory,
> >         updating the PATH) with
> >         > the same failure.
> >         > Can this sound strange for you?
> >         > As you know, which are the make versions Fedora has released
> >         for the
> >         > FC17/18?
> >         >
> >         > I think at the moment the build of the buildtools-tarball
> >         will be the way
> >         > I'll follow, temporary disabling the sanity check.
> >         >
> >         > Cheers,
> >         > Giuseppe
> >         >
> >
> >
> >         As stated in a previous thread, there's a snapshot of the
> >         buildtools
> >         at
> >
> http://autobuilder.yoctoproject.org/pub/nightly/CURRENT/buildtools/
> >         which might work for you. It should install a known good set
> >         of tools
> >         including make. This could be a good test for it.
> >
> >         --
> >         Paul Barker
> >
> >         Email: paul@paulbarker.me.uk
> >         http://www.paulbarker.me.uk
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--e89a8ff1cf1ad637b004e25123a3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Well,</div><div>further information for Stefan and Paul.</div><div>=A0=
</div><div>1) installing the make-3.82-14.fc18.x86_64=A0 the problem disapp=
eared. Previuosly I downloaded and installed the -9 release and it was not =
enough...</div>
<div>2) trying with the script Paul suggested all was built right. I only c=
atched a warning at the end of the build due to a wrong path that obviously=
 doesn&#39;t exist in my machine.</div><div>=A0</div><div>=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div>warning: templates not found /srv/home/pokybuild/yocto-autobuilder-new=
/yocto-slave/buildtools/build/build/tmp/sysroots/x86_64-linux/usr/share/git=
-core/templates<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D</div><div>=A0</div><div>Thanks all for the support,</div>
<div>=A0</div><div>Cheers.</div><div>Giuseppe<br></div><div class=3D"gmail_=
quote">2013/7/24 Stanacar, StefanX <span dir=3D"ltr">&lt;<a href=3D"mailto:=
stefanx.stanacar@intel.com" target=3D"_blank">stefanx.stanacar@intel.com</a=
>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div class=3D"im"><br>
<br>
On Wed, 2013-07-24 at 11:43 +0200, Giuseppe Condorelli wrote:<br>
&gt; Hi Paul,<br>
&gt;<br>
&gt; I saw it early this morning (reading the previous thread)<br>
&gt; but I&#39;ve not put it in the right attention I think.<br>
&gt; Now I&#39;ve installed the sdk using that script and a run is still<br=
>
&gt; ongoing.<br>
&gt; I&#39;ll let you know.<br>
&gt; I ask the same to you: are you sure the FC17 and ahead have solved the=
<br>
&gt; make issue?<br>
&gt;<br>
<br>
</div>I&#39;m running F19 and didn&#39;t ran into any problems.<br>
<br>
I also have an F18 machine that works which has<br>
make-3.82-14.fc18.x86_64 (this was the update that fixed the problem,<br>
pushed two weeks ago).<br>
<br>
And according to<br>
<a href=3D"https://admin.fedoraproject.org/updates/FEDORA-2013-11295/make-3=
.82-14.fc17?_csrf_token=3D9e2949b0095b56c00b217d0b00e77e28df2bb7ba" target=
=3D"_blank">https://admin.fedoraproject.org/updates/FEDORA-2013-11295/make-=
3.82-14.fc17?_csrf_token=3D9e2949b0095b56c00b217d0b00e77e28df2bb7ba</a><br>

and<br>
<a href=3D"https://admin.fedoraproject.org/updates/make?_csrf_token=3D9e294=
9b0095b56c00b217d0b00e77e28df2bb7ba" target=3D"_blank">https://admin.fedora=
project.org/updates/make?_csrf_token=3D9e2949b0095b56c00b217d0b00e77e28df2b=
b7ba</a><br>

<br>
the same patch was pushed for F17 make on the same day as F18, so that<br>
should work too.<br>
<br>
Cheers,<br>
Stefan<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt; Many thanks,<br>
&gt; Cheers.<br>
&gt; Giuseppe<br>
&gt;<br>
&gt; 2013/7/24 Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk">pau=
l@paulbarker.me.uk</a>&gt;<br>
&gt; =A0 =A0 =A0 =A0 On 24 July 2013 09:47, Giuseppe Condorelli<br>
&gt; =A0 =A0 =A0 =A0 &lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com">g=
iuseppe.condorelli@gmail.com</a>&gt; wrote:<br>
&gt; =A0 =A0 =A0 =A0 &gt; Many thanks for the quick reply Stefan,<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; For completion, I&#39;m working on FC16.<br>
&gt; =A0 =A0 =A0 =A0 &gt; Indeed (before sending the mail) I tried download=
ing the<br>
&gt; =A0 =A0 =A0 =A0 make rpm for FC17<br>
&gt; =A0 =A0 =A0 =A0 &gt; (<a href=3D"http://rpmfind.net" target=3D"_blank"=
>rpmfind.net</a>) and to use it<br>
&gt; =A0 =A0 =A0 =A0 &gt; (accordingly unpackaged under my personal directo=
ry,<br>
&gt; =A0 =A0 =A0 =A0 updating the PATH) with<br>
&gt; =A0 =A0 =A0 =A0 &gt; the same failure.<br>
&gt; =A0 =A0 =A0 =A0 &gt; Can this sound strange for you?<br>
&gt; =A0 =A0 =A0 =A0 &gt; As you know, which are the make versions Fedora h=
as released<br>
&gt; =A0 =A0 =A0 =A0 for the<br>
&gt; =A0 =A0 =A0 =A0 &gt; FC17/18?<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; I think at the moment the build of the buildtools=
-tarball<br>
&gt; =A0 =A0 =A0 =A0 will be the way<br>
&gt; =A0 =A0 =A0 =A0 &gt; I&#39;ll follow, temporary disabling the sanity c=
heck.<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt; =A0 =A0 =A0 =A0 &gt; Cheers,<br>
&gt; =A0 =A0 =A0 =A0 &gt; Giuseppe<br>
&gt; =A0 =A0 =A0 =A0 &gt;<br>
&gt;<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 As stated in a previous thread, there&#39;s a snapshot=
 of the<br>
&gt; =A0 =A0 =A0 =A0 buildtools<br>
&gt; =A0 =A0 =A0 =A0 at<br>
&gt; =A0 =A0 =A0 =A0 <a href=3D"http://autobuilder.yoctoproject.org/pub/nig=
htly/CURRENT/buildtools/" target=3D"_blank">http://autobuilder.yoctoproject=
.org/pub/nightly/CURRENT/buildtools/</a><br>
&gt; =A0 =A0 =A0 =A0 which might work for you. It should install a known go=
od set<br>
&gt; =A0 =A0 =A0 =A0 of tools<br>
&gt; =A0 =A0 =A0 =A0 including make. This could be a good test for it.<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 --<br>
&gt; =A0 =A0 =A0 =A0 Paul Barker<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 Email: <a href=3D"mailto:paul@paulbarker.me.uk">paul@p=
aulbarker.me.uk</a><br>
&gt; =A0 =A0 =A0 =A0 <a href=3D"http://www.paulbarker.me.uk" target=3D"_bla=
nk">http://www.paulbarker.me.uk</a><br>
&gt;<br>
</div></div><div class=3D"HOEnZb"><div class=3D"h5">&gt; __________________=
_____________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core</a><br>
<br>
</div></div></blockquote></div><br>

--e89a8ff1cf1ad637b004e25123a3--
