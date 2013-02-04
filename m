Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U2S5b-0006fd-Bu
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 20:52:28 +0100
Received: from mail-qc0-f197.google.com ([209.85.216.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 04 Feb 2013 11:36:34 -0800
Received: by mail-qc0-f197.google.com with SMTP id x40so9435362qcs.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 11:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=Ra6fjtVcvVJhzZTF7LcQhgH26rrmEdjEuS2uakf7YOE=;
	b=ojyWZKFtT8d+BYNyq/xn/snaJlvHOly3SkSelyw8rqBqnlPc18bhlsx3cWiqKU5h7P
	SgqsmboFp7c85Ihse7+VfzBxiEnWN8+So+J+LzLLFuDDYRpivKa443fiUVzId9VaQSzY
	QNALxMtkMfP9u9aXudQbNmiBKbQl74YeHAq/nJ9jg3F/dGZWB2hwfKKbe+cIRIBVHEAz
	nZfucwsXGEa1QxO5TY4bJxXeYlAJ1tnlGqJkRnGGgkFMINBzQ+TnjJaejScHy/0XpEth
	51kty5xvcYjAUi9ozjHoNgQ4897phqzGXlTGE15ZpABem6CraA4YX03A1blXo6TJtz1r
	7y8w==
X-Received: by 10.52.90.243 with SMTP id bz19mr16744118vdb.112.1360006593197; 
	Mon, 04 Feb 2013 11:36:33 -0800 (PST)
X-Received: by 10.52.90.243 with SMTP id bz19mr16744105vdb.112.1360006593041; 
	Mon, 04 Feb 2013 11:36:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Mon, 4 Feb 2013 11:36:12 -0800 (PST)
In-Reply-To: <lyvca89bso.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1359968730.git.laurentiu.palcu@intel.com>
	<510F8388.2030809@topic.nl> <510F875B.9070903@intel.com>
	<1360000031.6972.39.camel@phil-desktop.brightsign>
	<CAJTo0LaBDWRhcf+kj_k6OrV0B0sE98Fnoe5+XAK4gOhPzZTgjw@mail.gmail.com>
	<lyvca89bso.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Feb 2013 19:36:12 +0000
Message-ID: <CAJTo0LZhdRpvMTodB9Y01X2_QEfhCbnC-SZ9_wNPPO9nj_vbYA@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Gm-Message-State: ALoCoQnkiT1W5IOMN5yXKVre4AWpOOV0hLvUH2rnGUrz99+0fRJQ+VMrUMF593ZDCPcSB3CL8xLhSblL+mHmIVe8p5i1TJk90ZRdV1+xghX3fpBONr89i8hpdIB+f8aSXJt+FyWVjwtJGcwUBeeGVmC3KQ0YG0s8hwgjAnYsVCtJc7Udzo6rVHrAiDVjyAMBySGw1N9DyVB8
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Remove /var/cache from volatiles directory
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
X-List-Received-Date: Mon, 04 Feb 2013 19:52:30 -0000
Content-Type: text/plain; charset=UTF-8

On 4 February 2013 18:25, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
> really? The cache files are architecture dependent and I am not aware of
> a cross-fc-cache tool.

That's right, they are.  Laurentiu's been working on that too:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=lpalcu/fontconfig&id=fe7c0e0b2c92c36466ac6de02a98d13b3985282e

Ross


