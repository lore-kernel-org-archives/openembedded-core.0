Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4FEF66A882
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 16:12:37 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id fo12so874757lab.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=unTMfKS480eMpXnW2A3RaShs810uZCPztbDIeZknJ1I=;
	b=tX6P/yVjsTXi7y11QQW1C9ucKGd98xlWOpeZi/FSaMYdY2I9s1zRf4uGe1V+tsWIDW
	UkXRU/6nlMCzz6o4PCrZORQmCiBNB06ZQOs7WAamnfFYS2tl+HuEJoOveyvXmUltV5B3
	f0Oh5KUDfjabIhtWkR3u8K6HkAlCELDWh//QY10zTc4PQAp9o5p/T2l1tJ4sNo2wbZ7c
	PCrke9DpExT66GZq0x6QFO2yfgdDdHfVv+99MOpSCSOTAM2k93EvBJYZpAoyoAca/XZN
	fDWnbJKmjzFd3puOoiPyCu4jyitiUVZpUaiWbSTs3SSfV2QA/6N6dEGIPnt7IW0kb5JU
	G9wA==
X-Received: by 10.152.1.137 with SMTP id 9mr17980092lam.10.1370535157577; Thu,
	06 Jun 2013 09:12:37 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.4.66 with HTTP; Thu, 6 Jun 2013 09:12:17 -0700 (PDT)
In-Reply-To: <4045582.lhqZLrdHub@helios>
References: <CAP9ODKr9zNQENpsL_ASoKRWEfTauWhRx07Ps46=5u3D5=XXxng@mail.gmail.com>
	<4045582.lhqZLrdHub@helios>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 6 Jun 2013 09:12:17 -0700
X-Google-Sender-Auth: O9aVZX4QJSp9VHVcpcMJsb6RiNk
Message-ID: <CABcZAN=aMd0trknVT6r=omgrUeJ2hYDE3nUwBLiV65-gavPhug@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Linux kernel build dependency of 'bc'
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
X-List-Received-Date: Thu, 06 Jun 2013 16:12:37 -0000
Content-Type: multipart/alternative; boundary=089e013c6a90383e5404de7e958a

--089e013c6a90383e5404de7e958a
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 6, 2013 at 9:08 AM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> On Thursday 06 June 2013 12:11:04 Otavio Salvador wrote:
> > I got a build failure in my auto builder; it has a very lean system
> install
> > and it spot something it is new for me. It seems the kernel now depends
> on
> > 'bc' util.
> >
> > I tried to find a 'bc-native'  and couldn't find so I'd like to know if
> it
> > is a known issue and if someone is already working in a 'bc-native'
> recipe
> > to proper fix the issue.
>
> We used to have bc in our list of required host packages in the Yocto
> Project
> quick start guide, but after some testing a few versions ago I removed it
> because it didn't seem to be needed. FWIW I don't have it installed on my
> primary build machine and I haven't noticed any problems as a result.
>
> Rather than creating bc-native I think we should find out where the
> dependency
> on bc exists and try to patch it out (if practical); if it really is needed
> and too hard to remove, we can just add bc to the list of required host
> packages. I hope that's not the case though.
>

Apparently Peter Anvin added use of bc to avoid the dependency on perl.
Multiple other distros got bit by this added dep (gentoo, linux from
scratch, etc). Rob Landley was not too happy about it (he had perl removal
patches for the kernel which didn't require bc):

"The perl removal patches are finally upstream! But Peter Anvin's quest to
unnecessarily complicate the kernel build continues, he replaced one with
"bc" which is a turing-complete programming language that's so seldom used
busybox hasn't got it. His patch broke Linux From Scratch (they had to add
bc to chapter 5; in the past 12 years it's never been there). I have no
idea _why_ he did this since the C implementation I contributed was
actually smaller and simpler than what he wrote. Oh well."
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e013c6a90383e5404de7e958a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Jun 6, 2013 at 9:08 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"=
mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux=
.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":3u8" style=3D"overflow:hidden"><div class=3D"i=
m">On Thursday 06 June 2013 12:11:04 Otavio Salvador wrote:<br>


&gt; I got a build failure in my auto builder; it has a very lean system in=
stall<br>
&gt; and it spot something it is new for me. It seems the kernel now depend=
s on<br>
&gt; &#39;bc&#39; util.<br>
&gt;<br>
&gt; I tried to find a &#39;bc-native&#39; =C2=A0and couldn&#39;t find so I=
&#39;d like to know if it<br>
&gt; is a known issue and if someone is already working in a &#39;bc-native=
&#39; recipe<br>
&gt; to proper fix the issue.<br>
<br>
</div>We used to have bc in our list of required host packages in the Yocto=
 Project<br>
quick start guide, but after some testing a few versions ago I removed it<b=
r>
because it didn&#39;t seem to be needed. FWIW I don&#39;t have it installed=
 on my<br>
primary build machine and I haven&#39;t noticed any problems as a result.<b=
r>
<br>
Rather than creating bc-native I think we should find out where the depende=
ncy<br>
on bc exists and try to patch it out (if practical); if it really is needed=
<br>
and too hard to remove, we can just add bc to the list of required host<br>
packages. I hope that&#39;s not the case though.</div></blockquote></div><b=
r>Apparently Peter Anvin added use of bc to avoid the dependency on perl. M=
ultiple other distros got bit by this added dep (gentoo, linux from scratch=
, etc). Rob Landley was not too happy about it (he had perl removal patches=
 for the kernel which didn&#39;t require bc):</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">&quot;The p=
erl removal patches are finally upstream! But Peter Anvin&#39;s quest to un=
necessarily complicate the kernel build continues, he replaced one with &qu=
ot;bc&quot; which is a turing-complete programming language that&#39;s so s=
eldom used busybox hasn&#39;t got it. His patch broke Linux From Scratch (t=
hey had to add bc to chapter 5; in the past 12 years it&#39;s never been th=
ere). I have no idea _why_ he did this since the C implementation I contrib=
uted was actually smaller and simpler than what he wrote. Oh well.&quot;<br=
>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--089e013c6a90383e5404de7e958a--
