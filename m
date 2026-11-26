Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15832.1795706112684435776
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 07:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=YpAlR/eN;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5029514f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 07:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795706111; x=1796310911; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Qv+rkSfgkcTwLGKuPYTYg2o/btTVHVbqM2wnddZ7Dg=;
        b=YpAlR/eNUYaNhk4OI/IfPBee8hPBjUeCVuPJP5J/bM8rzzocd5KbL7rPfcEW9QgaXu
         6XAJlMbcJllqRn1pfPFysRpJG1FUCjOPvxb9/61BwyySbFFypj+d7WY7UC8DWIDBXgVD
         WuY+iC4jqw9XdsXFfMu0y51ubI6keF8ht3OzGykNukU7p3au5f7TYRvVF8yt6rmFfnO/
         XvX+AgI+gZ/FJhO6db/baj4xdd2NlTlncOgXYdNujY8xk6K2zNkslAm63fnr2Wtwydw5
         cDUraR2yJANBMWWSu4CwcoWlQtCsmCN7sFzkENX7SwFKhd13eacmWHvh/fFTM1CxmsQY
         Rppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706111; x=1796310911;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Qv+rkSfgkcTwLGKuPYTYg2o/btTVHVbqM2wnddZ7Dg=;
        b=SqRlpkIy5cNoDI3Y8waiTf7KeXiHv6f1/8sbGKVTncBawVfX1zIeETlJjMr+r3/ucA
         yGCapRGtUIYFR+uckGGld+vdxTUHuHQkwZvLZi/qXTUD8lgpQen64APTx2Zzu/X8Drrg
         fd+TxGGSKOxXTHiOn7ip2nv/nt74hJQEs9gr8Ij3llPz4v9I9n1xmfYUY6FB8AOmvvdX
         SWS1mhXWZvO8PewqHx1hYjSqyfiRo7kET3oNMy3fwRA957e2xIj5iUcOEsFWSTsw8wW2
         SRspeho/bOJKwiBFvKSleO2oLiBiEePEGdGxkA0zdvrce9zCACnOnh/6wrKXvCCJ9Ns7
         LyoQ==
X-Forwarded-Encrypted: i=1; AL+hErGz1kx19JmjHUd1GyIQoHHWPyZp6j0ab1dQlWuVnLlvsOVj/MEc6LJpmpHKQisHOwxoaP7kX98vipOmzXbsQu15EQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/5cjV47SiSm2eveoMwd+qdbOqH1nDWvDDIjyxdIKuiY441Cv5F
	P2VjRSwyCGGCcC7cy1E1Orw8HfmdVNW7iZl04wNla0GMbsa2n8+nXEyrp49q7vWcWm8=
X-Gm-Gg: AZFdTZfTBhBJtfHbIYtN+mfbFnkh/oJVPRk34GrQwdIbwV7prtPTnIi7VTo5WSdC/3K
	SgrOEb6BuPM2ijEVPX5C8j0AcxA6xFK7hSIHG8TIC2TcC5DjP6hwsN+KOSCEYYFxUhQXLaMDotn
	d/BwNSzww+IStiw+Holk4sexh88VnrXt1RYMsAqzJG5FqREw3Rcgnxkg0VyywcsE4+mEBljg2Zw
	95+HAzc7Adm/kodGkIHgodiTSgp2o24I3qA6BhDwDFzh5y2Cqb3qjqJ0VexCTGG8ssC7XzhOIpm
	yW+H23S5Iw2dYxNjl1rdi7isvZXy/0yPYz5KnadT93If3JGkqrzEBlSmsPuMzoNwRI0IWa+loiz
	4qd6uJhafRIISWVmXCYZWpoRfugWMXeAgZbdnOsQf0WvAaX6KA+5MLXjl9VyCLjQG/aqysSVBuH
	45YRw9tl5DFmYr4BGWHg7BDnpGHQtjG2HeqUtmcO0UmjJg3l1R64w/Sn7ovzXLzRnMt/YWz5beI
	FfnbPOc9u3ixTjOWr92mbvmLeitJgWhIzmAlNbKymxL4rPA1kDzolZycyjvu6AjPaN0yZbw3Xtl
	LzuE40nrcfq40/AQwY27tzHKnOVI6BmbLq6ycF6BCrDiTYoklonjHTQLKsqhksQUNC0LWtM1YQk
	J1NXk8RkUR8iKkyOdfw==
X-Received: by 2002:a5d:584f:0:b0:4b9:8ac3:f5fa with SMTP id ffacd0b85a97d-4b98ac3f6d5mr11976408f8f.48.1795706110650;
        Thu, 26 Nov 2026 07:15:10 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa006c84c8cd12b797e5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:6c84:c8cd:12b7:97e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm39643616f8f.0.2026.11.26.07.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:15:10 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 16:15:09 +0100
Message-Id: <DN58OUJGUFE1.1NS2QSHQ709AG@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 1/2] cve-check: keep global CVE
 exclusions out of unrelated reports
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.tatrai.ext@siemens.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261120092309.4056817-1-peter.tatrai.ext@siemens.com>
 <20261120092309.4056817-2-peter.tatrai.ext@siemens.com>
In-Reply-To: <20261120092309.4056817-2-peter.tatrai.ext@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 15:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251314

Hello,

On Fri Nov 20, 2026 at 10:23 AM CET, Peter via openembedded-core Tatrai wro=
te:
> From: Peter Tatrai <peter.tatrai.ext@siemens.com>
>
> The Scarthgap SPDX 3.0 backport [1] did not bring over product
> filtering for CVE_STATUS assessments. The follow-up [2] made SPDX
> export all CVE_STATUS assessments, exposing the same problem in SPDX
> that already affected CVE-check reports.
>
> Global exclusion lists are loaded for every recipe. Without product
> filtering, assessments intended for one product can appear in the
> CVE-check and SPDX/VEX reports of unrelated packages.

Can you put an extracts/examples of that please? Like before/after this
patch?

That sounds like a good bug to fix but I need more details since the
backport is not trivial.

> Backport the scoped parser from OE-Core commit abca80a716e9 and the
> product matcher from 452e605b55ad as they appear in Wrynose. Preserve
> Scarthgap's tuple and set APIs and the behavior of unscoped entries.

I have no idea if that makes sense but I suspect this would be easier to
review if the 2 squashed commit were backported separately (one in each
scarthgap patch): That way, I could compare the merged wrynose ones
with yours.

If applicable, please split the 2 commits for the next iteration.

> [1] Scarthgap SPDX 3.0 backport:
> https://git.openembedded.org/openembedded-core/commit/?id=3D9c9b9545049a
> [2] Export all CVE_STATUS assessments:
> https://git.openembedded.org/openembedded-core/commit/?id=3D9a204670b1c0
>
> Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
> ---
>  meta/classes/vex.bbclass                  |  1 -
>  meta/lib/oe/cve_check.py                  | 76 ++++++++++++++++++++---
>  meta/lib/oe/spdx30_tasks.py               |  1 -
>  meta/lib/oeqa/selftest/cases/cve_check.py | 48 ++++++++++++++
>  4 files changed, 117 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
> index 97213ea..3c44dbb 100644
> --- a/meta/classes/vex.bbclass
> +++ b/meta/classes/vex.bbclass
> @@ -141,7 +141,6 @@ python do_generate_vex () {
>      for cve_id in (d.getVarFlags("CVE_STATUS") or {}):
>          mapping, detail, description =3D decode_cve_status(d, cve_id)
>          if not mapping or not detail:
> -            bb.warn(f"Skipping {cve_id} =E2=80=94 missing or unknown CVE=
 status")

Was this warn removal voluntary? If yes, then this should be explained
in the commit message.

>              continue
>          cve_data[cve_id] =3D {
>              "abbrev-status": mapping,
> diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> index 7c09b78..9620dc5 100644
> --- a/meta/lib/oe/cve_check.py
> +++ b/meta/lib/oe/cve_check.py
> @@ -227,22 +227,84 @@ def convert_cve_version(version):
> =20
>  def decode_cve_status(d, cve):
>      """
> -    Convert CVE_STATUS into status, detail and description.
> +    Convert a matching CVE_STATUS into status, detail and description.
> +
> +    Keep the Scarthgap tuple API for cve-check and existing SPDX consume=
rs.

While referencing scarthgap in the commit message is fair, I don't think
it's necessary in the code itself, where the "Scarthgap tuple API" is
simply the current API. And you won't document a change you won't make
in the code.

This looks like a LLM output. Please review our AI-Assisted Contribution
Policy[0] and update your contribution if that apply.

>      """
> -    status =3D d.getVarFlag("CVE_STATUS", cve)
> +    status =3D decode_cve_status_scoped(d, cve)
>      if not status:
>          return ("", "", "")
> +    # Scarthgap applies unscoped statuses even when CVE_PRODUCT is empty=
.

(Same: scarthgap reference in code)

> +    unscoped =3D status["vendor"] =3D=3D status["product"] =3D=3D "*"
> +    if not unscoped and not has_cve_product_match(status, d.getVar("CVE_=
PRODUCT") or ""):
> +        return ("", "", "")
> +    return (status["mapping"], status["detail"], status["description"])
> +
> +
> +def has_cve_product_match(detailed_status, products):
> +    """
> +    Check product/vendor match between detailed_status from decode_cve_s=
tatus and a string of
> +    products (like from CVE_PRODUCT)
> +    """
> +    for product in products.split():
> +        vendor =3D "*"
> +        if ":" in product:
> +            vendor, product =3D product.split(":", 1)
> +
> +        if (vendor =3D=3D detailed_status["vendor"] or detailed_status["=
vendor"] =3D=3D "*") and \
> +            (product =3D=3D detailed_status["product"] or detailed_statu=
s["product"] =3D=3D "*"):
> +            return True
> =20
> -    status_split =3D status.split(':', 1)
> -    detail =3D status_split[0]
> -    description =3D status_split[1].strip() if (len(status_split) > 1) e=
lse ""
> +    #if no match, return False
> +    return False
> =20
> +
> +def decode_cve_status_scoped(d, cve):
> +    """
> +    Convert CVE_STATUS into status, vendor, product, detail and descript=
ion.
> +    """
> +    status =3D d.getVarFlag("CVE_STATUS", cve)
> +    if not status:
> +        return {}
> +
> +    status_split =3D status.split(':', 4)
> +    status_out =3D {}
> +    status_out["detail"] =3D status_split[0]
> +    product =3D "*"
> +    vendor =3D "*"
> +    description =3D ""
> +    if len(status_split) >=3D 4 and status_split[1].strip() =3D=3D "cpe"=
:
> +        # Both vendor and product are mandatory if cpe: present, the syn=
tax is then:
> +        # detail: cpe:vendor:product:description
> +        vendor =3D status_split[2].strip()
> +        product =3D status_split[3].strip()
> +        description =3D status_split[4].strip()
> +    elif len(status_split) >=3D 2 and status_split[1].strip() =3D=3D "cp=
e":
> +        # Malformed CPE
> +        bb.warn(
> +            'Invalid CPE information for CVE_STATUS[%s] =3D "%s", not se=
tting CPE'
> +            % (cve, status)
> +        )
> +    else:
> +        # Other case: no CPE, the syntax is then:
> +        # detail: description
> +        description =3D status.split(':', 1)[1].strip() if (len(status_s=
plit) > 1) else ""
> +
> +    status_out["vendor"] =3D vendor
> +    status_out["product"] =3D product
> +    status_out["description"] =3D description
> +
> +    detail =3D status_out["detail"]
>      status_mapping =3D d.getVarFlag("CVE_CHECK_STATUSMAP", detail)
>      if status_mapping is None:
> -        bb.warn('Invalid detail "%s" for CVE_STATUS[%s] =3D "%s", fallba=
ck to Unpatched' % (detail, cve, status))
> +        bb.warn(
> +            'Invalid detail "%s" for CVE_STATUS[%s] =3D "%s", fallback t=
o Unpatched'
> +            % (detail, cve, status)
> +        )
>          status_mapping =3D "Unpatched"
> +    status_out["mapping"] =3D status_mapping
> =20
> -    return (status_mapping, detail, description)
> +    return status_out
> =20
>  def extend_cve_status(d):
>      # do this only once in case multiple classes use this
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 0e9c6fa..539901f 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -470,7 +470,6 @@ def _get_cves_info(d):
>      for cve_id in (d.getVarFlags("CVE_STATUS") or {}):
>          mapping, detail, description =3D oe.cve_check.decode_cve_status(=
d, cve_id)
>          if not mapping or not detail:
> -            bb.warn(f"Skipping {cve_id} =E2=80=94 missing or unknown CVE=
 status")

(same: undocumented warn() removal)

>              continue
>          yield cve_id, mapping, detail, description
>          patched_cves.discard(cve_id)
> diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/se=
lftest/cases/cve_check.py
> index 60cecd1..8cd5eb9 100644
> --- a/meta/lib/oeqa/selftest/cases/cve_check.py
> +++ b/meta/lib/oeqa/selftest/cases/cve_check.py
> @@ -11,6 +11,54 @@ from oeqa.utils.commands import bitbake, get_bb_vars
> =20
>  class CVECheck(OESelftestTestCase):
> =20
> +    def test_scoped_status(self):
> +        import bb
> +        from oe.cve_check import decode_cve_status, extend_cve_status, g=
et_patched_cves
> +        from unittest.mock import patch
> +
> +        d =3D bb.data.init()
> +        cve =3D "CVE-2020-0001"
> +        d.setVarFlag("CVE_CHECK_STATUSMAP", "fixed-version", "Patched")
> +        d.setVarFlag("CVE_CHECK_STATUSMAP", "ignored", "Ignored")
> +        d.setVarFlag("CVE_STATUS", cve, "fixed-version: cpe:oracle:berke=
ley_db: Fixed: see upstream")
> +        for product, expected in (
> +            ("oracle:berkeley_db", ("Patched", "fixed-version", "Fixed: =
see upstream")),
> +            ("other:berkeley_db", ("", "", "")),
> +            ("oracle:zlib", ("", "", "")),
> +            ("zlib:zlib oracle:berkeley_db", ("Patched", "fixed-version"=
, "Fixed: see upstream")),
> +        ):
> +            with self.subTest(product=3Dproduct):
> +                d.setVar("CVE_PRODUCT", product)
> +                self.assertEqual(decode_cve_status(d, cve), expected)
> +                with patch("oe.patch.src_patches", return_value=3D[]):
> +                    self.assertEqual(get_patched_cves(d), {cve} if expec=
ted[0] else set())
> +
> +        d.setVar("CVE_PRODUCT", "zlib")
> +        d.setVarFlag("CVE_STATUS", cve, "ignored: Existing unscoped reas=
on: unchanged")
> +        self.assertEqual(decode_cve_status(d, cve),
> +                         ("Ignored", "ignored", "Existing unscoped reaso=
n: unchanged"))
> +        d.setVar("CVE_STATUS_GROUPS", "SCOPED_GROUP")
> +        d.setVar("SCOPED_GROUP", cve)
> +        d.setVarFlag("SCOPED_GROUP", "status", "ignored: cpe:*:zlib: Mat=
ching group")
> +        extend_cve_status(d)
> +        self.assertEqual(decode_cve_status(d, cve), ("Ignored", "ignored=
", "Matching group"))
> +        d.setVar("CVE_PRODUCT", "glibc")
> +        self.assertEqual(decode_cve_status(d, cve), ("", "", ""))
> +
> +    def test_scoped_status_spdx(self):
> +        import bb
> +        import oe.spdx30_tasks
> +        from unittest.mock import patch
> +
> +        d =3D bb.data.init()
> +        d.setVar("CVE_PRODUCT", "zlib:zlib")
> +        d.setVarFlag("CVE_CHECK_STATUSMAP", "ignored", "Ignored")
> +        d.setVarFlag("CVE_STATUS", "CVE-2020-0001", "ignored: cpe:*:berk=
eley_db: Not zlib")
> +        d.setVarFlag("CVE_STATUS", "CVE-2020-0002", "ignored: cpe:*:zlib=
: Matches zlib")
> +        with patch("oe.patch.src_patches", return_value=3D[]):
> +            self.assertEqual(list(oe.spdx30_tasks._get_cves_info(d)),
> +                             [("CVE-2020-0002", "Ignored", "ignored", "M=
atches zlib")])
> +
>      def test_version_compare(self):
>          from oe.cve_check import Version
> =20

Regards,

[0]: https://docs.yoctoproject.org/dev/contributor-guide/ai-assisted-contri=
bution-policy.html
--=20
Yoann Congal
Smile ECS

