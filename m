Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (unknown [209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4C71D65E87
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 16:06:35 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 79so1042579ykr.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 09:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=oiR1hvGzTTZGvWNiH9KBwjCOvXfoLQoIiPT3EHe0t3w=;
	b=gmZiQNKWxX/EmS11Gfm8zjPDR79E/ToyGfrNLcyxPgCs3Ri9b8c4hJ2zFaH3J3/Enm
	2SMp3ahplK8OeuQuDidjo1qB35QSM6SQ/n06im6mpUiRte7MTQY5agVeDRQNqTyV4EjX
	AoAct/dfuU2zqBB2onCiAibMW1fj+l+ukYXUCa3np1KPemyofPQKirez0vC951/hXW+L
	5YNqc03lG9m7gorMHNX4CPbmLXpwwtM8K4nTZEfaJsC2FuU2Hx2bASMt7HEWheuXGoTc
	ilBnJ/aMBIMJFd2gqU3Pf9V4psogzIipnsZ+uHqo9RxeEcFwEvNZ2OiEDtex+Zg5psto
	rPqA==
MIME-Version: 1.0
X-Received: by 10.236.230.6 with SMTP id i6mr16781938yhq.14.1400169996933;
	Thu, 15 May 2014 09:06:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Thu, 15 May 2014 09:06:36 -0700 (PDT)
In-Reply-To: <1399319125-39998-1-git-send-email-tudor.florea@enea.com>
References: <1399319125-39998-1-git-send-email-tudor.florea@enea.com>
Date: Thu, 15 May 2014 13:06:36 -0300
X-Google-Sender-Auth: IsBg5h-ZuM8DIO7jLpLW4MTcJWs
Message-ID: <CAP9ODKr2hE++mrqLiUY1+u2jVGNhTvrZBnU7peKJvXZeRDF_1A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tudor Florea <tudor.florea@enea.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] curl: remove inapporpriate file from curl release
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
X-List-Received-Date: Thu, 15 May 2014 16:06:38 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 5, 2014 at 4:45 PM, Tudor Florea <tudor.florea@enea.com> wrote:
> This is the adaptation for the a bugfix upstream
> The inappropriate file src/tool_hugehelp.c presence in the curl 7.36 release
> interfered with the upstream fix for
> https://sourceforge.net/p/curl/bugs/1350/
>
> Signed-off-by: Tudor Florea <tudor.florea@enea.com>

Tested-by: Otavio Salvador <otavio@ossystems.com.br>

This fixed the imx28evk build failure for me.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

