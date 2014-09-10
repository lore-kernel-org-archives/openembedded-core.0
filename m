Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id D722165FEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 21:07:01 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id i13so2960831qae.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 14:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FcRBjRcdgVhBoIsz8Es4SwDLrgPi1dLLR7bKrrH5wRQ=;
	b=iDm5z6FHFhtsRDuH8C/BCJCrPsdwSI2mw4oLiTp7SlWw81msE9i2cYc88iGm4E8Yws
	cqh3gYe5VCXPvtJc6hbDROA2b8QRvSap1qnhOp0bp2JFj1FqcQrLRGdU4/BOeWySwW7Z
	fvqlki/VNM/NRAIDjsQGUQnTCgZYxHr1ltoiu5LoAupCf1VPvcTcIYIp9huYWxgpYpkL
	BM5279C9wtgyhPKnhzNLs7/Yyuvab2D/ZxW3QGmJSFhp/kq7x0tJc4dSwOZO+YS8ciTc
	ucIpA9elj7YVBjwCg6FiXauNBAEB70fcxVBjaZcft0ggXvCuQg/oK9QEcr9urN+zEcXd
	MmIA==
X-Gm-Message-State: ALoCoQmiT2JOJconSl1KyBi3cHyevlbFli3SKZKSuTeX9MUVZzZRlqaZNVnDpAvmJTxCuiyYe9b4
X-Received: by 10.224.79.139 with SMTP id p11mr31258882qak.93.1410383222192;
	Wed, 10 Sep 2014 14:07:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Wed, 10 Sep 2014 14:06:42 -0700 (PDT)
In-Reply-To: <CAMKF1sr2YP+L5JWE723k9KynKVfW+AU_TPead1AM_WgJpOMLaA@mail.gmail.com>
References: <CAJTo0LYNAq45aF8dQKTiufrf-grUnZtJ1K9vDGpSvAUpF0cinQ@mail.gmail.com>
	<CAMKF1sr2YP+L5JWE723k9KynKVfW+AU_TPead1AM_WgJpOMLaA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Sep 2014 22:06:42 +0100
Message-ID: <CAJTo0LZjwqEoh9Ce8GF+Aqrb8YPjT7RFV6u0FYFSn=Nrh3qXYQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Patchwork cleanup
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
X-List-Received-Date: Wed, 10 Sep 2014 21:07:09 -0000
Content-Type: text/plain; charset=UTF-8

On 10 September 2014 21:21, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Sep 10, 2014 at 12:12 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> I've started running the patchwork post-receive hook manually and
>> marking as submitted many patches in the queue, but as there's 132
>> patches of patches still (down from 140-odd!) in an attempt to restore
>> sanity to the oe-core I think we should just mark as obsolete every
>> patch that was submitted before a cutoff date, say 1st January 2014.
>> Any thoughts?  As much as I'd love to ensure we didn't drop an
>> excellent patch from 2012, I'm not going to manually check all the
>> patches that the tool can't find automatically...
>
> I think its ok. Thanks for doing it.

As you have access to the server, do you think you could do this with
a carefully crafted bit of SQL directly to the database?  The
alternative would be to find the patch ID that corresponds to "a year
ago" and edit the state of every ID below that, which might take some
time...

Ross

