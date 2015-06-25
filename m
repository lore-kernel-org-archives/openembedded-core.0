Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2016175A0A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 15:18:41 +0000 (UTC)
Received: by qged89 with SMTP id d89so25771607qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 08:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lbm+1g0fW6Dkq/eXY/7yQ7Y8dv/PsYsg3YnhJB7kWa8=;
	b=RPdzLAg8y3HwCLX/l+A468jAZbVRBL0ndUgKs3c0fQBzqqe/SMHYzFtNgTP8s1JixL
	uP+IOTHwlZAzw7yEvCMnWRhN7+oAza7nnnnMxt0N0RcAlXtKVJ70qqILRn6OXwGTfdZM
	3Ea0tbt8i6nWlls6dKyd/JUac/q9UHLhTl0sSVh2/V3kgWrUlmHCP4H40XxNbjp8R3Bx
	BIfhOlTXEIju7bsSIJEZdw3Fd9AOFjqqMRojSUia55UcyPrd80i7BLJho9gMwM/Gr7wX
	7aDUs0qyV4wkcuZltakVg+fPj0FiYWgL0mJ6v0zrLlEUeEPqLc1yfbQiuEjefnbJCxuQ
	IHMA==
X-Gm-Message-State: ALoCoQloDH/fRS/8Mgy3VLlUkd0o/v6Ed+fp9Ckt3svbpdnEh9cbf7yx2syqtw+042MuAfOWVS1O
X-Received: by 10.140.88.5 with SMTP id s5mr59139977qgd.59.1435245522340; Thu,
	25 Jun 2015 08:18:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 25 Jun 2015 08:18:22 -0700 (PDT)
In-Reply-To: <558BCABE.609@windriver.com>
References: <cover.1435135356.git.liezhi.yang@windriver.com>
	<bf978a7894f51c909ede7f64c28b6da5495d981a.1435135356.git.liezhi.yang@windriver.com>
	<CAJTo0LZBzMKzzswgtsk0o3uohK+03a4kPB0niwhvyYqxpQBhYg@mail.gmail.com>
	<558B6646.2050809@windriver.com>
	<CAJTo0LbE33NkdmiA_+=NmHAS3hRJY6tdsoGHSQKo2ARAsCgpqA@mail.gmail.com>
	<558BCABE.609@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Jun 2015 16:18:22 +0100
Message-ID: <CAJTo0LYmdJ1fcx=AttjnpETy_THas_M1yV=d3Uzv6hMh_nSphg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] file: 5.22 -> 5.23
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
X-List-Received-Date: Thu, 25 Jun 2015 15:18:44 -0000
Content-Type: multipart/alternative; boundary=001a11c118748669db05195923f4

--001a11c118748669db05195923f4
Content-Type: text/plain; charset=UTF-8

On 25 June 2015 at 10:32, Robert Yang <liezhi.yang@windriver.com> wrote:

> Thanks, let's wait for 5.24.
>
> Btw, it doesn't work for me now, either, now.
>

FWIW, the FTP server appears to be back now.  The known problem with long
options does mean we should either backport the fix or wait for .24 though.

Ross

--001a11c118748669db05195923f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 June 2015 at 10:32, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":169" cla=
ss=3D"a3s" style=3D"overflow:hidden">Thanks, let&#39;s wait for 5.24.<br>
<br>
Btw, it doesn&#39;t work for me now, either, now.<br></div></blockquote></d=
iv><br>FWIW, the FTP server appears to be back now.=C2=A0 The known problem=
 with long options does mean we should either backport the fix or wait for =
.24 though.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a11c118748669db05195923f4--
