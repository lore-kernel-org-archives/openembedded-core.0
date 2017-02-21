Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 8391972F0D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 01:01:20 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v1L11JWZ005307
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 02:01:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1487638879;
	bh=G2EICjsrG7SXFEzgsSOb2mdM4wDFd8mkbFsAg6q9SyQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=hS8yZJ4KL+sIhr/3mTr/yqQa6LbDzXTTlpqUCygUmgAOEsK+hirwUC61yeSDIwu/t
	fLo6ZH5fkSoCuaHXoWaQa1q33OnBGtEdb+IPCdeLmtpQ/BIlaRZ9ZamkH1w6lqi5WD
	hGYl0aWiEnqIETWIdLj8wMdefE+b8UGVYeUD3kI0=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v1L11C3D027640 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 21 Feb 2017 02:01:12 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 90CB6159C9D;
	Tue, 21 Feb 2017 02:00:35 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v1L1124j027634
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 21 Feb 2017 02:01:02 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1cfypC-0007en-KK; Tue, 21 Feb 2017 02:01:02 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Burton\, Ross" <ross.burton@intel.com>
References: <cover.1487055395.git.hongxu.jia@windriver.com>
	<247659408552f6a0edba461a59a3cc53e85012ae.1487055395.git.hongxu.jia@windriver.com>
	<lyefz12gkp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYqkQfvgboQ5+wPuz2tVa8s=xDis_dX00ApAcHeLTNDrQ@mail.gmail.com>
	<CAJTo0LZyoG0qMwYYVM2wq7SRkz52QVQ3-CxZovNsiOXC6BVngw@mail.gmail.com>
Date: Tue, 21 Feb 2017 02:01:02 +0100
In-Reply-To: <CAJTo0LZyoG0qMwYYVM2wq7SRkz52QVQ3-CxZovNsiOXC6BVngw@mail.gmail.com>
	(Ross Burton's message of "Tue, 21 Feb 2017 00:20:56 +0000")
Message-ID: <lypoic1ho1.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -0.7
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.78
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] ncurses: fix beaglebone do_configure failure
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
X-List-Received-Date: Tue, 21 Feb 2017 01:01:22 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

>> c) fix the function that detects the "broken" use of CC as it should be
>> extracting the flags and moving them to CFLAGS.  Clearly this isn't working
>> somewhere.

Upstream tries to do it correctly for nearly a year and fails everytime
at some cornercases.


> I've a local working fix that basically does this:
>
> - cf_flags=`echo "$CC" | sed -e 's/^.*[ ]\(-[^ ]\)/\1/'`
> + cf_flags=`echo "$CC" | cut -f2- -d' '`

This will break for

  CC='ccache gcc -m32'

Perhaps there are cases (not for OE), where gcc contains a space... How
to deal with this?



Enrico

