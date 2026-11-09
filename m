Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7368.1794234939175985746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 06:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=FbaVY/Gq;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=F38pnJ/Y;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 3E659EC0703
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Nov 2026 09:35:38 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 09 Nov 2026 09:35:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794234938;
	 x=1794321338; bh=95UtCjDD7XTcQsyOVk4wJ0g7nRou0LQXT8i5mTjh3j0=; b=
	FbaVY/GqmwKac9XExoPbg30YdstZXj1bJGPyMfBfkMXnRoiiJCsSiXF3uNFYMDz1
	DAPSG0g8+t6Jd146BhhRmFmNrS7zDL3HEbtmhMdA2xER2WDVlulPrvORJDmg0Zba
	sdlZiru83xN+zztcG7grEFrFw2gGzaIg86/Ivhc9qDc88iWF7Uen9xhM6JZLe7D5
	0FTi7jjFPCrJvBCPdWVzuS2x+TCpnj4sxI0xF+vaW1NK6DAiHNmTj+4Tcx3AORg3
	yOKkhNoxpWi7J2Khldv4UCItXgQPADrHx8lAimzxhveEypOsHpMjOOYmElB03uh3
	E/PucQSsIFWQawUByQM7Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794234938; x=1794321338; bh=9
	5UtCjDD7XTcQsyOVk4wJ0g7nRou0LQXT8i5mTjh3j0=; b=F38pnJ/YGMSZRzus/
	qAlzfI2aOTOS6XoOdX8j1EUIpabHW5KGJ5widX9cKK+s3yf9XPz6MGIUz+7GoCJ1
	tRw44hnf6h0nj/D8Uxfd7meC2uEjyRvDw3Cw67aByZd+vGJVyBVw+LTNVlyB7jV3
	cnLrmdGRBWhB9EhdW63klyIK+kAx40LBmtRUApzQ8fVZ9r6RbggJKkywvM3xckjT
	mQe7LKXKYFfcSziNDp9zTLrcIIEHvZyz+GdbQtrlAvRoV+s2xv39w5tjGw6n5hxo
	rdPDSnyaZRPHKuJTY+N/ac7O69hwPfb/6/iFlJqpah17c7fdCuT4RFvi2JfEL6rx
	LEEqQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794234938; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:oif+bR5YgIMoK/VJJy8CfHO9Fmyzpe9kLFn+32drDZiemAn
	d0oW9jQVRllCsbLRVn+hw+5UJEFcMnsWfHu4ifHayzBFk0Lkiv4VupiWTVb18yPN
	TkwmOK+7JraT+BQkxHcqRPpC45BdOQ3uPIrpXtxMybIWAoby9VLq2mrA4GMtIbDP
	I2L+fhU0cFIgjUUKfWt8mehXPUjGbCJ1c9L8KS84faMkd96LUalb53HE/SA/+RJO
	TNvE8J2sTKIjn91lcGXueZs0vtlh9nRlDyTuwBo7lxdykYTgXp9uREy5zOmNuDg9
	dSzI7fYCj9376IDK7hysD3CBsjdLf1Tcv8foiDQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:pEvnybC/KEK2p/jmjOmxQXT5whQdp2Nr7ZVd+VgIAiw=:vbwFHIlP+03tqL8lsLGIg1rYdYCzAcKkl8jhvApiGaM=;
X-ME-Sender: <xms:OtrxalQY2IfBVbMI4K97d27LVNPf9gnPR_S1llLad2eZFVKMyCM5ag>
    <xme:Otrxakxz4RqKl3Ev41ittR9rBvke1TMRkTipEy-o-QvVu6ZpV6-MGMLbnoXTM7ntV
    4LQ8if4sePzozNoR9jRDMzUqxMo8g7FfjNIHDr_qS5bkbDrdMixzI41>
X-ME-Received: <xmr:OtrxaodV7WW7voE06W_uz1CCDhUrubBwv0CVdraJhR4mU8olYyO-GDA9n4kCyUkNhHDn_zxL3DI8GCFGkuQS3nm8IuRd>
X-ME-Proxy-Cause: dmFkZTGrFmpoXIWm3T1Enpec//WnqyByaUJlWNZti968kE7Amlp8NvD2ddlVnJY8NJW7Xj
    xE2makLYnvONYKOUxh9Dlc74DfAXjD2AuWZJ+a0lvwH379BEES0HkwAVlE1XhGL5ymwhWU
    P3Oc8DEpIGg8LqpjaBNyhJ+2pZEvUP44VIfAtPdsdBEajmTtIb+Xk6BS0RtL/8BcepMkDk
    /AgxhL+4Ym/KMXPY4KaZWOh5zZa/SI+XnkwBHdkc8/JS/biIEGwMTZsBZGWSH+v63bxj5s
    442HV7Z+DdhHnci3KtmuD5eu+VQjw+sUnINvjqE7tw+1OhLgB6udIqPCa50uuWCER4/pLS
    yPs9Fwj0S0Tf0SiXywgztddSk31AirWU0ijV3CtfNxmFS986ECCl2DuCHgmT6B88h2q9mu
    YK9T8OLOeDR5dGKwC+/fFLTTBd5AIprgnoz3ouClbyQTHmL9UKLXTxidAT+L/QdvyCmTBM
    CVhYWGrJMw8BB8AKMfADTozCzb++4pOHQQu7WWGpBzix5/Z5PcaHCgZOTbVZ0Hw5dAWwhd
    K0iGVRqPa6UejebQGy4UM5jQANreB2aTgOetDvxECRU61qLUff46HSStGUeJa1dFyBoCXp
    N8MygaI9qwGjEnaI0yuAAQOu3XPAjSXalyJr7Fdo/ATNcqt5orE89McfVebA
X-ME-Proxy: <xmx:OtrxaoL9MrOnN9wLa4zK2Mh67ibnzhkRwdD3vQCps-IDs_-HbOhJow>
    <xmx:OtrxahE6F3a27-y3WlNNEVN4ikylpiUnpY5olfQGkJwJ-rIeMtihSw>
    <xmx:OtrxaqrqUglw8Hc3WKxK8jSTQtXsvriHl6nZrzGSoPjB21H2EYEurg>
    <xmx:OtrxaiRZbxOE_o3hp2JycOIYxxuefPgFyanZNEF74VgvWYo90u1VyA>
    <xmx:OtrxatpXXSYMX3CRhE2tQ6PgII9J3EIjSZRXPI-Y37NdOGxl89AvWaCh>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Nov 2026 09:35:37 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:35:36 +0000
Message-Id: <DMQR7AZ8MVK5.1JMXT8OT9QKQY@pbarker.dev>
Subject: Re: [PATCH v2 1/3] archiver.bbclass: archive shallow git sources
 which have no clone
From: "Paul Barker" <paul@pbarker.dev>
To: <ecordonnier@snap.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20261030174536.2724008-1-ecordonnier@snap.com>
 <20261030174536.2724008-2-ecordonnier@snap.com>
In-Reply-To: <20261030174536.2724008-2-ecordonnier@snap.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 14:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249853

On Fri Oct 30, 2026 at 5:45 PM GMT, ecordonnier wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> In the original mode, do_ar_original archives a source if the fetcher's
> localpath is a file, or a directory (which is unpacked and tarred). For g=
it,
> localpath is the clone in DL_DIR/git2. A shallow fetch (BB_GIT_SHALLOW) c=
an
> use the gitshallow tarball (ud.fullshallow) without creating the clone: s=
ince
> bitbake commit 457288b2f ("fetch2/git: Add support for fast initial shall=
ow
> fetch") this is what a shallow fetch does by default, and it also happens=
 when
> the shallow tarball is fetched from a mirror. In this case, the source wa=
s
> silently skipped and not archived at all.
>
> Treat this case like a directory source, as unpack() populates the
> directory from the shallow tarball. Use the same check as unpack()
> (clonedir_need_update()), so that the case of an out of date clone, where
> unpack() also uses the shallow tarball, is handled as well.
>
> AI-Generated: Claude Sonnet 5.5
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/classes/archiver.bbclass            |  8 +++-
>  meta/lib/oeqa/selftest/cases/archiver.py | 48 ++++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
> index 0400d6e373..f6cca35186 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -204,10 +204,16 @@ python do_ar_original() {
>      fetch =3D bb.fetch.Fetch(urls, ld)
>      tarball_suffix =3D {}
>      for url in fetch.urls:
> +        ud =3D fetch.ud[url]
>          local =3D fetch.localpath(url).rstrip("/");
> +        # A shallow git fetch which used the shallow tarball has no up t=
o date
> +        # clone, which is what localpath() points to. unpack() then uses=
 the
> +        # shallow tarball, using the same check as here.
> +        shallow =3D getattr(ud, 'shallow', False) and os.path.isfile(ud.=
fullshallow) \
> +                  and ud.method.clonedir_need_update(ud, ld)
>          if os.path.isfile(local):
>              shutil.copy(local, ar_outdir)
> -        elif os.path.isdir(local):
> +        elif os.path.isdir(local) or shallow:

Hi Etienne,

One question we had during the patch review call was whether the current
fetcher behaviour makes sense. Usually, localpath() exists once do_fetch
has completed, but in the case where we restore from a shallow mirror
tarball that isn't true. That is probably the thing we should fix.

So, instead of this approach, could we modify the fetcher to ensure that
localpath() exists when do_fetch completes? That would avoid the need
for special handling in the archiver bbclass.

Best regards,

--=20
Paul Barker

