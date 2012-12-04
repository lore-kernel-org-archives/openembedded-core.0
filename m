Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfoRQ-00079b-SC
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 10:05:24 +0100
Received: by mail-wg0-f45.google.com with SMTP id dq12so1969121wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 00:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=F/Dec/wxdzebTZYMlw90uth9y1oDwBpKTAlvcnyodyo=;
	b=kwHGQwMB0b0LH0PHK4vVgrUBtd1WMMOZ3JLsY8zEqFLijy9DFcoPGLFbHHqlKV9cYq
	8t1LCAvbTSwzirUHiH0I+BlVjxqvHUQHVCSM4/jFP3ikd/syV/qIE5PJd5qpgkbLCycf
	CLK9nd//v1qEeiYJXJyb15Z51IcGfLSqVv1xBDGL4v+9ruI7egeONLER/leenRGNN8Tz
	QcfNC3WThGVJGa6mZVbfXgGV8DmLiZUb1PekkT0lJ3ndtRARCV2kxpNBPErZIikgSZ6J
	zztdWLSFygAglMXk3kH5qohOxL/tk2X0ChupwQ+bGQbIwT+TgKN6IluBsUPloFOw5aUA
	j1cw==
MIME-Version: 1.0
Received: by 10.180.81.39 with SMTP id w7mr2827519wix.15.1354611062527; Tue,
	04 Dec 2012 00:51:02 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Tue, 4 Dec 2012 00:51:02 -0800 (PST)
In-Reply-To: <50BC628B.1030905@windriver.com>
References: <cover.1354265260.git.Qi.Chen@windriver.com>
	<df75410d0032ada41e657f6bd01a5d185281d541.1354265260.git.Qi.Chen@windriver.com>
	<20121203081842.GA3354@jama.jama.net>
	<50BC628B.1030905@windriver.com>
Date: Tue, 4 Dec 2012 09:51:02 +0100
Message-ID: <CA+chaQdUszJUVsHhDoM-vZh+gWDVuFf3A-50jLQ1RuBkLh95Qw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] qt4-native: make qt4-native work with long building path
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
X-List-Received-Date: Tue, 04 Dec 2012 09:05:24 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 3, 2012 at 9:27 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> I've changed it to "Submitted" and sent the patches again.
> Could you please have a look at it to see whether there are other problems?
> (By the way, what's the difference between "Submitted" and "Pending"? If the
> patch hasn't been sent to upstream but will be, we call it "Pending"?)

It looks like older version of your patch was applied, can you rebase
that branch and send what was left as followup patches?

Cheers,


