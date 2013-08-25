Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id AF4016010E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 17:46:41 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id er7so2483964obc.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 10:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ZKYLmvgqGtV3LqNNgRfW7r0908uNh5rRbyBsl+i/IKA=;
	b=kAGwaxfLGkt6y32WGNnTtn1RIizHjJyIEmzGcaJh46FrEHmXCjspzsSUkUbIhFBTow
	KFA+eQzZTqPiGaFZnxeIusiFVJe3v5i24/uxj8Z1wCFpeu1Lyf8sbjClgg94larqjgnt
	q26g480vbOSrdDcFFIwRqUm6t4R6qnNjocTaikks9e2+2CuKyweafcypEWiulzzDWCV9
	dbGlc9m2tvYE0YWmeIJ90yGY00Am1yHTrk6uxegeW038Q/fvC0VKeBWmyhgxiuwLboZb
	v0RUr/a9DvDGp7n27W2ueK8bjZq3k16o1NTSz2iluu7dAe9nac3Taljl5i+RA053tm3Q
	cCSA==
MIME-Version: 1.0
X-Received: by 10.60.133.233 with SMTP id pf9mr771331oeb.46.1377452802052;
	Sun, 25 Aug 2013 10:46:42 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sun, 25 Aug 2013 10:46:41 -0700 (PDT)
In-Reply-To: <1377360080.6762.194.camel@ted>
References: <1377360080.6762.194.camel@ted>
Date: Sun, 25 Aug 2013 14:46:41 -0300
X-Google-Sender-Auth: bgzmoNvxJTmPND76x3aOiIQrNcA
Message-ID: <CAP9ODKooT-JrSFTSDuDeEprmNGca0v3dF4Rdv1VNx832jxQVHg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: Remove references to _remove in function names since this may become a bitbake keyword
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
X-List-Received-Date: Sun, 25 Aug 2013 17:46:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 24, 2013 at 1:01 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> There is a good chance we might want to support a bitbake operator
> "_remove" which works in a similar way to _append and _prepend. As
> such, we can't use those keywords in function or variable names.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Tested-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

