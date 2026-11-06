Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4727.1793967820607775511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 04:23:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=imiZ6gCE;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=vpXfKuUd;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B046114000F1
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 07:23:39 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 06 Nov 2026 07:23:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793967819;
	 x=1794054219; bh=zYX1mXXYl6PW1TaG7QB6yR5H3f9ewtpLHnjST6b7+jA=; b=
	imiZ6gCEhpxIZ8PElX8l6Tn/R3nSw3vLI8r7wabE+XGBqwKKDaVnox7pGzDeva6/
	DS+HGHcg4dAaSHUOGm6+ukdl79RWLytVYK/tw3RVHo2l8n2mQqK+Mm8zU4MCU6Sb
	pZu9GAOgPWiWIAY9FD/1c8cbAA8Pw+xT1jh5qFST6+lKATAbbTKkrtptKH06AvQu
	iiPga+CcGM5uS7r0QsgoLJi+EUlBuvZnF69fYxgLhNBsa12T5CR41eYh0a6nYaDA
	E74fCwO49QToaLCPDCpvz8A/nx2Pj1zPNqHtzIjx8RvDVRE8ecLGFeAZCLddITyp
	gbfWvhS+DLg2pvRTj5BKhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1793967819; x=1794054219; bh=z
	YX1mXXYl6PW1TaG7QB6yR5H3f9ewtpLHnjST6b7+jA=; b=vpXfKuUdB64KDywkj
	JbuwLTSYG0BtEx1rLupxtEheS2WDgSBeqzLdH6+20Em1Ir5zdBuFCTYRSN/COGfa
	5KCqintpntvs/3J5U/bNTNk7aVRQ+59YvhqWw4oISN1eN0wl3ICxIg5zhpPX1BYE
	5UztYX6VTJXNciuMcvpvBR+EJ7ghmdo/oL+ftbeh4eD9uGRJU+rp92+BHNijn73N
	DuEcn3cx4c5F2V5XJR3YpAm9/BrKc90JDWBEvUVNA1NhRGX4HKsXA8dg+2Xxaj7T
	JtZPLNfx5/U3JvEmqHzgovnCbNrn0qMLj0n20UfY9NiAUSKyK6UR0sb2GUYe7qY/
	lsW8g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793967819; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:rxy5/EpiomkXafQvsqyV24Uqwki8cmZgnZCbT4vuyYYEuTJ
	ydaEQ6MLvmiSrdspG3oaod0ftZ7mh6FuAtCDQe2zwCjGz90HcCUzdrlW6VzsTiw3
	zul+VIuCTs7aeUdVfbL7bAk7SVjl6LQZoWUoLXDRKC+oHlFXLQWYfzOPJFPJlfv2
	VCR3C8uPeNK2a/T8keGBWCfhgq2HpnpdUcmK502FffYo4vcR5+VuGLtdA9ZY2Fd3
	TF/tkz1RJxzE3OKv+lYEhOStLqP/z9zPr22uSbHiHZMxutJbMYieKCFXTwuClQqt
	HbQQU7LzDk5nBNk9woEuUlTm6T5P09CjvW3t0yw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:wVonIf0v7NVZkpS43aGQMbaZUSkSFMGSTZBfr/xRdaI=:jgz6tGkScQjVTTVkxR3JxdI7NzEcDEGa5pgxoAesuYU=;
X-ME-Sender: <xms:y8btav5tDjJvi0u4o0Ru4J6HztgzpKL-c27FAcbdQa3cMmZyWfvwOA>
    <xme:y8btaq6osslAMylQubkSkNT6wzKUto5dUv2EV1sbD0l15wdDO2vkoeB_2Zqlb9Es4
    zwbyC3jh5BSEpfgg5ofP2JsYIbdvLmfItyyWc_Fn_e7FfhYr5bg6RCw>
X-ME-Received: <xmr:y8btakEcT_2enkibGAIkq8uMbdMyj7KKRZDN5bRsaqcpz5tnTH5tBlwB_C0zblDJ_gWD4iw-XWRzXqkpKBsTjcRC5SJ4>
X-ME-Proxy-Cause: dmFkZTGauNxRWYz5b3J3BZL9UKh7tvNo4lM7QgSSdWSEc7/MAaoRso6MJ8PS2E+DJXqHkI
    4ds0AeOoGMijtku/Ms02FFs5rHyCRWZYeCYRotKwRFwGF3NBRd4B22daEiBV3LIkYX5Ldk
    7Wyt0iHc+L9Gz9y+8Cxt4E1Y1CYwuiIicW8PeNMzdb1j6MzY6sj3Y6XabpsjgT6I7ZN3Nc
    KM5y4JdXpi8Cfln/UbAwIc3NSVpPn2YsA365fLKpuET5SLdcdO9fDDrA5mLsuZFwKKqBPJ
    4D4htFYiFfmW51EZ20IKlWKxs1rZ/cEa33rcKE9WWH9An/sH5+RW++nwfDRvyfafnPOTLG
    qNJvvrZVhscQFXzvlXo7tXixGtMnsK9sGumKnHxheg0078IpSvDUHLoU+0cO39GyvkIMIx
    C1jqkniZp+29MREDxeHs9Jd1mqE4SIukDamy8zXsqEmk7Js8r8EkpHiBEIfSTZHiU8lAnc
    eiFIjT/Zwlh1CTM4JrPLGwK1omnOmGcoWH4+8sIb/8mMwk8D9n8xELDiYg4jmRuRwdD/BR
    jleYiHfvdjvqWIOi5lDK02v0Bbj9Nlzm8heIDGiUASINFuoZtOzUML+9/grFq+17DGQOrb
    sGDhLCXocK0ZxoPYJlkmN17zGjMjFsZZttkgOk2z4fGNuY7u5wnasI5EZUiw
X-ME-Proxy: <xmx:y8btarS213-OzTiXSycyV0wOl_Sy8FQvFYPGL2Lli03T98M1z7Vzvw>
    <xmx:y8btalsAtayIf4E0QwdCxywy6wy-Z-RuETW8caIuf1acvuY9fU9F_A>
    <xmx:y8btaizU3gKf37veDPj_fBEDhldS2DP6qqxaO_iKW6LUpAom5sJ89w>
    <xmx:y8btan6RpAeks5Ie5wJZfmd95s7X3I4mfvuSIaQGnNIs4RCMxhH2ag>
    <xmx:y8btasXrpiy4qKq23wvWGI69Vz-_-2q5Z0Hg7t5Xy7PMuNoONUr9038t>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Nov 2026 07:23:39 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 12:23:38 +0000
Message-Id: <DMO4IMDLZZZ6.1IIXHMBALKRU3@pbarker.dev>
Subject: Re: [DRAFT PATCH v3 0/2] Add meta layer information to spdx
From: "Paul Barker" <paul@pbarker.dev>
To: "Daniel Wagenknecht" <dwagenknecht@emlix.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20260915130509.2184318-1-dwagenknecht@emlix.com>
 <20261106115455.4141199-1-dwagenknecht@emlix.com>
In-Reply-To: <20261106115455.4141199-1-dwagenknecht@emlix.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 12:23:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249640

On Fri Nov 6, 2026 at 11:54 AM GMT, Daniel Wagenknecht wrote:
> v3 of the patch series looking for feedback on the overall architecture. =
I
> worked out the problem in alias linking, so a major blocker is out of the=
 way.
>
> Please continue to consider this as a draft for discussion only!
>
> During discussion on IRC some questions were raised especially regarding =
the
> interaction with sstate caching.
> The layer information is only part of `create_spdx`, not `create_recipe_s=
pdx`.
> It is thus only added to the final image spdx documents, not to the indiv=
idual
> recipe or packagage spdx document. Images and their spdx documents are al=
ways
> rebuild, so with this approach no additional rebuilds occur even if a lay=
ers
> revision changes.
>
> My still open questions are:
> * is the overall architecture reasonable/correct?
> * referring to layers is inconsistent across tooling. E.g. the core layer=
 is
>   either named `core` as defined by `BBFILE_COLLECTIONS` or `meta` as tha=
t is
>   the layer directory in the openembedded-core repository.
>   I chose the latter since that is what the utility function
>   `oe.buildcfg.get_layer_revisions` returns. The package URL (PURL)
>   implementation uses the other naming scheme though. Any thoughts on whi=
ch
>   should be chosen and why?=20

Hi Daniel,

It's worth thinking about how this will interact with the proposed
changes to how layer.conf will work [1] [2]. That should hopefully
improve consistency in how layers are referred to across tools, but may
also impact other parts of these patches.

[1]: https://lists.openembedded.org/g/openembedded-architecture/topic/layer=
s_and_layer_conf_time/121884200
[2]: https://lists.openembedded.org/g/openembedded-architecture/topic/layer=
_changes_poc_and_rfc/122113105

Best regards,

--=20
Paul Barker

