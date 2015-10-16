Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 89E3677128
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 02:18:59 +0000 (UTC)
Received: by iofl186 with SMTP id l186so110301093iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 19:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=jwJwIi88w2cpkMwzBq7vBNpRgCTnji/HjPj82Ga5pCs=;
	b=y8Hpmoty8DmOVPDH51pK5EtD4zS6voQYlfV6isb2bw603iL66e0OfVY8UTi6NcAp3n
	a2TJwAfFOX8NkijiWyUiVaZiSsdoZUsUKOekxDF1SdbZBfvxMtnnNA9pNYC81bnZI2f4
	P1wIgHVoHgUTLtwjrwVkWelz5D4TFujLnuF2MOfk//rouSi4GIN8Rtov5Ly7TXbKgGRo
	iuyMg4l9rAgQLPZwS7CA5tlHrOSn+OqB9h1qZzbb5BaOH3MEyzD6Hw9FHTTHa7Pfj8vA
	279x+Ic5EJIpPfC/LCeDMTU7yHdAENZNSe7s88gzInwC60TCtqtVGmyR5oKciWE6hTj+
	5UIw==
X-Received: by 10.107.38.210 with SMTP id m201mr12165739iom.98.1444961939572; 
	Thu, 15 Oct 2015 19:18:59 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.65.204 with HTTP; Thu, 15 Oct 2015 19:18:40 -0700 (PDT)
In-Reply-To: <1444957041-5419-1-git-send-email-psidhu@gateworks.com>
References: <1444957041-5419-1-git-send-email-psidhu@gateworks.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Thu, 15 Oct 2015 19:18:40 -0700
X-Google-Sender-Auth: pbCSEEM9_3UMvBEDQeaGh0uttcY
Message-ID: <CABcZAN=9huQJ2oT=1uK+2F3ME=+KBEHOkWv1qdhrYPHyf_P_Ww@mail.gmail.com>
To: Pushpal Sidhu <psidhu@gateworks.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iw: fix build path
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
X-List-Received-Date: Fri, 16 Oct 2015 02:19:02 -0000
Content-Type: multipart/alternative; boundary=001a114028181f64c305222f6b2b

--001a114028181f64c305222f6b2b
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 15, 2015 at 5:57 PM, Pushpal Sidhu <psidhu@gateworks.com> wrote:

> The source get's checked out into ${PN}-${PV}, not 'build'. Currently,
> building
> iw is broken because none of the source files are found.
>

First, this message doesn't make sense. You're implying that bitbake thinks
B is S, which it does not. Bitbake already knows the correct source tree
path. The S = you add here is redundant, ${PN}-${PV} is the default value
for S.

If iw was failing to build with a separate build directory from source,
you'd just need to remove B. That said, it's not, as far as I can tell. I
build iw every day as is and it works just fine building with a separate
build directory from source, so I suspect you have something wrong going on
in your environment.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a114028181f64c305222f6b2b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Oct 15, 2015 at 5:57 PM, Pushpal Sidhu <span dir=3D"ltr">&lt;<a href=3D=
"mailto:psidhu@gateworks.com" target=3D"_blank">psidhu@gateworks.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"overflow:hi=
dden">The source get&#39;s checked out into ${PN}-${PV}, not &#39;build&#39=
;. Currently, building<br>
iw is broken because none of the source files are found.<br></div></blockqu=
ote><div><br></div><div>First, this message doesn&#39;t make sense. You&#39=
;re implying that bitbake thinks B is S, which it does not. Bitbake already=
 knows the correct source tree path. The S =3D you add here is redundant, $=
{PN}-${PV} is the default value for S.</div><div><br></div><div>If iw was f=
ailing to build with a separate build directory from source, you&#39;d just=
 need to remove B. That said, it&#39;s not, as far as I can tell. I build i=
w every day as is and it works just fine building with a separate build dir=
ectory from source, so I suspect you have something wrong going on in your =
environment.<br></div></div>-- <br><div><div dir=3D"ltr">Christopher Larson=
<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus=
<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div></=
div>
</div></div>

--001a114028181f64c305222f6b2b--
