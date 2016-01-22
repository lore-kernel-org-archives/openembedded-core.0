Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7115F731F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 16:13:14 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id z14so152427374igp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 08:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ahgFJ6jHmzMpiIEhrjZRUOEwesi0ev8Vt0Ph1mxwaTU=;
	b=xI8B8GFuytUKxal0OM4wbJTx0cQGjH16SX/1e3zk7ggdag5IcofqCo0M4vT+bmkNxT
	NKk0WCBoKczOGO6iprEqwfmBPsp1uEhMdnNPB1Nz2iWhj6x6e2E2T7231YIIYd5Q8aW0
	3IR/zsH7etjthdOIuOG6zIH/11Ti0L9VTtI9vAg380v1nwseeW+H2OqZnwY7JiQL1Uzs
	nvINYHQXnvlb7PqmT5D7u6hUhpDleZOKPIUBM4gAei2uIQHSuuhCruBPNXMBBHj50b51
	oAb60niorcLRFV3geFimFOUnZbNqA/2L4blFMt/iZ58P6WXFeyc1xqFqu633u3Dz5ar+
	rvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ahgFJ6jHmzMpiIEhrjZRUOEwesi0ev8Vt0Ph1mxwaTU=;
	b=DYvmKIw3xyW1wHwarvMx+ACKysYQaOQAy7mJBCBFJR15f1QAExDrwgRgJxPWKwPiHX
	bTzrpUNi7jUWo9OySg2btLiVVkohWB5jiFikqw33WLqE/v9DddF9kKsiDBJruy4KZet2
	lSsoiH92+BIJkBtKMgNaHmDzZZpLbycB3dY+3GorvGABqul3DmTMnJGx31lXaJa95ZAI
	H8C/ikm46WOAuoyodNcVzpmZ+Xc1R5IMRySvoaV6qO+hxMzmY2/T7HBBP5s+wB/Fxjms
	j6cZ4EhIA/LYV60+GYFp0UCtw70Io9qwd4zpBKrca6FEuB/NRWKZN/BkMBM26GXozraV
	rWnQ==
X-Gm-Message-State: AG10YOTqZI1QVY6aD4jMamUuinCl+HAzHGdfZkcfl1/8imzeVrrR1D9opJBJOeE1f12Zspp7FcX/+XQhH15z9ze5
X-Received: by 10.50.55.4 with SMTP id n4mr4117614igp.64.1453479194830; Fri,
	22 Jan 2016 08:13:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 22 Jan 2016 08:12:55 -0800 (PST)
In-Reply-To: <56A24CE8.8010501@opendreambox.org>
References: <56A22767.7050000@linux.intel.com>
	<56A24CE8.8010501@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jan 2016 16:12:55 +0000
Message-ID: <CAJTo0LaAY=Bru-JzaNMQe5KNuAH3+A0VW_mQ6sNy4GvDU7nk6w@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: proposal: remove DirectFB from oe-core in the next release cycle
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
X-List-Received-Date: Fri, 22 Jan 2016 16:13:14 -0000
Content-Type: multipart/alternative; boundary=e89a8f3b9b4918cc790529ee7fba

--e89a8f3b9b4918cc790529ee7fba
Content-Type: text/plain; charset=UTF-8

On 22 January 2016 at 15:38, Andreas Oberritter <obi@opendreambox.org>
wrote:

> FWIW, https://github.com/deniskropp/DirectFB is the new location of the
> upstream repository. I see that you opened an issue there, so you're
> already aware. The last commit is from October 2015.
>

I guess the thing missing is an indication that the repo on github is
official and maintained.  Specifically the deniskropp repo has been
recently touched but you have to admit that
https://github.com/DirectFB/directfb looks more official.

Ross

--e89a8f3b9b4918cc790529ee7fba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 January 2016 at 15:38, Andreas Oberritter <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":v62" class=3D"" style=
=3D"overflow:hidden">FWIW, <a href=3D"https://github.com/deniskropp/DirectF=
B" rel=3D"noreferrer" target=3D"_blank">https://github.com/deniskropp/Direc=
tFB</a> is the new location of the<br>
upstream repository. I see that you opened an issue there, so you&#39;re<br=
>
already aware. The last commit is from October 2015.</div></blockquote></di=
v><br>I guess the thing missing is an indication that the repo on github is=
 official and maintained.=C2=A0 Specifically the deniskropp repo has been r=
ecently touched but you have to admit that=C2=A0<a href=3D"https://github.c=
om/DirectFB/directfb">https://github.com/DirectFB/directfb</a> looks more o=
fficial.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--e89a8f3b9b4918cc790529ee7fba--
