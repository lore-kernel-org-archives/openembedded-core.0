Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TK7lM-0004Qs-KK
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 15:16:20 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so1692987pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2012 06:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=vTleTSFxoOe6do5ysUbI7kXbl0/0+uVid1osib5P4jY=;
	b=n95szjX7JoF+ybmsy0H+l4wYlb+FzZFs3WuiocSSFKEwwVy0PCC6m0TIKAmG2xa4IZ
	mDQqVmGNOr2sgqD7ZEMOE/Ad2+EwowtPVVPG4ky60Oi6gOrZqBcR+KN+n8DEEBafdkhr
	tFse4vvWubZWKViGVyLG50teNkBnAD+jfUYtelZ6Y5VGNnlWBmFwDJIAzHPaW6XZT/Xd
	fRtT2DdEQ3B7+SvUtXyRLHoqrZk0382dkcRKdsZn99Q8JjVA7t6aw92oRdxCyPz+sEsl
	gyvOAkdHtwshzL25yrbF6zf8YrYJbf6PwGcYYqIrmbu3ySrfu0cCN2aFNlih1ea6qoeT
	VY2w==
MIME-Version: 1.0
Received: by 10.68.129.233 with SMTP id nz9mr30516209pbb.136.1349442197526;
	Fri, 05 Oct 2012 06:03:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Fri, 5 Oct 2012 06:03:17 -0700 (PDT)
In-Reply-To: <1349437649.15658.20.camel@ted>
References: <1349437649.15658.20.camel@ted>
Date: Fri, 5 Oct 2012 10:03:17 -0300
X-Google-Sender-Auth: 5r1GD30Me6YwYJczUcWnjk3QtpE
Message-ID: <CAP9ODKpvpJbYpP-HPzO23cFFFONpF4ULdmc_OAGM-MR-2sXGCQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Explicitly disable the cairo dependency
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
X-List-Received-Date: Fri, 05 Oct 2012 13:16:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 5, 2012 at 8:47 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We don't want the cairo dependency. Unfortunately simply checking whether its present
> isn't good enough. If its not in DEPENDS, it can disappear half way through building.
> We therefore need to explicitly disable it.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Richard,

Please use the Upstream-Status field in the patch so it is easier to
track later.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


