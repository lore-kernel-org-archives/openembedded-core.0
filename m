Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 27DBF73C60
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 18:42:15 +0000 (UTC)
Received: by ignm3 with SMTP id m3so69108540ign.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Apr 2015 11:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=FCqs05LgcnLnBmH8A9EMoVhPz0bbVmsiDQ9FV3TM8QE=;
	b=Cfof8sR/UjvJCfhWwbbZ8K06fl13uOmZVwLB2ay1s8NCPggPZ5tMdOoS63i/XFU/WQ
	lW9aFxkBapXoNTo0ZS0Hh0iUAsSW+KPejemQhYtaRWIG1tM4KO6nepiOKhPqeW4qdvLU
	jmmwKSdps4yTN1sDz1CxVmb7+IwDfqswCtqJUhDQhegP3CaHMVMOAp14trHf6pmOr0jW
	ihM48pSgOllsfLZak4osuVSZbTbZx7TqoRbamQKFYgag7DzbEEshnkSQtW8MhXWJ+4jU
	Ae1120T4tXLYbPHxp6I52HhzBUZNL7mX1tobJiwp2JwHKnfHvhJwrLJeZG/o70TSS6dN
	yKcg==
MIME-Version: 1.0
X-Received: by 10.107.34.210 with SMTP id i201mr5849292ioi.1.1428086537061;
	Fri, 03 Apr 2015 11:42:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Fri, 3 Apr 2015 11:42:17 -0700 (PDT)
In-Reply-To: <1428071649-7803-1-git-send-email-R01007@freescale.com>
References: <1428071649-7803-1-git-send-email-R01007@freescale.com>
Date: Fri, 3 Apr 2015 15:42:17 -0300
X-Google-Sender-Auth: eGJlBT1FrA4Wlp7UGgQU6TAFBSU
Message-ID: <CAP9ODKoB5Fmn2aYBMd6evqr2PtQjaeTdvjD1=aTOEefZzPqJ5w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Jun Zhu <R01007@freescale.com>
Cc: Lauren Post <raa013@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/lib/oe/utils.py: Corrected the return value of both_contain()
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
X-List-Received-Date: Fri, 03 Apr 2015 18:42:16 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 3, 2015 at 11:34 AM, Jun Zhu <R01007@freescale.com> wrote:
> oe.utils.both_contain() should return the result as "checkvalue" or "",
> but the latest implement returns as "set(['checkvalue'])" or "";
>
> It causes that bitbake.conf generates the wrong result of COMBINED_FEATURES,
> which contains the common components in both DISTRO_FEATURE and MACHINE_FEATURES.
>
> For example, build in Dizzy branch, COMBINED_FEATURES is "alsa usbhost ...",
> but recently, COMBINED_FEATURES is like "set(['alsa']) set(['usbhost']) ...".
>
> Signed-off-by: Jun Zhu <R01007@freescale.com>

Tested-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

