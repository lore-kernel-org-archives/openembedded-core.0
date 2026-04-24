Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E3CFB44BE
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 06:45:28 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15714.1777013119062673771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 23:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CDJMV1Et;
 spf=pass (domain: smile.fr, ip: 209.85.221.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43d64313c39so5816851f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 23:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777013117; x=1777617917; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wr0sLBI6aN8eO4ZlufOclBwEgr6bcy3AUCDjeLbh+E=;
        b=CDJMV1EtOu84Qx9QdomwJyXXJpWNmvm93e42qz2OGzGA84dauukfHHVc2mkvqKjhAQ
         vQcYi8NjNxdmwbZLfIVq0wPneOpLNMbKVbQu1h7mSjuiyBZCllkYBSvixydfoAtKeQke
         B6JvlAD6HrCtqFm7cWxYbZQg1EAViPn3/R+m4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777013117; x=1777617917;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wr0sLBI6aN8eO4ZlufOclBwEgr6bcy3AUCDjeLbh+E=;
        b=LaiDd8QIWDknGhadOHJ3XQNiFeW19ZxRrN+CxFn0b5DZUbMtpea3MnNrsVD1i8/ks1
         OOqG3PrPDxedyXBMOVuSCQaHcpwMrwC/RDFQCfdV5n2TQf8QMzv73A/EqlQN8ZN1Xw8J
         /R8T0iZO0RokB0e1aVA7p9/f4sTV3gIvKc5M3N11Rc2/CJqwKqHysL2kAjDMhUR5lfJQ
         zXCF8KIhk65bmvtc/xbeGZ3tc4n3nJzpbTvH+PjZDGzBJ7dLL9Elyo3B/QEMoz/c8j3c
         dusBMUN4O7m6FlOwVbEH67tYiHlVr6E49OamwVGx3mGu/+fp1W+CIlX/nZZSXDSVP38q
         O2Lg==
X-Forwarded-Encrypted: i=1; AFNElJ+oAWrNEx1AmDYHyyqVlHGuvsns/3ozcCsxi/YjMFcs5KxW2ubhRDeA+AgILpHYm3ryXhNbhqDjtxhyrgH128ztZA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxCrgALgeW9e6RM7f/4rgZwePusTQqRStpvTeIroX/fEYMhn6VD
	QVPSTTo30fDl6vVdXjLVoG0SOUukuZ3E4AD9ctqa7m3nkYlGtrGg6JiZGqUVJTnEGj8=
X-Gm-Gg: AeBDievv9whk1XDPsY0Fx28YVGch6ZXKZRa2AcX+WqoKpW0bGNS1zsN0KUjxtUWaxHC
	94cwiCLpPZkkqdRGplEHa9ljdwntm+1rmjmBN76Sk/BaLW0I9rFN98Tlp+z8xainVKWgf7JIJOM
	58/8g7CCv4KZE0ksq06YZB9OqBmHMDylBXSYLS7N621QxXf1cb7N5F6ORwLaNHtS/0pRIOoUqx0
	85LhD0MAVezmCcV12cmDzRhEcbDMFLPhBSPiK1c9Z1edjdTuxhAmt5aUhBz4/wkuwyE0y0tVsDK
	phJYUq3cDRB6sapLCgWrPsVlfdKN9ycVT+tFJCGgBbYGGknQxCbuJ6XONSs74U2HBoZtrzmHr7f
	KrNB7vj11jkTvvQE18Wdu1x6vjLqE7Ah9IyHIxJOATYlTC8cI0jYvxmG8Xa6iwyo9R2zEZo9UN0
	hKuMhjydFsICdUokL7hFlujujKp51cf3/fCc0OdA6Eo+dgYb+fE6TFYX3pCoNKHxtTm3dgSkxmD
	T2hh1aH5QMmnfCwOFWmVsrGuA==
X-Received: by 2002:a05:6000:22ca:b0:43d:1dfe:350a with SMTP id ffacd0b85a97d-43fe3dfc019mr46863615f8f.22.1777013117003;
        Thu, 23 Apr 2026 23:45:17 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412e36ff8bsm9455159f8f.26.2026.04.23.23.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 23:45:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 08:45:15 +0200
Message-Id: <DI16KRN0V4A0.1I7P5Z5C5PG7S@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <Jinfeng.Wang.CN@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH 04/12] python3-ply: fix
 CVE-2025-56005
X-Mailer: aerc 0.20.0
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
 <20260409061639.1688205-5-jinfeng.wang.cn@windriver.com>
In-Reply-To: <20260409061639.1688205-5-jinfeng.wang.cn@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 06:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235837

On Thu Apr 9, 2026 at 8:16 AM CEST, Jinfeng (CN) via lists.openembedded.org=
 Wang wrote:
> From: Libo Chen <libo.chen.cn@windriver.com>
>
> According to [1], An undocumented and unsafe feature in the PLY (Python
> Lex-Yacc) library 3.11 allows Remote Code Execution (RCE) via the
> `picklefile` parameter in the `yacc()` function. This parameter accepts
> a `.pkl` file that is deserialized with `pickle.load()` without
> validation. Because `pickle` allows execution of embedded code via
> `__reduce__()`, an attacker can achieve code execution by passing a
> malicious pickle file. The parameter is not mentioned in official
> documentation or the GitHub repository, yet it is active in the PyPI
> version. This introduces a stealthy backdoor and persistence risk.
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-56005
>
> Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> ---
>  .../python/python3-ply/CVE-2025-56005.patch   | 125 ++++++++++++++++++
>  .../python/python3-ply_3.11.bb                |   4 +
>  2 files changed, 129 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-ply/CVE-2025-560=
05.patch
>
> diff --git a/meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patc=
h b/meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patch
> new file mode 100644
> index 0000000000..3f1e62b766
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patch
> @@ -0,0 +1,125 @@
> +From bfaebcc33a5af77f2701581638aa31a1bf918302 Mon Sep 17 00:00:00 2001
> +From: Libo Chen <libo.chen.cn@windriver.com>
> +Date: Tue, 27 Jan 2026 13:58:57 +0800
> +Subject: [PATCH] python3-ply: fix CVE-2025-56005
> +
> +Deprecate and disable the unsafe picklefile parameter and related
> +pickle serialization/deserialization functions to prevent RCE attacks.
> +
> +The picklefile parameter in yacc() now issues a DeprecationWarning
> +and is ignored. The read_pickle() and pickle_table() methods are
> +stubbed out to issue warnings and raise NotImplementedError, following
> +Python's standard practice for security-deprecated APIs.
> +
> +CVE: CVE-2025-56005
> +
> +Upstream-Status: Inactive-Upstream
> +
> +Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>

Hello,

The status of this patch is not clear: It is not mentionned in the NVD
report you linked. And there is an argument to reject the CVE:
https://github.com/tom025/ply_exploit_rejection/blob/main/README.md

In doubt (such as this), I'd rather leave the CVE applicable and let
downstream users that uses impacted code decide for themselves how they
want to handle this CVE.

> +---
> + ply/yacc.py | 72 +++++++++++++++++++++--------------------------------
> + 1 file changed, 28 insertions(+), 44 deletions(-)
> +
> +diff --git a/ply/yacc.py b/ply/yacc.py
> +index 88188a1..5103566 100644
> +--- a/ply/yacc.py
> ++++ b/ply/yacc.py
> +@@ -1998,31 +1998,15 @@ class LRTable(object):
> +         return parsetab._lr_signature
> +=20
> +     def read_pickle(self, filename):
> +-        try:
> +-            import cPickle as pickle
> +-        except ImportError:
> +-            import pickle
> +-
> +-        if not os.path.exists(filename):
> +-          raise ImportError
> +-
> +-        in_f =3D open(filename, 'rb')
> +-
> +-        tabversion =3D pickle.load(in_f)
> +-        if tabversion !=3D __tabversion__:
> +-            raise VersionError('yacc table file version is out of date'=
)
> +-        self.lr_method =3D pickle.load(in_f)
> +-        signature      =3D pickle.load(in_f)
> +-        self.lr_action =3D pickle.load(in_f)
> +-        self.lr_goto   =3D pickle.load(in_f)
> +-        productions    =3D pickle.load(in_f)
> +-
> +-        self.lr_productions =3D []
> +-        for p in productions:
> +-            self.lr_productions.append(MiniProduction(*p))
> +-
> +-        in_f.close()
> +-        return signature
> ++        import warnings
> ++        warnings.warn(
> ++            "read_pickle() is deprecated and disabled due to security v=
ulnerability CVE-2025-56005. "
> ++            "Pickle deserialization can lead to arbitrary code executio=
n. "
> ++            "This function is no longer supported.",
> ++            DeprecationWarning,
> ++            stacklevel=3D2
> ++        )
> ++        raise NotImplementedError("read_pickle() is disabled for securi=
ty reasons (CVE-2025-56005)")

And, also, this is quite a breaking change for a stable user using this
feature.

So, I can't accept this one. Sorry.

> +=20
> +     # Bind all production function names to callable objects in pdict
> +     def bind_callables(self, pdict):
> +@@ -2845,27 +2829,19 @@ del _lr_goto_items
> +     # pickle_table()
> +     #
> +     # This function pickles the LR parsing tables to a supplied file ob=
ject
> ++    # DEPRECATED: Disabled due to CVE-2025-56005
> +     # -----------------------------------------------------------------=
------------
> +=20
> +     def pickle_table(self, filename, signature=3D''):
> +-        try:
> +-            import cPickle as pickle
> +-        except ImportError:
> +-            import pickle
> +-        with open(filename, 'wb') as outf:
> +-            pickle.dump(__tabversion__, outf, pickle_protocol)
> +-            pickle.dump(self.lr_method, outf, pickle_protocol)
> +-            pickle.dump(signature, outf, pickle_protocol)
> +-            pickle.dump(self.lr_action, outf, pickle_protocol)
> +-            pickle.dump(self.lr_goto, outf, pickle_protocol)
> +-
> +-            outp =3D []
> +-            for p in self.lr_productions:
> +-                if p.func:
> +-                    outp.append((p.str, p.name, p.len, p.func, os.path.=
basename(p.file), p.line))
> +-                else:
> +-                    outp.append((str(p), p.name, p.len, None, None, Non=
e))
> +-            pickle.dump(outp, outf, pickle_protocol)
> ++        import warnings
> ++        warnings.warn(
> ++            "pickle_table() is deprecated and disabled due to security =
vulnerability CVE-2025-56005. "
> ++            "Pickle serialization can lead to arbitrary code execution =
when deserialized. "
> ++            "This function is no longer supported.",
> ++            DeprecationWarning,
> ++            stacklevel=3D2
> ++        )
> ++        raise NotImplementedError("pickle_table() is disabled for secur=
ity reasons (CVE-2025-56005)")
> +=20
> + # ---------------------------------------------------------------------=
--------
> + #                            =3D=3D=3D INTROSPECTION =3D=3D=3D
> +@@ -3225,7 +3201,15 @@ def yacc(method=3D'LALR', debug=3Dyaccdebug, modu=
le=3DNone, tabmodule=3Dtab_module, star
> +=20
> +     # If pickling is enabled, table files are not created
> +     if picklefile:
> +-        write_tables =3D 0
> ++        import warnings
> ++        warnings.warn(
> ++            "The 'picklefile' parameter is deprecated and disabled due =
to security vulnerability CVE-2025-56005. "
> ++            "Pickle deserialization can lead to arbitrary code executio=
n. "
> ++            "The parameter will be ignored and standard table files wil=
l be used instead.",
> ++            DeprecationWarning,
> ++            stacklevel=3D2
> ++        )
> ++        picklefile =3D None
> +=20
> +     if errorlog is None:
> +         errorlog =3D PlyLogger(sys.stderr)
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/reci=
pes-devtools/python/python3-ply_3.11.bb
> index a05bd6702d..41bcac2be8 100644
> --- a/meta/recipes-devtools/python/python3-ply_3.11.bb
> +++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
> @@ -8,6 +8,10 @@ LIC_FILES_CHKSUM =3D "file://README.md;beginline=3D5;end=
line=3D32;md5=3Df5ee5c355c0e6719
>  SRC_URI[md5sum] =3D "6465f602e656455affcd7c5734c638f8"
>  SRC_URI[sha256sum] =3D "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b09=
5321aef446081da3"
> =20
> +SRC_URI +=3D " \
> +    file://CVE-2025-56005.patch \
> +"
> +
>  inherit pypi setuptools3
> =20
>  RDEPENDS:${PN}:class-target +=3D "\


--=20
Yoann Congal
Smile ECS


