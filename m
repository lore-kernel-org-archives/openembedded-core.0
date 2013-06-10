Return-Path: <sakoman@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id B08D26A5B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 15:43:37 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id k18so1552078oag.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 08:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=nOK7cYy1mJtoXZ1q+BRc9BMw8KVLyVwmI3+XqN6W/yo=;
	b=Cw5oB53v8/5sDGYig7kk1ekJc0YabP6swxufcujnC7hcICdNBDxaWplTeDd0N3VTZz
	jYr9H44As+K2WZVqgRuD1x+1h95iBu9TgZP+pQy9fS49+mxIQirAfLj8tqIJUzCrxQOg
	fgT/4EytgADgrFDK8bJIibo/QJzdtrVOiGc7oV2k60fb9LHqFcuZGvQtdUNbbiiuP2eY
	foSprCanOma5ZXV9Fr2nZnnygGO3RfbSji/KnnrEefOsqrfe5dZZhymoSj4IcAocvvWs
	zieJJ7nZVmuUKxjNahLdqqAUTCWOaAVw3+sSS2qlwvGJNgWXeev0eejfm89BOZixpqiY
	dE7w==
MIME-Version: 1.0
X-Received: by 10.182.53.194 with SMTP id d2mr8676594obp.28.1370879018128;
	Mon, 10 Jun 2013 08:43:38 -0700 (PDT)
Received: by 10.182.213.130 with HTTP; Mon, 10 Jun 2013 08:43:38 -0700 (PDT)
In-Reply-To: <20130610150755.33deefce@e6520eb>
References: <CAGDS+nnQjF9P9s61--FW+_1gs_-qbcugmKt7-xd2i6gwkVFpRw@mail.gmail.com>
	<20130610094536.36e83ecd@e6520eb>
	<CAGDS+nmZVx2Jg3+DDhn_-zQytwzBOsKNREFNXF=GgFBn_7pnDg@mail.gmail.com>
	<20130610150755.33deefce@e6520eb>
Date: Mon, 10 Jun 2013 08:43:38 -0700
Message-ID: <CAGDS+nkNmA+BctPBDVoH_dHxKJqJ+ECLy5Rv0Yy=9HgOnd=+zg@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qt4e-demo-image with meta-fsl-arm: successful build?
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
X-List-Received-Date: Mon, 10 Jun 2013 15:43:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2013 at 6:07 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> Le Mon, 10 Jun 2013 05:58:42 -0700,
> Steve Sakoman <sakoman@gmail.com> a =E9crit :
>> I haven't begun debugging yet, but I had 2 initial thoughts as to why
>> the X error message:
>>
>> 1. The qtdemo init seems to be written to support both x and x-free
>> setups, so perhaps the init is getting confused
>> 2. I had built the x11-free version of qt prior to the qte version, so
>> perhaps that causes the issue
>>
>> I started a clean build just in case #2 is the cause.
>>
> OK #2 is clearly a situation I avoid here as this created me some
> troubles in the past.

And it created issues for me too :-)

A clean build of qt4e-demo-image works.  A clean build of a similar
image based on qt4-x11-free however is broken as described in my
original post.

Clearly one must choose either qt4-x11-free or qt4e, having both in
the same build setup is broken (perhaps by design)

Steve

