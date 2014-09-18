Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9B3601A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 13:43:12 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id z60so1075014qgd.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 06:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=dmmSsTgXcgVrqflA/mLrL8HdgTtecpsOi3jKxwZATWE=;
	b=pkGKjMF8vBCXFibCeARgRxNjFG+o8WcqEnhvoy/sM+feJy1mjB8WBW/GOnIoc4/Lg7
	6ty1d9h69l6dLbgcQ7YzHVBvW06xniqkJqD/+qM21FBNhm+osNmVgDFna5Nox8MUwM51
	18EGQmY+2ETywm5k1jtIe1qPkKGciTLKNX91+zAfyG7jbw3ZT7TsBE1aW2bRnhsDiOFG
	pzheN3lxBf+RDVEE8SkiOBtMmBhamqAMqnf3xlnHU3yR4beabjyKoJ5gq1SUfPYufhaJ
	1PuSVdgqUPoHdZwXI0voJKv6LxwMmrlmmNzIeUhyM5+9cQSW8cJhFGZfQONsn4iUiWe/
	gjuA==
X-Received: by 10.224.103.65 with SMTP id j1mr9014927qao.17.1411047793302;
	Thu, 18 Sep 2014 06:43:13 -0700 (PDT)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94])
	by mx.google.com with ESMTPSA id y1sm16660298qaj.34.2014.09.18.06.43.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Sep 2014 06:43:12 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
References: <87sikoz4qd.fsf@parenteses.org>
Date: Thu, 18 Sep 2014 13:43:09 +0000
In-Reply-To: <87sikoz4qd.fsf@parenteses.org> (Mario Domenech Goulart's message
	of "Fri, 22 Aug 2014 19:47:22 +0000")
Message-ID: <87fvfpavte.fsf@email.parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Subject: Re: Should lsb rdepends on lsbinitscripts?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Sep 2014 13:43:15 -0000
Content-Type: text/plain

Hi,

On Fri, 22 Aug 2014 19:47:22 +0000 Mario Domenech Goulart <mario@ossystems.com.br> wrote:

> The scripts installed by the lsb package (under /etc/core-lsb) source
> /etc/init.d/functions, but that file is not installed by lsb or by any
> of its dependencies, as far as I can see.
>
> /etc/init.d/functions is provided by the lsbinitscripts package.  Should
> it be in lsb's RDEPENDS?

Any comment on this issue?

Best wishes.
Mario
-- 
http://www.ossystems.com.br

