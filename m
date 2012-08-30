Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T7BBA-0000V0-LX
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 22:17:29 +0200
Received: by lagv3 with SMTP id v3so1729844lag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 13:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=GTwIpzuDqHsY9lrCZsPvX2ySi1kzUfjqGB+jD/JcQPU=;
	b=PXJAWc7QOrtvJ+adNuEnibdLcMGPZYzURpQCoeM6BAvAxprD9h8hD2HcLOq+n27uor
	/GtsGAJjfJbL66gXHYQ/7ZiIHrM/JqZwMBjZbsYvyg1Z7+urW2HYx3zfGjeIbUCl1tHK
	jM7yA06qOD9FdKe2j7xuaNIdkBSdRzx6HKvaU48ps7Fp77UPwzxiW65sV5vkDgprfMLR
	+yQKTa8vIMuOLmCdLFpopykvbvuGXBwcXoj+NtxCTLEDaS8F3aYu83TqwoG1eh5Gr3Jh
	LHx3yUcgrHjN+gsQl9d1wpEgmu4Fb+RpPGTdomKcQaXveKg58qMTxKb3EMaDVxwymBWd
	6YQg==
Received: by 10.152.132.133 with SMTP id ou5mr4461146lab.45.1346357112867;
	Thu, 30 Aug 2012 13:05:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Thu, 30 Aug 2012 13:04:52 -0700 (PDT)
In-Reply-To: <1346356090-13811-1-git-send-email-sgw@linux.intel.com>
References: <1346356090-13811-1-git-send-email-sgw@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 30 Aug 2012 13:04:52 -0700
X-Google-Sender-Auth: cr3sGeZMMZuKNvbzwg85wLlO6Jg
Message-ID: <CABcZANn-7+kaOPJq1DV2QsjG3qqk_H=Vx8O3W5RN=rsfv+EsRA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] poky-tiny: Enable x86-64 to build eglibc correctly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 20:17:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 30, 2012 at 12:48 PM, Saul Wold <sgw@linux.intel.com> wrote:
> The libc-libm-big option allows eglibc to correctly configure
> itself to include the correct math functions for 64bit operations
>
> [YOCTO #2943]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

I'm curious, is this needed for other 64 bit platforms, e.g. powerpc64?
-- 
Christopher Larson


