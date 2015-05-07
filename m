Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id A12656081A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 21:20:12 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so50457604pab.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 May 2015 14:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=NyQSzblfjVyA8wT2359LRG8A4wi3GKwZ9dk4AJJNSec=;
	b=tNEFBaSZRVSxStMS/krITERE3KNDjOceFi9ILd+4OUxvRD26xn9j/0Ip7ib/kjC4to
	rcHcb1n+oL1bN5zhuOiYQTnCKPlbmgSDhcUGKkRwjPaOJxcXMzGX0oCbUWVI1JEC9jDt
	OppTN20I8Il4osfeXwcWI3a1/Ucy4/CoQ2S6EhUw3SpMuAw9FjaO9UQfcmszMqkyRwug
	H8dxv2k16zitf5MrWGJchrPgESvbOjWDIeI3Vax3IfI2gSpSFzhJqzuT+XguqfLCRms/
	XpEKHCSVT5HKtTJh/TNxK9VWhHrM1S3c1HrEcYCh2jz7/UA1CUtQAwMcB/iN+L4agVGq
	V6jA==
MIME-Version: 1.0
X-Received: by 10.70.128.9 with SMTP id nk9mr1042917pdb.58.1431033613902; Thu,
	07 May 2015 14:20:13 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Thu, 7 May 2015 14:20:13 -0700 (PDT)
In-Reply-To: <1430948328-17891-3-git-send-email-igor.santos@aker.com.br>
References: <1430948328-17891-1-git-send-email-igor.santos@aker.com.br>
	<1430948328-17891-3-git-send-email-igor.santos@aker.com.br>
Date: Thu, 7 May 2015 18:20:13 -0300
X-Google-Sender-Auth: Zl3ZKh1sPzsz_2jdau0Cg8Pyyns
Message-ID: <CAP9ODKrwdcH9F-=nkCSNiuEutQDmBcCi0uvP1hbggQM1PHOwDw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Igor Santos <igor.santos@aker.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] cscope: add
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
X-List-Received-Date: Thu, 07 May 2015 21:20:16 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 6, 2015 at 6:38 PM, Igor Santos <igor.santos@aker.com.br> wrote:
> Cscope is an interactive, screen-oriented tool that allows the user to
> browse through C source files for specified elements of code.
>
> Signed-off-by: Igor Santos <igor.santos@aker.com.br>

meta-oe please.

Igor, generally speaking, you shouldn't add new recipes to OE-Core
except if there is a very good reason to do so.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

