Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UPcxz-0007e5-JH
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 20:08:23 +0200
Received: by mail-wi0-f178.google.com with SMTP id ez12so3955053wid.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 10:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=YRQXzH6lApQ+w4roJCzf2isxPRW1Wq+RtJKajUfbIqc=;
	b=jYXlgTQLy8NDMq9LjWOjIZ7rm0ucGcS6sGLGzIQLm/Ypxhsf7wgVhdonxThn7hoAZ0
	t9Diswv3kj4ec13IjY/A2FxDrsO4epxT1CenVIWFEAacfxF0gFFQLPy9AIFHAky7EeNf
	cRXpyEGFFaLtRlpaDVkxIh84XAniCDhLIeKS8H3BLGLK+JV0d7Pg67vQ8a4jVKPuEc0/
	f4xriR+UxO76K/mXg783fSkXRdnDIqGeXU/YFK7t0rjYoYBNIUxwo27n3TBV+mgubme7
	fIVobeLKLZzqTUGzMf7z8G6M9G28yu2WuzeM9cCYzxpUZX0ctKFOZZTr8fJK9H+ZeI4+
	M4Uw==
MIME-Version: 1.0
X-Received: by 10.180.97.132 with SMTP id ea4mr21408458wib.23.1365529863447;
	Tue, 09 Apr 2013 10:51:03 -0700 (PDT)
Received: by 10.194.45.100 with HTTP; Tue, 9 Apr 2013 10:51:03 -0700 (PDT)
In-Reply-To: <cover.1365517068.git.paul.eggleton@linux.intel.com>
References: <cover.1365517068.git.paul.eggleton@linux.intel.com>
Date: Tue, 9 Apr 2013 13:51:03 -0400
Message-ID: <CAHUNapQLmeRw2jz=caaGk-db3UkggOLVL_MrGg_VSeJPwnL+DQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Minor comment/doc fixes
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
X-List-Received-Date: Tue, 09 Apr 2013 18:08:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 9, 2013 at 10:19 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>   git://git.openembedded.org/openembedded-core-contrib paule/layer-tweaks-core

This is odd... I perform a:

$ git fetch --all

But I can only find a paule/layer-tweaks and not
paule/layer-tweaks-core. Yet the http:// link works fine.

Did I set something up wrong?

$ git remote -v
contrib git://git.pokylinux.org/poky-contrib (fetch)
contrib git://git.pokylinux.org/poky-contrib (push)
origin  git://git.yoctoproject.org/poky (fetch)
origin  git://git.yoctoproject.org/poky (push)


