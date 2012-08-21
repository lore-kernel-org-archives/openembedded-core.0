Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1T3sFZ-0001tB-Hd; Tue, 21 Aug 2012 19:28:21 +0200
Received: by eaad12 with SMTP id d12so14792eaa.6
	for <multiple recipients>; Tue, 21 Aug 2012 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=w6m27nsCkJosSpk7LDidn3IjjFcYK3dPQxshN7ptDy8=;
	b=tI0DJVP2mFirCTOYP6SKCoCFiMDA5EmCOfOxPc8J53cTR4ZBpCvNtXdhjojh50OIE/
	ggLCcXTQReLvK+LYzLmtjEBineI6jQjRce46LNbnNKkTFykCDcTO+aLbmvoCQa5RGbpp
	hPfv7goRD4MVubGZONqgLGbv0z9x2ATnNPEgEY78wRd7PyaEc/DJQb6WKxPFdlrCuTVY
	CYGHoe1MiqZwa3tX1LM7KMU+G0JxV21YLSsc4pOnWW6ZBTbOPmL5vV+CZRPbDjbrI1lJ
	YhSanBaGDvuICYhnM2C7nZc5LW4DcbCd4CyW0S040bdNs4aowcvssTTOaLhumPFIuAU1
	IgVg==
Received: by 10.14.202.131 with SMTP id d3mr14648842eeo.32.1345569377849; Tue,
	21 Aug 2012 10:16:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 21 Aug 2012 10:15:47 -0700 (PDT)
In-Reply-To: <20120821121850.GD3029@jama.jama.net>
References: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
	<20120821121850.GD3029@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2012 10:15:47 -0700
Message-ID: <CAMKF1spWTYExCcvQ9Uqo-470Qxb2NTwB_xYHhU7RzFOuiYP_VA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: yocto@yoctoproject.org,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Toolchain rework, call for testing
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
X-List-Received-Date: Tue, 21 Aug 2012 17:28:21 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 21, 2012 at 5:18 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Maybe it's because
> http://git.openembedded.org/openembedded-core/commit/?id=30617bde61a3b0a0944b49a0c9fb7159dacbb19f
> is missing PR bump and gcc wasn't rebuilt before eglibc upgrade (OEBasic not OEBasicHash here).

yes seems so. I have stopped using OEBasic long ago, you should stop
using it too.
But feel free to send a PR bump patchlet.


