Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UODG2-0002MR-Lt
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 22:29:12 +0200
Received: by mail-ob0-f174.google.com with SMTP id wm15so1462423obc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 13:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=NEMU81Q+HHtWdQQeD4VQvYxVAEvMDUE6KZPfhFJxPYM=;
	b=lOOyzT6SqzpM7LGybrekgqG55H3MxGm677nF/OoXdqka1V5e7SLp1o4m12pL0Y0+nd
	WE1kurX3wlCD3uhaPHvpo6konKSp+UEq4a0qh53mh/uo4GFlrM8Cufxk+rW28CfKzHRd
	SXsW9itZurVkquXyIZy2yar2skDv+4qomRl8F/sFQKPaYChxu9dLzGICgEzy2PV1oejX
	RdxLUb+I5i5H9baG1DH5Stqh3MZBjnk48v6sp8VRytKUZrYvWLmAlAuJMmgv5VdwsjuR
	KIaxi1+EVTtSGd9F8ZQf6Uip3ggAsXgbspgNdkfCXCzcSX2PkG0L21+6mTYuJ+7sHk9W
	dYxg==
MIME-Version: 1.0
X-Received: by 10.60.63.73 with SMTP id e9mr9045976oes.87.1365192713692; Fri,
	05 Apr 2013 13:11:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Fri, 5 Apr 2013 13:11:53 -0700 (PDT)
In-Reply-To: <1365181591-6728-1-git-send-email-ross.burton@intel.com>
References: <1365181591-6728-1-git-send-email-ross.burton@intel.com>
Date: Fri, 5 Apr 2013 17:11:53 -0300
X-Google-Sender-Auth: wDTL4mSPhDJbesxvneGyXUpjT4s
Message-ID: <CAP9ODKowWP01_VijirCOUOQZp4W0uuV2Be151sCwjQ+02qSahw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: make the main package depend on all sub-packages
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
X-List-Received-Date: Fri, 05 Apr 2013 20:29:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Apr 5, 2013 at 2:06 PM, Ross Burton <ross.burton@intel.com> wrote:
> Whilst splitting out specific large firmware blobs is a good move for space
> saving, it makes installing "all the firmware" tricky.
>
> Make linux-firmware depend on all of the separated packages so that installing
> that pulls in all of the sub-packages.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

+1 Looks great, indeed.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


