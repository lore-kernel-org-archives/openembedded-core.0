Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 274BD71353
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 16:00:23 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id p6so6359841qcv.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 08:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WoEwnfI73/vzElHtJajPIrjZpim5YNPbtRe4bBIwl/U=;
	b=esKKs/teV9TStki2MVc/H1nF/SLt9hOsRskAZbuArEPpxEC+iDrMf4ovGjX0qOlR8x
	uJxG25YPGuo5gwXi06ypGuBUejeOMz1lnVvB1mI9RFs+cLCe660m2aPISnfUaOfoX/Zb
	eiH+LSA0o/rrlxQnOhnGtezZ1/T12TqCHlvR8p9ReGO/MMpvZh9Z23H0nGExhI5gSnZi
	veOsOn8DR3Rymsy5CJPivnHWkV76kOONa5ZmaHWe8bypD7Zj8oUO86ImhlzvTTWdQzoA
	BgPJgSOqqCSfU9/pg/xg/hpyydkfxWoryMEQI6BFSapKSJdzLmg3Hzje+X2EGYSCYb3b
	mDJg==
X-Gm-Message-State: ALoCoQmv5l/DqIH7GPPLx9QhU0OG6UK88RQ4r9mN5j3Bu0XZ75j7oEKDM4AK4JGnltYQAiHTtECP
X-Received: by 10.224.7.197 with SMTP id e5mr60461675qae.64.1421769622870;
	Tue, 20 Jan 2015 08:00:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 20 Jan 2015 08:00:02 -0800 (PST)
In-Reply-To: <20150119135710.GA21148@sestofb10.enea.se>
References: <1420632703-13393-1-git-send-email-maxin.john@enea.com>
	<20150119135710.GA21148@sestofb10.enea.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Jan 2015 16:00:02 +0000
Message-ID: <CAJTo0LZ2QXUwCP7B4y1ST2E0XCRozPyPgx4OqU5GrfayZ3bHiw@mail.gmail.com>
To: "Maxin B. John" <maxin.john@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [dizzy][PATCH] coreutils: Fix CVE-2014-9471
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
X-List-Received-Date: Tue, 20 Jan 2015 16:00:33 -0000
Content-Type: multipart/alternative; boundary=001a11c223f452f507050d17898c

--001a11c223f452f507050d17898c
Content-Type: text/plain; charset=UTF-8

On 19 January 2015 at 13:57, Maxin B. John <maxin.john@enea.com> wrote:

> On Wed, Jan 07, 2015 at 01:11:43PM +0100, Maxin B. John wrote:
> > Fiedler Roman discovered that coreutils' parse_datetime() function
> > has some flaws that may be exploitable if the date(1), touch(1),
> > or potentially other programs, accept untrusted input for certain
> > parameters. While researching this issue, he discovered that it
> > was independently discovered by Bertrand Jacquin and reported at
> > http://debbugs.gnu.org/cgi/bugreport.cgi?bug=16872
> >
>

Was this bug still in 8.23 so it needs to be applied to master, or is it
dizzy-specific?

Ross

--001a11c223f452f507050d17898c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 January 2015 at 13:57, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@enea.com" target=3D"_blank">maxin.john@enea.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6b" class=3D"a3=
s" style=3D"overflow:hidden">On Wed, Jan 07, 2015 at 01:11:43PM +0100, Maxi=
n B. John wrote:<br>
&gt; Fiedler Roman discovered that coreutils&#39; parse_datetime() function=
<br>
&gt; has some flaws that may be exploitable if the date(1), touch(1),<br>
&gt; or potentially other programs, accept untrusted input for certain<br>
&gt; parameters. While researching this issue, he discovered that it<br>
&gt; was independently discovered by Bertrand Jacquin and reported at<br>
&gt; <a href=3D"http://debbugs.gnu.org/cgi/bugreport.cgi?bug=3D16872" targe=
t=3D"_blank">http://debbugs.gnu.org/cgi/bugreport.cgi?bug=3D16872</a><br>
&gt;</div></blockquote><div><br></div><div>Was this bug still in 8.23 so it=
 needs to be applied to master, or is it dizzy-specific?</div><div><br></di=
v><div>Ross=C2=A0</div></div></div></div>

--001a11c223f452f507050d17898c--
