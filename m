Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 63E9A6612D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 16:42:08 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id r187so182930221oih.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bjgetjOsHwrdEy9FFQs8noY+a/QFsdmlQRbJ11X0mjQ=;
	b=haZGmeutQHXwACsofhDzMAejZZVY6k7uILfrpk5woVAUwEJygJ9gmtoSiT5FH+Evtj
	dny5Q2hDojbHok0QW3zhIJsptnTpqNKmLUeOphwxxN46g/RtgC2SsXgzp9a36o5AqV9b
	SbtQU02hFcyy+s0SQaP44/8fJhJ4QAhC/aejSVa4UjcDDt65E4yxCSv73aeGQtKbgt1f
	AGJ3dsy3EMJ4xiTlPyTUQhkO6ojgJYgeO4DkTyWyVZOPSki+Zz1P0sSuZZzmF5+mneCR
	b3HhtPBwUfjLDU95ROkekcMDMW1KoXdVEycnbnNW0Xu1U0vAIXZ+j1n/gRxphKiYa5qI
	aO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bjgetjOsHwrdEy9FFQs8noY+a/QFsdmlQRbJ11X0mjQ=;
	b=K9A5FDhK1t0EAXd6ynaAA1ubbXWCscsnbX26b1ZcBZEjlIDo0jMPrxblA8Bfux94ho
	RbguAfWMMVhcfo63+bDXJFwdy+WJl6GKWH4uiBsCZNaj2suYP4SU0kK/Bv+L0L6JEvp7
	qYVhQN2lnvDA/DzfDs5wz/pG/pxuYvGLmJbea6A6ZmdaeC6wWBlh0r8gOWYHTJF5+TIc
	cWptAFroDs5puXy8bwrPMXj6b1K4yhcDaYCBOt0oBuYc0WBa16l1Rcu3+LxbSz6kGElI
	czUa0y3g72b9xcOr2bfYeUch9U7KhIGq8NYaimPa8Ui5mTl3W2JkpaFgxt1qhg81yfmk
	Y/1w==
X-Gm-Message-State: AD7BkJK9doy3r9PEeXA+tSiIPsK8SXFdprSrsRtebwHYQsVhZJCFuQnBIYX2fwxtZbebHDADUcJ27CBg/S9GIakJ
X-Received: by 10.157.47.166 with SMTP id r35mr3271663otb.29.1458664929320;
	Tue, 22 Mar 2016 09:42:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.90.134 with HTTP; Tue, 22 Mar 2016 09:41:49 -0700 (PDT)
In-Reply-To: <56F17581.70809@linux.intel.com>
References: <1458664665-20517-1-git-send-email-alejandro.franco@linux.intel.com>
	<56F17581.70809@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Mar 2016 16:41:49 +0000
Message-ID: <CAJTo0LZv97ZB+x5t3toR=r00Dzcvy8jfpF0EzQZ7OZMhHqgQoQ@mail.gmail.com>
To: Alex Franco <alejandro.franco@linux.intel.com>
Cc: Joshua G Lock <joshua.g.lock@intel.com>,
	Benjamin Esquivel <benjamin.esquivel@intel.com>,
	Andreas Schultz <aschultz@tpip.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nativesdk-buildtools-perl-dummy.bb: disable ICECC
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
X-List-Received-Date: Tue, 22 Mar 2016 16:42:10 -0000
Content-Type: multipart/alternative; boundary=001a113dce08f576f9052ea5e4fc

--001a113dce08f576f9052ea5e4fc
Content-Type: text/plain; charset=UTF-8

On 22 March 2016 at 16:40, Alex Franco <alejandro.franco@linux.intel.com>
wrote:

> Fix originally submitted on bugzilla [1] by Andreas Schultz, I get good
> results with it and I do think that ICECC should be disabled for this
> recipe...
>

Do we understand why this recipe breaks the icecc class?

Ross

--001a113dce08f576f9052ea5e4fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2016 at 16:40, Alex Franco <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:alejandro.franco@linux.intel.com" target=3D"_blank">alejandro.franco@li=
nux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":dav" class=3D"a3s" style=3D"overflow:hidden">Fix originally submitte=
d on bugzilla [1] by Andreas Schultz, I get good<br>
results with it and I do think that ICECC should be disabled for this<br>
recipe...<br></div></blockquote></div><br>Do we understand why this recipe =
breaks the icecc class?</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a113dce08f576f9052ea5e4fc--
