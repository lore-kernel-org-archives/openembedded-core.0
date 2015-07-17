Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id E855375F1F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 16:50:40 +0000 (UTC)
Received: by qgy5 with SMTP id 5so49775087qgy.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 09:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1ave8IRYaLLu/vLzGYAes+FeCWhw9VhuCEFCjZDByug=;
	b=DExj+1sIabeVsGTVsZIeC2K7qnpLsoyNtsjCtkqtZgd8Wg7EoOf3s/exoAPZ5DruEI
	JRJta5c3uR6J6AmKP7qegIi5pjhrCaS4Z1nmnNSBGI8/6ZONq8Va+Xkrl9MJJm4xZVIN
	BZhT93GFSIDZCzsnzEcWk8xdUvdKM40DG/m3WnimPy36XRE6cLMzDkrEefq7P2jz0o6r
	5PTyh3zr9N3MW8ay1FNau3VZmNGpk/F9KgmmqKxt5aEhB2TZYko5I7m5Jzh+Cn5SuaGU
	5h1hEk9bl8PozmJbXMo/6ots7WcBT4Bn56aOSSkeYCQ1H29rK5O0eQZ6NTDzYMeHZSbR
	xt/A==
X-Gm-Message-State: ALoCoQktSDuHN/788l+zcsBF4zThxfboo3kpbsAylfkw4xZW9OIimIFQz5X7GCURyvUpSGtKdjHk
X-Received: by 10.140.88.80 with SMTP id s74mr26691239qgd.59.1437151840244;
	Fri, 17 Jul 2015 09:50:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 17 Jul 2015 09:50:20 -0700 (PDT)
In-Reply-To: <874ml2ybz5.fsf@weregild.amer.corp.natinst.com>
References: <1407178549-8464-1-git-send-email-ben.shelton@ni.com>
	<871tgbyk2s.fsf@weregild.amer.corp.natinst.com>
	<CAJTo0LZF6fogQd6YhTbkY9adXGOhiZONqwWLc909AUF4fBUapg@mail.gmail.com>
	<55A86A01.1060108@windriver.com>
	<874ml2ybz5.fsf@weregild.amer.corp.natinst.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Jul 2015 17:50:20 +0100
Message-ID: <CAJTo0LbYqYn9jxth0fwRYf0R1f-cbcQYAdER9tHU78R+ZivfHg@mail.gmail.com>
To: Richard Tollerton <rich.tollerton@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] create-pull-request: Fix error on 2.0 versions of git
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
X-List-Received-Date: Fri, 17 Jul 2015 16:50:42 -0000
Content-Type: multipart/alternative; boundary=001a11c114c4ed3416051b14fc95

--001a11c114c4ed3416051b14fc95
Content-Type: text/plain; charset=UTF-8

On 17 July 2015 at 17:39, Richard Tollerton <rich.tollerton@ni.com> wrote:

> Ross, please revert commit 7ee64ea60ede5477b2f9a355d93bdc556e6b7895. My
> sincere apologies for the inconvenience.
>

Already done in master-under-test.  Thanks for confirming that it works for
you.

Ross

--001a11c114c4ed3416051b14fc95
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 July 2015 at 17:39, Richard Tollerton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rich.tollerton@ni.com" target=3D"_blank">rich.tollerton@ni.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4d9" cla=
ss=3D"a3s" style=3D"overflow:hidden">Ross, please revert commit 7ee64ea60ed=
e5477b2f9a355d93bdc556e6b7895. My<br>
sincere apologies for the inconvenience.</div></blockquote></div><br>Alread=
y done in master-under-test.=C2=A0 Thanks for confirming that it works for =
you.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a11c114c4ed3416051b14fc95--
