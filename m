Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 28A81796B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 09:36:51 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 206-v6so5170064wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 02:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DOypx7Vol5JGxP3g9Ptp3O0Q0Gkb88uRGZU4NSpzMk4=;
	b=YYuiFAeqGwmoqzUuEj+4YwKWrPiPbMDZidWuPwvhLSMhoKUicdGfh1cm8eI4btmT0A
	3mEXiP+azQmG4Y02KcvI612Ni7Y8u84O6AjmXnzfLIEYhnlJov9j/8RYsh9AiwUgU3og
	9PwOrET7r7ILUO9spMVTkDV9W0jC9fWlLpEPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DOypx7Vol5JGxP3g9Ptp3O0Q0Gkb88uRGZU4NSpzMk4=;
	b=D983XkpDBFHi7mqYrU0y2bhw7LPrvX9TCBklDlqLKIr2LEGKvL8ueE7r5FNHcBKuqh
	OTxgHR3NNee0q1t4Qk/gI8vDSrvi4Zs02dOaTCzj0AgBclDlfUfZdXY9B/xWEUlIc44H
	kzGJB2WKfL6sBwOFZLLLaOtNtMeaQnljPeryDXdkNYw4eA8SQGV+znETSfMsWdLnPzBj
	ofZ7zXoiyTjrbUbVLjrYIC+eHwtkEgOIPu8b8GEaUymvGOtRCQTzTQPoxPGk4Uyg2APD
	Hx3g8fDwsbgj2uIrG5M8bOP5kI8pJWglG4NImVO9/DHvhEPA8yQooygN99NxHm0TSis7
	fFIA==
X-Gm-Message-State: ABuFfoiRRgppLSSxLT90mvZAexhI1+VZm+KrXZc4zb9/DJN4msiVtDiH
	pmtwhu5/Gmpp2g3H3ixVMwUWtg==
X-Google-Smtp-Source: ACcGV60bu5mO8BcYBlwSCFW7tpb1/bY9MOCupMA/z3s7LnHR3chOT0yJJSAmP9l29c6Va6FnHddhqg==
X-Received: by 2002:a1c:e00a:: with SMTP id
	x10-v6mr7033254wmg.58.1538041012651; 
	Thu, 27 Sep 2018 02:36:52 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h2-v6sm724757wrs.34.2018.09.27.02.36.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 27 Sep 2018 02:36:51 -0700 (PDT)
Message-ID: <d79e0565cb496dba5c031a3a6c6be7559c9207d2.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2018 10:36:50 +0100
In-Reply-To: <1538025770-242527-1-git-send-email-mingli.yu@windriver.com>
References: <1538025770-242527-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH] sysklogd.inc: add syslogd.8 to ALTERNATIVE_${PN}-doc
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
X-List-Received-Date: Thu, 27 Sep 2018 09:36:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-09-27 at 13:22 +0800, mingli.yu@windriver.com wrote:
> From: Mark Hatle <mark.hatle@windriver.com>
> 
> Other recipes, such as meta-networking inetutils
> may also provide a man page for syslogd.8.
> Use the alternatives mechanism to select the man
> page to display.
> 
> This is a partial revert of commit:
> 988aad01b20c18a8850db0ad6dc547525d94116c
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta/recipes-extended/sysklogd/sysklogd.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

I'm not sure I like the sound of this. Why would it provide a man page
but not the actual tool itself?

At the very least this needs a better explanation but I'm not sure it
sounds correct or is something we want to encourage.

Cheers,

Richard

