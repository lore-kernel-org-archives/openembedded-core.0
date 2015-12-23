Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD806FF84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 14:53:37 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id to4so81755132igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 06:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aZIRyDnz/+mm/YsTMIhtGDgVMJbDb9YMgFzxWhz6yxM=;
	b=xJDMZgqFAE1PIk7KDKEeeYYbLiS7P56czArhzM/KgkFMdFmlRyXPSGucHR8EFeTzv2
	TzEWdCqtC7HaRLQ0g3KcC1hktPgiAJ+gwAM1lFvrczQS/ND46NFsty16FUYI8O54e6W3
	2Y2w+unrfg0csU/gLK3yVx4SN0ZTBKc5rozEYts4CmCfR7CAH3v8wu/ay4RtpHeAJmst
	6SQfGjwmIWpR4L9Hr89qmcQYHnuvznjuPwXxW4XcB2nQVl7v1nvFBbdfGAH6V84bvpA1
	YVDAkvKDW+G2PF2MIqjr+SEf1Rq6GJgezrYF1y3K4wrGUOteF5izs+sCqItZaH1KwB5r
	hK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aZIRyDnz/+mm/YsTMIhtGDgVMJbDb9YMgFzxWhz6yxM=;
	b=SeDxwzrA35V60hpKmOQPdvMJsCkH1gxeIiJmKTxVncNSC0rj/MDcZCxUEJNMCm5gnc
	B58glpDYDwo9+w9LtOkGJTEmBel1CLvYeD5TUckDK2qcw3fKmbgqLDULs0PPlKBvvmYb
	/igtPPiTQAXrDYyERRxG3eKAu0eo/krAJD6cl64ZmsNERDx9G9DM4kaz4pvCJvyFNJXP
	JxtNvNl9EPigF+CS63ZyaArRtvnvFae/d1JFZSDydKJJ4b3Wr09bWo2lVwNQlPR3s3k8
	Z7dOnc9V+72vk8mbUfcT2g1co1K90n6CLS2hbNXiTNSgnsjUkfBumi8Z4pWmHU10aTWe
	3dDg==
X-Gm-Message-State: ALoCoQm82RnDYHpAYTsjBb/UMhSIHtzIZfeHFkfYU3qvxg8a8x6eVtxpA6P7A1GHjED0pqcKXcltXLBpRrbs0MjbpvcQXpgkXjDoapZse9CFc+ElYXelGgw=
X-Received: by 10.50.22.33 with SMTP id a1mr29360576igf.52.1450882418242; Wed,
	23 Dec 2015 06:53:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 23 Dec 2015 06:53:18 -0800 (PST)
In-Reply-To: <1450827499-32386-1-git-send-email-armccurdy@gmail.com>
References: <1450827499-32386-1-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Dec 2015 14:53:18 +0000
Message-ID: <CAJTo0LYLr=Qq1ETPdwTyjGddUNmuZvx+z7GtzTM5-N+EeNcHkQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] strace: update 4.10 -> 4.11
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
X-List-Received-Date: Wed, 23 Dec 2015 14:53:43 -0000
Content-Type: multipart/alternative; boundary=047d7b10ca19269c96052791e3b6

--047d7b10ca19269c96052791e3b6
Content-Type: text/plain; charset=UTF-8

On 22 December 2015 at 23:38, Andre McCurdy <armccurdy@gmail.com> wrote:

> Noteworthy changes in release 4.11 (2015-12-21)
>

They forgot to mention "breaks on the yocto autobuilder". :)

|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/build/tmp/work/i586-poky-linux/strace/4.11-r0/strace-4.11/tests/ksysent.c:45:24:
fatal error: syscallent.h: No such file or directory
| compilation terminated.
| make: *** [ksysent.o] Error 1
| make: Leaving directory
`/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/build/tmp/work/i586-poky-linux/strace/4.11-r0/build/tests'
| ERROR: Function failed: do_compile_ptest_base (log file is located at
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/build/tmp/work/i586-poky-linux/strace/4.11-r0/temp/log.do_compile_ptest_base.18605)

Did you test with ptests enabled?

(full log at
https://autobuilder.yoctoproject.org/main/builders/nightly-deb-non-deb/builds/235/steps/BuildImages/logs/stdio
)

Ross

--047d7b10ca19269c96052791e3b6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 December 2015 at 23:38, Andre McCurdy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div id=3D":1pt" class=3D"" style=3D"o=
verflow:hidden">Noteworthy changes in release 4.11 (2015-12-21)<br></div></=
blockquote></div><br>They forgot to mention &quot;breaks on the yocto autob=
uilder&quot;. :)</div><br>| /home/pokybuild/yocto-autobuilder/yocto-worker/=
nightly-deb-non-deb/build/build/tmp/work/i586-poky-linux/strace/4.11-r0/str=
ace-4.11/tests/ksysent.c:45:24: fatal error: syscallent.h: No such file or =
directory<br>| compilation terminated.<br>| make: *** [ksysent.o] Error 1<b=
r>| make: Leaving directory `/home/pokybuild/yocto-autobuilder/yocto-worker=
/nightly-deb-non-deb/build/build/tmp/work/i586-poky-linux/strace/4.11-r0/bu=
ild/tests&#39;<br>| ERROR: Function failed: do_compile_ptest_base (log file=
 is located at /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-n=
on-deb/build/build/tmp/work/i586-poky-linux/strace/4.11-r0/temp/log.do_comp=
ile_ptest_base.18605)<div><br></div><div>Did you test with ptests enabled?<=
/div><div><br></div><div>(full log at=C2=A0<a href=3D"https://autobuilder.y=
octoproject.org/main/builders/nightly-deb-non-deb/builds/235/steps/BuildIma=
ges/logs/stdio">https://autobuilder.yoctoproject.org/main/builders/nightly-=
deb-non-deb/builds/235/steps/BuildImages/logs/stdio</a>)</div><div><br></di=
v><div>Ross</div></div>

--047d7b10ca19269c96052791e3b6--
