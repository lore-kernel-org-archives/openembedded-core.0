Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3AECE782ED
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 16:33:15 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id w1so81609725qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 09:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8KItHmn0AzU4tIWPTQAQYccA38M93foQZChwxv3Bglc=;
	b=mdurk6NcHo4Qe2xjlxR28Aw3v91hBIoKgdDEsZAJJNlzddfr3o266aUAbGa773c/Yq
	+mnGLoDGLaS1+oPyXtEaFCKEolezIvggyGANNG5ZFlzeUV2y9KdU9jgf0cUxURsZ7zy+
	6PHgiOyw64lGnKQPNN6bXdHrOVLUUX4gLA8/JSAIvXUlfc9+l0DipiUIGhTz3ykki62t
	1uBReesl2RzNJN+UzNWrkbdaVfyKqvDOY7qEIOYihOlV+qEhP906mwx7/qH94HupQKZx
	UeuiFBSwAQ89jDEODuCrUNyfLxLt8oDh9X9sdLGUHorwNZ4TseZ+GD6b/T42G00O0Bdr
	zUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8KItHmn0AzU4tIWPTQAQYccA38M93foQZChwxv3Bglc=;
	b=SDAlezi2VKc5zrCnQDEO5u629ymtf+uSXxpKKpLcg+vBqVTRDrabe9L9eDSBR72dZE
	RFpIlpJ30/I6hfuOH4po0V4bFJoTRgVnSZYJLjC6IEPQ7ylU4RswaL+uS2nfdBzzpJ5w
	pLbRuA9yeTnWbOQq0SLrTIqpBuHdfBZBDXEVpgTnH/4lTv3kW+zfS9v37r6IIZNaVyQ6
	oAtDNeQJ8j6e1krFjWjv6iXmLkq26fll4dugcf1HNEkOqe/RzACnYiaJJcZXJELV9eM2
	/MZTk42njAuKuxXm0WWN7OsCWoDf33jcxmsgeCx0evXrsvtsCK/KPBV7tWNdwXLHgpGL
	+lLQ==
X-Gm-Message-State: AKS2vOyzQzOmx8O2xk83p/6OCyVFP4wCD+6W43nZLLVrGlB7UrFPxGaj
	2l/+1mROE1zW5gjrpcbaMD0mXMpdyR+y
X-Received: by 10.55.140.193 with SMTP id o184mr35160897qkd.127.1497025996550; 
	Fri, 09 Jun 2017 09:33:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 9 Jun 2017 09:32:56 -0700 (PDT)
In-Reply-To: <469831ab169cb0c7a7de2a5f5a5e7f4b4b40c4fe.1497006675.git.alexander.kanavin@linux.intel.com>
References: <cover.1497006675.git.alexander.kanavin@linux.intel.com>
	<469831ab169cb0c7a7de2a5f5a5e7f4b4b40c4fe.1497006675.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Jun 2017 17:32:56 +0100
Message-ID: <CAJTo0LakpwMpac5hsJzxMEWWQyBVb4HqQkFpL0OpzNbWn702kw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 2/2] rpm: run binary package generation via thread pools
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
X-List-Received-Date: Fri, 09 Jun 2017 16:33:16 -0000
Content-Type: multipart/alternative; boundary="001a114f0ce8be8ed005518986a1"

--001a114f0ce8be8ed005518986a1
Content-Type: text/plain; charset="UTF-8"

On 9 June 2017 at 12:13, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> This greatly reduces build times when there is a large amount of small
> rpm packages to produce. The patches are rather invasive,
> and so will be submitted upstream.
>

Sorry but I broke this in the same way as I did before...

Ross

--001a114f0ce8be8ed005518986a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2017 at 12:13, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kana=
vin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">This greatly reduces build times when there is a large am=
ount of small<br>
<span class=3D"il">rpm</span> packages to produce. The patches are rather i=
nvasive,<br>
and so will be submitted upstream.<br></span></blockquote></div><br>Sorry b=
ut I broke this in the same way as I did before...</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114f0ce8be8ed005518986a1--
