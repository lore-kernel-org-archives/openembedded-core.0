Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id A1E2B79C5E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 23:29:20 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id b9-v6so4551261pls.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ni4OXMSPxSumgIeA8aWLKCD80pG5sI3d3n3xWx4toh8=;
	b=GJdv1ePaHVk1YNUplXl7ZweRCqeJT/ZzoW3E1x2bE5PgkTvQe3VL6s1EqL4oVhtnWt
	zfGKDttwRaKQoeE+6bySNfXt8qyRhjD7CT8b/hDC++ey/0L4zsRLQN0dQ8wr6/wyjTUE
	eew5Pi0aeuMBZK4qdCK29ox4Al35YhLiKiGVqN04HYmevjgiClhQwyPUjqTfDjvBw/U0
	/8BSoNhJIb5CB9o32DCu9DC/ZldqyXCHYUasHRG5ptEAj5PknucuMm7c2TF7iTO3BUCz
	R9VMrzDTKrOIuqi6++rSatrtS0lJ1qX7Epus6Nju70H7QCho51Ivcm+gIm7O1N7taL3z
	IRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=ni4OXMSPxSumgIeA8aWLKCD80pG5sI3d3n3xWx4toh8=;
	b=JmCk5t/06BzR95JYTTL0L7GGN+bDq4A6fCeQCFVi/ITYXuZEt0yN9bGZTVlYUe/lUb
	uFfj4VJ2Z/5ea5h5RqDBFUQaZyqHs7/UW4ts4nfhzZRkKMKLVYY0CM3hc5Aa9kjzLyOS
	Oai0odnDkL4EtkIqoa79uXPugKWXjeVwj9qVi6NalOWAvojXF60x3MmYJJR22fz3kspP
	dDPfrArv9p0XbwxXz4iFu+H9X7SCsRD+3hz+fiqW901iaxRiUbkG3jU9Q4qTHNN/fF5E
	ovp0E8fzf+djy5VzxYEi6pc4BHeSMQeRbxi8M2S+7MFe99R+4mF9ekcs8RxQ8Dh7cd7N
	cYVg==
X-Gm-Message-State: AGRZ1gIFxB47IUljltdlqrL4KSs2fmrNsUnv0tPPK4fmoQnxw14XOU5o
	0Q99xhnNYCRVtv49ENuoa+Q=
X-Google-Smtp-Source: AJdET5dyQDRz/nxo9iQv3vFreXTKtADv6WkCVK2wM4Pvdme4fo4Zhc0mOWmu7spDPL4sn5ARVw6KNA==
X-Received: by 2002:a17:902:8202:: with SMTP id
	x2-v6mr16273306pln.192.1540855761222; 
	Mon, 29 Oct 2018 16:29:21 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:3405:5320:ca09:da28?
	([2601:202:4180:c33:3405:5320:ca09:da28])
	by smtp.gmail.com with ESMTPSA id
	m7-v6sm26346046pgq.59.2018.10.29.16.29.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 16:29:20 -0700 (PDT)
To: grygorii tertychnyi <gtertych@cisco.com>,
	openembedded-core@lists.openembedded.org
References: <20181010162511.7273-1-gtertych@cisco.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d74ab63e-2b8b-015f-2fba-2c693d56b594@gmail.com>
Date: Mon, 29 Oct 2018 16:29:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181010162511.7273-1-gtertych@cisco.com>
Cc: xe-linux-external@cisco.com
Subject: Re: [PATCH v3 1/3] cve-report: add scripts to generate CVE reports
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
X-List-Received-Date: Mon, 29 Oct 2018 23:29:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Grygorii,

I was good to see you at OEDeM.

I have some feedback.

On 10/10/18 9:25 AM, grygorii tertychnyi via Openembedded-core wrote:
> cvert-foss - generate CVE report for the list of packages.
>   Analyze the whole image manifest to align with the complex
>   CPE configurations.
>
> cvert-update - update NVD feeds and store CVE structues dump.
>   CVE dump is a pickled representation of the cve_struct dictionary.
>
> cvert.py - python library used by cvert-* scripts.
>   NVD JSON Vulnerability Feeds https://nvd.nist.gov/vuln/data-feeds#JSO=
N_FEED
>
> Usage examples:
>
>   o Download CVE feeds to "nvdfeed" directory
>     % cvert-update nvdfeed
>   o Update CVE feeds and store a dump in a file
>     % cvert-update --store cvedump nvdfeed
>   o Generate a CVE report
>     % cvert-foss --feed-dir nvdfeed --output report-foss.txt cve-manife=
st
>   o (faster) Use dump file to generate a CVE report
>     % cvert-foss --restore cvedump --output report-foss.txt cve-manifes=
t
>   o Generate a full report
>     % cvert-foss --restore cvedump --show-description --show-reference =
\
>                  --output report-foss-full.txt cve-manifest report-foss=
-full.txt

The cve-manifest, I could not figure out a way to create this from the
above steps. I had your patches included when I did an image build then
I got the "report-foss-full.txt" created. I am guessing I missed some
steps somewhere. Can you clarify?

Also, is there a way to version the report file by image or standard
buildID so that I don't accidentally overwrite the txt file. Maybe a
future enhancement is to group the packages by layer. I ran this with
the meta-security layer and I now need to look up what packages belong
to what layer to go work on them.

Overall,=C2=A0 I like this implementation and seems to be=C2=A0 fast.

Thanks for the patches.

kind regards,

Armin

>
> Manifest example:
>
>   bash,4.2,CVE-2014-7187
>   python,2.7.35,
>   python,3.5.5,CVE-2017-17522 CVE-2018-1061
>
> Report example:
>
>     patched |  7.5 | CVE-2018-1061      | python | 3.5.5
>     patched | 10.0 | CVE-2014-7187      | bash | 4.2
>     patched |  8.8 | CVE-2017-17522     | python | 3.5.5
>   unpatched | 10.0 | CVE-2014-6271      | bash | 4.2
>   unpatched | 10.0 | CVE-2014-6277      | bash | 4.2
>   unpatched | 10.0 | CVE-2014-6278      | bash | 4.2
>   unpatched | 10.0 | CVE-2014-7169      | bash | 4.2
>   unpatched | 10.0 | CVE-2014-7186      | bash | 4.2
>   unpatched |  4.6 | CVE-2012-3410      | bash | 4.2
>   unpatched |  8.4 | CVE-2016-7543      | bash | 4.2
>   unpatched |  5.0 | CVE-2010-3492      | python | 2.7.35
>   unpatched |  5.3 | CVE-2016-1494      | python | 2.7.35
>   unpatched |  6.5 | CVE-2017-18207     | python | 3.5.5
>   unpatched |  6.5 | CVE-2017-18207     | python | 2.7.35
>   unpatched |  7.1 | CVE-2013-7338      | python | 2.7.35
>   unpatched |  7.5 | CVE-2018-1060      | python | 3.5.5
>   unpatched |  8.8 | CVE-2017-17522     | python | 2.7.35
>
> Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
> ---
>
> Changes in v3:
>  o better logging: cvert.py lib log messages are controlled by cvert-* =
scripts
>  o add more examples
>  o add short params ("-o" "--output", "-f", "--feed-dir", etc)
>  o fix double entries in manifest
>  o fix pylint warnings
>
>  scripts/cvert-foss   | 151 ++++++++++++++++
>  scripts/cvert-update |  79 +++++++++
>  scripts/cvert.py     | 473 +++++++++++++++++++++++++++++++++++++++++++=
++++++++
>  3 files changed, 703 insertions(+)
>  create mode 100755 scripts/cvert-foss
>  create mode 100755 scripts/cvert-update
>  create mode 100644 scripts/cvert.py
>
> diff --git a/scripts/cvert-foss b/scripts/cvert-foss
> new file mode 100755
> index 000000000000..00fbf2c0687b
> --- /dev/null
> +++ b/scripts/cvert-foss
> @@ -0,0 +1,151 @@
> +#!/usr/bin/env python3
> +#
> +# Copyright (c) 2018 by Cisco Systems, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify=

> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License al=
ong
> +# with this program; if not, write to the Free Software Foundation, In=
c.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +#
> +
> +""" Generate CVE report for the given CVE manifest
> +"""
> +
> +import sys
> +import textwrap
> +import argparse
> +import logging
> +import logging.config
> +import cvert
> +
> +def report_foss():
> +    """Generate CVE report"""
> +
> +    parser =3D argparse.ArgumentParser(
> +        formatter_class=3Dargparse.RawDescriptionHelpFormatter,
> +        description=3Dtextwrap.dedent("""
> +        Generate CVE report for the given CVE manifest.
> +        """),
> +        epilog=3Dtextwrap.dedent("""
> +        @ run examples:
> +
> +        # Download (update) NVD feeds in "nvdfeed" directory
> +        # and prepare the report for the "cve-manifest" file
> +        %% %(prog)s --feed-dir nvdfeed --output report-foss.txt cve-ma=
nifest
> +
> +        # Use existed NVD feeds in "nvdfeed" directory
> +        # and prepare the report for the "cve-manifest" file
> +        %% %(prog)s --offline --feed-dir nvdfeed --output report-foss.=
txt cve-manifest
> +
> +        # (faster) Restore CVE dump from "cvedump" (must exist)
> +        # and prepare the report for the "cve-manifest" file
> +        %% %(prog)s --restore cvedump --output report-foss.txt cve-man=
ifest
> +
> +        # Restore CVE dump from "cvedump" (must exist)
> +        # and prepare the extended report for the "cve-manifest" file
> +        %% %(prog)s --restore cvedump --show-description --show-refere=
nce --output report-foss.txt cve-manifest
> +
> +        @ manifest example:
> +
> +        bash,4.2,CVE-2014-7187
> +        python,2.7.35,
> +        python,3.5.5,CVE-2017-17522 CVE-2018-1061
> +
> +        @ report example output:
> +
> +        . patched | 10.0 | CVE-2014-7187      | bash | 4.2
> +        . patched |  7.5 | CVE-2018-1061      | python | 3.5.5
> +        . patched |  8.8 | CVE-2017-17522     | python | 3.5.5
> +        unpatched | 10.0 | CVE-2014-6271      | bash | 4.2
> +        unpatched | 10.0 | CVE-2014-6277      | bash | 4.2
> +        unpatched | 10.0 | CVE-2014-6278      | bash | 4.2
> +        unpatched | 10.0 | CVE-2014-7169      | bash | 4.2
> +        unpatched | 10.0 | CVE-2014-7186      | bash | 4.2
> +        unpatched |  4.6 | CVE-2012-3410      | bash | 4.2
> +        unpatched |  8.4 | CVE-2016-7543      | bash | 4.2
> +        unpatched |  5.0 | CVE-2010-3492      | python | 2.7.35
> +        unpatched |  5.3 | CVE-2016-1494      | python | 2.7.35
> +        unpatched |  6.5 | CVE-2017-18207     | python | 3.5.5
> +        unpatched |  6.5 | CVE-2017-18207     | python | 2.7.35
> +        unpatched |  7.1 | CVE-2013-7338      | python | 2.7.35
> +        unpatched |  7.5 | CVE-2018-1060      | python | 3.5.5
> +        unpatched |  8.8 | CVE-2017-17522     | python | 2.7.35
> +        """))
> +
> +    group =3D parser.add_mutually_exclusive_group(required=3DTrue)
> +    group.add_argument("-f", "--feed-dir", help=3D"feeds directory")
> +    group.add_argument("-d", "--restore", help=3D"load CVE data struct=
ures from file",
> +                       metavar=3D"FILENAME")
> +    parser.add_argument("--offline", help=3D"do not update from NVD si=
te",
> +                        action=3D"store_true")
> +    parser.add_argument("-o", "--output", help=3D"save report to the f=
ile")
> +    parser.add_argument("--show-description", help=3D'show "Descriptio=
n" in the report',
> +                        action=3D"store_true")
> +    parser.add_argument("--show-reference", help=3D'show "Reference" i=
n the report',
> +                        action=3D"store_true")
> +    parser.add_argument("--debug", help=3D"print debug messages",
> +                        action=3D"store_true")
> +
> +    parser.add_argument("cve_manifest", help=3D"file with a list of pa=
ckages, "
> +                        "each line contains three comma separated valu=
es: name, "
> +                        "version and a space separated list of patched=
 CVEs, "
> +                        "e.g.: python,3.5.5,CVE-2017-17522 CVE-2018-10=
61",
> +                        metavar=3D"cve-manifest")
> +
> +    args =3D parser.parse_args()
> +
> +    logging.config.dictConfig(cvert.logconfig(args.debug))
> +
> +    cve_manifest =3D {}
> +
> +    with open(args.cve_manifest, "r") as fil:
> +        for lin in fil:
> +            lin =3D lin.rstrip()
> +
> +            # skip empty lines
> +            if not lin:
> +                continue
> +
> +            product, version, patched =3D lin.split(",", maxsplit=3D3)=

> +
> +            if product in cve_manifest:
> +                cve_manifest[product][version] =3D patched.split()
> +            else:
> +                cve_manifest[product] =3D {
> +                    version: patched.split()
> +                }
> +
> +    if args.restore:
> +        cve_struct =3D cvert.load_cve(args.restore)
> +    elif args.feed_dir:
> +        cve_struct =3D cvert.update_feeds(args.feed_dir, args.offline)=

> +
> +    if not cve_struct and args.offline:
> +        parser.error("No CVEs found. Try to turn off offline mode or u=
se other file to restore.")
> +
> +    if args.output:
> +        output =3D open(args.output, "w")
> +    else:
> +        output =3D sys.stdout
> +
> +    report =3D cvert.generate_report(cve_manifest, cve_struct)
> +
> +    cvert.print_report(report,
> +                       show_description=3Dargs.show_description,
> +                       show_reference=3Dargs.show_reference,
> +                       output=3Doutput)
> +
> +    if args.output:
> +        output.close()
> +
> +
> +if __name__ =3D=3D "__main__":
> +    report_foss()
> diff --git a/scripts/cvert-update b/scripts/cvert-update
> new file mode 100755
> index 000000000000..3b3f5572a83c
> --- /dev/null
> +++ b/scripts/cvert-update
> @@ -0,0 +1,79 @@
> +#!/usr/bin/env python3
> +#
> +# Copyright (c) 2018 by Cisco Systems, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify=

> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License al=
ong
> +# with this program; if not, write to the Free Software Foundation, In=
c.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +#
> +
> +""" Update NVD feeds and store CVE blob locally
> +"""
> +
> +
> +import textwrap
> +import argparse
> +import logging
> +import logging.config
> +import cvert
> +
> +
> +def update_cvert():
> +    """Update CVE storage"""
> +
> +    parser =3D argparse.ArgumentParser(
> +        formatter_class=3Dargparse.RawDescriptionHelpFormatter,
> +        description=3Dtextwrap.dedent("""
> +        Update NVD feeds and store CVE blob locally.
> +        """),
> +        epilog=3Dtextwrap.dedent("""
> +        examples:
> +
> +        # Download NVD feeds to  "nvdfeed" directory.
> +        # If there are meta files in the directory, they will be updat=
ed
> +        # and only fresh archives will be downloaded
> +        %% %(prog)s nvdfeed
> +
> +        # Inspect NVD feeds in "nvdfeed" directory
> +        # and prepare a CVE dump python blob "cvedump".
> +        # Use it later as input for cvert-* scripts (for speeding up)
> +        %% %(prog)s --offline --store cvedump nvdfeed
> +
> +        # Download (update) NVD feeds and prepare the CVE dump
> +        %% %(prog)s --store cvedump nvdfeed
> +        """))
> +
> +    parser.add_argument("-d", "--store", help=3D"save CVE data structu=
res in file",
> +                        metavar=3D"FILENAME")
> +    parser.add_argument("--offline", help=3D"do not update from NVD si=
te",
> +                        action=3D"store_true")
> +    parser.add_argument("--debug", help=3D"print debug messages",
> +                        action=3D"store_true")
> +
> +    parser.add_argument("feed_dir", help=3D"feeds directory",
> +                        metavar=3D"feed-dir")
> +
> +    args =3D parser.parse_args()
> +
> +    logging.config.dictConfig(cvert.logconfig(args.debug))
> +
> +    cve_struct =3D cvert.update_feeds(args.feed_dir, args.offline)
> +
> +    if not cve_struct and args.offline:
> +        parser.error("No CVEs found in {0}. Try turn off offline mode.=
".format(args.feed_dir))
> +
> +    if args.store:
> +        cvert.save_cve(args.store, cve_struct)
> +
> +
> +if __name__ =3D=3D "__main__":
> +    update_cvert()
> diff --git a/scripts/cvert.py b/scripts/cvert.py
> new file mode 100644
> index 000000000000..f93b95c84965
> --- /dev/null
> +++ b/scripts/cvert.py
> @@ -0,0 +1,473 @@
> +#!/usr/bin/env python3
> +#
> +# Copyright (c) 2018 by Cisco Systems, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify=

> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License al=
ong
> +# with this program; if not, write to the Free Software Foundation, In=
c.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +#
> +
> +""" CVERT library: set of functions for CVE reports
> +"""
> +
> +
> +import os
> +import re
> +import sys
> +import json
> +import gzip
> +import pickle
> +import logging
> +import hashlib
> +import datetime
> +import textwrap
> +import urllib.request
> +import distutils.version
> +
> +
> +logging.getLogger(__name__).addHandler(logging.NullHandler())
> +
> +
> +def generate_report(manifest, cve_struct):
> +    """Generate CVE report"""
> +
> +    report =3D []
> +
> +    for cve in cve_struct:
> +        affected =3D set()
> +
> +        for conf in cve_struct[cve]["nodes"]:
> +            affected =3D affected.union(process_configuration(manifest=
, conf))
> +
> +        for key in affected:
> +            product, version =3D key.split(",")
> +            patched =3D manifest[product][version]
> +
> +            if cve in patched:
> +                cve_item =3D {"status": "patched"}
> +            else:
> +                cve_item =3D {"status": "unpatched"}
> +
> +            cve_item["CVSS"] =3D "{0:.1f}".format(cve_struct[cve]["sco=
re"])
> +            cve_item["CVE"] =3D cve
> +            cve_item["product"] =3D product
> +            cve_item["version"] =3D version
> +            cve_item["description"] =3D cve_struct[cve]["description"]=

> +            cve_item["reference"] =3D [x["url"] for x in cve_struct[cv=
e]["reference"]]
> +
> +            logging.debug("%9s %s %s,%s",
> +                          cve_item["status"], cve_item["CVE"],
> +                          cve_item["product"], cve_item["version"])
> +
> +            report.append(cve_item)
> +
> +    return sorted(report, key=3Dlambda x: (x["status"], x["product"], =
x["CVSS"], x["CVE"]))
> +
> +
> +def process_configuration(manifest, conf):
> +    """Recursive call to process all CVE configurations"""
> +
> +    operator =3D conf["operator"]
> +
> +    if operator not in ["OR", "AND"]:
> +        raise ValueError("operator {} is not supported".format(operato=
r))
> +
> +    operator =3D True if operator =3D=3D "AND" else False
> +    match =3D False
> +    affected =3D set()
> +
> +    if "cpe" in conf:
> +        match =3D process_cpe(manifest, conf["cpe"][0], affected)
> +
> +        for cpe in conf["cpe"][1:]:
> +            package_match =3D process_cpe(manifest, cpe, affected)
> +
> +            # match =3D match <operator> package_match
> +            match =3D operator ^ ((operator ^ match) or (operator ^ pa=
ckage_match))
> +    elif "children" in conf:
> +        product_set =3D process_configuration(manifest, conf["children=
"][0])
> +
> +        if product_set:
> +            match =3D True
> +            affected =3D affected.union(product_set)
> +
> +        for child in conf["children"][1:]:
> +            product_set =3D process_configuration(manifest, child)
> +            package_match =3D True if product_set else False
> +
> +            # match =3D match OP package_match
> +            match =3D operator ^ ((operator ^ match) or (operator ^ pa=
ckage_match))
> +
> +            if package_match:
> +                affected =3D affected.union(product_set)
> +
> +    if match:
> +        return affected
> +
> +    return ()
> +
> +
> +def process_cpe(manifest, cpe, affected):
> +    """Match CPE with all manifest packages"""
> +
> +    if not cpe["vulnerable"]:
> +        # ignore non vulnerable part
> +        return False
> +
> +    version_range =3D {}
> +
> +    for flag in ["versionStartIncluding",
> +                 "versionStartExcluding",
> +                 "versionEndIncluding",
> +                 "versionEndExcluding"]:
> +        if flag in cpe:
> +            version_range[flag] =3D cpe[flag]
> +
> +    # take only "product" and "version"
> +    product, version =3D cpe["cpe23Uri"].split(":")[4:6]
> +
> +    if product not in manifest:
> +        return False
> +
> +    if not version_range:
> +        if version =3D=3D "*":
> +            # ignore CVEs that touches all versions of package,
> +            # can not fix it anyway
> +            logging.debug('ignore "*" in %s', cpe["cpe23Uri"])
> +            return False
> +        elif version =3D=3D "-":
> +            # "-" means NA
> +            #
> +            # NA (i.e. "not applicable/not used"). The logical value N=
A
> +            # SHOULD be assigned when there is no legal or meaningful
> +            # value for that attribute, or when that attribute is not
> +            # used as part of the description.
> +            # This includes the situation in which an attribute has
> +            # an obtainable value that is null
> +            #
> +            # Ignores CVEs if version is not set
> +            logging.debug('ignore "-" in %s', cpe["cpe23Uri"])
> +            return False
> +        else:
> +            version_range["versionExactMatch"] =3D version
> +
> +    result =3D False
> +
> +    for version in manifest[product]:
> +        try:
> +            if match_version(version,
> +                             version_range):
> +                logging.debug("match %s %s: %s", product, version, cpe=
["cpe23Uri"])
> +                affected.add("{},{}".format(product, version))
> +
> +                result =3D True
> +        except TypeError:
> +            # version comparison is a very tricky
> +            # sometimes provider changes product version in a strange =
manner
> +            # and the above comparison just failed
> +            # so here we try to make version string "more standard"
> +
> +            if match_version(twik_version(version),
> +                             [twik_version(v) for v in version_range])=
:
> +                logging.debug("match %s %s (twiked): %s", product, twi=
k_version(version),
> +                              cpe["cpe23Uri"])
> +                affected.add("{},{}".format(product, version))
> +
> +                result =3D True
> +
> +    return result
> +
> +
> +def match_version(version, vrange):
> +    """Match version with the version range"""
> +
> +    result =3D False
> +    version =3D util_version(version)
> +
> +    if "versionExactMatch" in vrange:
> +        if version =3D=3D util_version(vrange["versionExactMatch"]):
> +            result =3D True
> +    else:
> +        result =3D True
> +
> +        if "versionStartIncluding" in vrange:
> +            result =3D result and version >=3D util_version(vrange["ve=
rsionStartIncluding"])
> +
> +        if "versionStartExcluding" in vrange:
> +            result =3D result and version > util_version(vrange["versi=
onStartExcluding"])
> +
> +        if "versionEndIncluding" in vrange:
> +            result =3D result and version <=3D util_version(vrange["ve=
rsionEndIncluding"])
> +
> +        if "versionEndExcluding" in vrange:
> +            result =3D result and version < util_version(vrange["versi=
onEndExcluding"])
> +
> +    return result
> +
> +
> +def util_version(version):
> +    """Simplify package version"""
> +    return distutils.version.LooseVersion(version.split("+git")[0])
> +
> +
> +def twik_version(version):
> +    """Return "standard" version for complex cases"""
> +    return "v1" + re.sub(r"^[a-zA-Z]+", "", version)
> +
> +
> +def print_report(report, width=3D70, show_description=3DFalse, show_re=
ference=3DFalse, output=3Dsys.stdout):
> +    """Print out final report"""
> +
> +    for cve in report:
> +        print("{0:>9s} | {1:>4s} | {2:18s} | {3} | {4}".format(cve["st=
atus"], cve["CVSS"],
> +                                                               cve["CV=
E"], cve["product"],
> +                                                               cve["ve=
rsion"]),
> +              file=3Doutput)
> +
> +        if show_description:
> +            print("{0:>9s} + {1}".format(" ", "Description"), file=3Do=
utput)
> +
> +            for lin in textwrap.wrap(cve["description"], width=3Dwidth=
):
> +                print("{0:>9s}   {1}".format(" ", lin), file=3Doutput)=

> +
> +        if show_reference:
> +            print("{0:>9s} + {1}".format(" ", "Reference"), file=3Dout=
put)
> +
> +            for url in cve["reference"]:
> +                print("{0:>9s}   {1}".format(" ", url), file=3Doutput)=

> +
> +
> +def update_feeds(feed_dir, offline=3DFalse, start=3D2002):
> +    """Update all JSON feeds"""
> +
> +    feed_dir =3D os.path.realpath(feed_dir)
> +    year_now =3D datetime.datetime.now().year
> +    cve_struct =3D {}
> +
> +    for year in range(start, year_now + 1):
> +        update_year(cve_struct, year, feed_dir, offline)
> +
> +    return cve_struct
> +
> +
> +def update_year(cve_struct, year, feed_dir, offline):
> +    """Update one JSON feed for the particular year"""
> +
> +    url_prefix =3D "https://static.nvd.nist.gov/feeds/json/cve/1.0"
> +    file_prefix =3D "nvdcve-1.0-{0}".format(year)
> +
> +    meta =3D {
> +        "url": "{0}/{1}.meta".format(url_prefix, file_prefix),
> +        "file": os.path.join(feed_dir, "{0}.meta".format(file_prefix))=

> +    }
> +
> +    feed =3D {
> +        "url": "{0}/{1}.json.gz".format(url_prefix, file_prefix),
> +        "file": os.path.join(feed_dir, "{0}.json.gz".format(file_prefi=
x))
> +    }
> +
> +    ctx =3D {}
> +
> +    if not offline:
> +        ctx =3D download_feed(meta, feed)
> +
> +        if not "meta" in ctx or not "feed" in ctx:
> +            return
> +
> +    if not os.path.isfile(meta["file"]):
> +        return
> +
> +    if not os.path.isfile(feed["file"]):
> +        return
> +
> +    if not "meta" in ctx:
> +        ctx["meta"] =3D ctx_meta(meta["file"])
> +
> +    if not "sha256" in ctx["meta"]:
> +        return
> +
> +    if not "feed" in ctx:
> +        ctx["feed"] =3D ctx_gzip(feed["file"], ctx["meta"]["sha256"])
> +
> +    if not ctx["feed"]:
> +        return
> +
> +    logging.debug("parsing year %s", year)
> +
> +    for cve_item in ctx["feed"]["CVE_Items"]:
> +        iden, cve =3D parse_item(cve_item)
> +
> +        if not iden:
> +            continue
> +
> +        if not cve:
> +            logging.error("%s parse error", iden)
> +            break
> +
> +        if iden in cve_struct:
> +            logging.error("%s duplicated", iden)
> +            break
> +
> +        cve_struct[iden] =3D cve
> +
> +    logging.debug("cve records: %d", len(cve_struct))
> +
> +
> +def ctx_meta(filename):
> +    """Parse feed meta file"""
> +
> +    if not os.path.isfile(filename):
> +        return {}
> +
> +    ctx =3D {}
> +
> +    with open(filename) as fil:
> +        for lin in fil:
> +            pair =3D lin.split(":", maxsplit=3D1)
> +            ctx[pair[0]] =3D pair[1].rstrip()
> +
> +    return ctx
> +
> +
> +def ctx_gzip(filename, checksum=3D""):
> +    """Parse feed archive file"""
> +
> +    if not os.path.isfile(filename):
> +        return {}
> +
> +    with gzip.open(filename) as fil:
> +        try:
> +            ctx =3D fil.read()
> +        except (EOFError, OSError):
> +            logging.error("failed to process gz archive %s", filename,=
 exc_info=3DTrue)
> +            return {}
> +
> +    if checksum and checksum.upper() !=3D hashlib.sha256(ctx).hexdiges=
t().upper():
> +        return {}
> +
> +    return json.loads(ctx.decode())
> +
> +
> +def parse_item(cve_item):
> +    """Parse one JSON CVE entry"""
> +
> +    cve_id =3D cve_item["cve"]["CVE_data_meta"]["ID"][:]
> +    impact =3D cve_item["impact"]
> +
> +    if not impact:
> +        # REJECTed CVE
> +        return None, None
> +
> +    if "baseMetricV3" in impact:
> +        score =3D impact["baseMetricV3"]["cvssV3"]["baseScore"]
> +    elif "baseMetricV2" in impact:
> +        score =3D impact["baseMetricV2"]["cvssV2"]["baseScore"]
> +    else:
> +        return cve_id, None
> +
> +    return cve_id, {
> +        "score": score,
> +        "nodes": cve_item["configurations"]["nodes"][:],
> +        "reference": cve_item["cve"]["references"]["reference_data"][:=
],
> +        "description": cve_item["cve"]["description"]["description_dat=
a"][0]["value"]
> +    }
> +
> +
> +def download_feed(meta, feed):
> +    """Download and parse feed"""
> +
> +    ctx =3D {}
> +
> +    if not retrieve_url(meta["url"], meta["file"]):
> +        return {}
> +
> +    ctx["meta"] =3D ctx_meta(meta["file"])
> +
> +    if not "sha256" in ctx["meta"]:
> +        return {}
> +
> +    ctx["feed"] =3D ctx_gzip(feed["file"], ctx["meta"]["sha256"])
> +
> +    if not ctx["feed"]:
> +        if not retrieve_url(feed["url"], feed["file"]):
> +            return {}
> +
> +        ctx["feed"] =3D ctx_gzip(feed["file"], ctx["meta"]["sha256"])
> +
> +    return ctx
> +
> +
> +def retrieve_url(url, filename=3DNone):
> +    """Download file by URL"""
> +
> +    if filename:
> +        os.makedirs(os.path.dirname(filename), exist_ok=3DTrue)
> +
> +    logging.debug("downloading %s", url)
> +
> +    try:
> +        urllib.request.urlretrieve(url, filename=3Dfilename)
> +    except urllib.error.HTTPError:
> +        logging.error("failed to download URL %s", url, exc_info=3DTru=
e)
> +        return False
> +
> +    return True
> +
> +
> +def logconfig(debug_flag=3DFalse):
> +    """Return default log config"""
> +
> +    return {
> +        "version": 1,
> +        "formatters": {
> +            "f": {
> +                "format": "# %(asctime)s %% CVERT %% %(levelname)-8s %=
% %(message)s"
> +            }
> +        },
> +        "handlers": {
> +            "h": {
> +                "class": "logging.StreamHandler",
> +                "formatter": "f",
> +                "level": logging.DEBUG if debug_flag else logging.INFO=

> +            }
> +        },
> +        "root": {
> +            "handlers": ["h"],
> +            "level": logging.DEBUG if debug_flag else logging.INFO
> +        },
> +    }
> +
> +
> +def save_cve(filename, cve_struct):
> +    """Save CVE structure in the file"""
> +
> +    filename =3D os.path.realpath(filename)
> +
> +    logging.debug("saving %d CVE records to %s", len(cve_struct), file=
name)
> +
> +    with open(filename, "wb") as fil:
> +        pickle.dump(cve_struct, fil)
> +
> +
> +def load_cve(filename):
> +    """Load CVE structure from the file"""
> +
> +    filename =3D os.path.realpath(filename)
> +
> +    logging.debug("loading from %s", filename)
> +
> +    with open(filename, "rb") as fil:
> +        cve_struct =3D pickle.load(fil)
> +
> +    logging.debug("cve records: %d", len(cve_struct))
> +
> +    return cve_struct


