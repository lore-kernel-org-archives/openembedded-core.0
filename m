Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8F0601D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 09:25:40 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id 2so177490815ioy.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 02:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=117V0+4+1NXFhTQ20CwteY0EDcA8V0kCTO4EVBz8dyA=;
	b=c67Pt/LbPsy5z/Tu3UnIB7Kz6RSI3zGK6mZqn5ouQdtT4cG33Lby4Mo2fi4opqohiO
	mQGfoxMd12SNDH8BoiLhxiTMWAf8cRoVYvEgOazYMdKqDhvUiMXZqL2QPfDLNIUnoGtP
	Fm6U6biW6KIuSoULcO/dVVtMesF0hXmeb6CMqRS/9JFr3U6P0p/29OaDwjQfoDpahmTX
	WdHqT0W7qy3ymFmNIhc1PfdxQlFGmot8oJ4MHAbQpdiZCJ+3hsU4lX6/lcxXg5qK8bC+
	3CKy32Z0183tsha0QbbM0/aiLjn4/9Znbqj6LE460kX2YdozzOnGganf3pgPoc/myqMj
	KSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=117V0+4+1NXFhTQ20CwteY0EDcA8V0kCTO4EVBz8dyA=;
	b=Fhwg2wSFTV+wLUnV8zJlezwbryX9A8Ll1PWXGuGYdh76q2EbTWyitb9td6TxVtoZh4
	s57iugtzi6Uv3t5cGno1ZHYVQm4lvZJUtXK5i75SBybAMxy5KK9ASWr/TsL0lZLR4m6p
	rYrCuI4A7ywfsZTuSwVNpBx6F0c1UKsW2DQ/mupqrBw06YfEciGTlt1P4T93imUZz/eV
	oVtqcekWWLzi719V9Na56NGAiXmajer35QS6f1WbSS7Slo0QbBa2xeut0vtIo70Otn/i
	FzdwYj+gehtF6gTYzOpjPUD1pEi34/5XqCvCOvdpHXlDgTPOPjt88aHiPds3q4KU4Igg
	Y34g==
X-Gm-Message-State: AOPr4FXoA/WHJCBZusMoXfqZOU9tKpQgQasZWwxnsJMuY1D8z6poo4n/SMcNwh9yIsqVoY8r9Y1GBLBN6mVP4M1+
X-Received: by 10.107.51.213 with SMTP id z204mr12840622ioz.148.1461576341339; 
	Mon, 25 Apr 2016 02:25:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Mon, 25 Apr 2016 02:25:21 -0700 (PDT)
In-Reply-To: <20160424231708.GA7573@linux-yxv0>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E570F86EE@fmsmsx111.amr.corp.intel.com>
	<20160422170410.GB23308@linux-yxv0>
	<CAJTo0LYnK-sd+d1bkJN39AhkAN0t+42Nonm38Qyy3BXm1nLYdw@mail.gmail.com>
	<20160424231708.GA7573@linux-yxv0>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Apr 2016 10:25:21 +0100
Message-ID: <CAJTo0Lb_Vmn_ZFBqE4e++9AroBs-s6vTnwKfnMZTYBaVVgjJGA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project Status WW17
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
X-List-Received-Date: Mon, 25 Apr 2016 09:25:42 -0000
Content-Type: multipart/alternative; boundary=001a11440cd0a34ff705314bc2d5

--001a11440cd0a34ff705314bc2d5
Content-Type: text/plain; charset=UTF-8

On 25 April 2016 at 00:17, Trevor Woerner <twoerner@gmail.com> wrote:

> > CROPS is docker magic to do builds on Windows/Mac.  Todor did a
> > presentation at ELC: http:
> > //
> events.linuxfoundation.org/sites/events/files/slides/Todor_Minchev_CROPS_ELC_2016.pdf
> > <
> http://events.linuxfoundation.org/sites/events/files/slides/Todor_Minchev_CROPS_ELC_2016.pdf
> >
>
> I was *very* excited to learn about CROPS at ELC, which is why I was
> wondering
> if it was available to experiment with somewhere?


The slides have links to the git repos and some instructions.  I'm sure
Todor would help if you have any specific questions.

Ross

--001a11440cd0a34ff705314bc2d5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 April 2016 at 00:17, Trevor Woerner <span dir=3D"ltr">&lt;<a href=3D"=
mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; CROPS is=
 docker magic to do builds on Windows/Mac.=C2=A0 Todor did a<br>
&gt; presentation at ELC: http:<br>
&gt; //<a href=3D"http://events.linuxfoundation.org/sites/events/files/slid=
es/Todor_Minchev_CROPS_ELC_2016.pdf" rel=3D"noreferrer" target=3D"_blank">e=
vents.linuxfoundation.org/sites/events/files/slides/Todor_Minchev_CROPS_ELC=
_2016.pdf</a><br>
</span>&gt; &lt;<a href=3D"http://events.linuxfoundation.org/sites/events/f=
iles/slides/Todor_Minchev_CROPS_ELC_2016.pdf" rel=3D"noreferrer" target=3D"=
_blank">http://events.linuxfoundation.org/sites/events/files/slides/Todor_M=
inchev_CROPS_ELC_2016.pdf</a>&gt;<br>
<br>
I was *very* excited to learn about CROPS at ELC, which is why I was wonder=
ing<br>
if it was available to experiment with somewhere?</blockquote><div><br></di=
v><div>The slides have links to the git repos and some instructions.=C2=A0 =
I&#39;m sure Todor would help if you have any specific questions.</div><div=
><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11440cd0a34ff705314bc2d5--
