Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 703A96FF52
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 15:13:26 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id v10so7645070qac.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 08:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tlRwBN0AIvBNE8Pc8K8JvR5EVdRdwcsWvSLiU1U5NSg=;
	b=IZvCGFIXMJ2eTfcWzp4TnXhRVnB54voju6Z9F8690Jo4CPIiAulW/VkwQAgHlESBCh
	lX/30IzRR8TDgblhSz5a7YOLAEEfSZZNmDF+2GF/fcjsEaq6G+YqAwYuBCvJSQBb8hPS
	E3z7xstVSl47sOtUu7ONHMAc1XuaubbblBnykmqKL7wvXlNmhAQ45UMCjLDdbkFNTJ1v
	Yuq9awoTok0+n9BUoBFhrQboNu71p0gq5rkyFE3SPkcCB2BcrOYvThYiYEqWdlvdjs89
	tKhuHHc1SIdJ4H7oQ3cG5J+fzFtkyzqX263pV96eukU2+UEvkzILueDfCV0iRLU9bAzQ
	B6WA==
X-Gm-Message-State: ALoCoQlGuUr61bM/epdMwycgpL+F2YLdltWP03tjtFA9fnqm0UgmUW5ljY8KiddmN4CSKNyLtdJJ
X-Received: by 10.224.151.206 with SMTP id d14mr26918394qaw.35.1402931607078; 
	Mon, 16 Jun 2014 08:13:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.91.138 with HTTP; Mon, 16 Jun 2014 08:13:06 -0700 (PDT)
In-Reply-To: <f304fb8b27c04e7099b22978c44e30346fb25dea.1402926503.git.liezhi.yang@windriver.com>
References: <cover.1402926503.git.liezhi.yang@windriver.com>
	<f304fb8b27c04e7099b22978c44e30346fb25dea.1402926503.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Jun 2014 16:13:06 +0100
Message-ID: <CAJTo0LbGfC9+VNjOHQiN1z3KUD0c8ynbxbzSmE-htLsRbEKe6A@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] libpcap: Avoid libpcap build error when libnl1 is involved
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
X-List-Received-Date: Mon, 16 Jun 2014 15:13:26 -0000
Content-Type: text/plain; charset=UTF-8

On 16 June 2014 14:49, Robert Yang <liezhi.yang@windriver.com> wrote:
> +PACKAGECONFIG[libnl1] = "--with-libnl,--without-libnl,libnl1,libnl1"

Why did you need to specify a runtime dependency?

Ross

