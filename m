Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1SmUnW-0005rh-Dr; Wed, 04 Jul 2012 20:59:34 +0200
Received: by eaal1 with SMTP id l1so3004617eaa.6
	for <multiple recipients>; Wed, 04 Jul 2012 11:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7n8/FDP/TxmFxPdjExpgr0R7N2l3m/lDvZJV6lgfcks=;
	b=BVhhVrbzB4AWsxVof08B+bPKPbtrb1Zx4aNTIHGY+5bulNbKZjj9Bl8tF3aDJcsEir
	l5CmnhxXOXygi1Xm9G34TexpVqKBnUcxBUFme5jdt9L/ry2FauE0GQS250Zjv+PgjBkU
	K2YkYWYOv/zT8qqqvjRCEal4gKzZyrb22q2wzs9KB3WY9JISzFnaci+ixrPaqXPo3dFM
	f7L+8XXxGs8k3ZOymOIbZjLVMko6/10BCBgCFJVtsMcLwh1ggexlvUYxF52uXPs2OrqB
	Sc/KvpaU9sntQ39iftdCHr9h1qes07WPmj7Fm5/u9E1bnqDBZmq0ZAgMmE/xjhpfetPd
	zcGw==
Received: by 10.14.99.201 with SMTP id x49mr4087744eef.142.1341427710831; Wed,
	04 Jul 2012 11:48:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Wed, 4 Jul 2012 11:48:00 -0700 (PDT)
In-Reply-To: <20120704125810.GA15100@jama.jama.net>
References: <CAMKF1spU53TcfLHif3CUzrHKqJTT1uBqBqsZAn-zfaBOBecMtw@mail.gmail.com>
	<20120704125810.GA15100@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jul 2012 11:48:00 -0700
Message-ID: <CAMKF1soPi+uVJ95nv-iWfqXvpGqMz9Bm3Er+B+BBE3t9-TC9nw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: eglibc 2.16
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
X-List-Received-Date: Wed, 04 Jul 2012 18:59:34 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 4, 2012 at 5:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Jul 04, 2012 at 12:14:29AM -0700, Khem Raj wrote:
>> Hi All,
>>
>> I have pushed a contrib branch with eglibc 2.16 here
>>
>> http://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.16
>>
>> and I would like some hands in testing it out. I have so far tested
>> core-image-minimal and core-image-sato on all architectures
>> they build and boot fine. There are changes in eglibc which may need
>> tweaking some apps especially if its using gnulib. So give it shot and
>> let me know if you find issues
>>
>> All you need is pull this branch into your sandbox and then set
>>
>> EGLIBCVERSION = "2.16" in your local.conf if using angstrom then add
>> ANGSTROM_EGLIBC_VERSION = "2.16" to local.conf
>
> Buildtest still runnig (NOTE: Running task 1525 of 17969) sofar only
> bison failed (missing gets).
>

I have already patched bison this morning so repull the branch

> And I belive that grub would need something like this too:
> https://bugs.gentoo.org/show_bug.cgi?id=424703
>

grub too. But I see you submitted same patch there so it should be ok.
if you can send same for OE-Core and I can update this branch
> Cheers,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


