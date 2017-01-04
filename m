Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6A9605FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 06:39:20 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id x186so32449111vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2017 22:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WhpN2ueFPWBCZmI1YGNBybUNXdZzBOaFA7gfM18Qe6Y=;
	b=N0T+eB2pS+uyM9k56V3rx4YHqleJhmxeoj++F0WfuHyEjydJvTXURZK217hVAbztY4
	BCn7jO4td2vo8ccP7XHcEEHhbidK2m1FvWYMkli3vEWkPEirl92n/JHxBnd/qdVU4fZP
	e4M1W52YpIjMadE0VofnMLPbKJuGq9ttlHaBMGlmLz6+R0gnsx5DSMqDl2HUiN1xVo/A
	dGTjAFgg0OFqAzCVonKNW20/eEafzGojASoOLtLM1mYFRmoepQDjXTUlhp0W/QOzmUub
	1Anyvuk5cr7FixNKI1qewvdaVCfMWYfYJb7QwRSrUiz/hVdayKrhszVmIa5oVIavv1vO
	E4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WhpN2ueFPWBCZmI1YGNBybUNXdZzBOaFA7gfM18Qe6Y=;
	b=WxajZ6jXXU70MBmb8UsQ31KgDioXkRf2eF1kxxZod5RdS5PVKRWNPNApf8Mhi6D+CN
	nVAngU2hBAjilznTQpl2ENSXiSvwaeY7UtI26qetuRkT3vmuoUBRrcDdHMDwKiE+kyit
	21AFpYv/I7BSBEb7osOliAMBNfZG28UKh8fW/hGOLfn/6bWh7HmXboQo4W9IbypP3otZ
	TqrLtnzmXnmfvNgxxlpkTP3hYc0XzjTqyNlGM9Q5OrseNhBrUWTtYKG9Jv5Xwq9s0dqL
	aep/ImTFKnHs/4Q6NViH9nIryf92OCM9Dapg+ZnNZs603P4yn4Jz2a8kplOi3jjmdcrM
	QfUA==
X-Gm-Message-State: AIkVDXIej635VJ7aMc4gxk8sKWgRQXE/3nv1KDEECqCUvkGGHobg5j1+tlC/ohUgehsgQvf6bJdL9jmH97DGjQ==
X-Received: by 10.31.26.193 with SMTP id a184mr14705356vka.173.1483511960248; 
	Tue, 03 Jan 2017 22:39:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Tue, 3 Jan 2017 22:38:49 -0800 (PST)
In-Reply-To: <0960cf70d3357819843e693eb13c1e7c1f93da8e.1482363237.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
	<0960cf70d3357819843e693eb13c1e7c1f93da8e.1482363237.git.alejandro.hernandez@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Jan 2017 22:38:49 -0800
Message-ID: <CAMKF1soMf35-VzMr9rE5uOmGTu-3NhdhbykQrp0KBOVN=x1+Ag@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] scripts/tiny/ksum.py: New tool
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
X-List-Received-Date: Wed, 04 Jan 2017 06:39:20 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 3, 2017 at 2:30 PM, Alejandro Hernandez
<alejandro.hernandez@linux.intel.com> wrote:
> From: Tom Zanussi <tom.zanussi@linux.intel.com>
>
> 'ksum.py' generates a combined summary of vmlinux and module sizes for
> a built kernel, as a quick tool for comparing the overall effects of
> systemic tinification changes.  Execute from the base directory of the
> kernel build you want to summarize.  Setting the 'verbose' flag will
> display the sizes for each file included in the summary.
>

Does this work with python3 as well?

> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
> ---
>  scripts/tiny/ksum.py | 168 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 168 insertions(+)
>  create mode 100755 scripts/tiny/ksum.py
>
> diff --git a/scripts/tiny/ksum.py b/scripts/tiny/ksum.py
> new file mode 100755
> index 0000000..d4f3892
> --- /dev/null
> +++ b/scripts/tiny/ksum.py
> @@ -0,0 +1,168 @@
> +#!/usr/bin/env python
> +# ex:ts=4:sw=4:sts=4:et
> +# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
> +#
> +# Copyright (c) 2016, Intel Corporation.
> +# All rights reserved.
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
> +# DESCRIPTION 'ksum.py' generates a combined summary of vmlinux and
> +# module sizes for a built kernel, as a quick tool for comparing the
> +# overall effects of systemic tinification changes.  Execute from the
> +# base directory of the kernel build you want to summarize.  Setting
> +# the 'verbose' flag will display the sizes for each file included in
> +# the summary.
> +#
> +# AUTHORS
> +# Tom Zanussi <tom.zanussi (at] linux.intel.com>
> +#
> +
> +__version__ = "0.1.0"
> +
> +# Python Standard Library modules
> +import os
> +import sys
> +import getopt
> +from subprocess import *
> +
> +def usage():
> +    prog = os.path.basename(sys.argv[0])
> +    print('Usage: %s [OPTION]...' % prog)
> +    print('  -v,                 display sizes for each file')
> +    print('  -h, --help          display this help and exit')
> +    print('')
> +    print('Run %s from the top-level Linux kernel build directory.' % prog)
> +
> +verbose = False
> +
> +n_ko_files = 0
> +ko_file_list = []
> +
> +ko_text = 0
> +ko_data = 0
> +ko_bss = 0
> +ko_total = 0
> +
> +vmlinux_file = ""
> +vmlinux_level = 0
> +
> +vmlinux_text = 0
> +vmlinux_data = 0
> +vmlinux_bss = 0
> +vmlinux_total = 0
> +
> +def is_vmlinux_file(filename):
> +    global vmlinux_level
> +    if filename == ("vmlinux") and vmlinux_level == 0:
> +        vmlinux_level += 1
> +        return True
> +    return False
> +
> +def is_ko_file(filename):
> +    if filename.endswith(".ko"):
> +        return True
> +    return False
> +
> +def collect_object_files():
> +    print "Collecting object files recursively from %s..." % os.getcwd()
> +    for dirpath, dirs, files in os.walk(os.getcwd()):
> +        for filename in files:
> +            if is_ko_file(filename):
> +                ko_file_list.append(os.path.join(dirpath, filename))
> +            elif is_vmlinux_file(filename):
> +                global vmlinux_file
> +                vmlinux_file = os.path.join(dirpath, filename)
> +    print "Collecting object files [DONE]"
> +
> +def add_ko_file(filename):
> +        p = Popen("size -t " + filename, shell=True, stdout=PIPE, stderr=PIPE)
> +        output = p.communicate()[0].splitlines()
> +        if len(output) > 2:
> +            sizes = output[-1].split()[0:4]
> +            if verbose:
> +                print "     %10d %10d %10d %10d\t" % \
> +                    (int(sizes[0]), int(sizes[1]), int(sizes[2]), int(sizes[3])),
> +                print "%s" % filename[len(os.getcwd()) + 1:]
> +            global n_ko_files, ko_text, ko_data, ko_bss, ko_total
> +            ko_text += int(sizes[0])
> +            ko_data += int(sizes[1])
> +            ko_bss += int(sizes[2])
> +            ko_total += int(sizes[3])
> +            n_ko_files += 1
> +
> +def get_vmlinux_totals():
> +        p = Popen("size -t " + vmlinux_file, shell=True, stdout=PIPE, stderr=PIPE)
> +        output = p.communicate()[0].splitlines()
> +        if len(output) > 2:
> +            sizes = output[-1].split()[0:4]
> +            if verbose:
> +                print "     %10d %10d %10d %10d\t" % \
> +                    (int(sizes[0]), int(sizes[1]), int(sizes[2]), int(sizes[3])),
> +                print "%s" % vmlinux_file[len(os.getcwd()) + 1:]
> +            global vmlinux_text, vmlinux_data, vmlinux_bss, vmlinux_total
> +            vmlinux_text += int(sizes[0])
> +            vmlinux_data += int(sizes[1])
> +            vmlinux_bss += int(sizes[2])
> +            vmlinux_total += int(sizes[3])
> +
> +def sum_ko_files():
> +    for ko_file in ko_file_list:
> +        add_ko_file(ko_file)
> +
> +def main():
> +    try:
> +        opts, args = getopt.getopt(sys.argv[1:], "vh", ["help"])
> +    except getopt.GetoptError as err:
> +        print('%s' % str(err))
> +        usage()
> +        sys.exit(2)
> +
> +    for o, a in opts:
> +        if o == '-v':
> +            global verbose
> +            verbose = True
> +        elif o in ('-h', '--help'):
> +            usage()
> +            sys.exit(0)
> +        else:
> +            assert False, "unhandled option"
> +
> +    collect_object_files()
> +    sum_ko_files()
> +    get_vmlinux_totals()
> +
> +    print "\nTotals:"
> +    print "\nvmlinux:"
> +    print "    text\tdata\t\tbss\t\ttotal"
> +    print "    %-10d\t%-10d\t%-10d\t%-10d" % \
> +        (vmlinux_text, vmlinux_data, vmlinux_bss, vmlinux_total)
> +    print "\nmodules (%d):" % n_ko_files
> +    print "    text\tdata\t\tbss\t\ttotal"
> +    print "    %-10d\t%-10d\t%-10d\t%-10d" % \
> +        (ko_text, ko_data, ko_bss, ko_total)
> +    print "\nvmlinux + modules:"
> +    print "    text\tdata\t\tbss\t\ttotal"
> +    print "    %-10d\t%-10d\t%-10d\t%-10d" % \
> +        (vmlinux_text + ko_text, vmlinux_data + ko_data, \
> +         vmlinux_bss + ko_bss, vmlinux_total + ko_total)
> +
> +if __name__ == "__main__":
> +    try:
> +        ret = main()
> +    except Exception:
> +        ret = 1
> +        import traceback
> +        traceback.print_exc(5)
> +    sys.exit(ret)
> --
> 2.6.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

