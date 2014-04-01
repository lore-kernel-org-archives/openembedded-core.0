Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id C8DBE60B05
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 16:40:45 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id c41so9262640yho.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=RbKZk61Oq0Ou1NB8vtG98bG0b/UGEC/IPefQltuhgMw=;
	b=ugwI41rch2NIgSgUSSrLr2WHPtw47qfORtBOKfP+V2Q4lLmyNFRLWU2JWU8Tam0mEC
	DJ9fcar+1T3qeQsFu9ecbVWVNC3IyOrgX+/vsvbe2NSLJDlpYc7jGBEsa/M7A/FSmt1M
	TkAoSnZmICeqeEphvBFMtWtCUUrWlGM7VLHRM5JRpd6ygh528452rtYKekGGZ/YTTzEP
	uGVO7vQBHKVz+0Nqp102JapMjxALwzQ6qjNh5CqB7TRZbFTzej7nzM44gz/4EIJuKfzM
	pRjJVm8pyGjm+DlrEPZkICKWLOfXUXYDweKkOZg9vQZVWmPvoxqJUBiIS+YdJJwjdm1l
	fq4w==
MIME-Version: 1.0
X-Received: by 10.236.40.12 with SMTP id e12mr2797785yhb.155.1396370446395;
	Tue, 01 Apr 2014 09:40:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 1 Apr 2014 09:40:46 -0700 (PDT)
In-Reply-To: <1396369122-26878-1-git-send-email-otavio@ossystems.com.br>
References: <1396369122-26878-1-git-send-email-otavio@ossystems.com.br>
Date: Tue, 1 Apr 2014 13:40:46 -0300
X-Google-Sender-Auth: uaoRttJpUprUvnOqmrcP-QpOUco
Message-ID: <CAP9ODKopK+pQtXSDkCvMz-OJO=F7oWRe5q5ObjJUoHFrwMWiqw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] alsa-tools: Fix build without x11
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
X-List-Received-Date: Tue, 01 Apr 2014 16:40:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Tue, Apr 1, 2014 at 1:18 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> There is no way to disable the x11 without mangling the source code so
> instead using a patch we now used a 'sed' in do_configure so it is
> easier to maintain and extend. The patch had some new tools missing
> which were triggering build failures in O.S. Systems' builder as:
>
> ,----[ Build error in a clean tmp, without x11 ]
> | checking for GTK3... no
> | configure: error: Package requirements (gtk+-3.0) were not met:
> |
> | No package 'gtk+-3.0' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables GTK3_CFLAGS
> | and GTK3_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
> | make: *** [all] Error 1
> `----
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

A new, v2 version, not using sed is on the way. Ignore this one.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

