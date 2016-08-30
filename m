Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id AE7ED60746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 10:21:23 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id i32so24410741uai.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 03:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=q2QDxHDYf08/xj+ZqfnqL4NW55adww4dmGbCbSu7G6Q=;
	b=UUfe3IbYqfJSWDz675dDR0SL2MnnQgt1NhyzbDI9HRkLkKWk4AEO25UfE+fya+y0yA
	bXZNt19pbJ9TXcoTfpasAC+G9/9UAeJTpCQDMzVifIr6C90J5845FQVXGWGhE+3sMTcg
	2E0BYOtQpq+3FJkUtmELlCV8GhJUnLVv2LFfvvXrNDGsMhvSPRabIbnToMv8XYSjVdsZ
	vi8sniUuzXkPLhDS8PagdJ+Es+EJsW+FVSIyV0XInZoaRmrr0b4PTUYswo8JGT2uZCRu
	QITMulUDAM55s9IVPsA0uiv8M0EsEHOKaCUZH3JqleBDStB6LuZCytT+ufWPqsV7YChE
	a7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=q2QDxHDYf08/xj+ZqfnqL4NW55adww4dmGbCbSu7G6Q=;
	b=lOTEidvNuurO0t9ay/agIP/Ku+y+gMMc1hAHc62GoW90MC8zRlhEAamfeJEb9IX0fK
	DgocUqSrH3mKNlDl+/Md/bVzXQ89ZouaccDpFhrJJ4l5DMW6nHwvZ5bC/LX2reu7CR5v
	ud4QVIpZgCsRWCTmmpQIkdb5g4uBpHi8ZwdCoaBlOfimXZdq0UhKp2esgLzqyspJLpab
	FuKOWu6+xgxy5xlG2R4RqNvdzuq05NKmllZHweYl/TSE63WgbWEvfPn6C32C4Qb1FotW
	NXmm1xEWdWRUjuWGWptcvlylM1Xw4ePkFtBh6fk54f2dgcbCBtbPcjHE0Wr4oeaSr4Nu
	drBg==
X-Gm-Message-State: AE9vXwOKzjkXjkzh7DFD6uMmZLH+oI5i3OoG2zg4P3JN8hNrtsLwLVUJqOMe/xcQSUiMdA==
X-Received: by 10.31.9.137 with SMTP id 131mr1597786vkj.117.1472552483692;
	Tue, 30 Aug 2016 03:21:23 -0700 (PDT)
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com.
	[209.85.217.173]) by smtp.gmail.com with ESMTPSA id
	b127sm2719430vke.7.2016.08.30.03.21.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Aug 2016 03:21:22 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f173.google.com with SMTP id m60so24326167uam.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 03:21:21 -0700 (PDT)
X-Received: by 10.159.35.47 with SMTP id 44mr1372857uae.107.1472552481543;
	Tue, 30 Aug 2016 03:21:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Tue, 30 Aug 2016 03:21:20 -0700 (PDT)
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
Date: Tue, 30 Aug 2016 07:21:20 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrOOs2ofhCzxdV0ZCULDCO9r2RgKZpcNxhH_fe56so0PA@mail.gmail.com>
Message-ID: <CAP9ODKrOOs2ofhCzxdV0ZCULDCO9r2RgKZpcNxhH_fe56so0PA@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/18] Provide list of deployment artifacts
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
X-List-Received-Date: Tue, 30 Aug 2016 10:21:23 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 30, 2016 at 6:29 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> Hi,
>
> This is a fix for Bug #9869 - Provide a per-target manifest of files which were, or would have been, produced
>
> The list of artifacts produced by deployment tasks (do_deploy, do_image_complete and do_populate_sdk[_ext] is
> obtained from sstate manifests and fired as a TaskArtifacts metadata event. This should allow Toaster to
> handle artifacts in simple way and remove a lot of current Toaster code doing guess work.
>
> To generate manifests for do_image_complete and do_populate_sdk they have been put under sstate control.
>
> To avoid storing big files(images and sdk installer) in sstate new variable SSTATE_SKIP_CREATION has been
> set in image.bbclass and populate_sdk_base.bbclass and sstate code was modified to avoid adding files
> to sstate if SSTATE_SKIP_CREATION is set.

SKIP creation of what? Variable name seems a little vague for me. Even
needing the manifest, does it makes sense to store the image and SDK
on sstate?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

