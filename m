Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QmRa2-0001YM-O2
	for openembedded-core@openembedded.org; Thu, 28 Jul 2011 16:28:55 +0200
Received: by yib18 with SMTP id 18so1908234yib.6
	for <openembedded-core@openembedded.org>;
	Thu, 28 Jul 2011 07:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LZSio6RnIX400cEBXjyZc4A19/ViKCtgTfTk5J+ANzY=;
	b=thvTzpwUYuejIHaTx0ZDekByKLtRN+KsiIMTirTYAGDPGuJnrU9ZU6LRdGewVHKwDP
	BKk5iHNlbXPt4alQ5kEeS2Sh6P6aPUGNArezbwrnCR0diH7TEJW+wrZ9MmO87zZG/9qB
	HE1+Xy70ZGiEtg2qpTvSjpojywgFhRY+sZOX8=
MIME-Version: 1.0
Received: by 10.91.202.22 with SMTP id e22mr48287agq.176.1311863078483; Thu,
	28 Jul 2011 07:24:38 -0700 (PDT)
Received: by 10.91.94.13 with HTTP; Thu, 28 Jul 2011 07:24:38 -0700 (PDT)
In-Reply-To: <CAPcSpEJphsRYSr_CmXtDc=G5MnGNyoEd8MQcbaALKu4GPQ__Uw@mail.gmail.com>
References: <1311824295-13464-1-git-send-email-bengardiner@nanometrics.ca>
	<CACW_hTZEgveniP0x3R6Q1mNb9+T0kYP=TsOF4A2SwHKJeAqUjA@mail.gmail.com>
	<CAPcSpE+ZKH=o7RsotsiCmo3ss5zHo=wH9-z6htc7zVWDo7YSOQ@mail.gmail.com>
	<CACW_hTaR-BfLXDpUyrCcL+Ns2KOOSiT+kH9fJ07HGJwOZ51a4w@mail.gmail.com>
	<CAPcSpEJphsRYSr_CmXtDc=G5MnGNyoEd8MQcbaALKu4GPQ__Uw@mail.gmail.com>
Date: Thu, 28 Jul 2011 16:24:38 +0200
Message-ID: <CACW_hTYaTBDZjfwHo=fYaZZ72KqEHVKS1DYaxDgeEVOkArmjEw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
Cc: Koen Kooi <koen@dominion.thruhere.net>, openembedded-core@openembedded.org
Subject: Re: [PATCH] [PATCH] raptor: add recipe
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
X-List-Received-Date: Thu, 28 Jul 2011 14:28:55 -0000
Content-Type: multipart/alternative; boundary=001636af0321c9792a04a921ec4e

--001636af0321c9792a04a921ec4e
Content-Type: text/plain; charset=ISO-8859-1

2011/7/28 Ben Gardiner <bengardiner@nanometrics.ca>

>
>
> Well, I would not submit _this_ patch for pull-request. I was hoping
> to get this version of raptor included and then submit a pull-request
> for a cherry-pick of the patch to add libxml2 to DEPENDS.
>

Ah, missed that you also added libxml2.
Not sure about the policies of the maintenance branch, but I suspect the
proper way would be to fix and test in openembedded then submit a pull
request.
Then again maybe the policies for the maintenance branch are different.

[...]

> >>
> http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines#Example:_Importing_from_Elsewhere_Modified
> >
> > Ah ok, Those guidelines are fairly new and I was not too aware of them.
> If
> > it is in accordance with the guidelines it is fine with me to keep them.
> > I was mainly triggered by the signed-off lines at the beginning of your
> > message (which I don't think are in accordance to the above mentioned
> > guidelines).
>
>
> Oh. I thought they were [in accordance]. I guess there would usually
> be a commit body before the initial Signed-off-by:'s ; however, there
> was no original commit body to preserve.
>

Ah ok, understood.
Actually, I guess we should preserve the first line of the commit too.
This is what git log says:

frans@frans-desktop:~/workspace/openembedded/recipes/raptor$ git log *
commit 01e8e9f325d8d251e852e7a5704b5fe50880e1ad
Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Date:   Sat Aug 14 21:27:49 2010 +0200

    raptor: added recipe

    Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>



Best regards, Frans.

--001636af0321c9792a04a921ec4e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/7/28 Ben Gardiner <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:bengardiner@nanometrics.ca">bengardiner@nanometrics.=
ca</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div><div class=3D"h5">
<br>
</div></div><br>Well, I would not submit _this_ patch for pull-request. I w=
as hoping<br>
to get this version of raptor included and then submit a pull-request<br>
for a cherry-pick of the patch to add libxml2 to DEPENDS.<br></blockquote><=
div><br>Ah, missed that you also added libxml2. <br>Not sure about the poli=
cies of the maintenance branch, but I suspect the proper way would be to fi=
x and test in openembedded then submit a pull request.<br>
Then again maybe the policies for the maintenance branch are different.<br>=
<br>[...]<br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0=
pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;=
">
<div><div class=3D"h5">
&gt;&gt; <a href=3D"http://wiki.openembedded.org/index.php/Commit_Patch_Mes=
sage_Guidelines#Example:_Importing_from_Elsewhere_Modified" target=3D"_blan=
k">http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines#E=
xample:_Importing_from_Elsewhere_Modified</a><br>

&gt;<br>
&gt; Ah ok, Those guidelines are fairly new and I was not too aware of them=
. If<br>
&gt; it is in accordance with the guidelines it is fine with me to keep the=
m.<br>
&gt; I was mainly triggered by the signed-off lines at the beginning of you=
r<br>
&gt; message (which I don&#39;t think are in accordance to the above mentio=
ned<br>
&gt; guidelines).<br>
<br>
</div></div><br>Oh. I thought they were [in accordance]. I guess there woul=
d usually<br>
be a commit body before the initial Signed-off-by:&#39;s ; however, there<b=
r>
was no original commit body to preserve.<br></blockquote><div><br>Ah ok, un=
derstood.<br>Actually, I guess we should preserve the first line of the com=
mit too.<br>This is what git log says:<br><br>frans@frans-desktop:~/workspa=
ce/openembedded/recipes/raptor$ git log *<br>
commit 01e8e9f325d8d251e852e7a5704b5fe50880e1ad<br>Author: Frans Meulenbroe=
ks &lt;<a href=3D"mailto:fransmeulenbroeks@gmail.com">fransmeulenbroeks@gma=
il.com</a>&gt;<br>Date:=A0=A0 Sat Aug 14 21:27:49 2010 +0200<br><br>=A0=A0=
=A0 raptor: added recipe<br>
=A0=A0=A0 <br>=A0=A0=A0 Signed-off-by: Frans Meulenbroeks &lt;<a href=3D"ma=
ilto:fransmeulenbroeks@gmail.com">fransmeulenbroeks@gmail.com</a>&gt;<br>=
=A0<br></div><br></div><br>Best regards, Frans.<br>

--001636af0321c9792a04a921ec4e--
