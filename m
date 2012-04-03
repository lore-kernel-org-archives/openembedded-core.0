Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SErLP-0006Pu-R9
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 02:11:31 +0200
Received: by lagw12 with SMTP id w12so3862426lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Apr 2012 17:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bmP3fezyZ7rvIwVwxCOw0SC2nBYD2OAqtaDh/Xvvh38=;
	b=CFl3dgoydTvkd9C6ZBV4TD9hn9N7QdktrW0dogFZvJ87Xgyv0HHrxy/P8OkmjPq9K5
	2a/mffhlKZmOz16ju76COB3cuWcaXzjP71rAlYNASlBKfp95SmFnXOgx5lavRHhGGRoG
	TiQSSwIpHohSfAMjJ1jddJ0siQ7q+YXkqKIXubSwmqFkZsWkXbllTC2yq3LAUJpCfvvi
	iImUWEJgPCuTsMJ5LZKxgOUOFBkTxIK/O3VNoUierF9lqchEsqIVQakfoE2mGOo3cFts
	V8/EXChgKjoRKt+BcDeGJoO8t9fzIY0p2axxZr0nIsBt7Z/NOMuOEBhdxOiOYvZr6JuG
	jjfQ==
Received: by 10.152.115.38 with SMTP id jl6mr11681796lab.24.1333411343057;
	Mon, 02 Apr 2012 17:02:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Mon, 2 Apr 2012 17:01:52 -0700 (PDT)
In-Reply-To: <4F7A1E21.1070600@opendreambox.org>
References: <1331773718-14372-1-git-send-email-obi@opendreambox.org>
	<20120402210859.GA26880@sakrah.homelinux.org>
	<4F7A1E21.1070600@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Apr 2012 17:01:52 -0700
Message-ID: <CAMKF1sq7hPiGwyKU_uwQtQKTjP1c0iDdMdUg9rx1qW8L1T1O=A@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] parted: don't pass --disable-Werror to configure
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
X-List-Received-Date: Tue, 03 Apr 2012 00:11:32 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 2, 2012 at 2:46 PM, Andreas Oberritter <obi@opendreambox.org> wrote:
> Maybe (didn't verify), but it doesn't seem to be required anyway, so
> it's better to not use the option.

I generally agree on nor disabling werror. so removing it is right
thing to do regardless


