Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3A6EA7E3F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 08:41:08 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s3so1956545wms.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 01:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=SxAhrN0IZBDIUfO9ZZA10tcY5R92nbkkYch0hoCqN6I=;
	b=AADx/pBimI4MYM/M18LadMyLB0MzUhcOdVTuk9FRhHju5JOvn/4lnXHbg56dYjEgZb
	T0CmutPQUgrMrLl2yZTer1HoRmXf4SwVg+XWtJDN6ChMyAL1JzhcdTzdYZUdXqrNqUAY
	NsPftV9dFU7kAKxgglAeOR4337Cc+xzZAbjDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=SxAhrN0IZBDIUfO9ZZA10tcY5R92nbkkYch0hoCqN6I=;
	b=DlhX8KpHFwLglKHcI1FJjE8FwgXIQd0whM81IA2aRR32PTpaEfPgRBXQUE6C4EEkEh
	yg8anORTHFUX5B1hB7bjdo2YwqU9L4asK7RmmSW8OHn0xkQuC9IDGLebq5W3r2t3//06
	+Wxs632jFUZVyGQupn4ffJIukDEveC13qVNEFvMvFM17VGlFEKmuboncSZxwIwi3PEF/
	rohRW794vKJNoeXH2RTwoQWnyg9slUQlb4C7Jc1hfFffLWe25K7KQFV1U7fK2z1l+Ct8
	zTbaReolBThW9gG9fKoHNvznJ5RGBYRHR7dqTQyb5Jn0IItkxzxheBelixcgRyrRFHe7
	pX6Q==
X-Gm-Message-State: APjAAAWPsHQECJYgkrn+KPZLXSrNA863zOXaflLK2miaiNQ8U49KmExg
	1GoCS0+yL7/FoDM0T/ADFeujtg==
X-Google-Smtp-Source: APXvYqx4LactjAlzqcoXwyI8AceBRDfKidcRnedYbsXNYAe3TJNtoCFeM1nwF4NpIi6hGs8Ef/DtuQ==
X-Received: by 2002:a1c:c003:: with SMTP id q3mr16648669wmf.42.1560242468870; 
	Tue, 11 Jun 2019 01:41:08 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 74sm1869373wma.7.2019.06.11.01.41.08
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 11 Jun 2019 01:41:08 -0700 (PDT)
Message-ID: <cefb49e59c432b787b341d6df11ebf4608daa53d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2019 09:41:07 +0100
In-Reply-To: <20190611083731.190996-1-kai.kang@windriver.com>
References: <20190611083731.190996-1-kai.kang@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] gnome.bbclass: inherit upstream-version-is-even
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
X-List-Received-Date: Tue, 11 Jun 2019 08:41:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-06-11 at 04:37 -0400, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> According to gnome versioning policy, "Even/odd minor package
> versions
> can be used respectively for stable/unstable releases.". Make
> gnome.bbclass inherit upstream-version-is-even to comply with the
> policy.
> 
> Ref:
> https://developer.gnome.org/programming-guidelines/stable/versioning.html.en#stable-unstable-versions
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/classes/gnome.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

The question is whether all recipes using the gnome class use the gnome
version policy? I'm not sure that is true?

Cheers,

Richard




