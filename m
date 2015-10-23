Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA3760034
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 04:12:09 +0000 (UTC)
Received: by igbhv6 with SMTP id hv6so8475327igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 21:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Yy991c8KUooJ2NrXsI0p4xebIcpRxsMieO4FRMe1WIo=;
	b=d3CIjMYFo920pdhmDZqxw7dR7SdkQDx0bqJyW+aR7ex31jCc18jfpAY3c0UwbcTCoy
	FDJrEHCmlHsgUp/eM8EtccL7p2+rNKylB9lLqJjKB1WsE6Hfv8jsqSfLrT//mfPL1EBi
	GKlFw9p0RPSAQRvSj+/1ZRT1qx46CLL6LQTepwYHINjtGFIoNB8pJcBQAw5O5kkF81/N
	bYSk5OptudBko8dM8fN1sKBOkZ14FpfIeKrFr7qO+qMNX9Dy/lXNyGBw0pKmwPKwnSwe
	WiKADSjqxU/71w67qkTdUR/2HWaWjO/HriMvkLcmLtCzgUvqE5d71QEOaD/P3aQ4FZHI
	HLfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Yy991c8KUooJ2NrXsI0p4xebIcpRxsMieO4FRMe1WIo=;
	b=I9agwM1OIvDkgSZf1AKV24bosUTPnJ4THyESUBJAO0lLYUKmSRalFmeq3IdOKwHVMF
	wQ1AwaY+p2geLqBsNh8lK0Z8YLlOQkMBQWW3FxgNPtn+eM0/C9S4Ls7D6ywR4K9ac120
	GCzt85hkl43G/TOR9TD1MzxcnSxTvbKJigEV12GkwC/SaY5H3vkwcZu82NsRt2K5HWd1
	aGqqGOr4NZXpp6TorY9yjnGzd05i0qu2nEYjlaSC9AR//AaLR7jzrp2tcG3gvsv8PCe7
	WHgkOLeqxmgXFgbL+XwEkAs3IVLdfRJZ8tfvUkYR9aTLpvzJvJZzRlqsIXJreCCiaIiP
	FuRA==
X-Received: by 10.50.60.74 with SMTP id f10mr2183871igr.10.1445573529892; Thu,
	22 Oct 2015 21:12:09 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.65.204 with HTTP; Thu, 22 Oct 2015 21:11:50 -0700 (PDT)
In-Reply-To: <80093b6693dad32322aba0119f466a76fc468c67.1445570852.git.randy.e.witt@linux.intel.com>
References: <cover.1445570852.git.randy.e.witt@linux.intel.com>
	<4b16c77c29407f38c4c17f5bddbaec2cd5339c82.1445570852.git.randy.e.witt@linux.intel.com>
	<80093b6693dad32322aba0119f466a76fc468c67.1445570852.git.randy.e.witt@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 22 Oct 2015 21:11:50 -0700
X-Google-Sender-Auth: jxNkreCW0THvIZlCd7vbSlExWAo
Message-ID: <CABcZAN=CGvq4Wmd_fZosRijgqTtfrcJAeG39T=VRc165sG=qsg@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] populate_sdk_base: Ensure PKGDATA_DIR exists
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
X-List-Received-Date: Fri, 23 Oct 2015 04:12:10 -0000
Content-Type: multipart/alternative; boundary=047d7b10ca7dbf03f80522bdd06c

--047d7b10ca7dbf03f80522bdd06c
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 22, 2015 at 8:30 PM, Randy Witt <randy.e.witt@linux.intel.com>
wrote:

> -do_populate_sdk[dirs] = "${TOPDIR}"
> +do_populate_sdk[dirs] = "${TOPDIR} ${PKGDATA_DIR}"
>

I hope do_populate_sdk doesn't care where it's run from, as this doesn't
just make sure the dir exists, it changes the dir the task runs in (the
last entry in dirs is the cwd of the task).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b10ca7dbf03f80522bdd06c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Oct 22, 2015 at 8:30 PM, Randy Witt <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:randy.e.witt@linux.intel.com" target=3D"_blank">randy.e.witt@linux.int=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
6hu" class=3D"a3s" style=3D"overflow:hidden">-do_populate_sdk[dirs] =3D &qu=
ot;${TOPDIR}&quot;<br>
+do_populate_sdk[dirs] =3D &quot;${TOPDIR} ${PKGDATA_DIR}&quot;</div></bloc=
kquote></div><br>I hope do_populate_sdk doesn&#39;t care where it&#39;s run=
 from, as this doesn&#39;t just make sure the dir exists, it changes the di=
r the task runs in (the last entry in dirs is the cwd of the task).<br>-- <=
br><div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth =
dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tsli=
b<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--047d7b10ca7dbf03f80522bdd06c--
