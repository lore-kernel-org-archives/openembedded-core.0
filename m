Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 200B2719A2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 23:36:35 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id v138so54583878qka.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 16:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QXoUHD2dEspbsLyL/GBQFTIFpnAMHFQ4fjSolyrF5Ro=;
	b=USOif7eP+Ui8yKw6HbS7Mobv/xCUTcLA8Znnr0DlIMtWc6Otpa2Fs7hBkGEDuen5kf
	4H1Qbrt0Tbibutpe3YbQoHXoHXdlWWpVbHX04XztmE2oh8+wiApVz8S4uLlJYB+3gtzn
	9oOO8cdD1UYyptH6y5ga+bEfpOGN+rH5oPDmKXrFoM64bDt0kVFA3Cixwh3SUNQBfJpX
	Fep3EFm0SArmWdhSrWZ8jKPTetHnfEZCBl4aX1XkXjwLw+PlWnE11nqDkcGHLZomGhyM
	4bfVwZw0qjI17gQNzZ6yjad1sKAROj0PxKVJodtrtjDnDYhX6xQB/dmkzs+bMCTCKwnn
	0/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QXoUHD2dEspbsLyL/GBQFTIFpnAMHFQ4fjSolyrF5Ro=;
	b=Md4CcXjfm4kATpo8pwj4l6I8ZfIilo21pDwiVT5+zyIeKactS/jZuAX5LEnIqKmLSH
	0pvaVnBKwICGFhV83D9R3sjR40OM+YTvkPyFikd1e5EJ2EnQMxgnWqYyYzSLankWImp4
	HRRdjAiJffR6PhijlFVFyAE7nnPQDCLBNjoI2O2Ng5Ehe70bvjcYGnBG4ajg5gF35Eyq
	E3iAOBWsqz6gR/vYBMBqrL8bQoZKP/QRNUVnwC7Au4VLbN8q7KZ12wGKGLMliq2dl5wq
	cMou+cd6ef9Wqqobfyn8z7p1WBNrryk/0aESXZmqZ6LFeOwYKOeuodhwfZO0D/uhlQUL
	s5KA==
X-Gm-Message-State: ABUngvc351LOx5E0MvyCWSFRTHSBFCtvezI/tOKAJbwci9ciA05Mihh3t4o0ve/a0TnrGavHM8v/EAvBqOP4Pqk1
X-Received: by 10.55.75.17 with SMTP id y17mr3382936qka.26.1477870597034; Sun,
	30 Oct 2016 16:36:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Sun, 30 Oct 2016 16:36:16 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610301333390.3944@localhost.localdomain>
References: <alpine.LFD.2.20.1610300813220.27025@localhost.localdomain>
	<CABcZANnPcmg+iBWgB7HHbEEaTaDOfwtdXr8vfrG7OPzruRdTTQ@mail.gmail.com>
	<alpine.LFD.2.20.1610301333390.3944@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 30 Oct 2016 23:36:16 +0000
Message-ID: <CAJTo0LZcHSgs+Qw1Zkrj4bUWnU-p6Ja-vg3+J8H22vxoscTrRg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Christopher Larson <clarson@kergoth.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: should a "*git.bb" recipe lock that recipe to a fixed version?
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
X-List-Received-Date: Sun, 30 Oct 2016 23:36:36 -0000
Content-Type: multipart/alternative; boundary=001a114a88c8f5eee405401d8f9d

--001a114a88c8f5eee405401d8f9d
Content-Type: text/plain; charset=UTF-8

On 30 October 2016 at 17:35, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   fair enough ... i'm embarrassed to admit i didn't really understand
> the versioning selection so i'm going to examine it way more carefully
> now. i wonder how many recipes in oe-core are "_git" recipes that, in
> the end, just lock down to a specific version. as you say, i was a bit
> surprised.
>

Personally I've been endorsing the practise where _git.bb is only used for
recipes that are actually tracking git development branches, and if it's
just a release that it simply fetched over git via a SHA of a release tag
then the recipe should be _1.2.3.bb for clarity.

Ross

--001a114a88c8f5eee405401d8f9d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 October 2016 at 17:35, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":p7" clas=
s=3D"a3s aXjCH m15816aec4d9c0267">=C2=A0 fair enough ... i&#39;m embarrasse=
d to admit i didn&#39;t really understand<br>
the versioning selection so i&#39;m going to examine it way more carefully<=
br>
now. i wonder how many recipes in oe-core are &quot;_git&quot; recipes that=
, in<br>
the end, just lock down to a specific version. as you say, i was a bit<br>
surprised.</div></blockquote></div><br>Personally I&#39;ve been endorsing t=
he practise where _<a href=3D"http://git.bb">git.bb</a> is only used for re=
cipes that are actually tracking git development branches, and if it&#39;s =
just a release that it simply fetched over git via a SHA of a release tag t=
hen the recipe should be _<a href=3D"http://1.2.3.bb">1.2.3.bb</a> for clar=
ity.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a114a88c8f5eee405401d8f9d--
