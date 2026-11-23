Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50921.1795426260800118090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 01:31:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=Ydvu1x+N;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=LrKC8JVy;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1B7C77A0633
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 04:31:00 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 23 Nov 2026 04:31:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795426259;
	 x=1795512659; bh=fPnG7lyVV/KRXlpwPIv4KkRTfQAYkHvOcRWMs4gncEk=; b=
	Ydvu1x+NgzKQziHjolJ2wTmZGzoNmxMjAQiTXeqy3eLBFUmswgISa8L3uiLcKxca
	A7I7k7j7vVOE3bhzpJRpbbbVEM9cab5bXXgNEDhm+Z8GG3KpNxFENXVeBu1hiZJX
	RKF174HXYXvCA8oqPra+7HBMgnUel1WGLunbDE6k12g9A6ELTMTA9bTp0a+TeUl0
	QNcyI9IXnu4OW8Z3SOzOYBXlim6p0GDozkvkaLqoLM4zbyk7G4qP7kmbsFCpArLM
	QUckaITHwiwCd2zxygRi+csznwViKq+yrgMMBIoPz0Jt7lnFi2gW0/B7ioJXPHBR
	bbz4t6t3OllY8XDzlLH24w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795426259; x=
	1795512659; bh=fPnG7lyVV/KRXlpwPIv4KkRTfQAYkHvOcRWMs4gncEk=; b=L
	rKC8JVyoJhEreLNyWO3gl6EvshsjpVQL0Ypu3ntilPC6HKossU+8Ck6TWlhJLRoq
	YjhYoWQSqK3hnJf35C4xxrKdwm6rhTYRW2UFcmDHliEXoXW9K2U9+MA0rNFmjM5h
	7HNi5cleA4gLVN5qZL/dwd01OAmVBWQmIVPOqYAVf3AJg1PdiqWK0T5uI2yz8isu
	KcuOLWjtHenbE36vdw/SG4c3cqv39msqLqgFzlsI5PAq/n4SkrD+PEeCMESUHFHe
	ezJPUZgCRmf19VuYRzf/JyykhnSwDLv9dJtRMHBWbJMAyw1VS7NioVwsYgWkR4NF
	PPsl/rKgw8CTqozMZ2CNQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795426259; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:eVIu9EFlAL8cgTwL/4OqSsnuSkq+Q2KCr92cEzTtSalmhoh
	ktsXV9nT/Jtx9hhwLgpwVY9pmax0wlugKyo2oWQxlW0GJkv/I7zqY2nclm5QS9zN
	C8YB6g/jaTix1TFXDG03S5KmzUYfOSMeDqqHpohlTfC5QG9hOVDWZmQm/JcKGpNi
	yEXsviHYSI5WJpiPbd2iLSqHoZPQLneiPDR+AZ2lgrtDrWwpAuS9f0J7PgZH8mJO
	NragE6VMCkfx2viBURSZPSyY7igPQfGOxLnFtkH/EBHZy1ogI5PFN/ma4l5Xzp1m
	iRTSnin869XrTa0NajJ1dGUqt57WRpoZ7Q8JrGA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:VgVXUlu0mPBoHAt3XCk5JgBwamfiagybAll864jgmH0=:N/8FHfxAfmqG0xYrLt+aZrSzHlBC8GtUBHM2ws5RdtY=;
X-ME-Sender: <xms:0wcEa-2hvP7WUt61Z22J9FaBVQ4WZt0Zloz9hmO9D8gwYtAao_jdKQ>
    <xme:0wcEa4jXGW5MiWJMXH0-ojVTu8ZUXE4AF1LRSw66tERWiIrtibzk6a3zPFJHMK0FA
    sBuXCVrddkGBADkI0iuT_8rF3iTolfFUs3744Gfrn7FTIT6w1o8sIzg>
X-ME-Received: <xmr:0wcEa0T9gu48XKiB1ld2qjMaMlbZdvLTX6Ja7Z7eAiLUyiOZ8QjAqnc3NQ34g6ByBB4XHNP8yqFYLTu_yMcw1yb1BMp5>
X-ME-Proxy-Cause: dmFkZTExB/g2GAyCQGqEKo+VahkFMZ5wo+hGShO7T9LBtZ9fGTjPec20VS8iGWtU/TvMtd
    YDnWB/jn5Z59rVQqamao+uZ3faADiLryc4T41U/9rSqBRR5H4pZzADHdUyvjyuSexp5Nbq
    pFwl7NhenjpwfJwCvSxVKCrFlfPmn1OwmKiFExiVgWJA+fdTVEuN8aqDGR8KdoCdW5qWp1
    KlCbhGV8Gtln+fw+sTEZzXJ21VNWig1lsW4P8YgdiYJM+Pwh9g3OHdpl5qFGXJsrWXuep2
    u7obqvmhaS+vq/3EvcnETarUU6l4YPU7HdyXbVgrGnmu1JD2w+CAm4iI668Nc4Nmlbmdnl
    gB1uoX317JajhjrVb3bMJMu6KRSVDh6Apk0rDmRjc41s3imXJ4kLs3+b8MyRYY2fv2FL1Q
    v8+4/q7axcmOWwQWisS4Q8eg7Ms3PBsXzcEg+IBXO9Ksflfpe5/abWRS45k9RpvdrOQaBG
    HH+BpZJnPmvArU5yYkOIRqiHD1EA8pMazAfurZJjbbsQbF35jmHTWDOn2eG7093N/EgbtC
    ouIJ1iJFjHRbftO5owfXbo/+USk5odNoNCs3OazqVjQPTaJkkZ23gD5b+P0LJP4iTT8YCs
    VvfDkTYd7NH/6+zuD2v+CLTY40eDeo3RVVYLEYhi6+sprupR2Vs5eQ6wuf1w
X-ME-Proxy: <xmx:0wcEa5hxy5ip6SOzwk6FIWUYi_hOLgmUBcFNsrhiB4QyY0SEMYoUNQ>
    <xmx:0wcEa05pL8n5RSBCz-TawHmLoh5BpIOmCBzm_L3gfDRp4DLd-EGfkg>
    <xmx:0wcEa2BrRQTz1rn0u1gzPIpYuIvG_sVZh7Q9n6vV2V8MflnghZNZoQ>
    <xmx:0wcEa7YBWtoFAqk2jRBzFizbdcMmux0qsyhApQg9__VY4MOSfOE83Q>
    <xmx:0wcEazdhO18U3UT-uVLIz2WWxpjddHURnAzGy7IK-t62zCMHO_xR9iNE>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 04:30:59 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 09:30:58 +0000
Message-Id: <DN2HHOGYJB3B.1EWTJOMA10ROH@pbarker.dev>
Cc: "Ross Burton" <ross.burton@arm.com>
Subject: Re: [PATCH 2/2] recipetool: create: fix git URLs that only specify
 a tag
From: "Paul Barker" <paul@pbarker.dev>
To: "Babanpreet Singh" <bbnpreetsingh@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20261112035834.7-1-bbnpreetsingh@gmail.com>
 <20261112035834.7-2-bbnpreetsingh@gmail.com>
In-Reply-To: <20261112035834.7-2-bbnpreetsingh@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 09:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250891

On Thu Nov 12, 2026 at 3:58 AM GMT, Babanpreet Singh wrote:
> A git URL with tag=3D and no branch=3D fails with:
>
>   Unable to resolve '' in upstream git repository
>
> AUTOREV has no branch to follow now that bitbake no longer defaults to
> master. Fetch the tag itself, which also lets the branch be found from
> it.
>
> AI-Generated: Uses Claude (claude-fable-5-2)
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>

Hi,

The explanation in the commit message doesn't really make sense. The
issue with the test recipe created for matchbox-keyboard is that the
commit tagged as "0.1.1" isn't present on the default branch. This is
not true for all git URLs with "tag=3D..." and no "branch=3D...".

> ---
>
> Notes:
>     Tested with oe-selftest -r recipetool.RecipetoolCreateTests. Not trie=
d
>     on wrynose, which has the same code.
>
>  meta/lib/oeqa/selftest/cases/recipetool.py | 7 +++++++
>  scripts/lib/recipetool/create.py           | 4 ++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/s=
elftest/cases/recipetool.py
> index c278abdab2..804efcc755 100644
> --- a/meta/lib/oeqa/selftest/cases/recipetool.py
> +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
> @@ -811,6 +811,13 @@ class RecipetoolCreateTests(RecipetoolBase):
>          self._test_recipetool_create_git('git://git.yoctoproject.org/mat=
chbox-keyboard;branch=3Dmatchbox-keyboard-0-1;protocol=3Dhttps;tag=3D0.1.1'=
,
>                                           extravars=3D{'SRCREV': '630d890=
68dc0a1e9199306d405cb32f892dfa4d3'})
> =20
> +    def test_recipetool_create_git_srcuri_tag(self):
> +        # The 0.1.1 tag is only on the matchbox-keyboard-0-1 branch
> +        srcuri =3D 'git://git.yoctoproject.org/matchbox-keyboard;protoco=
l=3Dhttps;tag=3D0.1.1'
> +        self._test_recipetool_create_git(srcuri,
> +                                         extravars=3D{'SRC_URI': srcuri =
+ ';branch=3Dmatchbox-keyboard-0-1',
> +                                                    'SRCREV': '630d89068=
dc0a1e9199306d405cb32f892dfa4d3'})
> +
>      def _go_urifiy(self, url, version, modulepath =3D None, pathmajor =
=3D None, subdir =3D None):
>          modulepath =3D ",path=3D'%s'" % modulepath if len(modulepath) el=
se ''
>          pathmajor =3D ",pathmajor=3D'%s'" % pathmajor if len(pathmajor) =
else ''
> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/cr=
eate.py
> index 662e7a6232..0e73f462d3 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -520,6 +520,10 @@ def create_recipe(args):
>              storeTagName =3D params['tag']
>              params['nobranch'] =3D '1'
>              del params['tag']
> +            if srcrev =3D=3D '${AUTOREV}':
> +                # Nothing for ${AUTOREV} to resolve without a branch, so
> +                # fetch the tag itself
> +                srcrev =3D storeTagName

There is no situation where we are "without a branch". As the following
comment says, we assume we're on the "master" branch if the branch is
not specified.

>          # Assume 'master' branch if not set
>          if scheme in ['git', 'gitsm'] and 'branch' not in params and 'no=
branch' not in params:
>              params['branch'] =3D 'master'

Best regards,

--=20
Paul Barker

