Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA96CC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 10:37:25 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.29053.1647859044624803563
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 03:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aICCXDfH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id h23so19426282wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 03:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Wd2gouWjL7cPE4Qxmhwd/Fqz/F9hC3GbdW6VUVFwtUA=;
        b=aICCXDfHg/iJxg23AxCl6sQKJlkcJsSEeNoJpYJKC6/1HNJUMW7no8vsqIG7k7KaKn
         CRhbbhq31UwP2q+IBpqPpdPOwLVvLUIPDWAY6qokcHoVHHiqHZtaSosgxPSUySzJhYb9
         UAm4Q8jO2s+8mcGwV4R3ZxJ5FgCOaIKs3xbrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Wd2gouWjL7cPE4Qxmhwd/Fqz/F9hC3GbdW6VUVFwtUA=;
        b=i44iC8xn1jaUPRoKwJ2Pg/X6tWolilei/i9YtDfcAG8jyqZVaKxJeutavuk6K6Zz2F
         DBKgnFgYwzj6/HHXTYphQrOTNUHoqt5O08sfep9cj+g4HCvx149/UyLuTV4JeRLBhfsL
         J6Or5vLzAteyXsebTNVy3+6UegMvV7IzNShFwR/jjiPrM+APFQK5ZGI5Xkh3RFVd2HRg
         qZFyCEgMH3BIVubURlz6dM0/PATtuYxwmF2NDBtn44sQ1VF8u+4iJ7TPlhoWrlhFVPB2
         6wYkWubgiWeL1m99NNf07zRKyMa5a5OcXcvePzLKzyZo8/Mnl1i7Vch6TjXBHBsGbC6L
         dIBA==
X-Gm-Message-State: AOAM533exD64oqU0SLxf6a0uOFPYNfO5ceKeCFDbNJ7OrF6x6CVb4PEd
	7nJfG2NU8OoES44Ck1VadP1QxA==
X-Google-Smtp-Source: 
 ABdhPJy4JOSvd6XJQxTf2QV3pHv9DgWEMFpSfEhcloFRuLoYdqoo7n3cr9JQP+7ceiBx8LAT/eYfIA==
X-Received: by 2002:a05:6000:1889:b0:204:696:9256 with SMTP id
 a9-20020a056000188900b0020406969256mr6431332wri.64.1647859042993;
        Mon, 21 Mar 2022 03:37:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7422:13d5:6a39:d39?
 ([2001:8b0:aba:5f3c:7422:13d5:6a39:d39])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a5d64e5000000b00203914f5313sm13082071wri.114.2022.03.21.03.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 03:37:22 -0700 (PDT)
Message-ID: 
 <3de447ee8439264e9164d5f9eded0ea0a6891500.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] kernel: Add kernel-cve-tool support to
 help monitor kernel CVEs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
	paul.gortmaker@windriver.com
Date: Mon, 21 Mar 2022 10:37:17 +0000
In-Reply-To: <Yjgtzy+HeQfaEOqQ@korppu>
References: <20220319192555.1118739-1-richard.purdie@linuxfoundation.org>
	 <Yjgtzy+HeQfaEOqQ@korppu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 10:37:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163496

On Mon, 2022-03-21 at 07:48 +0000, Mikko.Rapeli@bmw.de wrote:
> Hi,
> 
> Thanks for the interesting patch!
> 
> On Sat, Mar 19, 2022 at 07:25:55PM +0000, Richard Purdie wrote:
> > This adds support for a random kernel CVE monitoring tool which can be
> > run as a specific task against a kernel:
> > 
> > $ bitbake linux-yocto -c checkcves
> > [...]
> > Sstate summary: Wanted 3 Local 3 Mirrors 0 Missed 0 Current 135 (100% match, 100% complete)
> > NOTE: Executing Tasks
> > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for be80a1d3f9dbe5aee79a325964f7037fe2d92f30:CVE-2021-4204 (NOT FOR THIS VERSION)
> > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 20b2aff4bc15bda809f994761d5719827d66c0b4:CVE-2022-0500 (NOT FOR THIS VERSION)
> > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 55749769fe608fa3f4a075e42e89d237c8e37637:CVE-2021-4095 (NOT FOR THIS VERSION)
> > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 4fbcc1a4cb20fe26ad0225679c536c80f1648221:CVE-2022-26490 (NOT FOR THIS VERSION)
> > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for dbbf2d1e4077bab0c65ece2765d3fc69cf7d610f:CVE-2019-15239 (NOT FOR THIS VERSION)
> > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 89f3594d0de58e8a57d92d497dea9fee3d4b9cda:CVE-2022-24958 (NOT FOR THIS VERSION)
> > WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_checkcves: Should consider cherry-pick for 1bfba2f4270c64c912756fc76621bbce959ddf2e:CVE-2020-25220 (NOT FOR THIS VERSION)
> > NOTE: Tasks Summary: Attempted 627 tasks of which 626 didn't need to be rerun and all succeeded.
> > 
> > Posted as an RFC to see what people think of this. I make no claims
> > on how useful it is/isn't but wanted to show integration isn't difficult
> > and provide some inspiration for ideas.
> > 
> > Details on the tool in question: https://github.com/madisongh/kernel-cve-tool
> > 
> > I've ignored the NO-FIXES-AVILABLE and PATCHED-CVES files.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/kernel.bbclass                   | 10 ++++++++++
> >  .../kernel-cve-tool/kernel-cve-tool_git.bb    | 20 +++++++++++++++++++
> >  2 files changed, 30 insertions(+)
> >  create mode 100644 meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_git.bb
> > 
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 4f304eb9c7a..a842747b9d9 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -753,6 +753,16 @@ addtask sizecheck before do_install after do_strip
> >  
> >  inherit kernel-artifact-names
> >  
> > +do_checkcves () {
> > +	cd ${S}
> > +	kernel-cve-tool -P ${STAGING_DATADIR_NATIVE}/kernel-cvedb
> > +	while read -r line; do 
> > +		bbwarn "Should consider cherry-pick for $line"; 
> 
> cherry-picking isn't recommended. Instead, stable releases should be merged
> fully into product trees to fix CVE and other critical bugs.
> 
> cherry-picking will miss bugs which don't yet have CVEs or exploits.
> cherry-picking will also miss non-obvious patch dependencies.
> 
> Kernel community including Android documentation strongly recommends
> stable tree merges.

If you have a stable tree available!

> https://source.android.com/devices/architecture/kernel/releases#keeping-a-
> secure-system
> 
> "When deploying a device that uses Linux, it is strongly recommended that all
> LTS kernel updates be taken by the manufacturer and pushed out to their users
> after proper testing shows the update works well"
> 
> http://kroah.com/log/blog/2018/02/05/linux-kernel-release-model/
> 
> "When deploying a device that uses Linux, it is strongly recommended that all
> LTS kernel updates be taken by the manufacturer and pushed out to their users
> after proper testing shows the update works well. As was described above, it
> is not wise to try to pick and choose various patches from the LTS
> releases..."
> 
> I think the cherry-pick status is not useful, but the list of CVEs and patches
> to various subsystems is useful to users. IMO the tool should ask for a point
> release merge from upstream instead.

I think a lot depends on the scenario you're using this in. The different ouputs
are useful in different scenarios...

> 
> > +	done < ${S}/cherry-picks.list
> > +}
> > +do_checkcves[depends] = "kernel-cve-tool-native:do_populate_sysroot"
> > +addtask checkcves after do_configure
> > +
> >  kernel_do_deploy() {
> >  	deployDir="${DEPLOYDIR}"
> >  	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
> > diff --git a/meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_git.bb b/meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_git.bb
> > new file mode 100644
> > index 00000000000..d2402bae052
> > --- /dev/null
> > +++ b/meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_git.bb
> > @@ -0,0 +1,20 @@
> > +HOMEPAGE = "https://github.com/madisongh/kernel-cve-tool/"
> > +SRC_URI = "git://github.com/madisongh/kernel-cve-tool;protocol=https;branch=master;name=tool \
> > +           git://github.com/nluedtke/linux_kernel_cves.git;protocol=https;branch=master;destsuffix=cvedb;name=data"
> 
> Could the 'data' be handled like the CVE database and updated regularly/automatically?

Something like:

SRCREV_data = "${AUTOREV}"

should do that. In some ways I prefer this to the CVE database approach since
you always have a deterministic outcome for a given revision.

Cheers,

Richard


