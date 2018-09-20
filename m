Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 17D877961D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 01:07:36 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 139-v6so10267222itf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 18:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QO2goHRQO2h5EjJYdGtXGBqNJTnW2DbrgIDV+3TVB70=;
	b=Ikk/d1VWfRvNmHQOy3iPsjRY5ttZwnZhNmk66IMA4zEcO0swe7JCFr3bFOT9D/Lms3
	h9cyhbeapNw24m8NeoIc0pAntqxo2N2GZ/WpsSwPlw3JqBXcFYDxQWh3qUuPSCGNTcfu
	soWjpwozdm74E2vXpFHkC318QVbu6msUA9hOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QO2goHRQO2h5EjJYdGtXGBqNJTnW2DbrgIDV+3TVB70=;
	b=sYI+inNRjcUw5vddsuv7gb63zxnTKQ8QIw1yM/9ZXOvCIZyRww0ZjluPPzyGGH7736
	6bQwx7931AoRuKk6HksyQCvcY4UvVRv1D9yyGhR8m69SLTdGp/VB+u670Onya9DxW9yS
	e3YxBmtWH+Tvw1RP+U/JrdYPsLVuSQx6k0QjIrNAnPSJQsqE1/gQ+N68OuEsmFzNBRlg
	fXDVatN78ooq31O+UB08oZh/NAdD21SgIGBv2FFBWRvpUHebPodzkfZNhdRcAg6cwyqn
	boqX+Oous+vqqGa2D6xFJ0JE5w3heRC7JqsCZCSu3rVFsPjku0ia4zK7rSi3xT4sja/W
	JcJw==
X-Gm-Message-State: APzg51Dezic+FICK8IZsHYLURJ447WIcEhnvtXkpDcK7FkBz00hPh/RU
	NsjGxQ5pWUr9ZJfUYf2nUBg0TA==
X-Google-Smtp-Source: ANB0VdbBL5QkXP+otnX4vfjfiGtG2nZ9k/OksQTfbycBsCCq46ItVkE6L1LlV5FsxtR3g2VsLwdMMw==
X-Received: by 2002:a24:3046:: with SMTP id q67-v6mr439376itq.9.1537405658080; 
	Wed, 19 Sep 2018 18:07:38 -0700 (PDT)
Received: from hex ([209.82.80.116]) by smtp.gmail.com with ESMTPSA id
	p13-v6sm269232itp.3.2018.09.19.18.07.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Sep 2018 18:07:37 -0700 (PDT)
Message-ID: <78fad439cd03f6e9be71a0a917667bcf94ebea51.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 18:07:34 -0700
In-Reply-To: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
References: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH V2 1/2] openssh: upgrade 7.8p1 -> 7.8p1+git to support openssl 1.1.x
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
X-List-Received-Date: Thu, 20 Sep 2018 01:07:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-09-19 at 19:59 +0800, Hongxu Jia wrote:
> - Convert from tarball to git repository which support
>   openssl 1.1.x
> 
> - There is no specific minor version that contains the
>   openssl fix (it was merged to master a few days agao),
>   rename recipe version to `7.8p1+git'
> 
> - Fix regression test binaries missing
>   In commit `1f7aaf7 openssh: build regression test binaries', it
> build
>   regression test binaries, since upstream add two binaries in
> commits
>   `c59aca8 Create control sockets in clean temp directories' and
>   `1acc058 Disable tests where fs perms are incorrect', we should
> update
>   do_compile_ptest.

Thanks for this. Unfortunately I think we still have some kind of a
problem on qemuarm64 since with this patch, we cannot log into core-
image-sato-sdk over ssh. Other images like core-image-sato work but
they use dropbear which suggests this is an openssh or openssl problem.

We're going to have to start to narrow down where the issue is. This
unfortunately means 2.6M3 continues to be blocked :(.

Cheers,

Richard

