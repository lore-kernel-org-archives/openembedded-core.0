Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 3E30879023
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 17:09:33 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w7KH9YME008026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 19:09:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1534784974;
	bh=TkVQim/H1aSnQrkXK+RVgOgVsA4zw0eRwa/9mZ3ECZw=; l=2224;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=HbE8E+7+ygMGIYjwDh6XPJp5UMrJ33fq7UzeTuwSUg60IqzTRvumm4KO0VgbwkrC2
	TaTTLEcFIuUCPIxK0qF+1iU9dn1OvNZiPxlW396E7Gm7S0Qf8oMKisAH60YV5SRCoT
	1aDowkeK1no166//W1S26MqLwpylfVEGw+c+EXNw=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w7KH9QPh017547 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Mon, 20 Aug 2018 19:09:26 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 3C42602FFF3;
	Mon, 20 Aug 2018 19:17:25 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w7KH9Oib017544
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 20 Aug 2018 19:09:24 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.91) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1frngC-007T96-CK; Mon, 20 Aug 2018 19:09:24 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <lywoslrvbf.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CANNYZj9NvALbQks02PS_Q-9cc=ZACfxWX8O3FKDC1-aP1p964A@mail.gmail.com>
	<lysh39rpwx.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CANNYZj9Ac=riDSLr1wANmKzNe-DoP5jd-YUVrM2-Us+1ci=zkA@mail.gmail.com>
Date: Mon, 20 Aug 2018 19:09:24 +0200
In-Reply-To: <CANNYZj9Ac=riDSLr1wANmKzNe-DoP5jd-YUVrM2-Us+1ci=zkA@mail.gmail.com>
	(Alexander Kanavin's message of "Mon, 20 Aug 2018 18:19:06 +0200")
Message-ID: <lyh8jprmm3.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Submission of 'emit-buildvars' class?
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
X-List-Received-Date: Mon, 20 Aug 2018 17:09:35 -0000
Content-Type: text/plain

Alexander Kanavin <alex.kanavin@gmail.com> writes:

>> I do not know, how this can be done with plain OE.  As said, SDKs are too
>> heavy weighted, 'devshell' too slow and can not be scripted, 'externalsrc'
>> is broken, slow and can not be scripted.
>
> For better or worse, Yocto Project has standardized on devtool (not
> devshell!)

'devtool' is for writing recipes, not for writing software.


> and externalsrc for these kind of local development workflows. You are
> very welcome to improve and add to them, so they are not broken

I tried 'externalsrc' after the per-package sysroot changes but just run
into bugs (class tried to write into read-only mounted source dir, every
2nd 'do_fetch' failed because sysroot was already populated).


Doing a 'make -f ../Makefile.common install' which writes data directly
into the NFS root is much faster than doing all the steps of the dev*
tools.


> or slow,

They *are* slow.

| $ cd workspace/kernel
| 
| $ git commit -m 'empty' --allow-empty
| 
| $ time bitbake linux-mainline
| real    4m7.417s
| user    0m0.763s
| sys     0m0.110s

vs.

| time make -f ../Makefile.kernel  -j12
| real    0m13.204s
| user    0m54.888s
| sys     0m17.970s



Even a plain 'bitbake'  is takes 0.5 sec:

| $ time bitbake
| Nothing to do.  Use 'bitbake world' to build everything, or run 'bitbake --help' for usage information.
| 
| real    0m0.588s
| user    0m0.255s
| sys     0m0.023s

vs.

| $ time make
| real    0m0.007s
| user    0m0.002s
| sys     0m0.005s



And some things are impossible because they are not supported by the
design.  E.g. how would would you implement the flymake 'check-syntax'
target[1]

| check-syntax:
|         gcc -o /dev/null -S ${CHK_SOURCES} || true

with devtool/devshell/externalsrc?


Deciding which task to execute (compile, do_compile_kernelmodules) and
installation into NFS root is not supported by dev* either.



Enrico


Footnotes: 
[1]  https://www.gnu.org/software/emacs/manual/html_mono/flymake.html#Example_002d_002d_002dConfiguring-a-tool-called-via-make

-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz

