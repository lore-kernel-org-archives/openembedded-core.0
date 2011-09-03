Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1Qzvag-0005PE-4b
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 21:09:18 +0200
Received: by vwe42 with SMTP id 42so3185091vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Sep 2011 12:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=38nuRDq/2AQAnf0A79Xh/DPxKyy77IjuN620oXkjzeA=;
	b=uzw+vJgTsbqN4gDVMrlq5o0Hd4Zp8HIc4FyysEnf8Hc/Rke5nZEEPB4hgGp8z1fo0E
	gXLRhN7s4+FMy2FN2C/YQXLvwMiKJjKNxJwUg35GamgIo3/min9VkqHVvYDdG7SnJLuR
	ZLNySdbUi3VkqXA6ucT/uPJpqwONz/kJ7lfQk=
MIME-Version: 1.0
Received: by 10.52.28.233 with SMTP id e9mr2134275vdh.266.1315076659561; Sat,
	03 Sep 2011 12:04:19 -0700 (PDT)
Received: by 10.52.183.37 with HTTP; Sat, 3 Sep 2011 12:04:19 -0700 (PDT)
In-Reply-To: <DE9759A0-C638-4B4A-A6BC-6B61139D866A@dominion.thruhere.net>
References: <1315074165-20137-1-git-send-email-dbaryshkov@gmail.com>
	<DE9759A0-C638-4B4A-A6BC-6B61139D866A@dominion.thruhere.net>
Date: Sat, 3 Sep 2011 23:04:19 +0400
Message-ID: <CALT56yOh6E9=51CWv9r-6Qz62wycn7MC4sn5pCKPEQziE07-QA@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] zaurusd: enable support for collie
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
X-List-Received-Date: Sat, 03 Sep 2011 19:09:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 9/3/11, Koen Kooi <koen@dominion.thruhere.net> wrote:
> shouldn't this move to meta-zaurus now that oe-core is qemu only?

Maybe. IIUC, currently the plan is to push meta-zaurus into meta-hh as published
by Paul Eggleton. On the other hand we didn't start this move (yet).
So please ignore
this patch for now.

BTW: Probably this patch and fix-makefile.patch should just be applied
into main git?

-- 
With best wishes
Dmitry


