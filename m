Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id CA831719C9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 10:23:56 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id a197so89616394wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 02:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=XcJ78BRE1R3iqKRxapZQh6ncmRQIi4IqGbw0YX+7w7A=;
	b=Ik2cVNR8Tafx5aCj70dKX/IJzGtkBS9EG2hTEpo+gd0y6cA3LHMANkwNgiDiAE+SIb
	9OIxX2lsTMibdvMgb/LNQVHTqpryf9GLJt1+cLSjI+e7GuRrtqczveBPVas040zvIorY
	7zC7otwDpJKlU+VmTr6xGhQQZD2FAh0QBJqj5ArTy9I9kcGQf/JjZs1NT2wPQBrTVJv7
	FtJmb0OGRigs7p7WCyJo4Q7uqxoa2PXDb9BbeJQQRZE4kBeEKHK/YoaLRZ+OPGwmPlL/
	xjlY8eRdv9cFLW0sri1ZBoi8q8r4nJ1kgy/2aXs6XZ3k5mSF08xmCO1So976EieLE75s
	Q9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=XcJ78BRE1R3iqKRxapZQh6ncmRQIi4IqGbw0YX+7w7A=;
	b=NqRK6WeXpF8Si0iHEJS5uh9FkWms4mniKsGgS66My91Thnsdy2si2Ar2bfpFlusTy8
	Xd5EOdOcBZtxEBJeT/VMJ4ixgWMxifvndzZ7qVapPkDyWakHp2E20VQNSvekupEBVILY
	mM6EBTL7B8ErWwZC7uJfZ4QdvrazdFiGY0GG8yg0CVrk1VYAcRdfXFn7+TfwxHXtG9v5
	JwKTC52ETzlPtkLyNYQP5M2VjzJZ3/cpgWMlDJI7uyjKwgH9sX2Eytcz4RtHE6r8qlzb
	LN3ddnMTchONjWalFg+HirBYzZwaHiA5N2292LQK1OGd3zXzWFnfdw9Eftc3zSRwP9Z0
	wDhw==
X-Gm-Message-State: AKaTC03fYtyWKADsKSHMUEwVx6VrpJVUiOBg9RmK/rTb6ypX+dz9HqUdRf0gMGpfXo1xJw==
X-Received: by 10.25.161.77 with SMTP id k74mr1125096lfe.157.1480933437336;
	Mon, 05 Dec 2016 02:23:57 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	10sm2793107ljh.11.2016.12.05.02.23.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 02:23:56 -0800 (PST)
To: ed.bartosh@linux.intel.com
References: <1480069993.6873.98.camel@intel.com>
	<f1699a69-1949-9cb3-8bef-adf9b68f385b@mender.io>
	<20161125163103.GA4830@linux.intel.com>
	<e29489aa-8303-d8ac-be67-93d650d09f6d@mender.io>
	<20161128105236.GB15660@linux.intel.com>
	<ae35149f-dc2d-fea5-e59e-a65dd3dce0ec@mender.io>
	<20161128111825.GA16035@linux.intel.com>
	<420c72b7-b5dd-14f3-a4b0-c57eb3512252@mender.io>
	<20161130152923.GA4811@linux.intel.com>
	<6132a02c-5934-8680-5970-3455f5af1842@mender.io>
	<20161202150536.GA23998@linux.intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <90b17b8a-b0d4-4e54-d933-216106e632a4@mender.io>
Date: Mon, 5 Dec 2016 11:23:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161202150536.GA23998@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Mon, 05 Dec 2016 10:23:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 02/12/16 16:05, Ed Bartosh wrote:
> On Fri, Dec 02, 2016 at 03:36:47PM +0100, Kristian Amlie wrote:
>> What are the thoughts on having a similar --exclude-path mechanism for
>> the standard rootfs building? IOW, the do_image_ext4 and friends?
> 
> That's a great idea! If source rootfs direcotry contains only requred
> content then we don't even need to change wic code. It's much better
> then implementing the same functionality in wic and in oe code.

Right, I didn't even consider it like that. But yeah, theoretically we
could drop the wic variant if you only use fsimage in your wks file.

But I think they sort of complement each other though. Since the rootfs
plugin does exist in wic, it makes sense that it would also support
--exclude-path. If you have a partition setup like this:

part1: Everything except /usr
part2: Everything inside /usr except /usr/share
part3: /usr/share

This would not be possible without --exclude-path support in wic, since
part2 would have to be constructed using the wic rootfs plugin, but
would need to exclude /usr/share.

In any case, I will definitely look at implementing the do_image_ext4
variant as well. I'll post more info about that when I have it.

-- 
Kristian

