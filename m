Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id B5DC4719BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 16:43:08 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id l13so110251653itl.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 09:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5bz8+XgWMfU3CgiXGiKYnXHosGE9Qkakvne7VIA0+yM=;
	b=1KhNET2Mktf9RtFvoXvp8a4tCxjbtrCeFusVeW3Qp8jycEUQ6/2WAyTPoHHV9FKQUJ
	twED18hIIk3mkHnADpZO8wbVWHYDTXM5x+3OqPiNCRnJgoDe3fjRMWJGLwK9wjULfRnC
	CLhzU5tYqZ2kCdUReVYEAI6hJhCoiYpba/B4sue52sx6RfRpomPn7a+MCrCgA8FlvEfg
	3fUaTfHW3jlqmiRAKqsL8h57MvFAxQLtUzb2xOWbz/qkm5Rlr98hT4I9u4c4pAtd4NjV
	VzYYdCB+bwA/QcAnaTa5Zn8xPC8KDTT4xSZjjA1+VQguQE3wZjTIJrASR57mPuOB4noG
	/RCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5bz8+XgWMfU3CgiXGiKYnXHosGE9Qkakvne7VIA0+yM=;
	b=dtVOVKwezUWbEke1LKmw9IU3EonzBEM6Ozxcz++PxYro/IT8dHgnE81vaEfe9rU0Yj
	0J8U21zlo5kRr7xnJHTvyaqUT/pVQBprV0TTDsON+81yrzekz9yVrbMd6Ql2EWt6L8m+
	QXhnb8IjSNWrfcvTQi8d9K49m66reKc9wpg+bGyHZQ4wLAernzrxh20pcLH0u9l0tA/o
	X7SN4NCSb+AGj/8Jqz23VpNFsXFCvNnkuP1SSaEzVzAaCaRGZFt6sZh2AKrWEaCBwJGn
	BSYvABLheuvyK9B772VwKTQVFjMtLPtLTQjZnu2pFfkq3nE6ZzqgRYSQgzs5yuMqeKQd
	f7ew==
X-Gm-Message-State: AA6/9RnojRecqrBhH5oatofwioKlOWvSge8q+tP36Tkohqtk/VTnnU5rieG4I/rtu5NMFO+JPLEwO77FqRc089la
X-Received: by 10.36.153.194 with SMTP id a185mr17560392ite.70.1476204189779; 
	Tue, 11 Oct 2016 09:43:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Tue, 11 Oct 2016 09:42:49 -0700 (PDT)
In-Reply-To: <1476194640.16008.49.camel@pbcl.net>
References: <1446734860-6091-1-git-send-email-mac@mcrowe.com>
	<1476194640.16008.49.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Oct 2016 17:42:49 +0100
Message-ID: <CAJTo0Lb+GoFVv2SqcwpX87HsikpV3V0vdP0DiZ0pU-EWJeEeOQ@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Permit overriding of KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Tue, 11 Oct 2016 16:43:11 -0000
Content-Type: multipart/alternative; boundary=94eb2c08e518592150053e99923c

--94eb2c08e518592150053e99923c
Content-Type: text/plain; charset=UTF-8

On 11 October 2016 at 15:04, Phil Blundell <pb@pbcl.net> wrote:

> Does anybody know why this patch was not merged?  I couldn't find any
> comments on the list.
>
> (It needs adjusting slightly to apply against current master due to
> other changes to kernel.bbclass in the meantime.)
>

Slipped through the crack most likely if there were no comments.  Cookie
for anyone who rebase and tests that it works!

Ross

--94eb2c08e518592150053e99923c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 October 2016 at 15:04, Phil Blundell <span dir=3D"ltr">&lt;<a href=3D=
"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div id=3D":6gw" class=3D"a3s aXjCH m157b40=
f7ddddcee6">Does anybody know why this patch was not merged?=C2=A0 I couldn=
&#39;t find any<br>
comments on the list.<br>
<br>
(It needs adjusting slightly to apply against current master due to<br>
other changes to kernel.bbclass in the meantime.)<br></div></blockquote></d=
iv><br>Slipped through the crack most likely if there were no comments.=C2=
=A0 Cookie for anyone who rebase and tests that it works!</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c08e518592150053e99923c--
