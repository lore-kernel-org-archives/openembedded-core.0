Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuXaq-0007l1-S5
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 00:03:28 +0100
Received: by lbol12 with SMTP id l12so1318594lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 14:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=E3efGdlhLsQvCwfhMpmPhwxziveofV4TZO6VvysfiAQ=;
	b=MzBf4bjzd5ubXRn2hy9qnAeSFjquqYtrVV2ZKQgrmqvgZRszb3b8M64Z4lgODGLjD+
	T2z3fIGswXj2OXQ/oVf3gAtjMMBEZmyCbOtJlKIMBT4aVM1qj9KGymsRUMNLuMRCyGjY
	WNaG4FKwpb58B5GcWa3iJ4rwb8dwqIoyzNdF0=
Received: by 10.112.32.1 with SMTP id e1mr5613355lbi.3.1328568927300; Mon, 06
	Feb 2012 14:55:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 6 Feb 2012 14:54:57 -0800 (PST)
In-Reply-To: <4F302661.9000400@gmail.com>
References: <cover.1328509284.git.xiaofeng.yan@windriver.com>
	<1624cca695c5baf08d376297f7278732dbcbfba6.1328509284.git.xiaofeng.yan@windriver.com>
	<1328519623.2716.208.camel@x121e.pbcl.net>
	<CAMKF1sqCO2Zz=4K=vSAAHZ1s8z=Hco7TQAWiFGMiXJLQB834pA@mail.gmail.com>
	<4F302661.9000400@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Feb 2012 14:54:57 -0800
Message-ID: <CAMKF1sr6Sz99zb4AK7K+nWvUivyF+Lkf1QzMdMKyiwpoETRfWQ@mail.gmail.com>
To: Peter Tworek <tworaz666@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] glib-2.0: Don't check function qsort_r
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
X-List-Received-Date: Mon, 06 Feb 2012 23:03:29 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 6, 2012 at 11:13 AM, Peter Tworek <tworaz666@gmail.com> wrote:
> Yes, it does. It was implemented somewhere in between 0.9.32 and 0.9.33 [1].
> Last time I've checked it even worked fine with glib-2.0. You just need to
> change glib_cv_have_qsort to yes in meta/site/common-uclibc.

yes I was merely pointing out the need since we still dont have 0.9.33
in metadata


