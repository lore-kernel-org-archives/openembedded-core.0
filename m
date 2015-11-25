Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id B0609612E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 21:34:03 +0000 (UTC)
Received: by iofh3 with SMTP id h3so66663868iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 13:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4b1dS01LmtoXFUbE7w81GtwN2slrKLbR3BsISv3KUi0=;
	b=frXY11wfDcN+v3d+yoGAh+J7iEXGnuGqcURgmYr2epEKglvfpmrD1dKKh+FBzw7fcx
	hhFtjjiq2YnL1V57vdTsR5bidvnYyFtoteYnIq+0k9tyQ6uZCmJJHrCzv0vRE1VVRTEp
	/6EYYW4940wbT8TenzlMfzbTGcyKC+AWAkkAKT7h7LuQvUTEv/fBLv/lriGh0t0Ma6/b
	7tx0aJVHD83ko5T4eo9WIx0Q3NaA+MwhqNVLxrb0lb1BNSqvmlAPvNnNXi4j2j/BkG4d
	uwaehaJyDu+NC6/vtb5PocVtAB6T9lGF2G3tgAfvnxj+3804HeHbAHbE3C/45zu3pVU+
	zdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4b1dS01LmtoXFUbE7w81GtwN2slrKLbR3BsISv3KUi0=;
	b=a3ih8yONdZdRc3evG6aXZgE+AqtraL5OTB5apvXsRJx5Tp8OXoMttBwEqAN3kfQN3i
	RCErBfiOyaIcd4blhl/j0nrzXLGpsjR4MZePLnAHCwrPWnevV3HSMnmoCBeW+UfDF5/X
	jDY059OtezHehB22I7eZAL2DBkxW9fkfOsFhAadZ7X7gYv/kktjAh2wl3xbv49GdEldn
	h6z+7kA/YlS6fG4GRvdQYd4nER8EE23s4GXi+49r7xzAbzP8dTbHuoEY4dlfrFf09U+N
	y1oB7OqyD0og+gPWhMn8u1inIVDrYhh6Fhk7cz2bkU6FsG4Ob5O1737YSXAdQih81bSA
	zubg==
X-Gm-Message-State: ALoCoQmBsViw5KhKt7LmNInMViLZ1PKwMI5z5f6FS1GPMdh4E1Y//arDVkn3xfk5ICgZ8PrnELKa
X-Received: by 10.107.135.30 with SMTP id j30mr34443950iod.148.1448487244808; 
	Wed, 25 Nov 2015 13:34:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 25 Nov 2015 13:33:45 -0800 (PST)
In-Reply-To: <1448322097-33026-2-git-send-email-tudor.florea@enea.com>
References: <1448322097-33026-1-git-send-email-tudor.florea@enea.com>
	<1448322097-33026-2-git-send-email-tudor.florea@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Nov 2015 21:33:45 +0000
Message-ID: <CAJTo0LbNcwn0wxdoFvtitdyOVXEZ=HVsStN0JLdt9LFNOgkJJg@mail.gmail.com>
To: Tudor Florea <tudor.florea@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] util-linux: Add ptest
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
X-List-Received-Date: Wed, 25 Nov 2015 21:34:06 -0000
Content-Type: multipart/alternative; boundary=001a113ec64ab04eee05256437c7

--001a113ec64ab04eee05256437c7
Content-Type: text/plain; charset=UTF-8

On 23 November 2015 at 23:41, Tudor Florea <tudor.florea@enea.com> wrote:

> +--- a/tests/run.sh     2015-11-18 15:09:05.517018566 +0100
> ++++ b/tests/run.sh     2015-11-18 20:02:15.492749213 +0100
>

Would it be possible to keep run.sh as it is but pass --parallel 1 from
run-ptest so it doesn't run the jobs in parallel?  Or, do we care if it
runs the tests in parallel?  I'm looking at that patch and thinking it's
going to be a nightmare to maintain when upstream modifies their script.

Ross

--001a113ec64ab04eee05256437c7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 November 2015 at 23:41, Tudor Florea <span dir=3D"ltr">&lt;<a href=3D=
"mailto:tudor.florea@enea.com" target=3D"_blank">tudor.florea@enea.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":a17" class=
=3D"a3s" style=3D"overflow:hidden">+--- a/tests/run.sh=C2=A0 =C2=A0 =C2=A02=
015-11-18 15:09:05.517018566 +0100<br>
++++ b/tests/run.sh=C2=A0 =C2=A0 =C2=A02015-11-18 20:02:15.492749213 +0100<=
br></div></blockquote></div><br>Would it be possible to keep run.sh as it i=
s but pass --parallel 1 from run-ptest so it doesn&#39;t run the jobs in pa=
rallel?=C2=A0 Or, do we care if it runs the tests in parallel?=C2=A0 I&#39;=
m looking at that patch and thinking it&#39;s going to be a nightmare to ma=
intain when upstream modifies their script.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ec64ab04eee05256437c7--
