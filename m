Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B78E76BCDC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 20:03:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44QvjB3Zp0z5c;
	Fri, 22 Mar 2019 21:03:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553284991;
	bh=pXjO/XgdinOaymgAFJA9WZLs1dMBhAiQSuRxgVxbCYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VY4VoGRZF1T2iDcEpArC41pmeUG0CbS0rfKvFQ9BAUJlxcrq87a+lDmanQZ2TE3gl
	f41Tn84iNwfLlH1Gx8YJpCk3tuD5y7woOmwFgd41UsZNymNLQVKp5j3NXJgJ/7hnak
	59wOjxYQUFdMVrOHi+Nf2qqzdQqcyE8xTLDxeK+rI2qfR7yR8WdaXhw9dYqza0O1Yz
	G3aUiAiALfCwB9i27EOXjidW3QpaCFAnuvSlopOmSnHtk+GO58staVqOb8bGkGlnd0
	+VOls10HziYKrExDrbBOQZGEP4cqjKlTY0aLQCZo7sv3drr+VJ9RrjjjEazG/JfOmf
	4rn+ooEKwcSV51EmV30IuHlKqg73yyYNXqXcps16g3uE5lyytfwolK+26Y9mAcfOzu
	mV4my2eLt18tpeD4HlEw/1hEWuQxBnAoAS5OJItiYHutB3BkKJPreJHRAMQd7JkqHg
	aONOKzXascmw39r5KqRERZ4XogddBQuW8i/sb7KGATWbIp8oTSw9dsQZDiQCUGeiI/
	Ld+vOEa0LMvjyuHmaTCXEfWHgm7n3pqhnbn8cngqFnjWVMjoVkSIQzjzVq911wh/RH
	rpAyYoSo4tA8ww+X+B+a3wvlpr+n5qUprsg14xU2/ke+DRpqSnqSqVnjxT+HROA3GY
	J9twiaVDaoX0CJRjKbDcvlTI=
Date: Fri, 22 Mar 2019 22:03:06 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20190322200306.GB14099@localhost>
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl thoughts
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
X-List-Received-Date: Fri, 22 Mar 2019 20:03:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Mar 22, 2019 at 02:11:35AM +0100, Andreas Müller wrote:
>...
> 3. Change our musl slightly: Many patches we currently have are
> trivial. Missing headers or #defines for missing functions... So if we
> add few headers
>   * Empty chunks for e.g <net/ethernet.h>
>...
> Some other ideas?

Not upstreamable hacks aren't a long-term sustainable way,
no matter where you do the patching.

net/ethernet.h header problems are requiring 2 patches in NM.

It would be good to get whatever is the actual root cause fixed properly,
and that fix upstreamed.

E.g. I wonder whether this was supposed to be fixed by
0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch

Or is this patch in linux-libc-headers even the cause of the problem?

linux-libc-headers applying 6 patches just for musl is not a good sign 
in any case.
Is that much patching also done by other distributions that use musl?
Why are these patches Upstream-Status: Pending/Submitted for a  long 
time without having been applied upstream?

Long-term it would be less work if everything would get fixed properly
with fixes reviewed and applied by upstream.

> Andreas
>...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


