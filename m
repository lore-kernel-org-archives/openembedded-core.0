Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4BFF971A17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 11:25:01 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id u25so9723617qki.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 03:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8j0mF0g+H1K+rEaplAxTQqYL2LMAtrr5DFuQef04kDE=;
	b=I/FGGSe8UonGNIqPtAzlxwzseXrZXtxXI+NiYfR+h4gMcCPJjcnGnLZvoLUq12PRCg
	rquvlx1afRhx+iJXSIAPucbxY6Go01db2bl8XdJhjyahyEvlmBUpoHT+2a7NDPmLXaZW
	8GZ5h/LVkf6IlCI8tO/C4KvBN9W9D9FOI2v3AyvLjpxugiME4LLQ9688iolUJF/92gM/
	SjcFJ01h8B6iJ8ptmXzgZoBJUwK0Ss7Vv9XvrwCqpgIQoRDtudn0hzYP4bhxFUwOek5o
	FYW4FIRy8eExC5E/f16PCvVhvjRdMGMsEJ5C1/g31cYa4ker4u64vW7uyeYxFV3YtNj0
	4qPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8j0mF0g+H1K+rEaplAxTQqYL2LMAtrr5DFuQef04kDE=;
	b=NVeEHz3IYKIiJJTIK6zk9bVospnYT2jCGW15lDD9kT6lFxmxwWG1Vd8PIYf71nT1xE
	Xod7LOWuWVQpsXZG33bIRxx13JfKocHZ+kKm0UJ0vvtJzOeTWdVI6fhLmcApMQlkIzCT
	zi2XgWQ85p2csUEegt9OzNde+YYHwljy7E5YZf9xHi46Kbr3voJjy3lgjfOqaCAjQTeR
	slli54lS/GdU+K8zJJDyhFRv7YcWvBrjA030H9EhWeqqXLn/k0lRmL18G+Vzv97NqAwM
	4Sierl6ZpZcBuznmZ7v/vwNMJOwnT6/xl8OyMPGhqFXwuPlpE8v4t9dxQcm6v8IAMUY4
	7FjQ==
X-Gm-Message-State: AIkVDXI/FoHIMn09FAY9nsE+u3bC8oRQ4T30IutpJVynXQQK+suon1/uqBA59Qyqkhu1LQILCcmZRC7hm4JwACd5
X-Received: by 10.55.15.231 with SMTP id 100mr2304573qkp.244.1484738702389;
	Wed, 18 Jan 2017 03:25:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 18 Jan 2017 03:24:42 -0800 (PST)
In-Reply-To: <CAP71WjyY0oH=j3ApVZhrc6sQ7YDw4bfnrAc1V9okencZLhjVBw@mail.gmail.com>
References: <cover.1484733982.git.ross.burton@intel.com>
	<CAP71WjyY0oH=j3ApVZhrc6sQ7YDw4bfnrAc1V9okencZLhjVBw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Jan 2017 11:24:42 +0000
Message-ID: <CAJTo0LbbY2VA55oZ=1A4K-QEyOtrZ3NoxsLbLOOz6Gcy4Cwd_w@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/56] Consolidated pul
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
X-List-Received-Date: Wed, 18 Jan 2017 11:25:02 -0000
Content-Type: multipart/alternative; boundary=001a11476032f0c70805465caa5a

--001a11476032f0c70805465caa5a
Content-Type: text/plain; charset=UTF-8

On 18 January 2017 at 10:15, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> > Khem Raj (1):
> >       gstreamer1.0-plugins-bad: Backport patches for improving live
> playback
> >
>
> I was under the impression that this one would be dropped.. at least
> based on last emails. maybe it was discussed separately.. did you
> conclude that we need these patches?


Personally I'm easy either way.  It's not a giant patch and can be removed
when the upgrade happens.  Then again it's churn that interested parties
can equally hold in their own distro layer.

CCing Khem for his opinion.

Ross

--001a11476032f0c70805465caa5a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 January 2017 at 10:15, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=
=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@=
linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">&gt; Khem Raj (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gstreamer1.0-plugins-bad: Backport patches f=
or improving <span class=3D"il">live</span> <span class=3D"il">playback</sp=
an><br>
&gt;<br>
<br>
</span>I was under the impression that this one would be dropped.. at least=
<br>
based on last emails. maybe it was discussed separately.. did you<br>
conclude that we need these patches?</blockquote></div><br>Personally I&#39=
;m easy either way.=C2=A0 It&#39;s not a giant patch and can be removed whe=
n the upgrade happens.=C2=A0 Then again it&#39;s churn that interested part=
ies can equally hold in their own distro layer.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">CCing Khem for his opinion.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a11476032f0c70805465caa5a--
