Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1E21A77162
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 22:29:45 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id g73so175872509ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 14:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bnlrXjhAHybyKu7tJWtDx8UKLZXPQR50Rj4yka0Vxys=;
	b=jdVc/E6GYXwZO/ejeEau5+TkTDXRsFvX7sQB9ljx98yVnqoYqOsmDG93a8ZBM9nfM6
	3rj0qCr6FtfrR+vfEen+QflXF2tI8cAQvKMm5YfHEFHv/nr1xqipartmVQ65IoxYqUM7
	tuPnqEy4shYUHknBZ0L0q+RY5OLUzPr2MAfxI4hf37doO1Wqc2GbQxSzlXWiSZod54VF
	zBVnyjwoqU3mtwS28WlH+wAP0WaBayOdJEN8iM5NCgZd5LN+VXdSwOKQvc0cMUIhAxFm
	vCLoE/LAydvng8lVvGN0gfidxcwuHEiCzxpnRv+u+W/ujRTb68+HiI2ChNQjRNLl2s6e
	3WhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=bnlrXjhAHybyKu7tJWtDx8UKLZXPQR50Rj4yka0Vxys=;
	b=U7YqdMLoTdFoXaDaPtdagZMTrLmdoByF1EpHOy0nvFcCReHfC38ugT0WWBIji5sP+o
	RGNRNqfKe/LbE4W3YAmMlijJ+M9zHizb+KP3v2oW8Hsm3PR78axPslAFCKtDBEcCuSIi
	GguFUsLVYyrwt68FtEEWbLFgimb65JEZS/Wn07qnraJ6WDOBuMTlRDrGyVvcCRFCCBAh
	YrjSwsZo30xUO+POi9TS/Fkxt9Fi0LqkHLvX3VOlilJCcwvUSm3Ouk/N867otk7XOcHy
	tczGs3KFZbcnsuYBhAukLZBOZMbs3s9I/5bwr74JdqZ6hwiOH49swE/e0bjdsnR6u8mK
	0CnA==
X-Gm-Message-State: AG10YOQROpCKgIrDNG7a3V0MPPJIwkEtJdRo7orzD7l6HiIKfpxuikmvLCFG5rNKxz3gA/AjiR2f4Pk2BpTkJw==
MIME-Version: 1.0
X-Received: by 10.107.165.14 with SMTP id o14mr23848712ioe.49.1454365785786;
	Mon, 01 Feb 2016 14:29:45 -0800 (PST)
Received: by 10.107.46.219 with HTTP; Mon, 1 Feb 2016 14:29:45 -0800 (PST)
Received: by 10.107.46.219 with HTTP; Mon, 1 Feb 2016 14:29:45 -0800 (PST)
In-Reply-To: <CAJTo0LaVpNfp0uDxWZM4=Q-_dPyxEDmuWvMBRA4FRNDXUkTP6Q@mail.gmail.com>
References: <cover.1454303080.git.raj.khem@gmail.com>
	<8414fe6c4db39df641533dfaf9d4c9021916517b.1454303080.git.raj.khem@gmail.com>
	<CAJTo0LaVpNfp0uDxWZM4=Q-_dPyxEDmuWvMBRA4FRNDXUkTP6Q@mail.gmail.com>
Date: Mon, 1 Feb 2016 14:29:45 -0800
Message-ID: <CAMKF1sp4n12SqqZwFTi2dUKd+Sg-eWCJpfv+kp1B4AY6yaUjzg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] nss-myhostname: Fix build on musl
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
X-List-Received-Date: Mon, 01 Feb 2016 22:29:50 -0000
Content-Type: multipart/alternative; boundary=001a1141f0c60914bf052abcec70

--001a1141f0c60914bf052abcec70
Content-Type: text/plain; charset=UTF-8

On Feb 1, 2016 1:14 PM, "Burton, Ross" <ross.burton@intel.com> wrote:
>
>
> On 1 February 2016 at 05:08, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> +From d1345871b992f9a055c968963967e728da1a7ffb Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sat, 30 Jan 2016 20:29:06 +0000
>> +Subject: [PATCH] nss-myhostname: Check for nss.h presense before use
>> +
>> +We do not have nss.h on musl e.g. and configury is already checking for
>> +nss.h presence, use this to define needed data structures if nss.h is
>> +missing on a given libc implementation on a platform
>> +
>> +include stdint.h for uint32_h definition
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>
> No Upstream-Status.

Thats embarrassing but I started to use devtool and recipe-update cmd
ovewrites it from older patch. May be update recipe cmd should ask for it
before transporting the patch to metadata
>
> Ross

--001a1141f0c60914bf052abcec70
Content-Type: text/html; charset=UTF-8

<p dir="ltr"><br>
On Feb 1, 2016 1:14 PM, &quot;Burton, Ross&quot; &lt;<a href="mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 1 February 2016 at 05:08, Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; +From d1345871b992f9a055c968963967e728da1a7ffb Mon Sep 17 00:00:00 2001<br>
&gt;&gt; +From: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; +Date: Sat, 30 Jan 2016 20:29:06 +0000<br>
&gt;&gt; +Subject: [PATCH] nss-myhostname: Check for nss.h presense before use<br>
&gt;&gt; +<br>
&gt;&gt; +We do not have nss.h on musl e.g. and configury is already checking for<br>
&gt;&gt; +nss.h presence, use this to define needed data structures if nss.h is<br>
&gt;&gt; +missing on a given libc implementation on a platform<br>
&gt;&gt; +<br>
&gt;&gt; +include stdint.h for uint32_h definition<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt; No Upstream-Status.</p>
<p dir="ltr">Thats embarrassing but I started to use devtool and recipe-update cmd ovewrites it from older patch. May be update recipe cmd should ask for it before transporting the patch to metadata<br>
&gt;<br>
&gt; Ross</p>

--001a1141f0c60914bf052abcec70--
