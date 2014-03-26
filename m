Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id F12C06F9B5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 22:12:28 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id e89so1690459qgf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=50nmTL5dLz6NmmXUFvDffEg7SXoyLOC1CWNUXKv2ff0=;
	b=J9uRJ80GywITMNxGtETGU1s/e5tt24zvYTYsuzligBc8UAtQEHKDp3Eo+vTOKgZ7HY
	RWZs8b5speqe/Av0z4ng3Ao2eC8xoK0ldjh1TWHop2mLzcKA5jnTlUeJUb6q2VfqiVD1
	2hCaV5emBHRu3a51dy+I8oahwp6zlwxzT2YOUQYUzUTGYKpAU+ap+vl5HDppIfkcHpmf
	qfAZKOFFvqJ915jVycLHyDJZ1/Uk+64uhJ+7oz2wcDagEicxL2ZQABRdNKIJ/zyxYViF
	/s93LgsO1Ue093n2aaYN+vvky0/AvQLn+DY/6lh3JFlm0xK59rZmPcluBMkzUMuNyYOS
	vdww==
X-Gm-Message-State: ALoCoQm8P3wnhdryhpQL5tfTIhOkFwff8Bg7waP9Q31rfYE7mLccddW6wjLJsq+kr2w2xveqcdV9
X-Received: by 10.140.106.195 with SMTP id e61mr87427838qgf.66.1395871948717; 
	Wed, 26 Mar 2014 15:12:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Wed, 26 Mar 2014 15:12:08 -0700 (PDT)
In-Reply-To: <CAMKF1soKZqqmQUVCQnUqS1GV1FO5KictTO+=up=d7Jw3+QhXMw@mail.gmail.com>
References: <CAMKF1soKZqqmQUVCQnUqS1GV1FO5KictTO+=up=d7Jw3+QhXMw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Mar 2014 22:12:08 +0000
Message-ID: <CAJTo0LYF0VNwy7=rhmr7U_=tXwJtPOax3AKttn66q3qD_QXd2w@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] initial support for musl libc with OE/Yocto Project
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
X-List-Received-Date: Wed, 26 Mar 2014 22:12:30 -0000
Content-Type: text/plain; charset=UTF-8

On 26 March 2014 22:04, Khem Raj <raj.khem@gmail.com> wrote:
> There were interest in other threads in having musl as an alternative
> to eglibc/uclibc that we already have in OE, in that direction I have
> poured in my on and off work and put it into a contrib tree

Blimey Khem that was quick. :)

Ross

