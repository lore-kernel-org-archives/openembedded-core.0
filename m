Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rt1V9-0007EZ-Bh
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 19:35:19 +0100
Received: by qaea17 with SMTP id a17so1939139qae.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 10:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=D2heBkVdU1Ssz4Zpg42/jibtABO4QEfhuntDlJ1SWk8=;
	b=vQwZwa0EhhG/vpMAdxeT9tN3IYcOjOiXJpKeg1kfz5MnBAYIvDwxuqvMdbnm7n+Z1p
	tII/e+crkWPSoPWVx9jTeCsqtth6UQV/ZvLB2rdejsJhyWSLEmD951SfaDOiDweP6EMH
	4Av4+WbGxERCZPUnzpQnC8iKzuLpY+j+lUr/o=
Received: by 10.224.214.200 with SMTP id hb8mr5568671qab.80.1328207242259;
	Thu, 02 Feb 2012 10:27:22 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.95.207 with HTTP; Thu, 2 Feb 2012 10:27:02 -0800 (PST)
In-Reply-To: <20120128202801.GF22106@sakrah.homelinux.org>
References: <cover.1327684024.git.chris_larson@mentor.com>
	<08cc6aa12fba6bcdb28c68edf3fe2e32dd5f52ca.1327684024.git.chris_larson@mentor.com>
	<20120128202801.GF22106@sakrah.homelinux.org>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 2 Feb 2012 11:27:02 -0700
X-Google-Sender-Auth: L0ADKVkwvfStvjx_oclRfe-2Vns
Message-ID: <CABcZAN=yt5U_qz9Mz85gaRKBaiwtT7vYs-Jsmv1BjWpKtz_ybw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 07/10] external-csl-toolchain: support mips/ppc/arm
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
X-List-Received-Date: Thu, 02 Feb 2012 18:35:19 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 28, 2012 at 1:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
> hmm is it using powerpc-linux-gnu canonical name to do both ppc32
> and ppc64
>
>> +CSL_TARGET_SYS_arm = "arm-none-linux-gnueabi"
>> +CSL_TARGET_SYS_mips = "mips-linux-gnu"
>> +CSL_TARGET_SYS_mipsel = "mips-linux-gnu"
>
>
>> +CSL_TARGET_SYS_mips64 = "mips-linux-gnu"
>
> same as above

Yeah, from what I can tell it's handled via -m32/-m64, not via the prefix.
-- 
Christopher Larson


