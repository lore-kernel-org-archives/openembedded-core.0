Return-Path: <danismostlikely@gmail.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4D34972541
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 15:27:55 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id w8so11490331qac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 07:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=yJSTqwRkW5dIuRnzCwWgv12A3X1n16PyFFrpypXsf8M=;
	b=XopAddOvmSQjVMEtyCxUvOpko45i/25jLVRtmbK9EKKJqEesgh5M+/mTjJEQSEjzm5
	bxNQ0DV7zpNjNYBIm7ZKRRWZ6ZeFjhZH6t1ZPb3pQOtX69OxRli0o6W0Kgu16BRGZOIN
	kkgyTgTZiiOal34zeuRVNO3cTQFMzzCEkHxh22N1fDpys30woD9mGkbm2N7qFH2q7h+o
	wgsCdQCzsbzDEfmOYOX5gd3aNWavvOvW34k2EbU+AkABhEhbH590M+wnpuG+frNtp+aF
	rpfXV2qMdTfJvUXGWKMFD8aShreyQo2OnmBigGl5bUbkavqWlddBm09pQ/fs3Fy9nWjl
	nnEg==
MIME-Version: 1.0
X-Received: by 10.224.79.12 with SMTP id n12mr17259268qak.2.1421335675560;
	Thu, 15 Jan 2015 07:27:55 -0800 (PST)
Received: by 10.96.35.34 with HTTP; Thu, 15 Jan 2015 07:27:55 -0800 (PST)
In-Reply-To: <54B7D574.9030606@linux.intel.com>
References: <CACS+7ZQe+N6mWE8uPR2nmE8dcEtFjmzH8NfGfX_iVVgsp8y6eQ@mail.gmail.com>
	<54B7D574.9030606@linux.intel.com>
Date: Thu, 15 Jan 2015 09:27:55 -0600
Message-ID: <CACS+7ZTokcoEGRFhpHLdQbrny7WFmdJDyx+EpOM9bHpn=-vECQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] dpkg: fix host contamination
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
X-List-Received-Date: Thu, 15 Jan 2015 15:28:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Sure thing. Will update and resend.

On 15 January 2015 at 08:57, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.int=
el.com> wrote:
> Hi Dan,
>
> Can you explain in the commit message what is this change needed?
>
> On 14/01/15 21:51, Dan McGregor wrote:
>>
>> +EXTRA_OECONF_append_class-target =3D " TAR=3Dtar"
>
>
> Kind regards
>
>     alimon

