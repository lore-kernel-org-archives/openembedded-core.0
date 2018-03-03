Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id F20C378A4C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 15:46:37 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id w38so11370531ota.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2018 07:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=os3dss/2xGebDNAbLG5M1vyrbYFq/s2a/5lGjaAd6/4=;
	b=mJKdecXg2V5taHeSB3n/Vs3aV0iTwLTY8gvc+010ePcGQkmUem+wgOc9dcU/XAQmLM
	pCtH5kaHq9u87zSzEllsrc/BxuB9yGiLJzkI7lWVc7ODVk+jl96Cy0UqurkGt2YrmI2y
	ztveLuMcbBU1MWwpXAlpmaDVuC3YQO5GJ+x6o4s1PF08PDgpOtmq8s12GbgKSUvBHrbP
	jS741LeOVGdHnb3qcBojj4GNTFWTon4Vr8+nntF4VUcg0mtsMpBE6TezYyI4guokqfkd
	HcYhXNfxYiY8zp0JwoPGsmtEmxGbQxZjAyirDlPwp0RwJbkfjQRAmQip3UutlIy4HD50
	bKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=os3dss/2xGebDNAbLG5M1vyrbYFq/s2a/5lGjaAd6/4=;
	b=aaUv8AZDcblE2JUj3lk86ZDWz4lL8zcIcPTfMWnrmPCnYU45Rf+BZyP0ZUZ0fbIlvT
	Ey1EtiTlASOKPlSGE1+T0yzPZTqyJmG0tHVM8e+EF3N72Gi6SKrlEkSrU1w1loMPeYO/
	e+idzAJbbUeDJYpKdFZbEklSHOfDzViWbewjH99rh9z2OLrJCFNY0VYqGbzYdK9VNRG7
	8dAV9fAQgfhjl60N1LJY0tfLybeD3N5nDj0wNLTiEDCIyBBHak06isC/ZoPy53keR500
	wCBnsK8kxt76f5p0S470OCwB2uMeaPp1iaV2XXqDblBeuDOxNH87yYIeULRHZglSiU5F
	Z4zQ==
X-Gm-Message-State: AElRT7Hvga0wc8yCmbTb2Vk/RRFyuRf/ca7l5BeXqdKtltcaIB2IR2yq
	rcPQUfi3Ic6c8lhm2HSD+BvIPeGA
X-Google-Smtp-Source: AG47ELv4z6OzOeE2my179fBVewPQyg/Yx6wwM2Oo+RSxQuxi721a4NNQ6ujvpae+Xs6fwE2i3rNlvw==
X-Received: by 10.157.22.144 with SMTP id c16mr6399629ote.326.1520091997442;
	Sat, 03 Mar 2018 07:46:37 -0800 (PST)
Received: from mail-ot0-f172.google.com (mail-ot0-f172.google.com.
	[74.125.82.172]) by smtp.gmail.com with ESMTPSA id
	w111sm4776364ota.41.2018.03.03.07.46.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Mar 2018 07:46:36 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f172.google.com with SMTP id h8so11376875oti.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2018 07:46:36 -0800 (PST)
X-Received: by 10.157.49.84 with SMTP id v20mr7003959otd.103.1520091995666;
	Sat, 03 Mar 2018 07:46:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Sat, 3 Mar 2018 07:46:35 -0800 (PST)
In-Reply-To: <1520022430-7908-1-git-send-email-jason.wessel@windriver.com>
References: <1520022430-7908-1-git-send-email-jason.wessel@windriver.com>
Date: Sat, 3 Mar 2018 12:46:35 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrOspi_MOPfaV3bHZyc9iZfOCgyJO4Db8urtpyYUseyMQ@mail.gmail.com>
Message-ID: <CAP9ODKrOspi_MOPfaV3bHZyc9iZfOCgyJO4Db8urtpyYUseyMQ@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: Use deltask instead of noexec for package_write_rpm
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
X-List-Received-Date: Sat, 03 Mar 2018 15:46:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 2, 2018 at 5:27 PM, Jason Wessel <jason.wessel@windriver.com> wrote:
> If you install an image into another image (this is the case for
> custom initrd for example), it will fail with a non obvious python
> backtrace.  This patch modifies the package_manager.py print which
> package causes the failure for the future, if it is missing a
> manifest.
>
> The error you get looks like this:
>
> oe-core/meta/lib/oe/package_manager.py', lineno: 534, function: create_packages_dir
>      0530:
>      0531:    for dep in rpmdeps:
>      0532:        c = taskdepdata[dep][0]
>      0533:        manifest, d2 = oe.sstatesig.find_sstate_manifest(c, taskdepdata[dep][2], taskname, d, multilibs)
>  *** 0534:        if not os.path.exists(manifest):
>      0535:            continue
>      0536:        with open(manifest, "r") as f:
>      0537:            for l in f:
>      0538:                l = l.strip()
> File: '/usr/lib/python3.5/genericpath.py', lineno: 19, function: exists
>      0015:# This is false for dangling symbolic links on systems that support them.
>      0016:def exists(path):
>      0017:    """Test whether a path exists.  Returns False for broken symbolic links"""
>      0018:    try:
>  *** 0019:        os.stat(path)
>      0020:    except OSError:
>      0021:        return False
>      0022:    return True
>      0023:
> Exception: TypeError: stat: can't specify None for path argument
>
> The root cause of the problem was determined to be the noexec clause
> in the image.bbclass.  When the package_write_rpm task runs it expects
> that a manifest will be generated.  Not running the task eliminates
> the problem.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>

What about the other image types?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

