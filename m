Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id DF9CF78170
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 16:16:31 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id u12so11568995qth.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 09:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z1ePUPG73kiktP3rIFVLlYnXiqXWTkHFgp4jLTLwP+w=;
	b=i4HVunXp6gco83U3RHol/3tjSECEG3tfXpD1ZLKxUVoeNg/Dl61s93lDPoynrIuqJe
	pHVJdL50UmDTrLDv3K5jSp4ZX+UaXRnACB1eXeFx9OrzeJkkfdMc+nPpVBWYiaR79A9X
	0OJiK6PTXzCpgdXIh81cjT8UdguqU0IwZrCn5yztCa6/egpKmpZEvqzXlU7pbh7V76cu
	DVY9gAt/+eoBAPToIWn12na3wMOhMen03M8CoauUOA4/2BkRCd4QVcoyPfC8qwLrx2wG
	4xghQBxyGNdXiASySMa50cf6La3ED2HjTpUT+A0MNVLtvCHqjyTpX+LNicBFd9Txt1X5
	u13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z1ePUPG73kiktP3rIFVLlYnXiqXWTkHFgp4jLTLwP+w=;
	b=eAW9J4oYRO2vmg1F6YEw8Xq/60YpjLqw8Tjcx7zcMpsRglBn90xPFcZksfG05MSJtN
	aLxdv5aBPvwrr940PA50e/ABL//rrr3HmiHjQTa4YPZJ5B7wxRf7MuUmkqMZfO7dYR40
	SBfiR0qgF3aSO+z3L/zkPXgdlKdJb6GLMDY0UJJlx+MOPzRy+Aut8mqk5GQ7nfSQtBoR
	tlFvR8xKxw+g3IJOn3vPNssOOMy38mapJhvmb/Rnu3gs87KoutCNmp2tRWeHgutOYdP0
	DFHaTMjgrZ/MZrR90WJU8HoTF0/Ub+WhQ6eaWem6cBT+hwn/trGyBULiEmhenNr2VLZT
	Uwaw==
X-Gm-Message-State: AKS2vOwAn8PiX2Q6cOzbOJdXkV7s7K/1OLoOG7J6vTjnYPLHZdnVWT/n
	rwtI3lICvqVzhmmmJOQtj61cbJXT4mJT
X-Received: by 10.55.140.193 with SMTP id o184mr21794377qkd.127.1496852193099; 
	Wed, 07 Jun 2017 09:16:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Wed, 7 Jun 2017 09:16:12 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84CF376642@ALA-MBC.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF84CF376642@ALA-MBC.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Jun 2017 17:16:12 +0100
Message-ID: <CAJTo0LYD+KPcjbjvEdaEzODauyMHrhhcKeSroRFMnEXD_NWQ1g@mail.gmail.com>
To: "Slater, Joseph W (Wind River)" <joe.slater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ghostscript: move to version 9.21
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
X-List-Received-Date: Wed, 07 Jun 2017 16:16:33 -0000
Content-Type: multipart/alternative; boundary="001a114f0ce84054d00551610ffa"

--001a114f0ce84054d00551610ffa
Content-Type: text/plain; charset="UTF-8"

On 6 June 2017 at 20:00, Slater, Joseph W (Wind River) <
joe.slater@windriver.com> wrote:

> A couple of patches have been submitted moving ghostscript from 9.20 to
> 9.21.  Should I submit a new one fixing the CUPSCONFIG issue, or is the one
> from Fan Xin being considered instead?
>
>
The patches are functionally the same from what I can tell (although I
haven't tested that), so the cups problem is still a thing.

Ross

--001a114f0ce84054d00551610ffa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 June 2017 at 20:00, Slater, Joseph W (Wind River) <span dir=3D"ltr">&l=
t;<a href=3D"mailto:joe.slater@windriver.com" target=3D"_blank">joe.slater@=
windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p cl=
ass=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,&quot;sans-serif&quot;;color:#1f497d">A couple of patches have been =
submitted moving <span class=3D"il">ghostscript</span> from 9.20 to 9.21.=
=C2=A0 Should I submit a new one fixing the CUPSCONFIG issue, or is the one=
 from Fan
 Xin being considered instead?<u></u><u></u></span></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>The patches are functiona=
lly the same from what I can tell (although I haven&#39;t tested that), so =
the cups problem is still a thing.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a114f0ce84054d00551610ffa--
