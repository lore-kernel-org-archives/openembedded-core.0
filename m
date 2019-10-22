Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id C40D17D19E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 11:36:05 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id i21so1453640vka.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 04:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oTBUFPnyzqi2YhDjnDOLwv+9nmrUpKUOiMeH65rv8XM=;
	b=AOy8Q4mLAmmZ0xBAFxDGwwQx8AM5jONeQNntY/bZigAAVKiALM2unOPWoXdOyFkSMS
	YS6JgMMiqZLwxSQ39OcLPRV5suqUmgv1K7bQDEohWqEcBtkaEmARhRGBcePKpSPRWz7x
	2lMmRSGfTBZGbFZpYIuzjXkXOgfNSUf0htMT/RP48Enn7K1/JYWkJkBXPOMeRIzhZWxX
	NVSgxIlxTrcrSl48WUaxIo2g7Z3J4MNm55ua9Vzu9LaZD5SlFluGjZv6afqx77sPk9LU
	Cu3JRoQV82VboQnx2d2Ud01UhFjFR5nCM2tDQBW8d/JM+BwK6VTxhq/pEN3E/VIF05xL
	1Wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oTBUFPnyzqi2YhDjnDOLwv+9nmrUpKUOiMeH65rv8XM=;
	b=malxJOSfBHNwkIq0T8fsLCPN8+3j0CdfW3UkFFZkQjQwNlgaPYfdDtOkZGU/RzWzmt
	GjKYsrnmQDrrCQqZEjdkwVpCH2DZeLVDvRYqVZAs3BA8B/uXjLcr+Ypq2C+5ieCZDdTg
	sg4t/f+Br6JZnT+WLdP6OALvGHajREGa4+eqwrlQBnoh8JGYxz5udCyIxvnb8VKco0gJ
	fR9eJlwvVM1XitebKll3MtPBszKCKjLXaWxfZW1qHY3cwllhUuSWbdfjHNn02BUumxM2
	mAMMgyul8K6r2gco+KAEeaFnThde9iAx/PtNbf+6yrXNcEhuXYC+zqh2mzSg69wHRjoL
	im9w==
X-Gm-Message-State: APjAAAWNcUEWgkw0ndf2S3SVrCo+rLOsIk8MC3WI+sk9kprbMQMviPKE
	lnSUjZ5VX8qNLuO/lMRMX5Vyc63Rf8WypyhXmDSByw==
X-Google-Smtp-Source: APXvYqziWFOxcEAO/Jtyt3QbSJBvNj9DcpophPAAfjtMhOa8sgX0z1bnjJd/NPftBDN9QjrSzu/LTRJVqw/vtgLp0+8=
X-Received: by 2002:a1f:97c2:: with SMTP id z185mr1562500vkd.0.1571744166320; 
	Tue, 22 Oct 2019 04:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<20191022090353.21151-2-jean-marie.lemetayer@savoirfairelinux.com>
In-Reply-To: <20191022090353.21151-2-jean-marie.lemetayer@savoirfairelinux.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Oct 2019 13:35:55 +0200
Message-ID: <CANNYZj9y0a7PgU2+vdBWYvbJYfUyHRCaZPfVjGmW0b2HY8Z=bA@mail.gmail.com>
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
Cc: brendan.le.foll@intel.com,
	"Paul Eggleton \(paul.eggleton@linux.intel.com\)"
	<paul.eggleton@linux.intel.com>, rennes@savoirfairelinux.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 1/6] npm.bbclass: refactor the npm class
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
X-List-Received-Date: Tue, 22 Oct 2019 11:36:06 -0000
Content-Type: multipart/alternative; boundary="000000000000b6204205957e34d2"

--000000000000b6204205957e34d2
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Oct 2019 at 11:12, Jean-Marie LEMETAYER <
jean-marie.lemetayer@savoirfairelinux.com> wrote:

> The simplest solution is to let npm do its job. Assuming the fetcher
> only get the sources of the package, the class will now run
> 'npm install' to create a build directory. The build directory is then
> copied wisely to the destination.
>

I agree that npm dependency handing is a mess, and we should indeed let npm
do the job.

However, 'npm install' pulls various things from the network; this can only
be happen during do_fetch(), so that offline builds can continue to work.
Whatever has been downloaded, needs to go to DL_DIR.

It also needs to be reproducible (there should be a guarantee that it
always pulls the same set of sources which are verified through a checksum
of some kind), I guess that can only be achieved through upstream provided
shrinkwrap?

Alex

--000000000000b6204205957e34d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 22 Oct 2019 at 11:12, Jean-Marie LEMETAYER &lt;<a href=3D"ma=
ilto:jean-marie.lemetayer@savoirfairelinux.com">jean-marie.lemetayer@savoir=
fairelinux.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">The simplest solution is to let npm do its job. Assuming the =
fetcher<br>
only get the sources of the package, the class will now run<br>
&#39;npm install&#39; to create a build directory. The build directory is t=
hen<br>
copied wisely to the destination.<br></blockquote><div><br></div><div>I agr=
ee that npm dependency handing is a mess, and we should indeed let npm do t=
he job.<br></div><div><br></div><div>However, &#39;npm install&#39; pulls v=
arious things from the network; this can only be happen during do_fetch(), =
so that offline builds can continue to work. Whatever has been downloaded, =
needs to go to DL_DIR.<br></div><div><br></div><div>It also needs to be rep=
roducible (there should be a guarantee that it always pulls the same set of=
 sources which are verified through a checksum of some kind), I guess that =
can only be achieved through upstream provided shrinkwrap?</div><div><br></=
div><div>Alex<br></div></div></div>

--000000000000b6204205957e34d2--
