Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9F171A5E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 06:37:31 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id c16so11269149itc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 22:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=MoNySkzTb+rIoueJ7VePQcKPd0MgqVU7bTo0fXVOBVw=;
	b=mIN7zR7I+Pvze1wHm854oRYMCrditpX5QVw0cnvI+YOM0kKjHZooX6f3lq4joIHOSn
	ff34jwGm+/gN+aZnSBaLp4rGjFGuJfywerP1kqTUQTA2uHrGj9r3JAqQy9Rm1v5PNlaJ
	CC0g19ENtCasT1GZPEXdQCNEEuC7ep73XeYebXukgbLVOHZE9AKpKSvpOhu5Dq6tCv5s
	z4wRWz4epzbJ1jY4jxW8a0oazSdSuvGvpVCRuFbFQY66ww4ockxZJJ14GRmnKv5Qvbol
	o1WRxFnshe/HRh24CViMS2jlE553ueG+J78gjrUvy/+qct2JZVHEtHh16CD9TXEn2qCo
	Q1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=MoNySkzTb+rIoueJ7VePQcKPd0MgqVU7bTo0fXVOBVw=;
	b=rOuiRz02lIPAxfH3ctEL8gC0DTB6iI6mgnQwWp6smaQesKD70/D+TpZgTXjPDjq97I
	/OzCS76phWwetBLdColgG0ApaeULFdhasg+3yrTCaHWjywZzGmOCwDp+1OQ4I4X/J+wF
	0GNf1Qz1Rc5wGWzrFdRhOFmoMtgm+zTnzMiZy8peujL9SU7jyw0SqCL1wAtnB18J2H33
	t4BAgoG0wjSm/9KTcv+cFBt5udyHO2Xc5x31rGUKGkionZhCkUh4RGJiYjkQ1Ep/EH9s
	/h1bLZ8cXGiKekRQemODP5RZnPjPlYtwHYPMymFP9Gc046irYDGLowUucluDW+wAZeQW
	mTVw==
X-Gm-Message-State: AKwxyteZmVe93l3uG3p5CUQRldfS3eJ15B8+W3snsILGlxRtsOdCsDID
	wx1Df/vpGDanGEOawnHr7eFmODV/
X-Google-Smtp-Source: AH8x226IEtl7FikCMEcD4iI2Um9kUu6OZcjr13pZKOO0C9Y5Px+gDZ2UxbdZYdDGLj9P2lQ6Jn/+SA==
X-Received: by 10.36.118.21 with SMTP id z21mr29424146itb.116.1517294252687;
	Mon, 29 Jan 2018 22:37:32 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:fd41:97d0:e3d:7877])
	by smtp.gmail.com with ESMTPSA id
	196sm5325624ioz.36.2018.01.29.22.37.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 22:37:32 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <CA+chaQfBm2Yc1Pb=-W-ndoT1ECuCuawa8_YRakjYEKVje_oP-Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ef66bde1-c576-99d5-dea6-f74d302d6214@gmail.com>
Date: Mon, 29 Jan 2018 22:37:30 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfBm2Yc1Pb=-W-ndoT1ECuCuawa8_YRakjYEKVje_oP-Q@mail.gmail.com>
Subject: Re: waf warnings in jack and samba related recipes Was: [oe-commits] [openembedded-core] 07/44: waf.bbclass: explicitly pass bindir and libdir if supported
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
X-List-Received-Date: Tue, 30 Jan 2018 06:37:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 1/29/18 4:01 PM, Martin Jansa wrote:
> Hi,
> 
> it might be useful to check if there is ${S}/waf at all before trying to 
> call it.
> 
> There are some recipes like jack and other which inherit waf-samba which 
> inherits waf, but they don't use waf for configure, strange isn't it?
> 

hmm, I think assuming waf seems to be ok in waf.bbclass, I wonder why we 
need to inherit waf and then not use it during configure, is that a 
valid usecase ? if so then it might be better to get this warning 
message a bit cleaner may be downgraded to a note probably

> But since this patch, there is new warning for every do_configure task, 
> because there is this prefuncs waf_preconfigure causing:
> WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf --version, 
> exit code 127. Assuming waf version without bindir/libdir support.
> WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf --version, 
> exit code 127. Assuming waf version without bindir/libdir support.
> WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute waf 
> --version, exit code 127. Assuming waf version without bindir/libdir 
> support.
> WARNING: jack-1.9.10+gitAUTOINC+2d1d323505-r0 do_configure: Unable to 
> execute waf --version, exit code 1. Assuming waf version without 
> bindir/libdir support.
> WARNING: libtevent-0.9.31-r0 do_configure: Unable to execute waf 
> --version, exit code 127. Assuming waf version without bindir/libdir 
> support.
> WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute waf --version, 
> exit code 127. Assuming waf version without bindir/libdir support.
> 
> Now when this change is also backported to rocko we should probably fix 
> those recipes to prevent introducing even more warnings to stable 
> release builds.
> 
> Regards,
> 
> On Tue, Jan 2, 2018 at 6:28 PM, <git@git.openembedded.org 
> <mailto:git@git.openembedded.org>> wrote:
> 
>     This is an automated email from the git hooks/post-receive script.
> 
>     rpurdie pushed a commit to branch master
>     in repository openembedded-core.
> 
>     commit 923f91d8d8606141ce218927bc943f4f4f34bcdd
>     Author: Stefan Agner <stefan.agner@toradex.com
>     <mailto:stefan.agner@toradex.com>>
>     AuthorDate: Tue Dec 12 17:13:24 2017 +0100
> 
>          waf.bbclass: explicitly pass bindir and libdir if supported
> 
>          On some build hosts distros (e.g. Fedora 26) waf tries to be
>          smart about libdir detection and defaults to [EXEC_PREFIX/lib64].
>          This obviously is not what we want for 32-bit targets and usually
>          fails in the do_package phase:
>            WARNING: gstreamer1.0-plugins-imx-0.13.0-r0 do_package: QA
>     Issue: gstreamer1.0-plugins-imx: Files/directories were installed
>     but not shipped in any package:
>              /usr/lib64/libgstimxcommon.so.0
>              ...
> 
>          Depending on version, waf knows prefix or prefix, bindir and
>          libdir as default options. Explicitly pass the right set of
>          arguments.
> 
>          Signed-off-by: Stefan Agner <stefan.agner@toradex.com
>     <mailto:stefan.agner@toradex.com>>
>          Signed-off-by: Ross Burton <ross.burton@intel.com
>     <mailto:ross.burton@intel.com>>
>     ---
>       meta/classes/waf.bbclass | 17 ++++++++++++++++-
>       1 file changed, 16 insertions(+), 1 deletion(-)
> 
>     diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
>     index c4698e9..acbda27 100644
>     --- a/meta/classes/waf.bbclass
>     +++ b/meta/classes/waf.bbclass
>     @@ -25,8 +25,23 @@ def get_waf_parallel_make(d):
> 
>           return ""
> 
>     +python waf_preconfigure() {
>     +    from distutils.version import StrictVersion
>     +    srcsubdir = d.getVar('S')
>     +    wafbin = os.path.join(srcsubdir, 'waf')
>     +    status, result = oe.utils.getstatusoutput(wafbin + " --version")
>     +    if status != 0:
>     +        bb.warn("Unable to execute waf --version, exit code %d.
>     Assuming waf version without bindir/libdir support." % status)
>     +        return
>     +    version = result.split()[1]
>     +    if StrictVersion(version) >= StrictVersion("1.8.7"):
>     +        d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir}
>     --libdir=${libdir}")
>     +}
>     +
>     +do_configure[prefuncs] += "waf_preconfigure"
>     +
>       waf_do_configure() {
>     -       ${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
>     +       ${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF}
>     ${EXTRA_OECONF}
>       }
> 
>       waf_do_compile()  {
> 
>     --
>     To stop receiving notification emails like this one, please contact
>     the administrator of this repository.
>     --
>     _______________________________________________
>     Openembedded-commits mailing list
>     Openembedded-commits@lists.openembedded.org
>     <mailto:Openembedded-commits@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-commits>
> 
> 
> 

