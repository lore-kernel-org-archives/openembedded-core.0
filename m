Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 99A4A6FFEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 13:12:42 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 5so119213220ioy.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 06:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O3QFHuA0kq/Tw4fSbVUEj0Ymh2vg5p/hUINSuciuqu8=;
	b=tEvY7HBSYSy5uvDm2QoX5LGmUo+N8Qp/bvgcTtli2o/3FASmkyf2M8Ne7v0WX3ZByR
	EDTDDxKISTlP1xZ6vrNSG6oI5+bAnCtHzV2ElM0c2xTFeNX/tuPpy3YgDJHh947jHtWC
	0nWz3mmMt1UToTjZhWWHpHbOBJakOFVrDiKDfAbD6KPFc8/i+LIVK2rgcZNXEnGdhL3m
	D56H5ZM9KIEC0AlCL6gGBy/z5UEZ+vyNFX5FE1etgL9ar9Ue4U8ogcs9ZV64iMCcPXCv
	qPsjijRtLzJ33RT00hWNVw7bT/m7meAu94XveOlsMDFTuCoYMnfDTqNBsfblQOwV10oT
	C8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O3QFHuA0kq/Tw4fSbVUEj0Ymh2vg5p/hUINSuciuqu8=;
	b=PmjTlia2GevdgVsPzuOaHuF4tzsBZTD+xsZ69yQXITkMMa0+qXUGixmg/dXHyHpGUs
	ZNEDlwBTH2P0z3k5xLA+g4KNxu4RBeTxFMbemg559IZDXnLisWblcaLSXc8OBhktutTA
	BMFwuGj+4jnXz7dIHnyuBj7TTt8detAvRYE6XQ3yjG4zQc/znBpiBrIbEyUSDElkceU3
	Zz0Rqlz5LyNblOBSSBDRRoxhsBu2QyxzdfPIdWpOZkUfjkH7DZlfl0dj62vjRLx5h+q5
	RHn6hr2wWRyW6la4sbTTwoGB5jP3V3ipGwo3RdcNOeQATxVkQQuuPiUWYDavcyXMrL/W
	rq9w==
X-Gm-Message-State: ALyK8tKLs6+k8FIySbr2HLTc/yXAkdZ2guycx5zRXJndHj8oQtKxciuT/m/3aNud/gvwV1Zv7O27Zh7KyFoSuMa/
X-Received: by 10.107.138.201 with SMTP id c70mr21817150ioj.148.1465823562998; 
	Mon, 13 Jun 2016 06:12:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Mon, 13 Jun 2016 06:12:23 -0700 (PDT)
In-Reply-To: <1465592512-45778-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1465592512-45778-1-git-send-email-alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Jun 2016 14:12:23 +0100
Message-ID: <CAJTo0LbuZndWwDyE=jRB5Z2F30PnU7PPaMn7u8dPQ0xr0OCHtA@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python-git: Upgrade both python-git and python3-git from 1.0.2 to 2.0.5
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
X-List-Received-Date: Mon, 13 Jun 2016 13:12:43 -0000
Content-Type: multipart/alternative; boundary=001a113e8e6ac6b9e9053528a40f

--001a113e8e6ac6b9e9053528a40f
Content-Type: text/plain; charset=UTF-8

On 10 June 2016 at 22:01, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
>

The v1 got merged to master, can you rebase this?

Thanks,
Ross

--001a113e8e6ac6b9e9053528a40f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 June 2016 at 22:01, Alejandro Hernandez <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejandro=
.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":16k" class=3D"a3s aXjCH m1553c2002483ac51">Signed-off-b=
y: Alejandro Hernandez &lt;<a href=3D"mailto:alejandro.hernandez@linux.inte=
l.com">alejandro.hernandez@linux.intel.com</a>&gt;<br></div></blockquote></=
div><br>The v1 got merged to master, can you rebase this?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Thanks,</div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a113e8e6ac6b9e9053528a40f--
