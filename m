Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id D78407017B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 19:04:42 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id y89so73644032qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 11:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RB95QbjzFmU47dRLESjD/Sz7A9zqRaeaRe5BosFWr/I=;
	b=q7L8B/TgJHus06emdmAOF0PNzQyq8VZyw7IOTx8l0IyDmvk90YK7sPp4rV/PIQIMI4
	12Nth2kkDGk07+4LZpmKrDvddVlmNhiotK/duD6kufl2iAqsZ+TBUvFkjrT1OZ08n/Aa
	cuphYc9NZDLqUq2ZLMWVhKy+whQfvs+NUX5ySZL1E+aXCWITaRAedbczixrxfML+UmuD
	Yq6WSri5MmqS+r6pVHXF9GCY8Uy5S0SqlJviiNDdYo3PBfN2OBPQ41Bpfi3iQgPHl1wO
	DON3bPTs723IW9O686eQuUu8Twfx9IBTt/IFG8g81PkzdeW3h091/OcjSBCeISU8jvHZ
	OzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=RB95QbjzFmU47dRLESjD/Sz7A9zqRaeaRe5BosFWr/I=;
	b=LUJ+Lx7AwLCHZPsBzj0Y5efbSEKhqo/WX4gjEp8Q/satb2b7t7rbnGtE7Iq+NfTT0p
	utOW5Xa4tVhiYxERxnATLJRZaW28hXsZO2wThRW8+pPLl6xPxoeZ+b9lf28hdQxNggPj
	y2FP94KnnS/rQ2Kk2aq1A4MQJBg7lWIZDsesM2SXpYtRdX24PujuG4X6340Ur01BcPYV
	KQ4AdENpWg34JjKhyrKr2Jhcfe0h2oqTmAro9Otc6NRyHNFU0VCu/h5IhyH8aMof8RXb
	C/sG8h6HLfpWalsfx3+aBpiGVuT7tqei3nhHJ5RwSipKoiDp4PRQoHpPu28/o4LuX6EP
	8KeA==
X-Gm-Message-State: AG10YOSA3hLV81TDivIKZ9u7C+8oejDhOqU5saf6FXN3mkNYyug9t1x9Y//zZExHbA1Yyrb+ZE4rcNs40YCGPw==
MIME-Version: 1.0
X-Received: by 10.140.167.86 with SMTP id n83mr45027877qhn.41.1455044683014;
	Tue, 09 Feb 2016 11:04:43 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Tue, 9 Feb 2016 11:04:42 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Tue, 9 Feb 2016 11:04:42 -0800 (PST)
In-Reply-To: <CAJTo0LaLWz6=kt2D7B4q_9B5atfBEoTt7Og+_HqBoB98ax+RFA@mail.gmail.com>
References: <cover.1455008560.git.jussi.kukkonen@intel.com>
	<aae55470a8d782e166fc6135ceb03631e1346429.1455008560.git.jussi.kukkonen@intel.com>
	<b4d964e733159d37952d2f1f6f4d9bbdbad24979.1455008560.git.jussi.kukkonen@intel.com>
	<CAP71WjxybQ+N3N-+pOzLo7jQdJ=F0TVwVEoFihAn_96TG-q=7g@mail.gmail.com>
	<4DE97B9F-591B-4298-9F48-48B09D1B4B79@gmail.com>
	<CAJTo0LaLWz6=kt2D7B4q_9B5atfBEoTt7Og+_HqBoB98ax+RFA@mail.gmail.com>
Date: Tue, 9 Feb 2016 11:04:42 -0800
Message-ID: <CAMKF1srP19D1Vg1Nvg5nbcqGp_xGLw=m8XFRiF6x659ixKZJBg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] xserver-xorg: Add PACKAGECONFIG for crypto libraries
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
X-List-Received-Date: Tue, 09 Feb 2016 19:04:45 -0000
Content-Type: multipart/alternative; boundary=001a113a64dc76a91f052b5afd15

--001a113a64dc76a91f052b5afd15
Content-Type: text/plain; charset=UTF-8

On Feb 9, 2016 9:58 AM, "Burton, Ross" <ross.burton@intel.com> wrote:
>
>
> On 9 February 2016 at 17:54, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> > Looks good to me. this is the same implementation I used in the mesa
>> > patch.. so we need to make sure that any review feedback is applied to
>> > both before merging the too,
>>
>> since its spans multiple recipes would it be better to control it with
>> a global knob instead of packageconfig.
>
>
> Personally I'm not convinced that two recipes currently sharing a small
piece of configure code warrants a global configuration.

Think of crypto policy point of view
>
> Ross

--001a113a64dc76a91f052b5afd15
Content-Type: text/html; charset=UTF-8

<p dir="ltr"><br>
On Feb 9, 2016 9:58 AM, &quot;Burton, Ross&quot; &lt;<a href="mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 9 February 2016 at 17:54, Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; &gt; Looks good to me. this is the same implementation I used in the mesa<br>
&gt;&gt; &gt; patch.. so we need to make sure that any review feedback is applied to<br>
&gt;&gt; &gt; both before merging the too,<br>
&gt;&gt;<br>
&gt;&gt; since its spans multiple recipes would it be better to control it with<br>
&gt;&gt; a global knob instead of packageconfig.<br>
&gt;<br>
&gt;<br>
&gt; Personally I&#39;m not convinced that two recipes currently sharing a small piece of configure code warrants a global configuration.</p>
<p dir="ltr">Think of crypto policy point of view<br>
&gt;<br>
&gt; Ross</p>

--001a113a64dc76a91f052b5afd15--
