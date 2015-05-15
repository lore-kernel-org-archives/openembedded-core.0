Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 870E473FC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 14:11:59 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so70875507qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 07:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=80mORWcBbS26pGD0+N0CgyZ1FDTnVpsk7kQiRlyJMyk=;
	b=BS67DI0uKEOaKZV0yvbXNI+MjUHXKqywz4OK30MLwn73ii//i8MANiPlPlMGLJQVLP
	4fp9PJpbhCTXDz8vBP24wUuZ8GCSOts0LGzFOWx9BHCreS28AN3gpVvvoecB4KRN7RCY
	r1dFjcLfYtTrcU5yO0+2Of2s3qpx52qH2TvYPtc0lV0yT2B4WbpCwL85ThlF3Qowpsp3
	+Lpw7iW4p+CDlQBdPqO9Z6j8FYzwI65YWeAK3kZwE3JRuaGDrXJzjSNx/PILPrWMqcoO
	D3gHAVnQDh7YwZ17QShjW8hYhEQyu9HQ8A8Y+kh7bYGgfPeCrmeIuIyaDfxiTVoqmXDy
	6Gew==
X-Gm-Message-State: ALoCoQmPYkU9RU6A78iJtYdJw0y0O8QCt1G+TFF3qHB0ejeKN1XfFC1gyLnVBTUhNndVsCnWd45T
X-Received: by 10.140.89.37 with SMTP id u34mr12551594qgd.15.1431699121019;
	Fri, 15 May 2015 07:12:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 15 May 2015 07:11:40 -0700 (PDT)
In-Reply-To: <1431686109-616-1-git-send-email-zhengjunling@huawei.com>
References: <1431686109-616-1-git-send-email-zhengjunling@huawei.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 May 2015 15:11:40 +0100
Message-ID: <CAJTo0LbRqndwb9_WPbVOnMDrfgHhujSV7jbO7x-uiQ34MbOQKQ@mail.gmail.com>
To: Junling Zheng <zhengjunling@huawei.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] autoconf: set perl location only for target
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
X-List-Received-Date: Fri, 15 May 2015 14:12:01 -0000
Content-Type: multipart/alternative; boundary=001a11c117ee88eeda05161f6d5a

--001a11c117ee88eeda05161f6d5a
Content-Type: text/plain; charset=UTF-8

On 15 May 2015 at 11:35, Junling Zheng <zhengjunling@huawei.com> wrote:

> We should only fix perl location to /usr/bin/perl for target. It seems
> to be more appropriate that the perl used by native and nativesdk class
> of autoconf depends on build host environment.
>

But as this fragment matches any hashbang line and replaces it with
/usr/bin/perl, won't this mean that the nativesdk packages will use the
path to perl *on the build host*, which may not be valid on the host using
a SDK (build host is Fedora with /bin/perl, SDK host is Debian without
/bin/perl).  Forcing the path to /usr/bin/perl seems the right thing to do
across all targets.

Ross

--001a11c117ee88eeda05161f6d5a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 May 2015 at 11:35, Junling Zheng <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:zhengjunling@huawei.com" target=3D"_blank">zhengjunling@huawei.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":13c" class=
=3D"a3s" style=3D"overflow:hidden">We should only fix perl location to /usr=
/bin/perl for target. It seems<br>
to be more appropriate that the perl used by native and nativesdk class<br>
of autoconf depends on build host environment.</div></blockquote></div><br>=
But as this fragment matches any hashbang line and replaces it with /usr/bi=
n/perl, won&#39;t this mean that the nativesdk packages will use the path t=
o perl *on the build host*, which may not be valid on the host using a SDK =
(build host is Fedora with /bin/perl, SDK host is Debian without /bin/perl)=
.=C2=A0 Forcing the path to /usr/bin/perl seems the right thing to do acros=
s all targets.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div><div class=3D"gmail_extra"><br></div></div>

--001a11c117ee88eeda05161f6d5a--
