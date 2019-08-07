Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A74877F2F2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 18:43:13 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p13so17796322wru.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 11:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=OU50SGS083l/7zgzS4VuqUq54OOq+/vN1XxJz4tXq8o=;
	b=DEycAjwBEHhdA7CQ2EBpGUiIoti7y+8dd9tIGldk/U6K9Ey8wIM4uaIW6QkHm6Yx0n
	s/1aMJiNTi3PRxk4mzKXndimrGSwculFnfwMy2QHXPZmpCyv1YvA3xVH/9geVAhxjFjq
	x96145Xk+Z6xFonkoYnh7DsaooknUi1KFcoK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=OU50SGS083l/7zgzS4VuqUq54OOq+/vN1XxJz4tXq8o=;
	b=mvpoXNdtqzFTV/m2wcR+5OAWz/WJgzMRt3gakJnJeErArIl+wycwAOnoCswFmKdIce
	C1STdLqWgIap1Q9uOCDC+jklWl/MxYigde9mZ1fRo6IqXDcgAzG/0M+gmh8mjChJTOp/
	EZlfzr8EQjmTFj+lREv9o0XxMlfLy0V/1PvnkHcrocrrZE+d8SIRaomixJozZehJJBnI
	q3VUAojpLMRgb2V7uH4LLWunRK7VQ8yNuzo145fJAAro4N1d0z+PNRWgnaJzf9zyuNyh
	i+J56OCooyx/Oi1tFCJKDzhCkAR6OAR7F9jjV3xIdBfFWhfspcw8q91QEsSYjyW5j1ap
	cPJg==
X-Gm-Message-State: APjAAAWegBJDGli5BXWN+9fIPol+OaAgBenHpWyjTEgNuMyl3W6V76Ef
	ySRdoKdgh9tUUVrLwbEidmOleA==
X-Google-Smtp-Source: APXvYqyhe1O7AOdi9GOHwWnVbPSSbwa2lRA4b/C3m61P1X53B3mNXji2EF8SNOjva0iAsRJTyMjs2Q==
X-Received: by 2002:a5d:6508:: with SMTP id x8mr12948309wru.310.1565203394290; 
	Wed, 07 Aug 2019 11:43:14 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	66sm10708013wrc.83.2019.08.07.11.43.13
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 11:43:13 -0700 (PDT)
Message-ID: <a08b3fb5e679868a896d3d3035bb30838973f711.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 07 Aug 2019 19:43:12 +0100
In-Reply-To: <D88A5CDD-118A-48EE-99D0-EF6CC362A1ED@intel.com>
References: <1564749183-3162-1-git-send-email-chee.yang.lee@intel.com>
	<e46e1d0f5ff44a4fe3ddbbfd301c72061962cdb7.camel@linuxfoundation.org>
	<D88A5CDD-118A-48EE-99D0-EF6CC362A1ED@intel.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] systemd-boot:grub-efi:wic: add variable APPENDS for multiple boot configuration
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
X-List-Received-Date: Wed, 07 Aug 2019 18:43:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 2019-08-05 at 08:40 +0000, Lee, Chee Yang wrote:
> would KERNEL_CMD_LINES a better variable name for this case?

I'd like to understand which code is using the variable as that might
help name it correctly. I'd have said it should be CMDLINE without the
space as that is generally how the kernel refers to it. I think the
prefix should indicate which code is going to end up using it so KERNEL
may be too generic.

Cheers,

Richard


