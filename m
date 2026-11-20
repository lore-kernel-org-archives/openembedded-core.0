Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4050.1795173844625781072
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 03:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=LvphKoWv;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=P4+oQOdM;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DA0387A035E
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 06:24:03 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 20 Nov 2026 06:24:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795173843;
	 x=1795260243; bh=+mc7ZvqUzzLx9GamYLfkz/fceszGxGKvMEkgMMuk8aQ=; b=
	LvphKoWvKq01sgTNWbeMhP8+6DH51JzJ1iTIkSJqGJHkUYhJII6w8foQXTU0W1WR
	ElpoxYFKFYggEv0fIk0fS9r0PftinQKUw07CEp/OFRRstlGvo5vAfowasOHpwM7k
	oHPCa2Pz0jh+nd1uJiYMyZBb+ti4TL6MF9Pq1QKOxwHuvgDHE5vXKNGBOC4EpeNs
	dQdQNEA7YUTXB5tX316XjlrJCwlcrIvJfzc3Lm7XPnD1b7cbPJUrfaVadJERcike
	kAxUdjNwLg329kLzdVzBnQYexd+vn3+i/j0VCaOQ2k1bMGZ32diVZvlwkyS0eDRB
	vkIjj+LpyZ06JtqogR+i5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795173843; x=1795260243; bh=+
	mc7ZvqUzzLx9GamYLfkz/fceszGxGKvMEkgMMuk8aQ=; b=P4+oQOdM6JyffzK9b
	gYSoScFxJnRkcyWuFZvH04Wm+ruHJ4TO1VrqH0rF33rEiySQhsoY3XrYdDAWqGNl
	GyFdXY0cwZUPdsvLCy/HJv/9gB182S4/X2HFq3uern/v76kpSrvxRrCiEz2lTqve
	qlXYLfwtbULYddOXiYJ75YX6aarPFvEsRhcYJknJEfADVDPqBi/6RBW3haqKvV9c
	JsuB4COyNT+65RnmWKXaOCgMPIGtFg6cl6fzuHKNLz3/2Hxjz9UI7uYPuVfN4ci1
	O3KpYLGqbL9MQaLmT/BsubZ4YA/OdF0yts1dkOxK1aQp9ENCTPK9sQdskKYebxhI
	rHgCA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795173843; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:phlxZ0Xgv6j3n7qHeTuV0nl3sKQb6hqUvJ6oVqsLpxfOl1g
	1flmo+eta3ZHGBmLbDeBmgvV3w3tNLIcln75Jr5ChAPV3FgqDwTJrkc8DGx9SJIC
	phK+UK5Djsi0bNsgWhb6ykmd5pTUP1MwYMC0UZFE5jXJPiO9P+k3GUIyLlcSDgJF
	4Nmsu5UV0oNmzWApKJ4Wg1rWrmU95tFJyW+iT3ohBxBQcHdv+2lbZyxRiC3uSiXI
	N3R0N0OYUGFWmcp89L3twoyNkopV1fLvcFBEzfoqg/TTD3QOXTBEkxRenVuUlGTT
	LjWuagToeCWd8iuSq9lEU9z6UGdWSgRKzu+IeTQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:N2NDQgqjfxgQ+Y/qJOtlv6bnGbwd4jY3S5EshYlrU1I=:hxFRFE6B4n2/PVkY+/8FQHpPrGlJFdXIJY2jkLj+plU=;
X-ME-Sender: <xms:0y0Aaw5VWKiWcAITOGo1Ohg8F_kUBkB7JTcEjCNbmOy9j0gc8Fvwcw>
    <xme:0y0Aa35qgm_WhmVIu3gCENeFUD8f_cT2gmJZLw6gkLc9RAYVU374kgqFV-0j6gWUb
    xyIbRhNTIE2qn1OI9hXDq4Q4xie23VlPn4KHGaOgPKsehIuODNjUIZi>
X-ME-Received: <xmr:0y0Aa9GBpUoSUk95XE7ST0l7Rbq8RwbuW_S_vqcPO5xQ9dtfFVOMHHfVFTEHOGZQTNpFkJo-_8E-fvp_NBfgWNjUqPoK>
X-ME-Proxy-Cause: dmFkZTGHWGcfIu2bL5Oe+5ouzgdfubwp0uf/sda2lBizaWdjUcz2325oRuNlvVeMq13O9l
    zQy3eijyvGBXqKKhqHiyRNZGRJ8z1Jh1nhJvtScM1ZBWG5+nCA50fPRjn61igvT0ZNwldC
    JDikxRDN+1ESzk0tntYz51BtSUV319hJ0A5WSrhDeEgQGurxo7ZXdmzGZwPtrb6pzYwnh8
    AnjuE3CtvOseUFlZJL42AeRQLL83t07XbwkChrEN+aLAMuhfcHX8W/qS+HK2xMZiMBbIGT
    4nFzvCCdaolg/g6ih4wfGvcvZwm9UvHw7TRWNnuhGYoFM9AMQxuxqD90ZbSu5dlUxZmxtc
    SQzJ7T1s8wWT9zIQLhshp9S81XhvAIV64PBGbuX7nH8l6rarVdvbs9rLLDPccq1UlsItH0
    0amFgF9SZuDyXZ3X1EmwmnmeZMsq4tHxOjna/nHySQW7zST0s0GTpiseQARRi5aJzcTzPu
    VKTGWRZgJxW+rM07iwoOTnEQN7R+1eN4zWwl/okYK/Lt24XEFftlZBvPOuF117dOTuUHSr
    if0YplO3des4/5Tqn9uJu91Ms5+36Qf6gcSzLJkOPj6uuy6WhdOYByUA6zZc21IC1oFZvt
    0TDPd7Jm28wwObdl6GPhZh3L/zYbxwzKKZBmpj9bKVDprIWtbBqsJcV145pA
X-ME-Proxy: <xmx:0y0AawRVoI0UWa_YIN51pImbl0XQ3ck_Y8Zzdgx4sqkIBfyWt0nmnw>
    <xmx:0y0Aa2tIHBuuigV1tFyBVrSE7xguEW98OhcAdBLno12iGcrhtxrgSA>
    <xmx:0y0Aa_ziVh5SnK1rmWBNbm-hRx44J7XEGfGXbd5XHa9cFNOJ_zG9dg>
    <xmx:0y0Aaw7A0Z7OGznKju5d-YiZKrXRrI8s26FmXTkxLRii_5PRf9IsEw>
    <xmx:0y0AawAoL3AvoDm4YzTzI0bl6-7xPqtDr2ODqqqFUJ6XqTaTbLQPkWrw>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 06:24:02 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 11:24:01 +0000
Message-Id: <DN000LWACEB0.1I4HB0QGTWT1X@pbarker.dev>
Subject: Re: [PATCH] lib/oe/gpg_sign.py: drop unsupported gpg-agent argument
 passing
From: "Paul Barker" <paul@pbarker.dev>
To: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20261111140027.69866-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20261111140027.69866-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 11:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250777

On Wed Nov 11, 2026 at 2:00 PM GMT, Adarsh Jagadish Kamini wrote:
> Passing auto-expand-secmem through --agent-program relies on GnuPG's
> unsupported regression test interface. Remove this use and leave agent
> configuration to the user, since the signing home directory is
> user-managed and an agent may already be running. Users can enable
> auto-expand-secmem in gpg-agent.conf to avoid secure-memory exhaustion
> during parallel signing.
>
> Tested with oe-selftest -r signing.
>
> [YOCTO #16480]
>
> AI-Generated: Uses Kiro (claude-opus-5.5)
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  meta/lib/oe/gpg_sign.py | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index ede6186c84..fec6fb27ea 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -18,12 +18,7 @@ class LocalSigner(object):
>          self.gpg_bin =3D d.getVar('GPG_BIN') or \
>                    bb.utils.which(os.getenv('PATH'), 'gpg')
>          self.gpg_cmd =3D [self.gpg_bin]
> -        self.gpg_agent_bin =3D bb.utils.which(os.getenv('PATH'), "gpg-ag=
ent")
> -        # Without this we see "Cannot allocate memory" errors when runni=
ng processes in parallel
> -        # It needs to be set for any gpg command since any agent launche=
d can stick around in memory
> -        # and this parameter must be set.
> -        if self.gpg_agent_bin:
> -            self.gpg_cmd +=3D ["--agent-program=3D%s|--auto-expand-secme=
m" % (self.gpg_agent_bin)]
> +        # Parallel signing may need auto-expand-secmem in gpg-agent.conf=
.
>          self.gpg_path =3D d.getVar('GPG_PATH')
>          self.rpm_bin =3D bb.utils.which(os.getenv('PATH'), "rpmsign")
>          self.gpg_version =3D self.get_gpg_version()
> @@ -43,7 +38,7 @@ class LocalSigner(object):
>          """Sign RPM files"""
> =20
>          cmd =3D self.rpm_bin + " --addsign --define '_gpg_name %s'  " % =
keyid
> -        gpg_args =3D '--no-permission-warning --batch --passphrase=3D%s =
--agent-program=3D%s|--auto-expand-secmem' % (passphrase, self.gpg_agent_bi=
n)
> +        gpg_args =3D '--no-permission-warning --batch --passphrase=3D%s'=
 % passphrase
>          if self.gpg_version > (2,1,):
>              gpg_args +=3D ' --pinentry-mode=3Dloopback'
>          cmd +=3D "--define '_gpg_sign_cmd_extra_args %s' " % gpg_args

Hi Adarsh,

I think we need to consider other ways to handle this. Dropping the
argument completely and leaving this up to users risks the user seeing
"Cannot allocate memory" errors without a clear and obvious explanation
of what to do to fix them.

Is there any way to detect if the running gpg-agent has the
auto-expand-secmem option enabled?

If we can't make this safe by default, perhaps we need to use a mutex so
that gpg signing processes run one at a time. If that has a significant
performance impact, we can provide an option to disable the mutex with
instructions on what the user needs to do to enable auto-expand-secmem.

I'm also open to other suggestions on how to handle this.

Thanks,

--=20
Paul Barker

