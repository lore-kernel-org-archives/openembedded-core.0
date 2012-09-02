Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <z.p.gaal@gmail.com>) id 1T87mk-0004jH-EO
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Sep 2012 12:52:10 +0200
Received: by bkcik5 with SMTP id ik5so2085987bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2012 03:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=tVUPW2SDwEmGQFBJaBmO9PVoVChzyuLlHiw6GwWLt9g=;
	b=qgSOw9jiXHAL1J4YU03EqLJdlAqCURintbdww0t3JRXYL3FMivniCVGHYpW4G6u9Ue
	uC+aBq9e9bxuS3zUontMxpOPLRMQRhDRQV8nX5KtgWG2AaFx1Bsiu/hGa2aHQIAIOtld
	D4GPJU4hsLIkqN9x6bjAT+TjLQEDRp+50Savtfb4MHPIUMfIpxxVVAuCmwUoNtH8Uf6i
	Rc4PkVCWPJ2M8yQYNZyofGEsqmkyuDUNZpuuziaFqj943uedWUeIAk6WQcNR8tlnnU6c
	jPIESC5O0JWoSY4niVDkdXM+ebk3J1+6AvpKubiiQTAcxRcur8FOoW41g3UBHwmC9t6c
	VB8A==
Received: by 10.205.118.14 with SMTP id fo14mr5910655bkc.130.1346582391193;
	Sun, 02 Sep 2012 03:39:51 -0700 (PDT)
Received: from [192.168.0.13] (BC2411C1.catv.pool.telekom.hu. [188.36.17.193])
	by mx.google.com with ESMTPS id fu8sm5837827bkc.5.2012.09.02.03.39.50
	(version=SSLv3 cipher=OTHER); Sun, 02 Sep 2012 03:39:50 -0700 (PDT)
Message-ID: <50433775.2030101@gmail.com>
Date: Sun, 02 Sep 2012 12:39:49 +0200
From: Zoltan Gaal <z.p.gaal@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAJTo0LYYFvwD75PsXu2WtC+CvQ2ep0i5bDKZFcNKFyQXwDDGTQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYYFvwD75PsXu2WtC+CvQ2ep0i5bDKZFcNKFyQXwDDGTQ@mail.gmail.com>
Subject: Re: [PATCH] mesa: clean up PACKAGECONFIG
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
X-List-Received-Date: Sun, 02 Sep 2012 10:52:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I've tried it, but mesa-dri is required for xserver and it won't compile 
without it. libgles-omap3 cannot replace the mesa dependency, though I'm 
not sure  if it is a simple config issue or some interface is missing 
(libgl). And as libgles-omap3 also provides virtual/egl, the bitbake 
process detects, there exists multiple projects with the same provided 
feature:

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide 
virtual/egl 
(/home/gzp/work/gumstix/oe/oe-meta/meta-ti/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb 
/home/gzp/work/gumstix/oe/oe-core/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb).
  This usually means one provides something the other doesn't and should.
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks

(in local.conf: PREFERRED_PROVIDER_virtual/egl="libgles-omap3")

Gzp


