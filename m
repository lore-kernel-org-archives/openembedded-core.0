Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id B93646AC37;
	Tue, 27 Feb 2018 15:27:15 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id 70so28123335lfw.2;
	Tue, 27 Feb 2018 07:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=MTushSkSd5FU9Z4TIHZcIRLuo8dDd/7u+kkG38QrOqw=;
	b=Cw21537T/ObrHMSkawbmttIGxKD+0mXxJ5zZBGVaHjywlMbAiV4vdR25Dv4pD7sbfm
	TRADSjcRhEIMD7RiD/5qpn4I1qQap6/hRs9mHjZyG+LaJlw01Dwp1tFcLTJbo/b3YAg2
	Xat7NNtNOEH70CRWVv1IFSIjlZe1z4Fr0Qce0xxHfxeGXi3P2N1jw0Utelt8kIPqnIRr
	SUURWaUPonft2tEyrAQahPINAcrfR6zvi83ogtPpLeTHL3SKaiJfGb5JVoepRcek6cVb
	fwL36eA5DDCau/uqVz8e4eJ6UkQAbA/Ua+P7LauvrhQFSUQy7NEl2mpDg0jKoC7EuF4y
	nl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=MTushSkSd5FU9Z4TIHZcIRLuo8dDd/7u+kkG38QrOqw=;
	b=PNvfFE+Q+eyolxKJZo3fzBaQPByojzZR0NTADaVjOG68ISy5XGEjHtgyMtPw+ZQ5Cr
	5rUaHqUx04nU66YceXv/JSFsqdQYnopNjG+GDs8B1VBrY+2BuuLz+Mqyc1zOEFC2fsCx
	m/mvmNlZnfGXmfftFTNai4zYSjMCst1UC90DhezDJJde8aSxw0IaZAtIdZraQG31XZop
	/aZ760DxV3YopRqoL83cp06cayUcoEgIO8vhRfo4S/Ye+/4lEH2GagV/4vYHST8p/kNJ
	GmtdiwYTRdo53ySc+chFFjmT1EFxrwWyQVJnMWdrGvDmMkb/j+6Z/y4w7j1YHmLOS50T
	8o0w==
X-Gm-Message-State: APf1xPCjf/BRPx0iTHPE5fIwsVhkBvPxcCEOn1sOWlJ2SDuiV4IehM7P
	QKYJ5YoM2qK/x606bImzGCcGLI1pbVjlJWUDuGlrCw==
X-Google-Smtp-Source: AH8x2242+Gz1G5a6oVyAR9Oc8iKyCVarNkbtxaYsGOYATVazZNNKuYw2pMReB2BXawCJfsdG7qM+9FPkfkMlT6rrdzk=
X-Received: by 10.46.46.12 with SMTP id u12mr9776879lju.110.1519745236482;
	Tue, 27 Feb 2018 07:27:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.168.137 with HTTP; Tue, 27 Feb 2018 07:27:15 -0800 (PST)
In-Reply-To: <20180224034807.GF2786@denix.org>
References: <CAAQYJAudtnFaY1S2j6FF_pN9B1OJhN-6fEBY8nWCtM73Kx8tSw@mail.gmail.com>
	<0bb858dc-a43f-ae14-01c9-2a42855e4409@gmail.com>
	<20180224034807.GF2786@denix.org>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 27 Feb 2018 10:27:15 -0500
Message-ID: <CAHUNapQYRJ=qNnQt8GT7eZ+m=iOdFDRWnY4Vuu4twB+VLA05jw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Rename meta-openembedded to openembedded-extras
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
X-List-Received-Date: Tue, 27 Feb 2018 15:27:17 -0000
Content-Type: multipart/alternative; boundary="089e0823f23cf840940566334203"

--089e0823f23cf840940566334203
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 23, 2018 at 10:48 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Thu, Feb 22, 2018 at 12:37:44PM -0800, akuster808 wrote:
> > I think openembededd-core is incorrect. it should have been
> > meta-openbedded-core or meta-core.
>
> It does have a layer called just "meta" though...
>

In retrospect, using the word "meta" everywhere becomes useless. No layer
contains actual sources and never should, so they're all "meta" data, it's
redundant to have to say so in every layer's name (etc).

It would have been better to use that space to convey something meaningful,
such as: "whether a layer was designed to be a bsp, a distro, something
else, or a combination", or perhaps other meaningful information.

--089e0823f23cf840940566334203
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Feb 23, 2018 at 10:48 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, Feb 2=
2, 2018 at 12:37:44PM -0800, akuster808 wrote:<br></span><span class=3D"">&=
gt; I think openembededd-core is incorrect. it should have been<br>
&gt; meta-openbedded-core or meta-core.<br>
<br>
</span>It does have a layer called just &quot;meta&quot; though...<span cla=
ss=3D""><br></span></blockquote><div><br></div><div>In retrospect, using th=
e word &quot;meta&quot; everywhere becomes useless. No layer contains actua=
l sources and never should, so they&#39;re all &quot;meta&quot; data, it&#3=
9;s redundant to have to say so in every layer&#39;s name (etc).<br><br></d=
iv><div>It would have been better to use that space to convey something mea=
ningful, such as: &quot;whether a layer was designed to be a bsp, a distro,=
 something else, or a combination&quot;, or perhaps other meaningful inform=
ation.<br></div></div><br></div></div>

--089e0823f23cf840940566334203--
