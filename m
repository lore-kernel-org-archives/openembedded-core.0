Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9455.1793360617157849534
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=fnwllfh3;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=DwV36rVF;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0C6811400174
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:43:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 30 Oct 2026 07:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793360616;
	 x=1793447016; bh=wW3i24brd6lYw3ld0ogUWkXM05cUYRiPqW4v/M1edXM=; b=
	fnwllfh3BAIcSpNdRn3buQPmlyI5ttfaAumOcz58AmyBo3HOrKkGNwy1VlWI8Cmq
	Rno4gN1Iz8pZtDBFxBxHwj62fvw0rYhHRRp+QIhGJlATA1kq0i4dut1a+iELkG0Y
	GT5ybx76SVUR8I6+2f9x4tVL7dAbM5Ron39RsrOaOwysazpma5TsVR067xr+TV2r
	p/niqqTtG0mksCY4WQ03IO7LhUwYSJOGOdmd6SyGibhhGHFrFa7PLSHRjvbaYela
	TP53GTwFLjshq86NlLC4u8qKktFiZCmdsNCwdoFqOope8aFegu6FZq7E0ZKJKWHE
	ET9zqg0R1BJci8LWqC3wVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793360616; x=1793447016; bh=w
	W3i24brd6lYw3ld0ogUWkXM05cUYRiPqW4v/M1edXM=; b=DwV36rVFyCNxAEz6V
	hoX1sQrW/mGiAX8GmSrEN52qiVIKsK2IXQBUtMCO9IWXo943EjD4xM7ZxSlB44oX
	d+v8MNMumDMtKxPLGoaMhnDc1SPfE8PX+l9Wu6W0XgL8dWCm8PmHUrDxpPbHzJoA
	5nwYq8bq/1s2wHYxJj5Y7J5Ojk90DRLc37Tc97SMm4L0BGgiQONP5UxAofgV/WGU
	Rgm4HOx/fZNtqJtw4GnNUvcnPlD3C8Pe//DR538F9LDOxj8FP3c9l7imt1QOLha6
	YsTlPn8HhAM+l15v1dSn1yPHLsSShrQKJnPUQqwDMxsJueq3ZibZok1QDZuri1OJ
	D2MSA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793360616; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:dp3JzCSqNJN53vHLfWctF/BBXNDMO8jVuSQvfl8XvlC5iCH
	fcWNJPy4TD12j1bpPqrTtQfBsqZfG/p83vCLEV6LnefZ2wHsx4RXfjJTa3AdmVze
	aE++XlsiQau2Q2qjaw6IgADH5EH0X0C+X2ZucxkEiD1aSwTODAGlgUMGyxGQUHZH
	5XHos7cEmqpmtfewBBBlmN3iacX2dtjzjiHTxUg43XPCaS+N1GkDCsFE/DLuoB+r
	zX1W93o+HKSfeRg0TYWejGQmHDRPqwy/zA0GVWGEiA18tFK87lCTujCNwjkIkPPB
	cXqUtO7r3GZ9rLJJwJ8LnMq+sAGm/rZ/tEM6KJQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:loDzo2LnrflkvwpdyESM7KKfpF2mTrNkX/try1lSc7U=:ksfIBakIMrC+TyCTYemTW1k1IozpRILFFhtSzOmivPU=;
X-ME-Sender: <xms:54LkavHdm9Y7wZlURKpfmgKugt79NMFfPtAL5qmoJtF3CK2iIkj44g>
    <xme:54LkaiWlg9q16MSuy4KyihK1JoLzIQWMG5pzX6IyHgLpgIUbA6DfT_VqvcoFbb31W
    sT-va56eZkVgDN4cysA6FR212l5yEupXdUo2HFrx3Y1L4hGP3rsyF8>
X-ME-Received: <xmr:54LkauyE0dik3iF6uDsiKKG7dsuIpWmsZOz86Eo51k8-MPbe-65bvvVCjVXM0VrICgc0epROnPJYNCftNfvGyYCKHcQCESv6ItAHTCk>
X-ME-Proxy-Cause: dmFkZTE/gXJlcHv7NQvGH/iOoHpp/4imL+YQWApa7GDKLYDsiLYGWOBhRdoNTtTBKhTjsT
    g0a7AXoHXSSHHLuJnJ+N61v3pKhKToC4IIllawZSqfJt2aHj05XZGjElZ5J+HQZmErGiPX
    Hfv+Vqa7cx1qZn+WEfKIVnmsUxGlbF0Hsp4M9rTvD/SeFZKVrf8YmgAsLqmTQvhHGKU7XS
    Iy0NmemV9+LN34RkdmgXRcxcURX2qczBhsRWUfbleSVaGr3+9zExjMyjFsXqhm9v7rxOyh
    xqruyahN4Vx3u/ROHdpLhsaug3qp1xCKNibzJhwJhJIUKNVceyk6nROFs47BRIymhEKTrW
    V/cSJg09LWsla48evwaiKhR/QHMJyfyBpIWFkW5p81/bBcvLcmg3YvAuI35NwG9thgVGh4
    TrdZlHX37bw429NvvK/dLvheQMWByIYtMk4QcAt6SO1+eAI7yjdMiKIdhysmrFrqQAgsRo
    veAX+XFxbrdVKkhAM8T/FmGhoH6VXqM5lEGtZsoZ/6UQBvInnIJftvD0tegPV9+pBLVez/
    7sUKQYExoO8+ivdKltWjanQe1HIj9/zP0rHCS3+0w6n7JwWpytSowb1JxIsjoet3db3GU0
    CnvW7db6jWbp6Lwm2kcF1ZUAORJgkt7dMI0GbPyUnWLQgRcDsI7c2IKWJwEw
X-ME-Proxy: <xmx:54LkaoPpC-h_0bIVrdTURfbOWM7HMsOJxUY5GPLk5uHTOtv9_3EU7w>
    <xmx:54Lkan6caEkPAouAKGx46Fz4pW-lxWa1sSaabkHt16TaXL6yJSpRjQ>
    <xmx:54LkahPB42Opq_v6pVhVhiMT0nPMNx3qoBiauFCysELLx5A1RhTwOQ>
    <xmx:54Lkatn5iHpcHPAIobi382o-JW06gpIhJBCO82HElFsVSDsAHZknuQ>
    <xmx:6ILkaoVVrmbPQJdSbit6BN06RUXyo3x4hyzyEtyXX82Om5rJvVl-FPJ8>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 07:43:35 -0400 (EDT)
Message-ID: <2d92a69b0b95fbc662687a1aaee1ac154d8198a8.camel@pbarker.dev>
Subject: Re: [PATCH] yocto-check-layer: don't skip entries when dropping
 invalid layers
From: Paul Barker <paul@pbarker.dev>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 30 Oct 2026 11:43:33 +0000
In-Reply-To: <20261029112443.1734921-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261029112443.1734921-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 11:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249031

On Thu, 2026-10-29 at 08:24 -0300, Vinicius Pedrosa wrote:
> The "Detected layers" loop removes invalid entries from the list it's
> iterating over. When two invalid layers are next to each other,
> removing the first one skips the second.
>=20
> A skipped entry without conf/layer.conf makes the dependency pass fail
> with KeyError: 'collections'. A skipped BSP+DISTRO entry isn't
> reported at all. If no other layer is left to test, the script exits 0.
>=20
> Iterate over a copy of the list so every entry gets checked. Keep
> removing from the original list, since dep_layers refers to that same
> list when --dependency isn't used.
>=20
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> ---
> Hit it on a layer that had a few subdirectories with an empty conf/ in
> them.
>=20
> Tested on master (fa83da7) with small synthetic layers, same tree and
> command before/after:
> - two adjacent dirs with an empty conf/: KeyError before; after, both
>   get the "ignoring" line and the real layer is tested
> - two adjacent BSP+DISTRO dirs only: exit 0 before, exit 1 after
> - valid layer + one stray conf/ dir: same test results before/after
>=20
> Applies to master-next too (offset 2), not tested there.
>=20
>  scripts/yocto-check-layer | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
> index 8c8b4db..a580a8f 100755
> --- a/scripts/yocto-check-layer
> +++ b/scripts/yocto-check-layer
> @@ -125,7 +125,7 @@ def main():
>          return 1
> =20
>      logger.info("Detected layers:")
> -    for layer in layers:
> +    for layer in layers[:]:

While this is technically correct, it's not immediately obvious what's
going on here unless you really know your Python details.

I'd prefer to move this to a validate_layers() function which logs the
errors and builds a new list of valid layers then returns it. Something
like:

    def validate_layers(layers):
        valid_layers =3D []
        for layer in layers:
            ...

        return valid_layers

Best regards,

--=20
Paul Barker

