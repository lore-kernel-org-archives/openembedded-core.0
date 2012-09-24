Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TGG4n-00018w-Ba
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 23:20:25 +0200
Received: by lbky2 with SMTP id y2so4117555lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 14:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=2x9oDPAq8HKl3GmCjkeHCkbejmMVoIC98u1fB+dZXLc=;
	b=EC4yl77QbuNWhGx38wsYb4JySpLuxWrF0CPZmKR3eOnw960OyTLzTqMo56XXLZDbnt
	gflPoW1eM6dPOP0wPydOSo45vQiyOJ6Gx2gjbNsuIUv/s2O93p/7O9lMDKy8tDe83dQQ
	hMIpJfukmor/KrUwFjLcWLs98SHtfxGvcRjjYB10sXJjnLJilVkiTOb6dRy9rR6z6ZOu
	tkdYxaMRMtJvdqE7ufW6TEvEBYjgqTWwAvg2eBCvv7pCox7b1I2Ws2yffjBuYtZ0SxqW
	MPER2QAzXWRp7QF4uWDJ92u6hA2WnOlSH19IjLr/ORmA198tRyEod7rGZzhc03OF7BNe
	Ayow==
Received: by 10.112.103.167 with SMTP id fx7mr4654716lbb.44.1348520857061;
	Mon, 24 Sep 2012 14:07:37 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Mon, 24 Sep 2012 14:07:16 -0700 (PDT)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6A31A1@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
	<20120924200050.GF3295@jama.jama.net>
	<CAEsOVNfNgM0b508hovOLYTFe=4o7XDD8meZ37t3UM+sVY4WM8w@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A31A1@039-SN1MPN1-001.039d.mgd.msft.net>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 24 Sep 2012 14:07:16 -0700
X-Google-Sender-Auth: DFfjBzxjy7pQDCRZlMEduJGMbxk
Message-ID: <CABcZAN=GniLZ83Bjx_mstm2KiC4yk307=YLSxUQ+DJjpPHZrtQ@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libx11.inc: disable warnings that don't work on certain compilers
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
X-List-Received-Date: Mon, 24 Sep 2012 21:20:25 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 24, 2012 at 1:43 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Mon, Sep 24, 2012 at 3:06 PM, Matthew McClintock <msm@freescale.com> wrote:
>> On Mon, Sep 24, 2012 at 3:00 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> On Mon, Sep 24, 2012 at 02:55:45PM -0500, Matthew McClintock wrote:
>>>> Fixes these sorts of issues present on older gcc (CentOS 5.x in this case)
>>>>
>>>> | cc1: error: unrecognized command line option "-Werror=implicit"
>>>> | cc1: error: unrecognized command line option "-Werror=nonnull"
>>>> | cc1: error: unrecognized command line option "-Werror=init-self"
>>>> | cc1: error: unrecognized command line option "-Werror=main"
>>>> | cc1: error: unrecognized command line option "-Werror=missing-braces"
>>>> | cc1: error: unrecognized command line option "-Werror=sequence-point"
>>>> | cc1: error: unrecognized command line option "-Werror=return-type"
>>>> | cc1: error: unrecognized command line option "-Werror=trigraphs"
>>>> | cc1: error: unrecognized command line option "-Werror=array-bounds"
>>>> | cc1: error: unrecognized command line option "-Werror=write-strings"
>>>> | cc1: error: unrecognized command line option "-Werror=address"
>>>> | cc1: error: unrecognized command line option "-Werror=int-to-pointer-cast"
>>>> | cc1: error: unrecognized command line option "-Werror=pointer-to-int-cast"
>>>
>>> Shouldn't it be applied only for -native? version?
>>
>> That's reasonable. But, suppressing warnings to compile logs also did
>> not seem to matter much since we don't go line by line on warnings in
>> compile logs (does anyone?). I'll go with the consensus though.
>
> Actually, this makes sense now because I'm seeing issues with
> non-nativesdk packages with the '-e' I've added... thought I build
> tested that... ;(

Why is -e being added? It's almost always better to add the vars you
need explicitly, imo. I wish we could change the default EXTRA_OEMAKE
to drop it, personally. It can cause odd unintended consequences.
-- 
Christopher Larson


