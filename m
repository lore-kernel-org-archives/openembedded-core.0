Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5B2257626F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 12:53:45 +0000 (UTC)
Received: by qgii95 with SMTP id i95so73597585qgi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 05:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YoDEU5fTBtPDh8s+B7kK4HOEN34hWyr6/Xj2akODCcw=;
	b=e6Lc54pe8yjazKK3KEzwXISFhKPoMoZfu+fMwVmAfNJRG8t/EM5ArRa0gMXnGJBFHC
	bAVw8mRq/Kj0eazgNCzjctcP6l1FKgFOU1YCKTBA4KVegocuECYrKjZlTYFSxycvT1kA
	QDYTJEE7Yf+Ah/O08KBzD4L3JOz7pwZTzBkLL/KXd7/khujNwXmsle93a+3X3trTU5Ag
	xEiK0l3/8TBdcwRfewoBh8g9PUMGpsUS5KfuMdFtpGtzvATptzUqumWJaF09U4NgnZaj
	LDeVhUojuiB5CjGwEUumMcBTjT0xZ5aqAxMU37KLHIHrLerZ2nTpy1QhmkwEmuevLw0z
	bdxA==
X-Gm-Message-State: ALoCoQmzSOynJDuqbdq1rDED3vvxFanZ5WfNskduKuxuGnEyG9XT0pzPZdN9KPeMiRYkBPZO3Lev
X-Received: by 10.140.88.80 with SMTP id s74mr48399198qgd.59.1438088025632;
	Tue, 28 Jul 2015 05:53:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Tue, 28 Jul 2015 05:53:26 -0700 (PDT)
In-Reply-To: <55B582F8.5000603@windriver.com>
References: <1436518495-27392-1-git-send-email-rongqing.li@windriver.com>
	<CAHiDW_FxgLz638LwPen_AfOByHeCpvL6A093PjrmGD4X=P-xNQ@mail.gmail.com>
	<55B582F8.5000603@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Jul 2015 13:53:26 +0100
Message-ID: <CAJTo0La-RwRf3L-sJ=HtMMFi_nMQwXi5cXzunELAg6trRyT0cw@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][resend] perl: fix build failure if building dir has the "blib" string
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
X-List-Received-Date: Tue, 28 Jul 2015 12:53:46 -0000
Content-Type: multipart/alternative; boundary=001a11c114c4ec8b8e051beef524

--001a11c114c4ec8b8e051beef524
Content-Type: text/plain; charset=UTF-8

On 27 July 2015 at 02:01, Rongqing Li <rongqing.li@windriver.com> wrote:

> I think we can merge this patch.
>
> I open a defect and submit this patch, as a result, noone knows
> what this line can fix.
>
>
> https://rt.perl.org/Public/Bug/Display.html?id=125603
>

Reading the bug it seems a more upstream-friendly fix (i.e. one that they
would also accept and have in fact asked for) would be to change the regex
to /\bblib\b/. This solves the problem of building in paths that contain
the substring "blib" *and* retains the intent of the logic.

Ross

--001a11c114c4ec8b8e051beef524
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 July 2015 at 02:01, Rongqing Li <span dir=3D"ltr">&lt;<a href=3D"mail=
to:rongqing.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1g3" cla=
ss=3D"a3s" style=3D"overflow:hidden">I think we can merge this patch.<br>
<br>
I open a defect and submit this patch, as a result, noone knows<br>
what this line can fix.<br>
<br>
<br>
<a href=3D"https://rt.perl.org/Public/Bug/Display.html?id=3D125603" rel=3D"=
noreferrer" target=3D"_blank">https://rt.perl.org/Public/Bug/Display.html?i=
d=3D125603</a></div></blockquote></div><br>Reading the bug it seems a more =
upstream-friendly fix (i.e. one that they would also accept and have in fac=
t asked for) would be to change the regex to /\bblib\b/. This solves the pr=
oblem of building in paths that contain the substring &quot;blib&quot; *and=
* retains the intent of the logic.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a11c114c4ec8b8e051beef524--
