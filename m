Return-Path: <ross.burton@intel.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id AA0D376260
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 22:18:43 +0000 (UTC)
Received: by obnw1 with SMTP id w1so5499112obn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8iiLovuRTErYN1W+iRrahpJ5YykUVxi4HbPB0L7jgAQ=;
	b=TjcveCakYfBwUV9zF+MXB72tCbUTHYKq+duyF6+3SbQL5zKTutCN0iiGAvIhAjz4v7
	fImNxxwkDVRvJEuhkY6HOfQMU4Yy1r/ASnwaEiPtTDFRglTHcRc9doNCvqpZF+5cTWVR
	PQoKxFLY3Bq7o9c3s+J6mKlMoea2NFupePf6+TZeBL20AJs7MRLdryTEJLcwDeaS8SK2
	Hy7lnOM7lCZPXlUtbaRMpjhnzp+17ms9Z9yCgjeZnd0JYBLelhxo85OH7HngIyALAO9q
	DLIhPDRX8NOh2zLNamt3MiPkr0WCW9hxi7/9u9mnfWtaIwbUduKZUHlL8O6DwWYqp++x
	ZFEA==
X-Gm-Message-State: ALoCoQm/PyndHwRFWhWZTXfwyCnk57AzbDfYxMsObkzpanyJmmueqfn4dXm15nkxIZDFmaq3nhwV
X-Received: by 10.202.46.209 with SMTP id u200mr10665618oiu.66.1437689923342; 
	Thu, 23 Jul 2015 15:18:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.108.4 with HTTP; Thu, 23 Jul 2015 15:18:23 -0700 (PDT)
In-Reply-To: <CADkTA4MmTxDpE-TsJdZGhYGDR1sOtUDtETJpjnvyL330+YpGXQ@mail.gmail.com>
References: <cover.1437491325.git.bruce.ashfield@windriver.com>
	<CADkTA4NTzQhvmCt4J9BkbsAh6CL5joomn-NDA8=0kgjd6wcTxQ@mail.gmail.com>
	<CADkTA4MeGsBtd1iCOOWNhbb4TspG6=OMc6eJ=+wtE_rWWR=-MA@mail.gmail.com>
	<1437638193.821.89.camel@linuxfoundation.org>
	<CADkTA4N76E2P5vL=6SuM5xqveotp1tpYon0HN0M8CMa2aXrN7w@mail.gmail.com>
	<1437660855.821.121.camel@linuxfoundation.org>
	<CADkTA4MmTxDpE-TsJdZGhYGDR1sOtUDtETJpjnvyL330+YpGXQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Jul 2015 23:18:23 +0100
Message-ID: <CAJTo0LZBQQxOiDOfMuJOxBeTYJFiv1qKBMFqp6HYGu_vz0iaFw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] linux-yocto: build changes, 4.1 and libc-headers
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
X-List-Received-Date: Thu, 23 Jul 2015 22:18:43 -0000
Content-Type: multipart/alternative; boundary=001a1137ad682dac7d051b9245df

--001a1137ad682dac7d051b9245df
Content-Type: text/plain; charset=UTF-8

On 23 July 2015 at 16:01, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> > a) should be straightfoward to fix, its just updating the message
> > whitelists (again).
>
> I'm building a fresh qemux86-64 now, I'm going to see if the warnings
> are something
> I should fix, versus the whitelist. I should know tomorrow on this one.


Patch sent to update the whitelists.

Ross

--001a1137ad682dac7d051b9245df
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 July 2015 at 16:01, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"=
">&gt; a) should be straightfoward to fix, its just updating the message<br=
>
&gt; whitelists (again).<br>
<br>
</div></div>I&#39;m building a fresh qemux86-64 now, I&#39;m going to see i=
f the warnings<br>
are something<br>
I should fix, versus the whitelist. I should know tomorrow on this one.</bl=
ockquote></div><br>Patch sent to update the whitelists.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1137ad682dac7d051b9245df--
