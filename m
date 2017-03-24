Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2206A7198D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 13:42:19 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id f11so2526810qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 06:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n5fZk9i42VfhlFhnRBR4pETckLuH4UPwB+WLpvSSywg=;
	b=AXGCKTAeEc4aJU7cmG6EtkfpMViP/hNEWn7tlUJsEe16NZGgnfCLOjJ/KEiGgSjLmc
	qd7typL+6H5h68SJKj626pGvpMdBIP5RgptYyjXj8JY84T+NbXGyT26wlDr2nE8rCTtT
	yi6JE59AQmPJDJ/siTXWXVOaq3wM6z2/BXUGY130llfuAyJlkkTD5MlWjqFcNYhGNQD3
	SIJyiJ3uNPC11iRQFG9CxTXphzRQaKTm/vE7MG8vQIMUuj2IHJB06oXLkxN0s4NTH74K
	f8X08Do6pYKwS/uGP1tgf0vNDcbvbonVTsi0C3RhsbELwHhiUWqC8cNwZlKqA4cd3wSm
	l8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n5fZk9i42VfhlFhnRBR4pETckLuH4UPwB+WLpvSSywg=;
	b=rW1k4xkiP0lq90GhyYiI7Ri0q5qxfojhChbj2F6/FoKF38z8TalL5Cgv/C76uXL8Vf
	LkpELKUqxE/ZgOwFHzHHaocWG95aopwyrYs8YgVys622+S8n8KXsevTYv33NgxGKyVtU
	8nhtNdGNBsKz2qFcIHzSgrr7CSDHa+tMLBiXOEymOcCmxSczpvRC4qVPpsQfN+bfqeR2
	fzpngXfXuh+KSYG0o8pxn3yxGwVu6U5pTbFSntdHoX304mLoBCg8ggFdIdM1NBiCzI7g
	LHkvEd7Fn9vz1E2/XtW/3pQu05IVH+iFAc5CxX1jb5uEc0yskRCPPEvMsxKeVvS/RL2k
	UFiw==
X-Gm-Message-State: AFeK/H2lkcu41JG/RDVYj5MhBWZYTD0YZR05slf1F2CJlrpvVJ3Uw+JmF2OhNnU6JTE8TfwWGRIyqYT9KnljpCEj
X-Received: by 10.55.47.4 with SMTP id v4mr7544212qkh.77.1490362941116; Fri,
	24 Mar 2017 06:42:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 24 Mar 2017 06:42:00 -0700 (PDT)
In-Reply-To: <d277a548-fc71-01a7-d995-1f9c9301db51@phytec.de>
References: <20170324111502.23474-1-ejo@pengutronix.de>
	<d277a548-fc71-01a7-d995-1f9c9301db51@phytec.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Mar 2017 13:42:00 +0000
Message-ID: <CAJTo0LaMhJmNJTT=TqMk4CFuk8Dbp_fjD7Jj98D_Kgxgi_qJPA@mail.gmail.com>
To: Daniel Schultz <d.schultz@phytec.de>
Cc: ejo@pengutronix.de, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: perform fsck on created ext image
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
X-List-Received-Date: Fri, 24 Mar 2017 13:42:20 -0000
Content-Type: multipart/alternative; boundary=001a114f4108b132bd054b7a291a

--001a114f4108b132bd054b7a291a
Content-Type: text/plain; charset=UTF-8

On 24 March 2017 at 13:34, Daniel Schultz <d.schultz@phytec.de> wrote:

> The patch which is identical to yours wasn't applied so far, the other
> ones were.
>

Whoops, that was marked locally as merged but wasn't in the tree.  Now it's
staged.

Ross

--001a114f4108b132bd054b7a291a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 March 2017 at 13:34, Daniel Schultz <span dir=3D"ltr">&lt;<a href=3D"=
mailto:d.schultz@phytec.de" target=3D"_blank">d.schultz@phytec.de</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2b3" class=3D"a3=
s aXjCH m15b008702ab25357">The patch which is identical to yours wasn&#39;t=
 applied so far, the other ones were.<div class=3D"yj6qo ajU"><div id=3D":2=
bk" class=3D"ajR" tabindex=3D"0"></div></div></div></blockquote></div><br>W=
hoops, that was marked locally as merged but wasn&#39;t in the tree.=C2=A0 =
Now it&#39;s staged.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a114f4108b132bd054b7a291a--
