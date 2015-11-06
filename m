Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id A5A6573D46
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 23:04:52 +0000 (UTC)
Received: by qgad10 with SMTP id d10so103191422qga.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 15:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TW8BeVRs/SM5WE7zGY/N9aQ+WxNr1pM7eA1ZViQN0/Q=;
	b=Gb9D0e8x7nD5E3eOKB5xk3xD/j6kMCV5En2cCU9bVjEP1wWUFnMPnN8LQt0+OWr/TV
	bipKC4C/tWBE7pIVhxCkrvdqZbN+xICZWiO+HFyjH6fIBy0xmAXUgrIMIENtT173YksV
	iZovdZKF8qmcSSfe4cQET96j3eoM7a1Z4KBiD+Ce7VTRsdO9eTdk4/hgZA/ldU0K2Sdy
	lUMx3StNxbWHvQKes4z8oIuKThCLQnc2F1RW/6wPf7733n9VWddb0RIQ5VWxRlB7Nntj
	BZC2DhM5BVF5dxpoYO8SfxIHIY4zYjl9eY9hzEspVdgQw+wexfPRUwiSllXyIWkl/f0i
	YMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TW8BeVRs/SM5WE7zGY/N9aQ+WxNr1pM7eA1ZViQN0/Q=;
	b=fkmEitEkZPKVZnEuXlOPmUILKPrCV+wvs1ImilOW0lfWaxkqCF0y4ymTaeX6bHPby3
	RFc2h6J8/UkHkTsqzdC1h2iQ66WME9z5Zo2HJf2FAmLaywyCgv6joBwYOvnSvZHbskgd
	CaeXCMOWWrFjLf59dAjoDoxspmr8PRcrFbTKhOSNFT945hzpVBeSxtmK6cgoM4JbXvkW
	kAkHzFiV2jVQXrZnAgL2Nv+nk4JxIg9PjhB3tZ642vWasTPB90ESj6esrlInhbSGSHic
	Je04JKKis+QtL1CJb4jZS5Ff7Zs2ks43g6+qKUElN8b5hokq+TK475V90JXI+PKuK34J
	6/Ow==
X-Gm-Message-State: ALoCoQlMAgTH7nv+eYxBIUeohjULgUKer8floTSJr4THf33oqs/NxwKvOYx5zH1D0eYlTo8avWeR
X-Received: by 10.140.132.11 with SMTP id 11mr17138785qhe.64.1446851092485;
	Fri, 06 Nov 2015 15:04:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Fri, 6 Nov 2015 15:04:33 -0800 (PST)
In-Reply-To: <CAMKF1soxAD=Yv9e8Y+xLcEso39_N7CkfY=4ud-V6dhMSO27Giw@mail.gmail.com>
References: <1446824182-8839-1-git-send-email-ross.burton@intel.com>
	<CAMKF1soxAD=Yv9e8Y+xLcEso39_N7CkfY=4ud-V6dhMSO27Giw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Nov 2015 23:04:33 +0000
Message-ID: <CAJTo0LZKNvvAM0GXob59neWfDv5GuYrWcF7xkJ9q8f7bw8cafg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libaio: don't disable linking to the system libraries
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
X-List-Received-Date: Fri, 06 Nov 2015 23:04:55 -0000
Content-Type: multipart/alternative; boundary=001a113502d06946600523e745a0

--001a113502d06946600523e745a0
Content-Type: text/plain; charset=UTF-8

On 6 November 2015 at 21:35, Khem Raj <raj.khem@gmail.com> wrote:

> It might be due to AS NEEDED becoming default in linker. That now the
> positions of command line Argument will matter.


The command line upstream uses -nostdlib so most distributions do something
to make it build with fortify enabled: for example debian adds -lgcc -lc to
the link.  I'm not sure what the difference between -nostdlib -lgcc -lc and
a normal link is, if there is a difference?

> Isnt this line redundant see the below line adds same
>
Yes, bad hunk left from previous workings.  I'll fix.

Ross

--001a113502d06946600523e745a0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 November 2015 at 21:35, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb=
(204,204,204);border-left-style:solid;padding-left:1ex">It might be due to =
AS NEEDED becoming default in linker. That now the positions of command lin=
e Argument will matter.</blockquote><div><br></div><div>The command line up=
stream uses -nostdlib so most distributions do something to make it build w=
ith fortify enabled: for example debian adds -lgcc -lc to the link.=C2=A0 I=
&#39;m not sure what the difference between -nostdlib -lgcc -lc and a norma=
l link is, if there is a difference?</div><div style=3D"font-size:13px"><di=
v class=3D"adm"><div id=3D"q_150decfaec57406e_2" class=3D"h4"></div></div><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:so=
lid;padding-left:1ex"><p dir=3D"ltr">Isnt this line redundant see the below=
 line adds same</p></blockquote><div>Yes, bad hunk left from previous worki=
ngs.=C2=A0 I&#39;ll fix.</div><div><br></div><div>Ross=C2=A0<br></div></div=
></div></div>

--001a113502d06946600523e745a0--
