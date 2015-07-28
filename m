Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 28ADD73D13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 13:28:09 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so70957297pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 06:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=ixg5worv5hesboXegZmSIvJxak+U2Lc7N0u69z6kF0w=;
	b=Ruk3ZQwWz4FgvL93DDOxxDTv/mFfG4sW+F7evHwFd5+V3+UHIQOK8pqaX/JSFAq38l
	evgB0N38MfAeLc8+Aav88O8Di2/BR2L5cRtCy9VQWwrXHnLp/TmDgwsbUwQIlI+oB+GD
	AqNJor4TJKUmFESKjX8Vw+E9Ljvd5Uyoo+4m7q0jMNqPV0laYj4zui7ilLJhPol9efod
	1AUNeSH64B4WODnXmJAz+NPgaF3sOquTXUXLaQ0PaBm/2jnWjlK9zw+j7rj5jmoGIZzq
	M8FmSWkOEvmEY7wNgKGFzHvht0gXMzSPA3+Hw+lqMYkbDCcFed5wHXWpcMpkO3MJCxgr
	dzqQ==
X-Gm-Message-State: ALoCoQmpAwX8YH8pMpnhAmbUODQpUs3nAFqvQ5M2ugBMckd4tO0b467euRDDM7jPwPFRH/gn7lSg
X-Received: by 10.70.91.171 with SMTP id cf11mr79718951pdb.141.1438090090228; 
	Tue, 28 Jul 2015 06:28:10 -0700 (PDT)
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com.
	[209.85.220.54]) by smtp.gmail.com with ESMTPSA id
	bx7sm35308992pdb.82.2015.07.28.06.28.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jul 2015 06:28:09 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by padck2 with SMTP id ck2so70062045pad.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 06:28:07 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.101.9 with SMTP id fc9mr79960878pab.37.1438090087185;
	Tue, 28 Jul 2015 06:28:07 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Tue, 28 Jul 2015 06:28:07 -0700 (PDT)
In-Reply-To: <1438089822.11208.9.camel@linuxfoundation.org>
References: <1438089822.11208.9.camel@linuxfoundation.org>
Date: Tue, 28 Jul 2015 10:28:07 -0300
Message-ID: <CAP9ODKpsscuNtP+S=zX6uM9sTiFRO8FyN3c9y-Fqr7xUr3B18g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] toolchain-scripts: Extend to cover nativesdk compiler tools (e.g. nativesdk-gcc)
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
X-List-Received-Date: Tue, 28 Jul 2015 13:28:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 28, 2015 at 10:23 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This is needed when we add nativesdk-gcc/binutil to an SDK. Being
> present doesn't hurt in other cases.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Maybe it could use the environment-setup subscript to extend this?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

