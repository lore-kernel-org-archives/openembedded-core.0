Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
	[209.85.222.42])
	by mail.openembedded.org (Postfix) with ESMTP id CDFCD601FC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 09:53:17 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id d19so3051054uak.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 02:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D9tMNzeI3PMTwjr23EAjWCVs8vJtdUjDUnUtO2pV1VI=;
	b=W3jruiqWhn4v19bpqmv6rgfMJOfNmAOZqkBuXUbFs1pCM51SA9KGOumYSRyWBrOZK2
	QePYrgV8iyPqraC7YDwpEoPfuDiHknF3jHmyHWJ6tcmEZbVy2AqYeTLBEUirch7btSqD
	/X43bRPGWFUGzNzRiVBzD1qf3mcPYVbYi7tl0u64wUz85bZTi1vaM4sYY6l3g9C6XCg9
	5jojZT9EUxlzgKoFICDPOMJxgUIpLL5o9QJ4o1hdQqnXYdGGEkcxAAk2TZu97WESbuPA
	Fl+G7/5ecv28Qmb+nPgMfOpClUkAdd/Gb1s2dpeNlXt4IMdMhpS5dAjvQ1zK/iR3uWa9
	0ZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D9tMNzeI3PMTwjr23EAjWCVs8vJtdUjDUnUtO2pV1VI=;
	b=dxheZ3+0ZUtmYALgSZXCc9ZR0rR9TgpS/vAqRrJ5DhWxAw+KGLRMPtU0AJRDpoixI1
	NEJUkXkKwwSFwWn98CGhqP01fpjGTyZBBiToDVJ2ZRqBBwT4bEuEtIbgfv4kmL7VfT8z
	QhLcS4hp5CpJ135iHRZmEpfNw4MQhSN1vF9JlJm92mHooSxZ/1kY9pPa+j2WTCPD2+FE
	QV2k+U6AZpTG4LOOdm4LtW76UUskY0phkWp2EkM9RhjKYAHnG6SeB1nhAooIpjEn9aAV
	BJPafXo9Fukpt4XWc1vAUIfaXSZambB/oHbC8PV6acBUr8k92Z48jNke1/PaJzIOZqZi
	0tew==
X-Gm-Message-State: ANhLgQ1SAxvxBom/Vn2ZHit6Odq3KlZ4zOIsEqM0HUSm9+U2jq8qkd08
	EBKbraRXtNFczziu+t84/4nmeOOjPPfdm4fqCTvAUQ==
X-Google-Smtp-Source: ADFU+vtYXtjJ5fIZJTMJvUZhwZTqBVfzzVONJJ/zRdWEOYeUSyjBrALGWF1CfATPJYWuVqRiKJ8quui1uFNqSDu3B6k=
X-Received: by 2002:ab0:7802:: with SMTP id x2mr8511075uaq.100.1583747598396; 
	Mon, 09 Mar 2020 02:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200304113217.GB7923@localhost>
	<CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
	<20200304140109.GC7923@localhost>
	<CANNYZj8ciqgR7eed+B+WwfMRHKc3u_XHrT3vo004=TEX9cCmhA@mail.gmail.com>
	<20200304172415.GA29456@localhost>
	<01b3bb37-f65f-8048-1a27-b859b62d7f98@gmail.com>
	<20200306100422.GA17785@localhost>
	<877e317932176664bc7b0120439c56d4dda791af.camel@linuxfoundation.org>
	<20200308214610.GB1425@localhost>
	<CANNYZj_4sTc9vjhm1+S1GbjN=8SjChWt+gksxxKLXEZXeK9nPQ@mail.gmail.com>
	<20200309002308.GD1425@localhost>
	<f99fbcc5-bb47-a177-f1e9-815d3cf4e5c0@embexus.com>
In-Reply-To: <f99fbcc5-bb47-a177-f1e9-815d3cf4e5c0@embexus.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Mar 2020 10:53:07 +0100
Message-ID: <CANNYZj98o12+zAcDnic+NNmuqNOH3fp5W1+37HCbOhR90evm+w@mail.gmail.com>
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Openembedded-architecture] Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Mon, 09 Mar 2020 09:53:18 -0000
Content-Type: multipart/alternative; boundary="00000000000004300b05a068f9f3"

--00000000000004300b05a068f9f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The intent is to say that security patches are eligible for inclusion into
stable release updates (while e.g. version updates are not). If the wording
is vague, it can be improved. I tend to agree that there has to be a more
clear message that users must set up their own security process or pay
someone to do it (especially considering that most products involve a lot
more 3rd party layers and not just oe-core). Some of the fixing work can be
reused from upstream but there is no promise that it covers everything.

Alex

On Mon 9. Mar 2020 at 8.45, Ayoub Zaki <ayoub.zaki@embexus.com> wrote:

> Hello,
>
> On 09.03.20 01:23, Adrian Bunk wrote:
> > On Sun, Mar 08, 2020 at 11:08:08PM +0100, Alexander Kanavin wrote:
> >> On Sun, 8 Mar 2020 at 22:46, Adrian Bunk <bunk@stusta.de> wrote:
> >>
> >>> It is on YP to make it clear to users whether or not Yocto comes with
> >>> the same set of security guarantees as distributions like Ubuntu or
> >>> Debian.
> >>> If it is the duty of every user of Yocto to track and fix CVEs,
> >>> then this has to be stated clearly instead of implying the opposite.
> >>> This gives users the opportunity to mitigate, instead of unknowingly
> >>> shipping insecure products.
> >>>
> >> Do you have any actual evidence for actual users shipping insecure
> products
> >> because they mistakenly believe Yocto takes care of security for them?
> > Nothing to discuss in public.
> >
> >> This
> >> has been the situation from the start of the project, certainly this w=
as
> >> the case 5 years ago when I joined it, and the only person ever to mak=
e
> an
> >> issue out of it is you. Everyone else seems to understand the deal
> they're
> >> getting by using Yocto without a commercial support contract.
> >> ...
> > You are saying that 'track and fix CVEs' is on users.
> > Let's check what YP is telling users.
> >
> > Click on the "Is Yocto Project for you?" link on the YP frontpage:
> >
> > https://www.yoctoproject.org/is-yocto-project-for-you/
> > 13. Yocto Project follows a strict release schedule incorporating
> > security patches in all supported releases. This predictability is
> > crucial for projects that are based on Yocto Project and allows the
> > development teams to plan their activities. Developers can choose which
> > Yocto Project branch on which to base their activities as a function of
> > their needs. The development branch will ensure access to the latest
> > features while the stable branches will reduce the pace of changes. CVE=
s
> > (common vulnerabilities and exposures) issues are supported for the
> > latest 2 releases.
>
>
> Adrian is making a point here, The Yocto Project by claiming that it
> supports security patches for Stable releases is misleading the Users!
>
> I work with different customers and some of them think that by using and
> pulling the latest releases they will get the CVEs automatically fixed!
>
> YP should state that CLEARLY! Of course it will impact the choice of
> going with Yocto or Not ( probably NOT in this case).
>
> >
> >
> >> Alex
> > cu
> > Adrian
>
> Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards
>
> --
> Ayoub Zaki
> Embedded Systems Consultant
>
> Vaihinger Stra=C3=9Fe 2/1
> D-71634 Ludwigsburg
>
>
> Mobile   : +4917662901545
> Email    : ayoub.zaki@embexus.com
> Homepage : https://embexus.com
> VAT No.  : DE313902634
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000004300b05a068f9f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">The intent is to say that security patches are eligi=
ble for inclusion into stable release updates (while e.g. version updates a=
re not). If the wording is vague, it can be improved. I tend to agree that =
there has to be a more clear message that users must set up their own secur=
ity process or pay someone to do it (especially considering that most produ=
cts involve a lot more 3rd party layers and not just oe-core). Some of the =
fixing work can be reused from upstream but there is no promise that it cov=
ers everything.</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Al=
ex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon 9. Mar 2020 at 8.45, Ayoub Zaki &lt;<a href=3D"mailto:ayoub.z=
aki@embexus.com">ayoub.zaki@embexus.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Hello,<br>
<br>
On 09.03.20 01:23, Adrian Bunk wrote:<br>
&gt; On Sun, Mar 08, 2020 at 11:08:08PM +0100, Alexander Kanavin wrote:<br>
&gt;&gt; On Sun, 8 Mar 2020 at 22:46, Adrian Bunk &lt;<a href=3D"mailto:bun=
k@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; It is on YP to make it clear to users whether or not Yocto com=
es with<br>
&gt;&gt;&gt; the same set of security guarantees as distributions like Ubun=
tu or<br>
&gt;&gt;&gt; Debian.<br>
&gt;&gt;&gt; If it is the duty of every user of Yocto to track and fix CVEs=
,<br>
&gt;&gt;&gt; then this has to be stated clearly instead of implying the opp=
osite.<br>
&gt;&gt;&gt; This gives users the opportunity to mitigate, instead of unkno=
wingly<br>
&gt;&gt;&gt; shipping insecure products.<br>
&gt;&gt;&gt;<br>
&gt;&gt; Do you have any actual evidence for actual users shipping insecure=
 products<br>
&gt;&gt; because they mistakenly believe Yocto takes care of security for t=
hem?<br>
&gt; Nothing to discuss in public.<br>
&gt;<br>
&gt;&gt; This<br>
&gt;&gt; has been the situation from the start of the project, certainly th=
is was<br>
&gt;&gt; the case 5 years ago when I joined it, and the only person ever to=
 make an<br>
&gt;&gt; issue out of it is you. Everyone else seems to understand the deal=
 they&#39;re<br>
&gt;&gt; getting by using Yocto without a commercial support contract.<br>
&gt;&gt; ...<br>
&gt; You are saying that &#39;track and fix CVEs&#39; is on users.<br>
&gt; Let&#39;s check what YP is telling users.<br>
&gt;<br>
&gt; Click on the &quot;Is Yocto Project for you?&quot; link on the YP fron=
tpage:<br>
&gt;<br>
&gt; <a href=3D"https://www.yoctoproject.org/is-yocto-project-for-you/" rel=
=3D"noreferrer" target=3D"_blank">https://www.yoctoproject.org/is-yocto-pro=
ject-for-you/</a><br>
&gt; 13. Yocto Project follows a strict release schedule incorporating<br>
&gt; security patches in all supported releases. This predictability is<br>
&gt; crucial for projects that are based on Yocto Project and allows the<br=
>
&gt; development teams to plan their activities. Developers can choose whic=
h<br>
&gt; Yocto Project branch on which to base their activities as a function o=
f<br>
&gt; their needs. The development branch will ensure access to the latest<b=
r>
&gt; features while the stable branches will reduce the pace of changes. CV=
Es<br>
&gt; (common vulnerabilities and exposures) issues are supported for the<br=
>
&gt; latest 2 releases.<br>
<br>
<br>
Adrian is making a point here, The Yocto Project by claiming that it <br>
supports security patches for Stable releases is misleading the Users!<br>
<br>
I work with different customers and some of them think that by using and <b=
r>
pulling the latest releases they will get the CVEs automatically fixed!<br>
<br>
YP should state that CLEARLY! Of course it will impact the choice of <br>
going with Yocto or Not ( probably NOT in this case).<br>
<br>
&gt;<br>
&gt;<br>
&gt;&gt; Alex<br>
&gt; cu<br>
&gt; Adrian<br>
<br>
Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards<br>
<br>
-- <br>
Ayoub Zaki<br>
Embedded Systems Consultant<br>
<br>
Vaihinger Stra=C3=9Fe 2/1<br>
D-71634 Ludwigsburg<br>
<br>
<br>
Mobile=C2=A0 =C2=A0: +4917662901545<br>
Email=C2=A0 =C2=A0 : <a href=3D"mailto:ayoub.zaki@embexus.com" target=3D"_b=
lank">ayoub.zaki@embexus.com</a><br>
Homepage : <a href=3D"https://embexus.com" rel=3D"noreferrer" target=3D"_bl=
ank">https://embexus.com</a><br>
VAT No.=C2=A0 : DE313902634<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000004300b05a068f9f3--
