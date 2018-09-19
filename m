Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9309B792B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 19:36:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8JJaLsH012723
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Sep 2018 12:36:21 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 19 Sep 2018 12:36:21 -0700
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>,
	<openembedded-core@lists.openembedded.org>, "Jia, Hongxu"
	<Hongxu.Jia@windriver.com>
References: <1537202690-5887-1-git-send-email-jkrishnanjanappa@mvista.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <17cfd18f-1825-73a0-c904-f9ddecef823b@windriver.com>
Date: Wed, 19 Sep 2018 15:36:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537202690-5887-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH] ghostscript: upgrade to 9.25
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
X-List-Received-Date: Wed, 19 Sep 2018 19:36:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 09/17/2018 12:44 PM, Jagadeesh Krishnanjanappa wrote:
> Removed below patches, as v9.25 source already has those
> changes/security fixes:
> 
> 0001-Bug-699665-memory-corruption-in-aesdecode.patch
> 0001-pdfwrite-Guard-against-trying-to-output-an-infinite-.patch
> 0002-Bug-699656-Handle-LockDistillerParams-not-being-a-bo.patch
> 0003-Fix-Bug-699660-shading_param-incomplete-type-checkin.patch
> 0004-Hide-the-.shfill-operator.patch
> 0005-Bug-699657-properly-apply-file-permissions-to-.tempf.patch
> remove-direct-symlink.patch
> 
> Re-worked ghostscript-9.21-native-fix-disable-system-libtiff.patch
> and ghostscript-9.21-prevent_recompiling.patch
> to fix warnings in do_patch task of ghostscript v9.25 recipe.
> 
> Highlights of ghostscript v9.25 release:
> ---------------------------------------
> - This release fixes problems with argument handling, some unintended results
>    of the security fixes to the SAFER file access restrictions
>    (specifically accessing ICC profile files), and some additional security
>    issues over the recent 9.24 release.
> 
> - Note: The ps2epsi utility does not, and cannot call Ghostscript with
>    the -dSAFER command line option. It should never be called with input
>    from untrusted sources.
> 
> - Security issues have been the primary focus of this release, including
>    solving several (well publicised) real and potential exploits.
> 
> - As well as Ghostscript itself, jbig2dec has had a significant amount of work
>    improving its robustness in the face of out specification files.
> 
> - IMPORTANT: We are in the process of forking LittleCMS. LCMS2 is not thread
>    safe, and cannot be made thread safe without breaking the ABI.
>    Our fork will be thread safe, and include performance enhancements
>    (these changes have all be been offered and rejected upstream). We will
>    maintain compatibility between Ghostscript and LCMS2 for a time, but not in
>    perpetuity. Our fork will be available as its own package separately from
>    Ghostscript (and MuPDF).
> 
> - The usual round of bug fixes, compatibility changes, and incremental
>    improvements.
> 
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>


Makes sense to me since otherwise distros will have to backport 10s of
CVE and other bug fixes. We're so close to cutting 2.6-M3 and there
could always be just one more package update but
how about just one more package update?

It's an app not a library so as long as Jagadeesh has tested well,
the risk of breaking in the autobuider tests is low.

Jagadeesh,
Did you build for all of qemu* x [glibc|musl]?
What runtime tests have you done?


-- 
# Randy MacLeod
# Wind River Linux

