Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 925F47277D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 10:58:22 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sBNAwIaS014604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 23 Dec 2014 11:58:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1419332301;
	bh=BFFe+WPyEswcwlHzqdzPpEM/Ub4ABtSr3m9LMX3ltQk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=NMDs7lsNK771WJyQXoUx+R3npUatRaUEGOUqQGC3nxwN1o1z1BWweL/21OhH/6tzI
	gPTy7SW3rLAenUU0i9wUzdnV46ruveVWP4GU5nPxIGtseRsFyLGXHpbECyAeYeLxJW
	Qju9Quty+6takL2OX7JykT1+8flwn0dSfN1gyvZg=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sBNAwC2u030208
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 23 Dec 2014 11:58:14 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Y3NAK-0000Yv-E7; Tue, 23 Dec 2014 11:58:12 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <lymw6gylj1.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1419322751.1777.3.camel@linuxfoundation.org>
Date: Tue, 23 Dec 2014 11:58:12 +0100
In-Reply-To: <1419322751.1777.3.camel@linuxfoundation.org> (Richard Purdie's
	message of "Tue, 23 Dec 2014 08:19:11 +0000")
Message-ID: <ly8uhyab0b.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to enforce ${B} = ${S} builds globally?
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
X-List-Received-Date: Tue, 23 Dec 2014 10:58:27 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> | test:
>> | /srv/oe/cache/bld/f95aceac-8952-bd61-430a-dfcdf48db33c/work/cortexa9t2hf-vfp-neon-linux-gnueabi/test/1.0-r0/test-1.0/test.c:2:
>> | main: Assertion `0' failed.
>> 
>> instead of
>> 
>> | test: test.c:2: main: Assertion `0' failed.
>
>
> Lets say you just shared this error as a cut and paste to me asking for
> help. In the latter case, I have no idea what happened. In the former, I
> can tell you were building for an arm system, your recipe PN was test
> and so on.

Version numbers can be extracted more detailed from package management
data (e.g. in case of kernel, you do not see the git revision in the
BUG() but it is shown in 'opkg info kernel\*').

fwiw, I wrote the posting as an end-user who had to deal with 'GST_DEBUG=9
gst-launch' output where 70% of the line is filled with a redundant and
uninteresting path.


Enrico

