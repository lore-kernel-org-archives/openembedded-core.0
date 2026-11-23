Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58228.1795452963243669892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 08:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=fIRnzCBB;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2212561f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 08:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795452961; x=1796057761; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eS1R3PqCxhzZgDjLL5QtrfpX3bSp4P7trXwACtGOmT0=;
        b=fIRnzCBBth9aQNFqLtaSv8KLpjHQRSjzw5lobvk3GXuIhOTstYoK2ohZg1cWiY4oE5
         nMRXpFsx26ZPJqwkQCIWV8ji5PW02G4V3znE9Q2/OUzbWzS3iLBTSIBcsgZ0WqpV+oMH
         4jxwDbsV/vdD7kbXR2lJs0K3IHC+vV4Ud3sDPvSV2stEMWjNm4u8MfEx0Egf+Y01eLex
         /Ynr98SR+6RJPChI5umhUo60FZuDr9bTeo9vsyuPaqsYbb71V4Y3gPVZBZFsqjYBnnZb
         Oh6aUMlwO9a9GnqZzBGlya9eXOyYC3RpuX2u76QjdeiLSNbZu62rWrsFj0rnS6rX6j8U
         u5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452961; x=1796057761;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eS1R3PqCxhzZgDjLL5QtrfpX3bSp4P7trXwACtGOmT0=;
        b=I7QgqEz/58GlA7jnwPBMeFCJIAI2t98uuxI9Hz921OeCTFpxiRQXwRaNcMBBdRVwu8
         rOSUSxK2n4DCDV9vypYDe4Q+XUrCulqMKQzkY2s/7MISw5Jgo/VRzOkcCACxPPlRZpwj
         T2yPTDCcc5rm+OaFGN1DQEmbZX4ho0Tp35QSXpn4r4aG2WsgF2ijRTu4Eptd+FeXi5vR
         uhgrsfauMslTzEjEjOC3WdD6SFVtRSYpkSAMz85aK1Z8nMiVXW7RfbtlLFoNU+FSxdxt
         lDgGRs77J9r1Oz2lcpQTTMzGJh9dRVairn7qula4PiNTpNN+zxpDzg/8qzRM7LSmre9k
         mzyA==
X-Forwarded-Encrypted: i=1; AL+hErHv21aBst+6gn/MLOv19VFWKRDV/TdPvmUW7blIL2x2uhq3a8mfpyJYk7sDwUB+VrcInOZPQKYjUPGmPOCoF19JVA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+GuJhpqIZPbTJ0qzCeV6IqLiSJaPZKt0oSEHSrsich7o1CjvbZ
	qm5psYLFUAEPOQUK8o8mX/Aa3CPpwW3Eb0KiPHzvhD3Jk+ZkPYCuXPIuTF4OzmQDqn0=
X-Gm-Gg: AZFdTZeKXC2WBYyuxGLcVak8fhu2EG8OpF1ZaSi7VXejjKu4VRrtMGFPkv0a+b4V+we
	jqe3zjJ2pa9+2TLdRnawivlMuEHHvgcxuatrKvdi1sP0E12IkSTkKgJeFIT8tRICVKQMq0b6bev
	yrZibUJQKdtW48sEIUJEnjx5kZIHFMCA0lF3zZbCj6kUixLoVFZnqsEPIMExEBL2IzUiA0igh6k
	h2szBZtR5Yft5rj0I0PjVq+agcTWei3/w7qWfBCaTMcsPQbGsbQbLBD4ry94QCHmVJ1XirQEA3m
	kzKR5RWTJmyxp6LFr9SDkLRlqHtN8Ss7mytAfAHFiy4z8mXYswyFvLmmqLFytwt8u8zsgAQQXSx
	Vpvbis6NDPlUB0c8Eddrgx/gRLZaKDi4kIiXr6bt7QaMlfYVG3DFmCtFkaTQRG1fpP+IpgB2yd5
	UY0jLS0Zmt3irjb36jvK8bMfvNkAi/jRGYjaoUkPjND2ib1WZ5FgklxtF5uiVp04nc8tPAvqXlX
	iojDM0OjVmB8YNkVo0EDywWgC+2mQWbUq8/DPOO3wbxV5VKQ6cJawxsJMbdz0Tf55Zyeoj4UG52
	TFwjj1NXVCPOyJiQm6Vb9YNLJGaNrHaauYEcIItCkUAsNjNVt8Nm4aCvCCwcjMpf5GM4Aab2Sgv
	6ZifFTWsRaVIjGQ==
X-Received: by 2002:a05:6000:2997:10b0:4a4:d03b:ef34 with SMTP id ffacd0b85a97d-4abb0e46a3bmr18543187f8f.17.1795452961310;
        Mon, 23 Nov 2026 08:56:01 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm23035043f8f.32.2026.11.23.08.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:56:00 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 17:56:00 +0100
Message-Id: <DN2QYF5QP61I.3PF69TBZP70OB@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 10/12] curl: fix CVE-2026-87865
X-Mailer: aerc 0.20.0
References: <20261104073627.302002-1-dkelaiya@cisco.com>
 <20261104073627.302002-11-dkelaiya@cisco.com>
In-Reply-To: <20261104073627.302002-11-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 16:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250925

On Wed Nov 4, 2026 at 8:36 AM CET, Darsh Kelaiya -X (dkelaiya - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> Match hashed known_hosts entries against the requested host before
> selecting the host-key algorithm. Adapt the connection fields and
> SSH test fixture to curl 8.19.0.
>
> Include the upstream follow-up [3] to cache key types already absent
> for this host, avoiding repeated full-file scans introduced by [1].
> Keep both upstream commits in separate patches and retain test3500.
>
> Install test3500.pl into ptest so the hashed-host regression can run
> from the target package.
>
> [1] https://github.com/curl/curl/commit/323c184b6bdf5b1988a10c0a61560666e=
1588149
> [2] https://curl.se/docs/CVE-2026-87865.html
> [3] https://github.com/curl/curl/commit/dc055e8a9eefe65cf63cb0396668a37c0=
b7c474a
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../curl/curl/CVE-2026-87865_p1.patch         | 225 ++++++++++++++++++
>  .../curl/curl/CVE-2026-87865_p2.patch         |  89 +++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   4 +
>  3 files changed, 318 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865_p1.patc=
h
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865_p2.patc=
h
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-87865_p2.patch b/met=
a/recipes-support/curl/curl/CVE-2026-87865_p2.patch
> new file mode 100644
> index 00000000000..0bf7cfea3c6
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-87865_p2.patch
> @@ -0,0 +1,89 @@
> +From dc055e8a9eefe65cf63cb0396668a37c0b7c474a Mon Sep 17 00:00:00 2001
> +From: Bobbeh Rhino <bobbeh@rhino.Rhino>
> +Date: Tue, 8 Sep 2026 20:24:35 -0400
> +Subject: [PATCH] libssh2: skip repeat checkp() for already-absent hashed=
 key
> + types
> +
> +ssh_force_knownhost_key_type() called libssh2_knownhost_checkp() once
> +per hashed known_hosts entry, and each call itself rescans the whole
> +known_hosts set. Cache key types already confirmed absent for the
> +connecting host so repeat entries of the same type do not each trigger
> +another full scan. checkp() NOTFOUND for a given (host, port, type) is
> +independent of the key bytes passed in, so this is safe.
> +
> +Behavior for MATCH is unchanged, and only store->typemask is read
> +after a match, which is identical for any entry of the same type.
> +
> +Tests: runtests.pl 3500 1459 600, full SFTP/SCP keyword set (58/58),
> +checksrc.pl.
> +
> +Closes #22905
> +
> +CVE: CVE-2026-87865
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/dc055e8a9=
eefe65cf63cb0396668a37c0b7c474a]
> +
> +Backport Changes:
> +- Use curl 8.19.0's conn->host.name and conn->remote_port instead of
> +  conn->origin->hostname and conn->origin->port. The older connection
> +  has no origin pointer; preserve the -1 lookup port for port 22.
> +
> +(cherry picked from commit dc055e8a9eefe65cf63cb0396668a37c0b7c474a)
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>

Hello,

This _p2 has not been submitted for blacksail. Also, it's a perf
optimisation not a security/bug fix. So, I can't accept it (Unless the
perf issue creates a bug).

I suggest to resend this patch with p1 only. Beware, I plan to merge
some patches of this series.

Regards,
--=20
Yoann Congal
Smile ECS

