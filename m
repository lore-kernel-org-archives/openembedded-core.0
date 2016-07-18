Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7765A60797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 21:21:45 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id j124so2579608ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 14:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MtCKMw1Xutx/jg3cMC+6y8M6JxztQRj5s+3D7fD+2uA=;
	b=FupbUr0Ulcaz4asL7F+EZrAZpigu11362GNjcX7JTF9usM5Q7tv21c3pNvTIl2QkZE
	xkkeDFsAhojeKUMOhEP4lHD7EuSRhDJ8qbECo4hVe1CU1aIm5NN9qdZXz4dl8OxEBGL0
	Ztc0S8Mi2KrzV0A462RUT/YjK6acr6H7gkmAJ5MOv7Fv2sogQ7Adpe3jZZETltvAAjar
	9xUyGG7ns1Fl9jCnSMM3wRWJzL8U/RLIcBCYLM31ge34ioRRrhXuy+EnJQfL0nUo33yW
	r8OcgNlmfJyYUQtDlvKz8RQS794M+AmSX8CIk7xrm9LoFlX7A+afL/8mvjnOaSpjk9fi
	BNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MtCKMw1Xutx/jg3cMC+6y8M6JxztQRj5s+3D7fD+2uA=;
	b=hWySULyxl+1i+ZMi3NU54yHoVcINdRvm4zZ+bgw/aQ4gYlnQY0fBfWKS0pdDLcrEA1
	7iacegr7FbQwKy9A6SRQy+fjThIghA2XodZMCQpSB1T2XknfkrXykL4VweEF+tXbgsyt
	odjh3jotd/duZ5bpXXxyxTnrP7VL9FstWF3o8FXur1RFC+bOWL/E++jb6Q3wCHrDAqfk
	jScoSRv0iV/rbM6qQGr7eXkAfgeBAWsYOeQAcaSSP/4hbZnILbf0WuzFS5+3DRDGxZAC
	yO4WmyqkfLFHH1o5v5dcXSt57TswHc66ICtvIlmjijiNCPDX6UOcmgVfrOaX77yYrUYQ
	ZYYA==
X-Gm-Message-State: ALyK8tI+MJlO4DWgLwCz4cdd028t9hIexIlUZxt2m0+YidxEbzRGIpOFffepdeSehxF4QCWKYFAMbCJQgTncfhTf
X-Received: by 10.36.121.204 with SMTP id z195mr36846763itc.22.1468876905591; 
	Mon, 18 Jul 2016 14:21:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 18 Jul 2016 14:21:26 -0700 (PDT)
In-Reply-To: <20160711175529.2650-2-stephano.cetola@linux.intel.com>
References: <20160711175529.2650-1-stephano.cetola@linux.intel.com>
	<20160711175529.2650-2-stephano.cetola@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jul 2016 22:21:26 +0100
Message-ID: <CAJTo0LZfTnmKoMCwjZhU9-ooBZm4F1vsy=vC4sh9p0HQF6mVKQ@mail.gmail.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] rootfs.py: allow removal of support packages
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
X-List-Received-Date: Mon, 18 Jul 2016 21:21:45 -0000
Content-Type: multipart/alternative; boundary=001a114aa4662d705c0537ef8e07

--001a114aa4662d705c0537ef8e07
Content-Type: text/plain; charset=UTF-8

On 11 July 2016 at 18:55, Stephano Cetola <stephano.cetola@linux.intel.com>
wrote:

> +            unneeded_pkgs.extend(self.d.getVar("ROOTFS_BOOTSTRAP_INSTALL",
> +                True).split(","))
>

Sorry for not getting around to reviewing this...

That variable is whitespace separated, not comma.

Ross

--001a114aa4662d705c0537ef8e07
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 July 2016 at 18:55, Stephano Cetola <span dir=3D"ltr">&lt;<a href=3D"=
mailto:stephano.cetola@linux.intel.com" target=3D"_blank">stephano.cetola@l=
inux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":235" class=3D"a3s aXjCH m155db1a243f47d1f">+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 unneeded_pkgs.extend(self.d.getVar(&quot;ROOTFS_BOOTST=
RAP_INSTALL&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 True).split(&quot;=
,&quot;))<br></div></blockquote></div><br>Sorry for not getting around to r=
eviewing this...</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">That variable is whitespace separated, not comma.</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114aa4662d705c0537ef8e07--
