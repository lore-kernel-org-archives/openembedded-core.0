Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 582D07646E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 16:00:45 +0000 (UTC)
Received: by igfj19 with SMTP id j19so86571939igf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 09:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=q7LkS4mnlszR2WQb2gQ3S2lDApQ7xH7svK0WYqyhvko=;
	b=ZmS6YYu+xtk0hfAhINO1mGGhgV/pAy274YOTEqwJ60dWRwfTk9pdlkEV1G4pHqx73f
	oNY+54NYF4aFk7iOfThhqVK7Z/prfitKmbD54vw6WR2qD5M4/1ZfsCROTNUK731hwNxZ
	VCoSIxsZvPHkYPXM9ggUbJHI1u9gtM7H4jLbIg2eQ1ERjcv+ZXJB0qjMfvSVbFdeo7If
	iCF4G84cycvmvhN5C9ZqEP+inJBMOS/5Y5+6/KrienxKFOWgvNA4MtxkkgZgGcqtMXOz
	soM/2f6gjrnTCylWlwuc8f1BE9hJYADtTSzF/U3K2eY9ZuNEJ5hLaQERoq3e2Ol/tGX/
	GNXA==
X-Received: by 10.50.98.3 with SMTP id ee3mr24868596igb.10.1439913646113; Tue,
	18 Aug 2015 09:00:46 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.118.150 with HTTP; Tue, 18 Aug 2015 09:00:26 -0700 (PDT)
In-Reply-To: <CABcZANmjXndEm+OF8aKvSgHwkiOMuFgHrrJy97CYLpDNtZxCmg@mail.gmail.com>
References: <365E1805BC95084CBE82381A0B869994E73E4FE9@EU-MBX-03.mgc.mentorg.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CFA7F5@IRSMSX105.ger.corp.intel.com>
	<CAP71WjyESzCxJrJsxgSk0ZxnM8q0tQYU+CFmm-QVQGVouYWB+A@mail.gmail.com>
	<CABcZANkgxRSRA9afEaOD0cpeNzzSAti_Ef9D4V4ThoJkQzwmgg@mail.gmail.com>
	<CABcZANmjXndEm+OF8aKvSgHwkiOMuFgHrrJy97CYLpDNtZxCmg@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 18 Aug 2015 09:00:26 -0700
X-Google-Sender-Auth: EpX5xL2Iwo7UcX9D6_Ohx2uJeXk
Message-ID: <CABcZAN==rSZ2M4f_2-eZ5yvAaHV+k=rC8pgRju425151ijWMZw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: iw in place of wireless-tools
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
X-List-Received-Date: Tue, 18 Aug 2015 16:00:46 -0000
Content-Type: multipart/alternative; boundary=047d7b3a9498624aee051d9805c2

--047d7b3a9498624aee051d9805c2
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 18, 2015 at 8:53 AM, Christopher Larson <clarson@kergoth.com>
wrote:

> Bringing this back up again, as I think we really need to at the *very*
> least pull in iw from meta-oe into oe-core, and adjust packagegroup-base
> (worst case, with a VIRTUAL-RUNTIME), and better yet also drop
> wireless-tools / move it to meta-networking.


Worst case, we could keep both in VIRTUAL-RUNTIME for compatibility, as a
temporary measure, but I think we need to get iw into oe-core and into the
base images for sure.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b3a9498624aee051d9805c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Aug 18, 2015 at 8:53 AM, Christopher Larson <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Bringing this back up =
again, as I think we really need to at the *very* least pull in iw from met=
a-oe into oe-core, and adjust packagegroup-base (worst case, with a VIRTUAL=
-RUNTIME), and better yet also drop wireless-tools / move it to meta-networ=
king.</blockquote></div><br>Worst case, we could keep both in VIRTUAL-RUNTI=
ME for compatibility, as a temporary measure, but I think we need to get iw=
 into oe-core and into the base images for sure.<br>-- <br><div class=3D"gm=
ail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder =
- BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Softwar=
e Engineer, Mentor Graphics</div>
</div></div>

--047d7b3a9498624aee051d9805c2--
