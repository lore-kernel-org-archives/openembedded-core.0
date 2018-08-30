Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 47925783DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 19:11:35 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id p84-v6so17428127oic.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 12:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/hUt5uv/gl+0l6WIMWoDip+/yy0tMPAxPeEwMahEPOk=;
	b=NHritY0CmL6Nf3rEOGkjaLNM0FxbRMPR3Fad5WU1DOPvgOURH1ybGp07Hya6tYTqvE
	V0IOIEoK7MUtYWxIvwY88WQS4RT3DJcOz4ZEv2YZGJlzDVXbJEnmB0b6g4AI4S109mGv
	sRiu/dHcuNBp7AfAIUODCvZCY0SEY1S7dvDlXukVpHf6oqlrvPLDXe8kBYwaw6KfAv61
	sSoNuybkFLQUbGr8xZoAiwmMiLzqV3+eZfIa1qnbPzR2mSw1LGTMTEM4fXHVrLkINE5+
	rFcj8uMESdAr+sABe0aYDHrmBPxwq2WUJrWUBICYEgmLS/m8bdqALDMhAY+lDAZPrUrd
	OnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/hUt5uv/gl+0l6WIMWoDip+/yy0tMPAxPeEwMahEPOk=;
	b=j64iqRMSYARvCNF/BO4qc80bovT5B622qYKuaQcdW5j782yjNHQxzPTNU4HRz6WqBV
	gjp3WmanRda9nruov/hUVlke7/jn2GxKvVZxoezO9T6fmaZrPOjzxw6++0SgRp2y7OX6
	QNubOd7+yxatikRpTx8K8Bg4dJRucV3H+YtQTjC6p0aFQlAUwX8gItBI2WPzkU4a+gYk
	KiSIUHJPH/atDUKrWUIGuR2wtoNa4WNvoleEA7+npwN9RFEFNPYGt+vHXdots/4dsiiw
	xil3/0h7n1wHExmvVjJ25d45TqoILqYvK175qZ8uUaF54rGKCL4hdS+Ks5j3QJybzVnh
	RpoQ==
X-Gm-Message-State: APzg51Br/IZ5feFANfUym2oloExbl5Px1SvczVtYKwvdIM2/ZfYmY/NV
	BiQ7s9wDqfVC4pTsfrKpbu1yl1uJPsucUaSMq9s=
X-Google-Smtp-Source: ANB0Vda8/m9fIwCR8Rrz1S9QsEBE4k16u6iP2RRMLytQL8S4litfpAbRUG/vwvkc2TaJpKeXhSpdY055NW8vCfy7utQ=
X-Received: by 2002:aca:c34b:: with SMTP id
	t72-v6mr4183624oif.338.1535656296251; 
	Thu, 30 Aug 2018 12:11:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:454b:0:0:0:0:0 with HTTP; Thu, 30 Aug 2018 12:11:35
	-0700 (PDT)
In-Reply-To: <5d6ddab2b5eacfe864c99f0e67797c4bd4d96415.camel@linuxfoundation.org>
References: <20180828221954.3214-1-schnitzeltony@gmail.com>
	<66aa21df8fa33f677b8a65150da5af2f98c22268.camel@linuxfoundation.org>
	<CALbNGRS2x76WRxtbNu417m8p5OVcF8pt1F7L3pUoUQ0PLvjTnw@mail.gmail.com>
	<fcb8bc41a5f65715b41f2c9461cdd434467e6ad4.camel@linuxfoundation.org>
	<CALbNGRQPs4mX70TdFnaHeBiPqp2hKJyrj1R9nUfGDe7BghGyAQ@mail.gmail.com>
	<5d6ddab2b5eacfe864c99f0e67797c4bd4d96415.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 30 Aug 2018 21:11:35 +0200
Message-ID: <CALbNGRScmvEmQqFfNcM-tZVTY6_2Trn2FUXLNbFXLW8ZhwCGUQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libsdl2: Fix left rotated display for RaspPi/VC4/GLES2
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
X-List-Received-Date: Thu, 30 Aug 2018 19:11:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 30, 2018 at 5:22 PM,  <richard.purdie@linuxfoundation.org> wrot=
e:
> On Thu, 2018-08-30 at 12:45 +0200, Andreas M=C3=BCller wrote:
>> > I'd have thought Accepted should have a []. A quick grep shows
>> > other
>> > patches which have that in the tree so I suspect that help text is
>> > misleading...
>> >
>>
>> V2 with Accepted?
>
> I've tweaked it in -next to save reposting and remerging the patches :)
>
> Cheers,
>
Thanks and sorry for consuming your time on this - try to do better next ti=
me

Andreas

