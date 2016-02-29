Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0894E771EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 10:07:14 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id z135so181857331iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 02:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P45osQ8zsnod6cG2dyV1e2TPBKKlxYcb8LdpwFITMms=;
	b=lsZPjvXiswZzWrGTI1+tu5eYhCKOl/KvQuexD8xNbh4QAHjuHNOSEJH3BIUA+XeITh
	fhHdieiaR9GBmDFoXayfgOhPI7Gzr0B1257C0gV7c6aJIvpZIODth9CSoRVqNkwvfYzo
	sRaGV8foWKsN8C8SaSX16EWPj8IJac75aAGLBI9+JluuXdkk6fiBxTPeyJTIIxfpQF2V
	2aFojuP9ocBqNV2yOirD9NYgKz1TIrtcI4KbfeorRUlZU/RsZZbxdNgJKKeEvAAe9nrx
	n4/ypqG775vsqvuEjrnfoAtRk67HVDKd05WjGUilyNrRDPx+s3aNJlpTX8uDx6SJWsbp
	W5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P45osQ8zsnod6cG2dyV1e2TPBKKlxYcb8LdpwFITMms=;
	b=BQ8tZYGf5DjAAUF6JkuuVOWVnYVzABvZgH2md5409NGI8dmd/89JOXY5A90JIMW7n0
	RSa3cBW2iOUHt3gN5CXOikQT9XOxFCpv0V+NvJP6OYuPMEWDzeE6ts5peA95GV64kyKU
	BKqSgrdFo4bzHRvhBBrncq9/yl3W4AuLhzUIVHUgDvcd70v8uOQbiiCjDZDlE1yX8Aft
	SWN6EuYBNcGajFMKPpl37Jl0h8tMOTxoWpjurRoNuMVACljNDdOtvHYzMZlw+Pn6/8Re
	hGakOS15GJHEX49ZAsAM+yFS+dlD2fZA6jMKP62tc8lmH5JygklSEKPLEkTO50HDxM96
	bnOw==
X-Gm-Message-State: AG10YOTR1LV8f9y7B/T0r36O4iScKKdN6HKqa/y3/DJzM5nfoYT1Iiq8EqgLG5MeE3//7Pv8Pgyhd4QHo/A+WWFI
X-Received: by 10.107.137.92 with SMTP id l89mr20759974iod.133.1456740435324; 
	Mon, 29 Feb 2016 02:07:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 29 Feb 2016 02:06:55 -0800 (PST)
In-Reply-To: <062AD77D-2CDB-4D36-89AA-7F8072A8283A@gmail.com>
References: <898F5FB0-0062-4647-8A7A-1DE402384A75@gmail.com>
	<CAJTo0LYt_SVFavOCtZmdcXcgZBarR+RMArwA_MJn7Amiy4iZuw@mail.gmail.com>
	<062AD77D-2CDB-4D36-89AA-7F8072A8283A@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Feb 2016 10:06:55 +0000
Message-ID: <CAJTo0LbmQi76WuT7A7hmmJfPFGmsQDgK2_yNiX72Ap=YQcTvPw@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] avahi: make dbus optional but default
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
X-List-Received-Date: Mon, 29 Feb 2016 10:07:15 -0000
Content-Type: multipart/alternative; boundary=001a113ebdb42d83bb052ce5d056

--001a113ebdb42d83bb052ce5d056
Content-Type: text/plain; charset=UTF-8

On 29 February 2016 at 08:00, Jens Rehsack <rehsack@gmail.com> wrote:

> Especially that one fails when no dbus support is added. So, nope - it
> should not always executed.
>

Just testing the existance with shell logic is more bulletproof.

Ross

--001a113ebdb42d83bb052ce5d056
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 February 2016 at 08:00, Jens Rehsack <span dir=3D"ltr">&lt;<a href=3D=
"mailto:rehsack@gmail.com" target=3D"_blank">rehsack@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":4da" class=3D"a3s" =
style=3D"overflow:hidden">Especially that one fails when no dbus support is=
 added. So, nope - it should not always executed.<br></div></blockquote></d=
iv><br>Just testing the existance with shell logic is more bulletproof.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a113ebdb42d83bb052ce5d056--
