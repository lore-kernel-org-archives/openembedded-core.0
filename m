Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTCnA-0001o7-Uw
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 15:27:45 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so119302dak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 07:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=kPhm9GDYVDwUgPitDuxmiDDtREpAL99rwdbAFhyyQeE=;
	b=QHsn6owKcceqxzTtRvAfpMldKollxcPC9BBqrwdkKljGGYK/843pOI3uo5z0T2TYw6
	l5aljLJ8CXd5GGSUPyNwBq3t/ftVwgWHajf9QBqvfOqneNm9kYsrhwKAUIbQZVlisJKc
	QX6tPgwaPupnIYorFeGzxPt4Lr2nfvUScdNEOUYi7/za3gbQPLJhH9hb/1/MlNI9Ja8X
	ZCs+n3b952xVo2HRzM/iGMXjG/NyMI5QWtHO/X/L/S9ONtsCqA93lu5ta1VSxyhhYzsQ
	ZbAawqUZ7+9Q2CMdlYxrCikystxP7JQhfkKNypopUkpClWubV5tB0g/WzVWx2vUXf8E9
	QCeA==
MIME-Version: 1.0
Received: by 10.68.204.34 with SMTP id kv2mr19463623pbc.136.1351606448793;
	Tue, 30 Oct 2012 07:14:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Tue, 30 Oct 2012 07:14:08 -0700 (PDT)
In-Reply-To: <508FA924.4030301@communistcode.co.uk>
References: <508FA924.4030301@communistcode.co.uk>
Date: Tue, 30 Oct 2012 12:14:08 -0200
X-Google-Sender-Auth: iBxJGT9ziKOczdCGLIxQYMa8mp8
Message-ID: <CAP9ODKqDYeu8ywdGPE_v3LjxG=_NLopzcd=XwZ1pTf9d7JZx+g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ml@communistcode.co.uk
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Removing netbase from an image
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
X-List-Received-Date: Tue, 30 Oct 2012 14:27:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 30, 2012 at 8:17 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> I am attempting to remove netbase from a custom image. I would like to
> replace it with connman. I have added connman through EXTRA_IMAGE_INSTALL,
> however netbase is brought in via packagegroup-core-boot.bb which funnily
> enough has some very important features and I would like to keep.
>
> What would be the best way to make this replacement. Should I copy
> packagegroup-core-boot.bb and keep a local copy, while keeping it in sync
> manually? Alternatively, I notice quite a few packages in
> packagegroup-core-boot have a VIRTUAL-RUNTIME_* define. Would it be worth
> having a VIRTUAL-RUNTIME_network ?= "netbase" which could be overridden?
>
> Thoughts?

Even though I agree with Ross that you most probably want to override
the interfaces file I think it is nice to be able to override it and
the VIRTUAL-RUNTIME_network-base would be a good addition for it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


