Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5F3BC60043
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 02:08:00 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id f105so56196453qge.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 19:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=tGx7mLICcpov4mYuwFgJuKNxeXAsTKmfiRo/LBOR3qo=;
	b=oVS5l2BJdC2nH8P5T3Enj/7mshXDGDpLKMdof71h8uUIMU7wrEZC6MFr3Dg/u9HmIG
	8Sr+WKeASjRVZTW+4DvFCCGEe80pnbf5vaOlL4cNx/yK087sq2cYH9NTCusX6KU7vm7X
	UMmrD88eC/gZsVoFn33uHAH1QJsWAuc392XB7N9qa/Wja58OUspNVRvdmqxMPrBPB/jb
	TVNAKIiWNlM4vZmuOrmmXEp7GhnuAr3r1ILc0JEcmLYAfcE9KhtKEK3hxZWX11cpSpWj
	4Nibx2BzD5oIfAyZKI9qdEqjnJzvw1Jh13J0gR4dOM58n3AgamOYusKl76IAmvV2zyax
	yBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=tGx7mLICcpov4mYuwFgJuKNxeXAsTKmfiRo/LBOR3qo=;
	b=Mjn7RPvnRxZpdXtAk6psPCANtVGo6RIPnP6jIYB7I9VNoTeu1kIsjZOowaV5uvocxe
	Z7G2Qnkqwxo+E2i10cdQ+uoWTBYG0iZiPKbuV15qqsf818WQ1m601c/VMg7PwMyYthWN
	pykDP8BLXP3kVcxVXYR9yk+Za60xWUE7w5/wr/puKHgEP91gr5o4KZoIKiSJJjPasvLD
	TJ2JwsMBvU91CRPVvPvhfvWzT7+iVqRyXQl2jVUmcnNKtwLglZ5+t9nq7ZqK4vqEZFp4
	XLMOUSDFvTaYK9BLMg06Jv6SRYmzSX/u1FxUhZ88HjbJi4bvPcGwqB/m4JqqEdnQr+Ke
	9OMg==
X-Gm-Message-State: AD7BkJJwz+pTjnEYje5+RASElP3Jx0W39Kj+aIoScYxniwb+bi+UM4Qyohoglkq2u82e1xyv3jsK2yMQWaX+/w==
MIME-Version: 1.0
X-Received: by 10.140.254.9 with SMTP id z9mr8591548qhc.5.1460081281031; Thu,
	07 Apr 2016 19:08:01 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Thu, 7 Apr 2016 19:08:00 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Thu, 7 Apr 2016 19:08:00 -0700 (PDT)
In-Reply-To: <570710A7.9020306@windriver.com>
References: <cover.1460020929.git.Qi.Chen@windriver.com>
	<ca141106b28e9f213b0965de589507300ccbbca3.1460020929.git.Qi.Chen@windriver.com>
	<CAJTo0LZLevMcyDJhgGe9uADDW60PgBXHm+GD1kijm8F6BSnCRw@mail.gmail.com>
	<570710A7.9020306@windriver.com>
Date: Thu, 7 Apr 2016 19:08:00 -0700
Message-ID: <CAMKF1spSxf3UBO=4=R017RYb-gnfRaA8S53nn8-tiN6dvAekQQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] grub2: fix do_configure failure when largefile is not in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 08 Apr 2016 02:08:04 -0000
Content-Type: multipart/alternative; boundary=001a113a74f6196bff052fefaa00

--001a113a74f6196bff052fefaa00
Content-Type: text/plain; charset=UTF-8

On Apr 7, 2016 6:59 PM, "ChenQi" <Qi.Chen@windriver.com> wrote:
>
> On 04/07/2016 06:24 PM, Burton, Ross wrote:
>>
>>
>> On 7 April 2016 at 10:22, Chen Qi <Qi.Chen@windriver.com> wrote:
>>>
>>>   configure: error: Large file support is required
>>
>>
>> Is it safe to ignore configure.ac telling you that large file support is
required?
>>
>> Ross
>
>
> Frankly I'm not sure about it ...
> Maybe Khem has more knowledge in this area.
>

We cache sizeof off_t with out considering lfs support thats the
fundamental problem. We should probably stop doing that.

> Best Regards,
> Chen Qi

--001a113a74f6196bff052fefaa00
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Apr 7, 2016 6:59 PM, &quot;ChenQi&quot; &lt;<a href=3D"mailto:Qi.Chen@wi=
ndriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 04/07/2016 06:24 PM, Burton, Ross wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 7 April 2016 at 10:22, Chen Qi &lt;<a href=3D"mailto:Qi.Chen@wi=
ndriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0 configure: error: Large file support is required<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Is it safe to ignore <a href=3D"http://configure.ac">configure.ac<=
/a> telling you that large file support is required?<br>
&gt;&gt;<br>
&gt;&gt; Ross<br>
&gt;<br>
&gt;<br>
&gt; Frankly I&#39;m not sure about it ...<br>
&gt; Maybe Khem has more knowledge in this area.<br>
&gt;</p>
<p dir=3D"ltr">We cache sizeof off_t with out considering lfs support thats=
 the fundamental problem. We should probably stop doing that.</p>
<p dir=3D"ltr">&gt; Best Regards,<br>
&gt; Chen Qi<br>
</p>

--001a113a74f6196bff052fefaa00--
