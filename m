Received: from mail-ve0-f180.google.com ([209.85.128.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UQQvV-0003nf-2t
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 01:29:10 +0200
Received: by mail-ve0-f180.google.com with SMTP id da11so79651veb.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 16:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=Q9cseCrWYM6C5hUutsSVmzz7kbUaZR76rreaeDgliLk=;
	b=N8gXdKcWFYlouEPnO2REK70yIbg7tZVFxYkLvSmHwf491IGSNBQ2zzlsfxNPJ+l9d3
	bZncWt6sPpgVzR8L524XwK7XhYI241r9nNU88h7t19loWXxVNh+8rFSYKdISeLjnIUFE
	BNJaLvXdCfxvMy22h+3Y/h3CtJ1XMH6sD+wjhxES6pv5NCluE3A+Xr5zH0EmW7Kpo5hz
	s/vZvuGv11Nx6Xn+NOMVNv+3t/7NnchzjqtLKXoH3mzGT2Zk7+TPiO/ox3rcJFcnybrd
	r0heMwEJlIkPomWhw4EHis+dS31ZnNGxAIk4KSyJAIKFxZKzOsWl8+g+iiMq/V3ZQ4DG
	mIoQ==
MIME-Version: 1.0
X-Received: by 10.52.65.147 with SMTP id x19mr5774962vds.27.1365721905154;
	Thu, 11 Apr 2013 16:11:45 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Thu, 11 Apr 2013 16:11:45 -0700 (PDT)
In-Reply-To: <1364824441.24754.20.camel@localhost>
References: <cover.1364456659.git.raj.khem@gmail.com>
	<ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
	<20130328122110.GA5105@jama>
	<35803143-FAED-48CC-9FD1-1E216B3A575C@gmail.com>
	<A54391FA-3CD5-4290-A92B-EE3477A2EEAE@dominion.thruhere.net>
	<D8B28775-1426-427F-B7CB-E10164FAF197@gmail.com>
	<CALbNGRSs_t4EbStjw4S6djPiL3xJDRQ0U0MvS820f1OkC7Q6cQ@mail.gmail.com>
	<1364824441.24754.20.camel@localhost>
Date: Fri, 12 Apr 2013 01:11:45 +0200
Message-ID: <CALbNGRSqEdebP4WsrH9xrW30k+MuxfaXousVfNfjdufS4yCfSw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Colin Walters <walters@verbum.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: Upgrade to 199
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
X-List-Received-Date: Thu, 11 Apr 2013 23:29:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2013 at 3:54 PM, Colin Walters <walters@verbum.org> wrote:
> On Fri, 2013-03-29 at 13:50 +0100, Andreas M=C3=BCller wrote:
>
>> Anybody an idea why I get this when building from scratch:
>>
>> | /home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/armv7=
a-vfp-neon-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-objcopy:
>> 'systemd': No such file
>> | make[2]: *** [org.freedesktop.systemd1.Manager.xml] Error 1
>> | make[2]: *** Waiting for unfinished jobs....
>
> http://lists.freedesktop.org/archives/systemd-devel/2013-February/008751.=
html
>
>
Had no make-native so did manually build it and now systemd compiles fine n=
ow.

Is there a reason why we don't build make-native - If remember correct
there were fixes also for webkit-gtk parallel-make issues (ok - these
are wiped away for me by retry loop).

Andreas


