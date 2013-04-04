Received: from mail-oa0-f53.google.com ([209.85.219.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UNnwG-0000aM-7M
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 19:27:06 +0200
Received: by mail-oa0-f53.google.com with SMTP id m17so3032467oag.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ucQgpU0ZXdp1NiNO1x1q+trEnPFyEHn4lc5z4K8GKeM=;
	b=DEdzv/hgiFONWCaP8cvGVO4N4br37Dxh1NzIT7OS7n2t/TTmXtX4xnKqmo9Z/HG+JO
	F9canIbmOXdr9VsrHPxrHGuAHvDvVPy9nR+8jfgrXAGgmCCHxrkmrPe7tq8IPXmcduoB
	vReKeKi1SRtK6CfQBSdfnlDttV8dlKpMrdEizwYcSyB4C8i0VdYn/Tk9Xvac6HMtRusT
	wNhfUwnNE0c+G5Ukg9vcmDXha1aRl0BBs71UNdzkC/pR2eiynxEl23hhb9gKRjp69z5K
	GC0vPdifRQ1o3JwoyU0G93JlTcKqPkHQMcfGqvr3FF9tbIlwAbd0rev9iQu4aTsklILj
	b0iA==
MIME-Version: 1.0
X-Received: by 10.182.127.7 with SMTP id nc7mr4997187obb.94.1365095389684;
	Thu, 04 Apr 2013 10:09:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Thu, 4 Apr 2013 10:09:49 -0700 (PDT)
In-Reply-To: <515D9F33.9060909@linux.intel.com>
References: <1365017211-17183-1-git-send-email-dv@pseudoterminal.org>
	<515D9F33.9060909@linux.intel.com>
Date: Thu, 4 Apr 2013 14:09:49 -0300
X-Google-Sender-Auth: M4519K3T93aea8B8ZJtVP80TZWA
Message-ID: <CAP9ODKoHXQt=HN7VkyeE+rWXkVV+hPLJhPFRUne+mCm7phhEdQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe][PATCH] eglinfo: Add recipes for x11 and fb backends
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
X-List-Received-Date: Thu, 04 Apr 2013 17:27:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 4, 2013 at 12:41 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
> I am going to defer this to 1.5 when it opens up, I still need to review the
> recipe, but wanted to give you a heads up about the deferral.

Any reasoning to defer it when it adds a good tool for validation and
test? It also offers very low risk of breaking something.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


