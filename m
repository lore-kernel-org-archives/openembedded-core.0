Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id A12DF6D145
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2013 12:33:20 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i7so2542939oag.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2013 04:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=HnHG/w247ekAR89vIWztah3Yiia1pNmflgBNEIB+7Is=;
	b=Xz56sMdRiGVQpAhtrXUz3EZkIZbkU2hhQ3DjDvS6d7lPC5WngkkluX/G2Q1EJBHH1d
	QtYenc0Fgj42RXakSUeqMHDSb7y5IUXyYimFpkg0rY6jfWHVo7uWJxUtG0CThbldVSHp
	qaCaFF5782s96ZLio40EmxVWwMXk3HeU44XOKc7cSf4RqYmTiKmdpBSn0NPAbbHSAIkR
	fFXSmaO692A72YNc+CEmGT6A6k5+a6gy3cufvvudMVkqMS1Kh+D5RZiX64tZKM/8jihm
	B2Z3UL7vX74ZxYCE9kfqge41GgtUxLDGx5x/NDjiV7kI1Y2lXuJMDnnvrssof7Jx3GDx
	ZsbA==
MIME-Version: 1.0
X-Received: by 10.60.155.166 with SMTP id vx6mr15670365oeb.28.1385209999808;
	Sat, 23 Nov 2013 04:33:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sat, 23 Nov 2013 04:33:19 -0800 (PST)
In-Reply-To: <1385159983-29270-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1385159983-29270-1-git-send-email-nicolas.dechesne@linaro.org>
Date: Sat, 23 Nov 2013 10:33:19 -0200
X-Google-Sender-Auth: h5w2Ha5iF9XyyOKRYV5eXfjWr5M
Message-ID: <CAP9ODKrrie-HbKxLpxHdRGutbkyhTPKz=0DRALPDRm3xWoE61w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: patches@linaro.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH dylan & dora & master] image-mklibs: ensure sysroot is correctly set when calling gcc
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
X-List-Received-Date: Sat, 23 Nov 2013 12:33:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 22, 2013 at 8:39 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> [YOCTO #2519]
>
> When getting gcc from sstate, it is possible to get a gcc with a bogus
> sysroot configuration, as discussed in [1] or in [YOCTO #2519].
>
> mklibs script will eventually call gcc, so we need to make sure that it
> provides gcc with the right sysroot location.
>
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2013-September/084159.html
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Nice; once this is merged this should be considered to Dora as well,
shouldn't it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

