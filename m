Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id AF1F3731B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 16:33:32 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id g185so109122890ioa.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 09:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+cBBChY4jqIMxXeB5hdFQXXYZyM/HJcQdRHREf9+wJ4=;
	b=pOZG0QmrLywyep/uQ4Lms/2CjdXZIIa9cYAYcZhbw8pHWLjNxOm4Hy9NuCRJ/V9j88
	mKy72l4hAp32k83BpiZtE3S4V41n72xL9jvB2dNHqObosZRytlPt4P3CItZbqI3WUDXa
	ddUbVoIwczRdNlfOd6DBXLCOF1HMUoATkOwkBHgxhSIFokLaWu21J0j1xFz8DaYuCqZb
	0jKhQ1w8aDIXIw1Lo49BtnqSSwmlgev4mqrrR/z0sXvo6DYUh5lIr3wf6lWoAID4N9cF
	wC9+SOdSutNPIKNRcSnkgD+paMsjNTV1Od7FUN/V4Y5Jz487XC88nqrlAjUzOdMpJc9X
	t3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+cBBChY4jqIMxXeB5hdFQXXYZyM/HJcQdRHREf9+wJ4=;
	b=mySLYoykwHttX1MBeWAMkKXN8fjnuaSk5x0cqiSht9fNTYIfsqpbZTXjKKoiggJ9w4
	2KnvajfV4UaI5jlQxZ0ezoe8BkSpKdHiOaF+9LT+TuJeHhtz61KKRtS5j4olxBTpKX+6
	eyxKhf9MAC14Hd0vRfi4cekDnkB9BaMVlA/vm+rT+RRMS7kUTLgku4JJAHCMVtTbQ9ML
	d778375nP90giAfJY4fCPmMGBMluJ3EYS3HpWvXOmZ2FtbTSG1arIXjT+v46ILimkkmD
	US4D3/8lwQ8NZdF7OITNmJG507btlJDYfnd6PrhYQB7KMhBc2GgwtoF4xeZdjmIqU/P1
	mSdQ==
X-Gm-Message-State: AOPr4FUEgrD36wEvwO+O8plUkp9YmpI8rZMnxYD6wf52lwNA8v3zlZVpgL+C3LptI5tIXDufGrepT5tFhbXlCyFC
X-Received: by 10.107.135.74 with SMTP id j71mr18816938iod.133.1460651612986; 
	Thu, 14 Apr 2016 09:33:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Thu, 14 Apr 2016 09:33:13 -0700 (PDT)
In-Reply-To: <CACS+7ZSuQzcMLhv2DS37WHwOU24YLYbyw2ErrveqC2=8k5Mb7A@mail.gmail.com>
References: <cover.1460015043.git.liezhi.yang@windriver.com>
	<0186a488dc4ff5d3daf5ef0d1fd54bb0e79763a7.1460015043.git.liezhi.yang@windriver.com>
	<CACS+7ZQ55g1EQkWD5OQOH0zU=S1p9BRx_Nn8u5FKQmL3_-QEcw@mail.gmail.com>
	<570664CD.4090501@windriver.com>
	<CACS+7ZSOJg9gpWGKAKM2dA6Y6Se4wcj+DWFpjOdKS014fqZWYQ@mail.gmail.com>
	<5706FF8B.1060706@windriver.com>
	<CACS+7ZSuQzcMLhv2DS37WHwOU24YLYbyw2ErrveqC2=8k5Mb7A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Apr 2016 17:33:13 +0100
Message-ID: <CAJTo0LbGex1-Jhs_HK6ym5z9YkUbMFnQYyKcf93xuKwY4se68A@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] fs-perms.txt: fix ROOT_HOME's permission
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
X-List-Received-Date: Thu, 14 Apr 2016 16:33:32 -0000
Content-Type: multipart/alternative; boundary=001a113f921888984505307474b6

--001a113f921888984505307474b6
Content-Type: text/plain; charset=UTF-8

On 14 April 2016 at 17:23, Dan McGregor <danismostlikely@gmail.com> wrote:

> I believe you merged the wrong version of this patch.
>

I've updated mut with a revert/add of the revised patch.

Ross

--001a113f921888984505307474b6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 April 2016 at 17:23, Dan McGregor <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:danismostlikely@gmail.com" target=3D"_blank">danismostlikely@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4b5" c=
lass=3D"a3s" style=3D"overflow:hidden">I believe you merged the wrong versi=
on of this patch.<br></div></blockquote><div><br></div><div>I&#39;ve update=
d mut with a revert/add of the revised patch.</div><div><br></div><div>Ross=
=C2=A0</div></div><br></div></div>

--001a113f921888984505307474b6--
