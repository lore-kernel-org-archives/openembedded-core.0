Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1SDcfh-00054E-Po
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 16:19:21 +0200
Received: by qcso7 with SMTP id o7so358355qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 07:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hm5oNplxUhXAWgqmbIaZjB+jgOc7VBpVoQHHXEn8iuM=;
	b=jrAdPs2rpMSLzs4LU02ecwriNKi9gCcfk6GeriUr+JtNDYg0IC+RdBnhfV8/fCv2Fx
	pD8wkxA1b+WVSxkwfh7OcIDJyWrYsoCXlOWXblCIQ8VUcdOLVcjpLGFeQUb0dLYTq1fT
	0M4ysVmEXKltBFJGDaX8zyNO26I4brxL4QTg+jKpwC/kR6OIpXMxCH/BOyp359kowoAs
	tWBsOk8oEwG3pcRFA6y1dKtJTwMh/rYj+GK+3zYKmyL8xCz66hyw/YTUwioRqWyZJriL
	xzvfcUA9OJ+OImo1KUNJ8l4obUm38U1hu28l5xhGNs2U7r67Mi/zXc101OUlndHr36Kr
	RAIA==
MIME-Version: 1.0
Received: by 10.229.115.21 with SMTP id g21mr873213qcq.77.1333116616524; Fri,
	30 Mar 2012 07:10:16 -0700 (PDT)
Received: by 10.229.158.4 with HTTP; Fri, 30 Mar 2012 07:10:16 -0700 (PDT)
In-Reply-To: <20120329135727.16cc3f61@wrlaptop>
References: <CAGDS+nnR4it2-C0FM1CeJBSakt9HmVizKQSO1wkc5EqxQKh22Q@mail.gmail.com>
	<4F74AC6F.5040009@windriver.com>
	<CAGDS+nnEOMQs+OXtchFWq-Jr+zVxhGd4KTtaK3PBS4JYJVGG-g@mail.gmail.com>
	<20120329135727.16cc3f61@wrlaptop>
Date: Fri, 30 Mar 2012 07:10:16 -0700
Message-ID: <CAGDS+nkPcbDFg5Ahq9jTktHHG7RUE5+e+LA2S_Kxw=BBJ321aw@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: pseudo failing with cc1: error: unrecognized command line option '-m32'
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
X-List-Received-Date: Fri, 30 Mar 2012 14:19:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 29, 2012 at 11:57 AM, Peter Seebach
<peter.seebach@windriver.com> wrote:
> On Thu, 29 Mar 2012 11:53:23 -0700
> Steve Sakoman <sakoman@gmail.com> wrote:
>
>> Clearly not something a sane person would do . . .
>
> Now that is a persuasive argument in favor of making it work if I've
> ever heard one!
>
> I'm doing too many things right now to fix this, but if you want to try
> to fix it, I'd be interested in seeing patches.

FWIW, this patch:

http://www.sakoman.com/cgi-bin/gitweb.cgi?p=poky.git;a=commitdiff;h=e8fb8258707e798828d033fc8e1c051a27d4c0ed

Gives the following results at runtime:

root@omap3-multi:~/pseudo-1.3# ./run_tests.sh -v
test-chroot: Passed.
test-dir-move: Passed.
test-env_i: Passed.
test-execl: Passed.
test-pseudo_disable-fork-env_i: Failed.
test-pseudo_disable-fork: Failed.
test-pseudo_unload-fork-env_i: Failed.
test-pseudo_unload-fork: Failed.
test-reexec-chroot: Passed.
5/9 test(s) passed.

I don't have a lot of time to debug this today, but if you have any
ideas I am happy to try them!

Steve


