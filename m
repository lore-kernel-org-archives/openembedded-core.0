Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5869977016
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 13:20:11 +0000 (UTC)
Received: by qkcj187 with SMTP id j187so8256475qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 06:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=N2CVC/9hdeFPLqBUOzgTUpRTTOhYITQubx9eHazU/G4=;
	b=UJjf/rG5vKEYdo0kDCIEwXz9ckVQSfs0DASMj6JuEiida4WsftH0QuhNIzUwlS2BI2
	s7Y62uvpQj/NBon1X7MUmF1F2bYbK6ZYu/ge9HNdAkhNhCa/blCy6H2bR7Z+1ZMX/K6+
	PfMBeicRM3bEOj18Rd4UEzV/MUeLUdXGr8hqCUpOisD/wQjzCT44MHEZwVAjluyRx+Yg
	GcwUgZdsT6spkM1BQ/uAFXqEVud9hvXdllJ0pyCO89xqS5MhlqGO0EdY2bKXaZq7cGo+
	f/pTQief18Fb/RZR7mkweDlNzZUsT/TjrdH/wGpwJX8jhEYAcOUaG1xQT0fr7Zh3C77h
	tPBg==
X-Gm-Message-State: ALoCoQmp3KDfoYVTek32UwXyD/wSVYkuSQXxz9hRZYV4Ry89+wWTTQnqMnIpsMitdSKcAC2nxwa1
X-Received: by 10.55.221.79 with SMTP id n76mr4930454qki.62.1441372811717;
	Fri, 04 Sep 2015 06:20:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 4 Sep 2015 06:19:52 -0700 (PDT)
In-Reply-To: <709779e96e115ed29b9ab7d0e9ba9fba38c584e7.1441336912.git.peter.seebach@windriver.com>
References: <cover.1441336912.git.peter.seebach@windriver.com>
	<709779e96e115ed29b9ab7d0e9ba9fba38c584e7.1441336912.git.peter.seebach@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Sep 2015 14:19:52 +0100
Message-ID: <CAJTo0LbzGw_ZZ5BpYxCQremnk82bJ6RDNMwjag1qRELkENit8w@mail.gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo_1.7.2.bb: New version of pseudo
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
X-List-Received-Date: Fri, 04 Sep 2015 13:20:12 -0000
Content-Type: multipart/alternative; boundary=001a11499f946ec252051eebc2cf

--001a11499f946ec252051eebc2cf
Content-Type: text/plain; charset=UTF-8

On 4 September 2015 at 04:28, Peter Seebach <peter.seebach@windriver.com>
wrote:

> +SRC_URI = " \
> +    http://downloads.yoctoproject.org/releases/pseudo
> /${BPN}-${PV}.tar.bz2 \
>

ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
http://downloads.yoctoproject.org/releases/pseudo/pseudo-1.7.2.tar.bz2:
2015-09-04 14:11:21 ERROR 404: Not Found.

There isn't a 1.7.2 tarball uploaded yet.

Ross

--001a11499f946ec252051eebc2cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 September 2015 at 04:28, Peter Seebach <span dir=3D"ltr">&lt;<a href=
=3D"mailto:peter.seebach@windriver.com" target=3D"_blank">peter.seebach@win=
driver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":134" class=
=3D"" style=3D"overflow:hidden">+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 <a href=3D"http://downloads.yoctoproject.org/releases/pseudo=
/${BPN}-${PV}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://download=
s.yoctoproject.org/releases/<span class=3D"">pseudo</span>/${BPN}-${PV}.tar=
.bz2</a> \<br></div></blockquote></div><br><div class=3D"gmail_extra">ERROR=
: Fetcher failure: Fetch command failed with exit code 8, output:</div><div=
 class=3D"gmail_extra"><a href=3D"http://downloads.yoctoproject.org/release=
s/pseudo/pseudo-1.7.2.tar.bz2">http://downloads.yoctoproject.org/releases/p=
seudo/pseudo-1.7.2.tar.bz2</a>:</div><div class=3D"gmail_extra">2015-09-04 =
14:11:21 ERROR 404: Not Found.</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">There isn&#39;t a 1.7.2 tarball uploaded yet.</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div></div>

--001a11499f946ec252051eebc2cf--
