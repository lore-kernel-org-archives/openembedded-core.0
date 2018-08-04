Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 89EEB78A8B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Aug 2018 08:56:18 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id b16-v6so639111oic.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Aug 2018 01:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=USPJRgF3+vLXjDHQOTwdoeqyE5tMrlsU9wednUBP7GM=;
	b=IQCOEKDFAo0ximrTyHFdzUi6JpoiBkciLLHbxApz3dMnF6ehfQB2nn4VBybD53fVok
	CJ7XaW3efF6orbApORFAdn9E/ifK/LJOuj2bgW7C4MNXCPLS8Drql4YW1mGM/wdfvl/n
	cNiUIXBTbzBbiT1iAW4QaTEEI4HIU6PmzFE9JXeosDUccbdVj5Fp8fEg6UjqrTLROApk
	Gu43tHbLFcKGlc40SRTrRZ39yALJQU60Doi24QKGAgAyBT0SFvij8/wiiz4buSUtSsFF
	I6M2PVTcm/+ViGTx3NjHV7yrO8e59lNeB1jaHgJGQ95hnYB5TDZl4cGM8+8b75lSblim
	OHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=USPJRgF3+vLXjDHQOTwdoeqyE5tMrlsU9wednUBP7GM=;
	b=fss8YD3nOuaCUMCEW6CHax+xywDVXCb0Nx7CvpxdDPOS1I/WlMv9x+/H/JLL/a2Xig
	Jv+chcSJP07tWvzqJtik4W/B1PWFN6GJf6JD32Hb8rcX9D4QE7gRrEk3PYxvyARrNyOP
	si5eEYmdxNZm5Y8SxQCBYin2Co1cQxwgj2t6gRajQiVs4Q06PKmeQLeRFSV+Odsx6lUo
	kK6AKmD/O6GPOSAvxChN0VjuSTDoOQHPI9np1PUw3tyDhGr0eNFw4mOwRkebwkoTlhwP
	32y7rjWZqgYVV+0OY6+ezXFvS3rb+cl5FLbWO4WzN/lTj7F278/VmPzkpSGTkw0yJpXs
	VrIA==
X-Gm-Message-State: AOUpUlHHLCLXJGz+RqtI575j1V8X0NHlP1EOx0H9ibjtBMPuxCJh0BcL
	rBPeqkGJwI2vpIc4NHrOnEuCIqeJF+Aph4ZNfKw=
X-Google-Smtp-Source: AAOMgpdqeEfJtI+UTeuq5gnIHmkimq2owL9r/h4VxydzgOyjvMjwRrR+8U/Qxphj6Oku06WXNoBPD779dUnmx8HerHU=
X-Received: by 2002:aca:4782:: with SMTP id
	u124-v6mr6914388oia.45.1533372979101; 
	Sat, 04 Aug 2018 01:56:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP;
	Sat, 4 Aug 2018 01:56:18 -0700 (PDT)
In-Reply-To: <1533335883158.4719@cisco.com>
References: <1533335883158.4719@cisco.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 4 Aug 2018 10:56:18 +0200
Message-ID: <CANNYZj8Kfk215Qgh+tNaeGnqAjSEy2tinRLFbyTq8SWt=mkdww@mail.gmail.com>
To: "Grygorii Tertychnyi (gtertych)" <gtertych@cisco.com>
Cc: "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] cve-report: add scripts to generate CVE reports
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
X-List-Received-Date: Sat, 04 Aug 2018 08:56:18 -0000
Content-Type: text/plain; charset="UTF-8"

How reliable is NVD database for such automated scans? Previously, we
have repeatedly concluded that it should not be trusted, and proper
patching of vulnerabilities must involve humans looking at
vulnerability reports and making appropriate decisions - same as
Debian is doing for example.

Alex

2018-08-04 0:37 GMT+02:00 Grygorii Tertychnyi (gtertych) via
Openembedded-core <openembedded-core@lists.openembedded.org>:
> cvert-kernel - generate CVE report for the Linux kernel.
>   NVD entries for the Linux kernel is almost always outdated.
>   For example, https://nvd.nist.gov/vuln/detail/CVE-2018-1065
>   is shown as matched for "versions up to (including) 4.15.7",
>   however the patch 57ebd808a97d has been back ported for 4.14.
>   cvert-kernel script checks NVD Resource entries for the patch URLs
>   and looking for the commits in the local git tree.
>
> cvert-foss - generate CVE report for the list of packages.
>   It analyzes the whole image manifest to align with the complex
>   CPE configurations.
>
> cvert-update - only update NVD feeds and store CVE blob locally.
>   CVE blob is a pickled representation of the cve_struct dictionary.
>
> cvert.py - python module used by all cvert-* scripts.
>   Uses NVD JSON Vulnerability Feeds https://nvd.nist.gov/vuln/data-feeds#JSON_FEED
>
> Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
> ---
>  scripts/cvert-foss   | 109 ++++++++++++++
>  scripts/cvert-kernel | 157 +++++++++++++++++++
>  scripts/cvert-update |  64 ++++++++
>  scripts/cvert.py     | 418 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 748 insertions(+)
>  create mode 100755 scripts/cvert-foss
>  create mode 100755 scripts/cvert-kernel
>  create mode 100755 scripts/cvert-update
>  create mode 100644 scripts/cvert.py
>
> diff --git a/scripts/cvert-foss b/scripts/cvert-foss
> new file mode 100755
> index 0000000..a0cc6ad
> --- /dev/null
> +++ b/scripts/cvert-foss
> @@ -0,0 +1,109 @@
> +#!/usr/bin/env python3
> +#
> +# Generate CVE report for the list of packages.
> +#
> +# Copyright (c) 2018 Cisco Systems, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License along
> +# with this program; if not, write to the Free Software Foundation, Inc.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +#
> +
> +import sys
> +import cvert
> +import textwrap
> +import argparse
> +
> +def report_foss(filename, cve_struct):
> +    packagelist = {}
> +
> +    with open(filename, 'r') as fil:
> +        for lin in fil:
> +            product, version, patched = lin.split(',', maxsplit=3)
> +
> +            if product in packagelist:
> +                packagelist[product][version] = patched.split()
> +            else:
> +                packagelist[product] = {
> +                    version: patched.split()
> +            }
> +
> +    return cvert.match_cve(packagelist, cve_struct)
> +
> +
> +if __name__ == '__main__':
> +    parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,
> +                                     description=textwrap.dedent('''
> +                                     Generate CVE report for the list of packages.
> +                                     '''),
> +                                     epilog=textwrap.dedent('''
> +                                     examples:
> +
> +                                     # Download (update) NVD feeds in "nvdfeed" directory
> +                                     # and prepare the report for the "package.lst" file
> +                                     %% %(prog)s --feed-dir nvdfeed --output report-foss.txt package.lst
> +
> +                                     # Use existed NVD feeds in "nvdfeed" directory
> +                                     # and prepare the report for the "package.lst" file
> +                                     %% %(prog)s --offline --feed-dir nvdfeed --output report-foss.txt package.lst
> +
> +                                     # (faster) Restore CVE dump from "cvedump" (must exist)
> +                                     # and prepare the report for the "package.lst" file
> +                                     %% %(prog)s --restore cvedump --output report-foss.txt package.lst
> +
> +                                     # Restore CVE dump from "cvedump" (must exist)
> +                                     # and prepare the extended report for the "package.lst" file
> +                                     %% %(prog)s --restore cvedump --show-description --show-reference --output report-foss.txt package.lst
> +                                     '''))
> +
> +    group = parser.add_mutually_exclusive_group(required=True)
> +    group.add_argument('--feed-dir', help='feeds directory')
> +    group.add_argument('--restore', help='load CVE data structures from file',
> +                        metavar='FILENAME')
> +
> +    parser.add_argument('--offline', help='do not update from NVD site',
> +                        action='store_true')
> +    parser.add_argument('--output', help='save report to the file')
> +    parser.add_argument('--show-description', help='show "Description" in the report',
> +                        action='store_true')
> +    parser.add_argument('--show-reference', help='show "Reference" in the report',
> +                        action='store_true')
> +
> +    parser.add_argument('package_list', help='file with a list of packages, '
> +                        'each line contains three comma separated values: name, '
> +                        'version and a space separated list of patched CVEs.',
> +                        metavar='package-list')
> +
> +    args = parser.parse_args()
> +
> +    if args.restore:
> +        cve_struct = cvert.load_cve(args.restore)
> +    elif args.feed_dir:
> +        cve_struct = cvert.update_feeds(args.feed_dir, args.offline)
> +
> +    if not cve_struct and args.offline:
> +        parser.error('No CVEs found. Try to turn off offline mode or use other file to restore.')
> +
> +    if args.output:
> +        output = open(args.output, 'w')
> +    else:
> +        output = sys.stdout
> +
> +    report = report_foss(args.package_list, cve_struct)
> +    cvert.print_report(report,
> +                       show_description=args.show_description,
> +                       show_reference=args.show_reference,
> +                       output=output
> +    )
> +
> +    if args.output:
> +        output.close()
> diff --git a/scripts/cvert-kernel b/scripts/cvert-kernel
> new file mode 100755
> index 0000000..446c7b2
> --- /dev/null
> +++ b/scripts/cvert-kernel
> @@ -0,0 +1,157 @@
> +#!/usr/bin/env python3
> +#
> +# Generate CVE report for the Linux kernel.
> +# Inspect Linux kernel GIT tree and find all CVE patches commits.
> +#
> +# Copyright (c) 2018 Cisco Systems, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License along
> +# with this program; if not, write to the Free Software Foundation, Inc.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +#
> +
> +import re
> +import cvert
> +import argparse
> +import textwrap
> +import subprocess
> +
> +
> +def report_kernel(cve_struct, kernel_dir, kernel_ver=None):
> +    oneline = subprocess.check_output(['git', 'log',
> +                                       '--format=%s'],
> +                                      cwd=kernel_dir,
> +                                      stderr=subprocess.DEVNULL
> +    ).splitlines()
> +
> +    if not kernel_ver:
> +        kernel_ver = subprocess.check_output(['make', 'kernelversion'],
> +                                             cwd=kernel_dir,
> +                                             stderr=subprocess.DEVNULL
> +        ).decode().rstrip()
> +
> +    manifest = {
> +        'linux_kernel': {
> +            kernel_ver: []
> +        }
> +    }
> +
> +    report = cvert.match_cve(manifest, cve_struct)
> +
> +    for cve in report:
> +        for url in cve['reference']:
> +            headline = git_headline(kernel_dir, match_commit(url))
> +
> +            if headline and headline in oneline:
> +                cve['status'] = 'patched'
> +                break
> +
> +    return report
> +
> +
> +def match_commit(url):
> +    matched = re.match(r'^http://git\.kernel\.org/cgit/linux/kernel/git/torvalds/linux\.git/commit/\?id=(.+)$', url) \
> +              or re.match(r'^https?://github\.com/torvalds/linux/commit/(.+)$', url)
> +
> +    if matched:
> +        return matched.group(1)
> +    else:
> +        return None
> +
> +
> +def git_headline(kernel_dir, commit_id):
> +    if not commit_id:
> +        return None
> +
> +    try:
> +        headline = subprocess.check_output(['git', 'show',
> +                                            '--no-patch',
> +                                            '--format=%s',
> +                                            commit_id],
> +                                           cwd=kernel_dir,
> +                                           stderr=subprocess.DEVNULL
> +        ).rstrip()
> +    except subprocess.CalledProcessError:
> +        # commit_id is not found
> +        headline = None
> +
> +    return headline
> +
> +
> +if __name__ == '__main__':
> +    parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,
> +                                     description=textwrap.dedent('''
> +                                     Generate CVE report for the Linux kernel.
> +                                     Inspect Linux kernel GIT tree and find all CVE patches commits.
> +                                     '''),
> +                                     epilog=textwrap.dedent('''
> +                                     examples:
> +
> +                                     # Download (update) NVD feeds in "nvdfeed" directory
> +                                     # and prepare the report for the "kernel-sources" directory
> +                                     %% %(prog)s --feed-dir nvdfeed --output report-kernel.txt kernel-sources
> +
> +                                     # Use existed NVD feeds in "nvdfeed" directory
> +                                     # and prepare the report for the "kernel-sources" directory
> +                                     %% %(prog)s --offline --feed-dir nvdfeed --output report-kernel.txt kernel-sources
> +
> +                                     # (faster) Restore CVE dump from "cvedump" (must exist)
> +                                     # and prepare the report for the "kernel-sources" directory
> +                                     %% %(prog)s --restore cvedump --output report-kernel.txt kernel-sources
> +
> +                                     # Restore CVE dump from "cvedump" (must exist)
> +                                     # and prepare the extended report for the "kernel-sources" directory
> +                                     %% %(prog)s --restore cvedump --show-description --show-reference --output report-kernel.txt kernel-sources
> +                                     '''))
> +
> +    group = parser.add_mutually_exclusive_group(required=True)
> +    group.add_argument('--feed-dir', help='feeds directory')
> +    group.add_argument('--restore', help='load CVE data structures from file',
> +                        metavar='FILENAME')
> +
> +    parser.add_argument('--offline', help='do not update from NVD site',
> +                        action='store_true')
> +    parser.add_argument('--output', help='save report to the file')
> +    parser.add_argument('--kernel-ver', help='overwrite kernel version, default is "make kernelversion"',
> +                        metavar='VERSION')
> +    parser.add_argument('--show-description', help='show "Description" in the report',
> +                        action='store_true')
> +    parser.add_argument('--show-reference', help='show "Reference" in the report',
> +                        action='store_true')
> +
> +    parser.add_argument('kernel_dir', help='kernel GIT directory',
> +                        metavar='kernel-dir')
> +
> +    args = parser.parse_args()
> +
> +    if args.restore:
> +        cve_struct = cvert.load_cve(args.restore)
> +    elif args.feed_dir:
> +        cve_struct = cvert.update_feeds(args.feed_dir, args.offline)
> +
> +    if not cve_struct and args.offline:
> +        parser.error('No CVEs found. Try to turn off offline mode or use other file to restore.')
> +
> +    if args.output:
> +        output = open(args.output, 'w')
> +    else:
> +        output = sys.stdout
> +
> +    report = report_kernel(cve_struct, args.kernel_dir, args.kernel_ver)
> +    cvert.print_report(report,
> +                       show_description=args.show_description,
> +                       show_reference=args.show_reference,
> +                       output=output
> +    )
> +
> +    if args.output:
> +        output.close()
> diff --git a/scripts/cvert-update b/scripts/cvert-update
> new file mode 100755
> index 0000000..adea13d
> --- /dev/null
> +++ b/scripts/cvert-update
> @@ -0,0 +1,64 @@
> +#!/usr/bin/env python3
> +#
> +# Update NVD feeds and store CVE blob locally.
> +#
> +# Copyright (c) 2018 Cisco Systems, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License along
> +# with this program; if not, write to the Free Software Foundation, Inc.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +#
> +
> +import cvert
> +import textwrap
> +import argparse
> +
> +
> +if __name__ == '__main__':
> +    parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,
> +                                     description=textwrap.dedent('''
> +                                     Update NVD feeds and store CVE blob locally.
> +                                     '''),
> +                                     epilog=textwrap.dedent('''
> +                                     examples:
> +
> +                                     # Download NVD feeds to  "nvdfeed" directory.
> +                                     # If there are meta files in the directory, they will be updated
> +                                     # and only fresh archives will be downloaded:
> +                                     %% %(prog)s nvdfeed
> +
> +                                     # Inspect NVD feeds in "nvdfeed" directory
> +                                     # and prepare a CVE dump python blob "cvedump".
> +                                     # Use it later as input for cvert-* scripts (for speeding up)
> +                                     %% %(prog)s --offline --store cvedump nvdfeed
> +
> +                                     # Download (update) NVD feeds and prepare a CVE dump
> +                                     %% %(prog)s --store cvedump nvdfeed
> +                                     '''))
> +
> +    parser.add_argument('--store', help='save CVE data structures in file',
> +                        metavar='FILENAME')
> +    parser.add_argument('--offline', help='do not update from NVD site',
> +                        action='store_true')
> +
> +    parser.add_argument('feed_dir', help='feeds directory',
> +                        metavar='feed-dir')
> +
> +    args = parser.parse_args()
> +
> +    cve_struct = cvert.update_feeds(args.feed_dir, args.offline)
> +
> +    if not cve_struct and args.offline:
> +        parser.error('No CVEs found in {0}. Try to turn off offline mode.'.format(args.feed_dir))
> +
> +    if args.store:
> +        cvert.save_cve(args.store, cve_struct)
> diff --git a/scripts/cvert.py b/scripts/cvert.py
> new file mode 100644
> index 0000000..3a7ae5a
> --- /dev/null
> +++ b/scripts/cvert.py
> @@ -0,0 +1,418 @@
> +#!/usr/bin/env python3
> +#
> +# Copyright (c) 2018 by Cisco Systems, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License along
> +# with this program; if not, write to the Free Software Foundation, Inc.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +#
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
> +stream = logging.StreamHandler()
> +stream.setFormatter(logging.Formatter('# %(asctime)s %% %(name)s %% %(levelname)-8s %% %(message)s'))
> +
> +logger = logging.getLogger('CVERT')
> +logger.setLevel(logging.DEBUG)
> +logger.addHandler(stream)
> +
> +
> +def match_cve(manifest, cve_struct):
> +    report = []
> +
> +    for cve in cve_struct:
> +        for conf in cve_struct[cve]['nodes']:
> +            affected = process_configuration(manifest, conf)
> +
> +            for key in affected:
> +                product, version = key.split(',')
> +                patched = manifest[product][version]
> +
> +                if cve in patched:
> +                    cve_item = {'status': 'patched'}
> +                else:
> +                    cve_item = {'status': 'unpatched'}
> +
> +                cve_item['CVSS'] = '{0:.1f}'.format(cve_struct[cve]['score'])
> +                cve_item['CVE'] = cve
> +                cve_item['product'] = product
> +                cve_item['version'] = version
> +                cve_item['description'] = cve_struct[cve]['description']
> +                cve_item['reference'] = [x['url'] for x in cve_struct[cve]['reference']]
> +
> +                report.append(cve_item)
> +
> +    return sorted(report, key=lambda x : (x['status'], x['product'], x['CVSS'], x['CVE']))
> +
> +
> +def process_configuration(manifest, conf):
> +    '''Recursive call to process all CVE configurations.'''
> +
> +    operator = conf['operator']
> +
> +    if operator not in ['OR', 'AND']:
> +        raise ValueError('operator {} is not supported'.format(operator))
> +
> +    op = True if operator == 'AND' else False
> +    match = False
> +    affected = set()
> +
> +    if 'cpe' in conf:
> +        match = process_cpe(manifest, conf['cpe'][0], affected)
> +
> +        for cpe in conf['cpe'][1:]:
> +            package_match = process_cpe(manifest, cpe, affected)
> +
> +            # match = match <operator> package_match
> +            match = op ^ ((op ^ match) or (op ^ package_match))
> +    elif 'children' in conf:
> +        product_set = process_configuration(manifest, conf['children'][0])
> +
> +        if product_set:
> +            match = True
> +            affected = affected.union(product_set)
> +
> +        for child in conf['children'][1:]:
> +            product_set = process_configuration(manifest, child)
> +            package_match = True if product_set else False
> +
> +            # match = match OP package_match
> +            match = op ^ ((op ^ match) or (op ^ package_match))
> +
> +            if package_match:
> +                affected = affected.union(product_set)
> +
> +    if match:
> +        return affected
> +    else:
> +        return ()
> +
> +
> +def process_cpe(manifest, cpe, affected):
> +    '''Matches CPE with all packages in manifest.'''
> +
> +    if not cpe['vulnerable']:
> +        # Ignores non vulnerable part
> +        return False
> +
> +    version_range = {}
> +
> +    for flag in ['versionStartIncluding',
> +                 'versionStartExcluding',
> +                 'versionEndIncluding',
> +                 'versionEndExcluding']:
> +        if flag in cpe:
> +            version_range[flag] = cpe[flag]
> +
> +    # only "product" and "version" are taken
> +    product, version = cpe['cpe23Uri'].split(':')[4:6]
> +
> +    if product not in manifest:
> +        return False
> +
> +    if not version_range:
> +        if version == '*':
> +            # Ignores CVEs that touches all versions of package
> +            # Can not fix it anyway
> +            logger.debug('ignore "*" in {}'.format(cpe))
> +            return False
> +        elif version == '-':
> +            # "-" means NA
> +            #
> +            # NA (i.e. "not applicable/not used"). The logical value NA
> +            # SHOULD be assigned when there is no legal or meaningful
> +            # value for that attribute, or when that attribute is not
> +            # used as part of the description.
> +            # This includes the situation in which an attribute has
> +            # an obtainable value that is null
> +            #
> +            # Ignores CVEs if version is not set
> +            logger.debug('ignore "-" in {}'.format(cpe))
> +            return False
> +        else:
> +            version_range['versionExactMatch'] = version
> +
> +    result = False
> +
> +    for version in manifest[product]:
> +        try:
> +            if match_version(version,
> +                             version_range):
> +                logger.debug('{} {}'.format(product, version))
> +                affected.add('{},{}'.format(product, version))
> +
> +                result = True
> +        except:
> +            # version comparison is a very tricky
> +            # sometimes provider changes product version in a strange manner
> +            # and the above comparison just failed
> +            # so here we try to make version string "more standard"
> +
> +            if match_version(twik_version(version),
> +                             [twik_version(v) for v in version_range]):
> +                logger.debug('{} {} (twiked)'.format(product, twik_version(version)))
> +                affected.add('{},{}'.format(product, version))
> +
> +                result = True
> +
> +    return result
> +
> +
> +def match_version(version, vrange):
> +    '''Matches version with the version range.'''
> +
> +    result = False
> +    version = util_version(version)
> +
> +    if 'versionExactMatch' in vrange:
> +        if version == util_version(vrange['versionExactMatch']):
> +            result = True
> +    else:
> +        result = True
> +
> +        if 'versionStartIncluding' in vrange:
> +            result = result and version >= util_version(vrange['versionStartIncluding'])
> +
> +        if 'versionStartExcluding' in vrange:
> +            result = result and version > util_version(vrange['versionStartExcluding'])
> +
> +        if 'versionEndIncluding' in vrange:
> +            result = result and version <= util_version(vrange['versionEndIncluding'])
> +
> +        if 'versionEndExcluding' in vrange:
> +            result = result and version < util_version(vrange['versionEndExcluding'])
> +
> +    return result
> +
> +
> +def util_version(version):
> +    return distutils.version.LooseVersion(version.split('+git')[0])
> +
> +
> +def twik_version(v):
> +    return 'v1' + re.sub(r'^[a-zA-Z]+', '', v)
> +
> +
> +def print_report(report, width=70, show_description=False, show_reference=False, output=sys.stdout):
> +    for cve in report:
> +        print('{0:>9s} | {1:>4s} | {2:18s} | {3} | {4}'.format(cve['status'], cve['CVSS'], cve['CVE'], cve['product'], cve['version']), file=output)
> +
> +        if show_description:
> +            print('{0:>9s} + {1}'.format(' ', 'Description'), file=output)
> +
> +            for lin in textwrap.wrap(cve['description'], width=width):
> +                print('{0:>9s}   {1}'.format(' ', lin), file=output)
> +
> +        if show_reference:
> +            print('{0:>9s} + {1}'.format(' ', 'Reference'), file=output)
> +
> +            for url in cve['reference']:
> +                print('{0:>9s}   {1}'.format(' ', url), file=output)
> +
> +
> +def update_feeds(feed_dir, offline=False, start=2002):
> +    feed_dir = os.path.realpath(feed_dir)
> +    year_now = datetime.datetime.now().year
> +    cve_struct = {}
> +
> +    for year in range(start, year_now + 1):
> +        update_year(cve_struct, year, feed_dir, offline)
> +
> +    return cve_struct
> +
> +
> +def update_year(cve_struct, year, feed_dir, offline):
> +    url_prefix = 'https://static.nvd.nist.gov/feeds/json/cve/1.0'
> +    file_prefix = 'nvdcve-1.0-{0}'.format(year)
> +
> +    meta = {
> +        'url': '{0}/{1}.meta'.format(url_prefix, file_prefix),
> +        'file': os.path.join(feed_dir, '{0}.meta'.format(file_prefix))
> +    }
> +
> +    feed = {
> +        'url': '{0}/{1}.json.gz'.format(url_prefix, file_prefix),
> +        'file': os.path.join(feed_dir, '{0}.json.gz'.format(file_prefix))
> +    }
> +
> +    ctx = {}
> +
> +    if not offline:
> +        ctx = download_feed(meta, feed)
> +
> +        if not 'meta' in ctx or not 'feed' in ctx:
> +            return
> +
> +    if not os.path.isfile(meta['file']):
> +        return
> +
> +    if not os.path.isfile(feed['file']):
> +        return
> +
> +    if not 'meta' in ctx:
> +        ctx['meta'] = ctx_meta(meta['file'])
> +
> +    if not 'sha256' in ctx['meta']:
> +        return
> +
> +    if not 'feed' in ctx:
> +        ctx['feed'] = ctx_gzip(feed['file'], ctx['meta']['sha256'])
> +
> +    if not ctx['feed']:
> +        return
> +
> +    logger.debug('parsing year {}'.format(year))
> +
> +    for cve_item in ctx['feed']['CVE_Items']:
> +        iden, cve = parse_item(cve_item)
> +
> +        if not iden:
> +            continue
> +
> +        if not cve:
> +            logger.error('{} parse error'.format(iden))
> +            break
> +
> +        if iden in cve_struct:
> +            logger.error('{} duplicated'.format(iden))
> +            break
> +
> +        cve_struct[iden] = cve
> +
> +    logger.debug('cve records: {}'.format(len(cve_struct)))
> +
> +
> +def ctx_meta(filename):
> +    if not os.path.isfile(filename):
> +        return {}
> +
> +    ctx = {}
> +
> +    with open(filename) as fil:
> +        for lin in fil:
> +            f = lin.split(':', maxsplit=1)
> +            ctx[f[0]] = f[1].rstrip()
> +
> +    return ctx
> +
> +
> +def ctx_gzip(filename, checksum=''):
> +    if not os.path.isfile(filename):
> +        return {}
> +
> +    with gzip.open(filename) as fil:
> +        try:
> +            ctx = fil.read()
> +        except (EOFError, OSError):
> +            return {}
> +
> +    if checksum and checksum.upper() != hashlib.sha256(ctx).hexdigest().upper():
> +        return {}
> +
> +    return json.loads(ctx.decode())
> +
> +
> +def parse_item(cve_item):
> +    cve_id = cve_item['cve']['CVE_data_meta']['ID'][:]
> +    impact = cve_item['impact']
> +
> +    if not impact:
> +        # REJECTed CVE
> +        return None, None
> +
> +    if 'baseMetricV3' in impact:
> +        score = impact['baseMetricV3']['cvssV3']['baseScore']
> +    elif 'baseMetricV2' in impact:
> +        score = impact['baseMetricV2']['cvssV2']['baseScore']
> +    else:
> +        return cve_id, None
> +
> +    return cve_id, {
> +        'score': score,
> +        'nodes': cve_item['configurations']['nodes'][:],
> +        'reference': cve_item['cve']['references']['reference_data'][:],
> +        'description': cve_item['cve']['description']['description_data'][0]['value']
> +    }
> +
> +
> +def download_feed(meta, feed):
> +    ctx = {}
> +
> +    if not retrieve_url(meta['url'], meta['file']):
> +        return {}
> +
> +    ctx['meta'] = ctx_meta(meta['file'])
> +
> +    if not 'sha256' in ctx['meta']:
> +        return {}
> +
> +    ctx['feed'] = ctx_gzip(feed['file'], ctx['meta']['sha256'])
> +
> +    if not ctx['feed']:
> +        if not retrieve_url(feed['url'], feed['file']):
> +            return {}
> +
> +        ctx['feed'] = ctx_gzip(feed['file'], ctx['meta']['sha256'])
> +
> +    return ctx
> +
> +
> +def retrieve_url(url, filename=None):
> +    if filename:
> +        os.makedirs(os.path.dirname(filename), exist_ok=True)
> +
> +    logger.debug('downloading {}'.format(url))
> +
> +    try:
> +        urllib.request.urlretrieve(url, filename=filename)
> +    except urllib.error.HTTPError:
> +        return False
> +
> +    return True
> +
> +
> +def save_cve(filename, cve_struct):
> +    '''Saves CVE structure in the file.'''
> +
> +    filename = os.path.realpath(filename)
> +
> +    logger.debug('saving {} CVE records to {}'.format(len(cve_struct), filename))
> +
> +    with open(filename, 'wb') as fil:
> +        pickle.dump(cve_struct, fil)
> +
> +
> +def load_cve(filename):
> +    '''Loads CVE structure from the file.'''
> +
> +    filename = os.path.realpath(filename)
> +
> +    logger.debug('loading from {}'.format(filename))
> +
> +    with open(filename, 'rb') as fil:
> +        cve_struct = pickle.load(fil)
> +
> +    logger.debug('cve records: {}'.format(len(cve_struct)))
> +
> +    return cve_struct
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

