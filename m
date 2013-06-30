Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id EC7066A465
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 15:56:34 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b15so1588599eae.38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 08:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=A4JL1QTH5kHbxza7W/hMqmaICUbCH9JUap8cU9Z3ktU=;
	b=MZ0SLCU0RallObdIhYeXMyx338x1pLlgjwmhFK6uQ22KDC2EL39xwCfC2v41lZWopP
	FdoZZUth1jDj+BAk+KqORKBaEj3JgqRDnynODY6pjwR1iySAGH7bW65SFX9pW/blJFPc
	5IFdzSBD2M8L1QvA+RIoE8xcBSVq7uNYW4iqv9kftTOSZyQr4PmmQ/6NVu95NQpofOsa
	tDc6j7MTTZ0mVUBzee2rzj4hrdKT85EmeOPktOHKcveTDtyMGkYslDJqMcXJs0vJZMaB
	Lw9c7LIK42AJ6HE+fRRX0Nm1UzxKYZP3oOdO9PLHh3pBpzr2evg/eRwOAUT7uPrdghK5
	8Xfg==
MIME-Version: 1.0
X-Received: by 10.14.0.4 with SMTP id 4mr17478086eea.68.1372607795251; Sun, 30
	Jun 2013 08:56:35 -0700 (PDT)
Received: by 10.14.117.65 with HTTP; Sun, 30 Jun 2013 08:56:35 -0700 (PDT)
In-Reply-To: <1372342113-32763-1-git-send-email-mark.hatle@windriver.com>
References: <1372342113-32763-1-git-send-email-mark.hatle@windriver.com>
Date: Sun, 30 Jun 2013 11:56:35 -0400
Message-ID: <CALmOhgk+NG_aqEwbtKXm0KTWGEim9z5bCpCE8sHiovsaDiTPew@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Mark Hatle <mark.hatle@windriver.com>
X-Gm-Message-State: ALoCoQlS1aTcplX+hq4AnbMHhdm/oJGgtxAOiBK2YKmWruWh0U1TVJCma7OmTe9dfe/l29LKHNgJ
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3 v2] sanity.bbclass: Check for the known broken version of make
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
X-List-Received-Date: Sun, 30 Jun 2013 15:56:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 27 June 2013 10:08, Mark Hatle <mark.hatle@windriver.com> wrote:
> See GNU Savannah bug 30612 -- make 3.82 is known to be broken.
>
> A number of vendors are providing a modified version, so checking
> for just the version string is not enough.  We also need to check
> if the patch for the issue has been applied.  We use a modified
> version of the reproduced to check for the issue.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
> +
> +        if status != 0:
> +            return "Your version of make 3.82 is broken. Please revert to 3.81 or install a patched version.\n"


Instead of returning an error and asking the user to manually update
their own 'make', wouldn't it be better if bitbake simply built its
own known-to-be-working -native version instead? In this way a good,
working version of 'make' could be installed in a potential SDK's
sysroot as well?

