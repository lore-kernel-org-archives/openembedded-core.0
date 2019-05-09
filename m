Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5E37D3E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 09:52:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x499q7jv005912
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 May 2019 02:52:22 -0700
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 9 May 2019 02:52:05 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1557395383-6322-1-git-send-email-zhe.he@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <32c3ac4e-d226-0256-ae43-0b80979913f0@windriver.com>
Date: Thu, 9 May 2019 17:52:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557395383-6322-1-git-send-email-zhe.he@windriver.com>
X-Originating-IP: [128.224.162.146]
Subject: Re: Review request 0/1: LIN1019-1252 run 'shutdown -P now' on vm and shutdown failed
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
X-List-Received-Date: Thu, 09 May 2019 09:52:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Please ignore.

Thanks,
Zhe

On 5/9/19 5:49 PM, zhe.he@windriver.com wrote:
> From: zhe.he@windriver.com Mon Sep 17 00:00:00 2001
>
> Summary: LIN1019-1252 run 'shutdown -P now' on vm and shutdown failed
> Tech Review: Qi Chen
> Gatekeeper: Robert
> Lockdown Approval (if needed): 
> Branch Tag: wr-10.19-20190505
>
> IP Statement (form link or license statement, usually automated):
> Crypto URL(s) (if needed): see http://wiki.wrs.com/PBUeng/LinuxProductDivisionExportProcess
> Parent Template (where applicable):
>
>
> ====== Sanity Issues: (DO NOT EDIT this section) ======
>
>
>
> ====== Impacted area             Impact y/n ======
> docs/tech-pubs                      n
> tests                               n
> build system                        n
> host dependencies                   n
> RPM/packaging                       n
> toolchain                           n
> kernel code                         n
> user code                           y
> configuration files                 n
> target configuration                n
> Applicable to Yocto/upstream        n
> New Kernel Warnings                 n
> Other                               n
>
>
> ====== Comments (indicate scope for each "y" above) ======
> * Conditions of submission
>
> * Documentation Changes/Release Notes
>   = Doc changes
>
>   = Release notes
>
> * Git logs
>
>
> ====== Testing ======
> * Commands
> setup.sh --machine qemux86-64 --distro wrlinux --dl-layers
> . ./oe-init-build-env
> bitbake wrlinux-image-glibc-std
> runqemu qemux86-64 nographic
> root
> shutdown now
>
> * Expected Results
> shut down successfully
>
> * Applicable to
>
> * Tested configurations
>
>   Arch    built      boot     boardname
>   -------------------------------------
>   MIPS      n         n
>   MIPS64    n         n
>   MIPS64n32 n         n
>   ARM32     n         n
>   ARM64     n         n
>   x86       n         n
>   x86_64    n         y       22015
>   PPC       n         n
>   PPC64     n         n
>   SPARC64   n         n
>
>
> ====== Reviewer Checklist ======
> [Submitters: make sure that your review doesn't trigger any checkmarks!]
> http://lxgit.wrs.com/cgit/bin.git/tree/etc/review.txt
>
>
> ====== PULLs ======
> * The branch is made of: <branch_name>_<commits_count>_<date>
>   git://128.224.158.51/git/oe-core zhe/wr-10.19-20190505__1__20190509174633
>
> * WRH-PULLs ("wrh -m" can merge it):
>   git://128.224.158.51/git/oe-core__s__zhe/wr-10.19-20190505__1__20190509174633


