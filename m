Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 829F16013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 14:57:46 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so15626337pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 07:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=mkBFMwZRQxPH5s6qQqyNHiYiPwWM60VQ7dt4JOAircg=;
	b=aARNKCKLf3hXa/iQBCc95KVb5bmfbJHsypnAlLzzXFRNu9t0FIC0lP8qbFYjrvU1EV
	PFWPQCrnkXfeeDp0iifsXHvrVX1w8HOpPw2czGIyNzr6Kas/6oA+hprqF/FEmeK5d+4E
	yjqr+wukSOlto6ecO3QRvrRxE+XZu7vhSm7K+TWaZiD54AyqR09Z8zI1SCcmO5oYQo1H
	A5PdjwZ22NXEu/wqUcy2UXKZKr1J1zX9Vy/PO8v7qwwbdPqWVBoedmZWypl7sd2JhIX1
	v2s0HA5TIksMi3MFxfoOS+ZJTaw0T+/yPywq7jShuH06RznHJunAHbwooQGCW1J9tQZu
	j7pw==
MIME-Version: 1.0
X-Received: by 10.66.216.136 with SMTP id oq8mr28232052pac.97.1431442667123;
	Tue, 12 May 2015 07:57:47 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Tue, 12 May 2015 07:57:46 -0700 (PDT)
In-Reply-To: <1431414393.30971.109.camel@linuxfoundation.org>
References: <1431268136-6968-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>
	<1431295383.30971.25.camel@linuxfoundation.org>
	<1431414393.30971.109.camel@linuxfoundation.org>
Date: Tue, 12 May 2015 11:57:46 -0300
X-Google-Sender-Auth: ipvlxRoU38seH2bySvCB-wIYqDY
Message-ID: <CAP9ODKocHho1K+zDbnEVsM5Lq_wFhJD59cD6o0c2R_99oZrmjQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Richard Schmitt <richard.schmitt@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: fix build issue with gcc5
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
X-List-Received-Date: Tue, 12 May 2015 14:57:48 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 12, 2015 at 4:06 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2015-05-10 at 23:03 +0100, Richard Purdie wrote:
...
> Otavio: Could you see what our options are with meta-fsl-ppc and
> metafsl-arm?

Yes. I foresee some challenges especially the old kernels.

fsl-arm has 2.6.35 for some platforms and fsl-ppc has 3.12.

I am adding FSL people to also take a look on these failures.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

