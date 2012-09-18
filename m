Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TDn3I-0006qa-JO
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 03:56:40 +0200
Received: by eaad12 with SMTP id d12so2229638eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 18:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=W4kZp/Hw+Nz4uroq8Q82rFhyIlVhuO4GYITVejr+1DE=;
	b=mvoQltifE4As9tW0wtHFATSE96l4KzAL2VE7AoJOI73aW6rWJfcGRRpC5+/FagQdjP
	w6L7aKLw6J40hcRjoXb3f23/Y4/tfmq7gRl+lzMZswVlHGexO3d7U0xp+HQUeql2PlTL
	p+rkWDD4Jq1K3g1p2w3Qzc1dIUT8T7INhMFUS+M3sPy2FctW26esKHXiyCMFokdalWqH
	BljryxFL1ZgX4Hf53mLu+KRyBfRY40oE5c4sRADLOqUIJy2bBD+AKgzG61KO828DWmfV
	gdAllqPWrzdo1YqpvWcnge8VQGmT69o+5wLUQZ3s61PGSeVw9gjIRrj0xHimJyeM645u
	1fPA==
Received: by 10.14.211.3 with SMTP id v3mr15412594eeo.43.1347932641491; Mon,
	17 Sep 2012 18:44:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Mon, 17 Sep 2012 18:43:31 -0700 (PDT)
In-Reply-To: <lyr4q0zydx.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyr4q0zydx.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Sep 2012 18:43:31 -0700
Message-ID: <CAMKF1spzF3aXKo5X2+vFNo_Ha4LDA+5rx6gSCoh_R_2rapcxzQ@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: binutils regression: internal error in set_address
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
X-List-Received-Date: Tue, 18 Sep 2012 01:56:40 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 17, 2012 at 4:23 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Hi,
>
> recent binutils upgrade[1] breaks dot assignments within NOLOAD sections.


Hi Enrico

Yes I have seen this and currently filed a bug for gold upstream. This
exists on trunk of gold too.

> E.g
>
> $ echo '_start:' > foo.S
> $ cat <<EOF >foo.ld
> SECTIONS {
>         .stack (NOLOAD) : {
>                . = . + 128;
>         }
> }
> EOF
> $ arm-linux-gnueabi-gcc foo.S -T foo.ld
> arm-linux-gnueabi/4.7.2/ld: internal error in set_address, .../binutils-2.22/gold/output.h:189
>
>
>
> Enrico
>
> Footnotes:
> [1]  0038-Copy-from-mainline-to-binutils-2.22-branch.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


