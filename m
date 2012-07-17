Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <damien.lespiau@gmail.com>) id 1SrGx8-0003QG-CR
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 01:13:14 +0200
Received: by vcbfy27 with SMTP id fy27so673640vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 16:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OErrPunXLruwf48a8y7xt6ex05xbSG4GDYiqElW6UIE=;
	b=iPjtfH8ZE1oNQEWat9F4Zh4m2+vuhrOLxaKTtlpDWzAXaCfMqMEEhSYPpNTTf7gOVK
	dezM3w+OZd88Gf7Eif+1sPbcGbbtWSjuAbzQMJByaeBniBeSOiVQdgOXG7xkMtbSUf7I
	EvSg2+5D892bX+MaZnqep0Va0UlY0nKmsYD2Ru2GeQlcNbj/KFTrEJFdmJvhzSfcC7fb
	YD26AfkLaKg2BxzcdnyNor4bkFkZ0kfyyKLeMZo6LNZaSiCkzyOXVRm0vdII57hvP/Hy
	QHUbi97dkNewqmv705RSOOh7Ff6CyvX1csob8UJFsAAYyHdrKnqpi1Fxt1iSj2J0qNJc
	zAKw==
MIME-Version: 1.0
Received: by 10.52.27.143 with SMTP id t15mr1819985vdg.18.1342566113628; Tue,
	17 Jul 2012 16:01:53 -0700 (PDT)
Received: by 10.58.240.73 with HTTP; Tue, 17 Jul 2012 16:01:53 -0700 (PDT)
In-Reply-To: <20120717223910.GE22569@jama.jama.net>
References: <1342563792-17634-1-git-send-email-damien.lespiau@gmail.com>
	<20120717222804.GD22569@jama.jama.net>
	<20120717223910.GE22569@jama.jama.net>
Date: Wed, 18 Jul 2012 00:01:53 +0100
Message-ID: <CAGrt=7hO1pUvJfhxjf2QaDHOmCiUhafAiBJaOxBwf6yD-C+scQ@mail.gmail.com>
From: Damien Lespiau <damien.lespiau@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Damien Lespiau <damien.lespiau@intel.com>
Subject: Re: [PATCH] eglic: Update the svn URL
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
X-List-Received-Date: Tue, 17 Jul 2012 23:13:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 17 July 2012 23:39, Martin Jansa <martin.jansa@gmail.com> wrote:
> It's a bit worse.. this patch didn't make it to V2
> http://patchwork.openembedded.org/patch/31617/

Ah, thanks! makes more sense now.

git grep helped as well to catch all the remaining instances (Vs
runtime warnings). btw, bitbake still has uses proto= and ">proto<" in
its manual :)

-- 
Damien


