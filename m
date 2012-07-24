Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1StfKQ-0000lx-68
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 15:39:10 +0200
Received: by lags15 with SMTP id s15so831046lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 06:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=HrccRqAoHhHFcNtNo94p/+w0c4PG7WLvN7I9Gnma6x8=;
	b=04Ga8p1sT2k+qKC30XdIwvGf/eAg6I7In8N/9FL44j9LsaDADToe2cAVfTsjKJ3FGo
	imVwOXsoOD4YnR7TeLmBqDkLHs9tgNXqRF9QJXCfL49JlHOzx1ldMZNVUvA+C0JOgoNH
	Ph+gtMEIdXrE9BIeK/9vumiUA0IuKdY+OL0aIFQ/b9wcJSaF4RFV/ZJScWF7FBskvObO
	2udCjagUf/Gt3He82E86vhaxO4LSwPxoKdH1kwq6gxuZxiFf0w1Wd1FHakmGL7NmCOsv
	xsQFAtTxeHDazUiAOqFQ8idh0K9dw8PALCNPuiqBAbBUhcmFA6RY66bDqghPN9dhx/0/
	YSpQ==
Received: by 10.152.105.51 with SMTP id gj19mr21485180lab.38.1343136461806;
	Tue, 24 Jul 2012 06:27:41 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Tue, 24 Jul 2012 06:27:21 -0700 (PDT)
In-Reply-To: <500E50C5.8000403@intel.com>
References: <1343052252-4154-1-git-send-email-radu.moisan@intel.com>
	<lywr1uzguj.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<500E50C5.8000403@intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 24 Jul 2012 06:27:21 -0700
X-Google-Sender-Auth: RkQnB7-KwU9clLE1WLJdthuacKo
Message-ID: <CABcZANkJhW+yER52vnbXSywxd-mhpNTPrFixL6R27thmMRmhMg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kmod: Handle undefined O_CLOEXEC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jul 2012 13:39:10 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 24, 2012 at 12:37 AM, Radu Moisan <radu.moisan@intel.com> wrote:
> I have not tested on CentOS 5.8 if the applications are not broken in some
> way, but that's not in the scope of this patch. If something does indeed
> break, then a totally different patch is required, targeting a backport of
> kmod for kernel older than 2.6.23.

Personally, I'd rather see the build fail than have the tools behave
incorrectly in some inexplicable way. If you haven't tested it, the
patch shouldn't go in.
-- 
Christopher Larson


