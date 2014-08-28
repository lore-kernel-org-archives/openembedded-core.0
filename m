Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id DA1076AC6B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 23:22:02 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id c41so998682yho.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 16:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=nLUqfWIj4fb454FHbW3PBMCzPAO01nQzHvfVSv47vcc=;
	b=Am9mb+tdfeiG0mnOezMeT/GfX+1THXVO6QC4nTr7CN6TDiUVaWxx77Xe3NaJr5JS1q
	cY9tmMxDF7byl4qhgTreYp0kQYDYZuu4bhMcTvlXOoBF31m3GIUZSvYkayjURlT6HnzT
	Dq6A5gCg+5mtqsAWIjt7ouM5RHDKBtIEVR3+XPADyhbkqFdGdhxoh5ue6h/pqh8AAKPF
	F09bGWQi9oHTm361qN0cM8F+ts6ZAqEuRyTjzU7Tu/ZRFYfznohg7sGqPdagQmyAhREO
	6IGJpmJdshuCRldy5dEjw+SUNe9jFsMX7HploA6B4etDmwGj2Mk8yZS/HjPnPV6OiSfA
	CG8A==
MIME-Version: 1.0
X-Received: by 10.236.61.69 with SMTP id v45mr9018673yhc.130.1409268124170;
	Thu, 28 Aug 2014 16:22:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Thu, 28 Aug 2014 16:22:04 -0700 (PDT)
In-Reply-To: <CAP9ODKqY11_EXarBER9MqxE-DCD7Dp_mGjVZZjrHtwk9rzomog@mail.gmail.com>
References: <cover.1408993148.git.raj.khem@gmail.com>
	<0e3c53a4d84fa2a3c5e6b53697b953fab59a71bc.1408993148.git.raj.khem@gmail.com>
	<CAP9ODKqY11_EXarBER9MqxE-DCD7Dp_mGjVZZjrHtwk9rzomog@mail.gmail.com>
Date: Thu, 28 Aug 2014 20:22:04 -0300
X-Google-Sender-Auth: vngCf6Q6gE_xi1a5on3YEEqzPuQ
Message-ID: <CAP9ODKq+60yG_zKtSH2g3QpsXES7fuDoj8_PqiReMcY-5J6XkQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>, Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] native/nativesdk: Clear MACHINEOVERRIDES
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
X-List-Received-Date: Thu, 28 Aug 2014 23:22:12 -0000
Content-Type: text/plain; charset=UTF-8

Hello Saul,

On Mon, Aug 25, 2014 at 4:28 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Mon, Aug 25, 2014 at 4:01 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> In cases where we override variables e.g PACKAGE_ARCH
>> conditionally and use a MACHINEOVERRIDE to qualify the
>> override like
>>
>> PACKAGE_ARCH_<MACHINE> = "some target PACKAGE_ARCH"
>>
>> This would also be effective if this recipe is
>> BBEXTENDED to native or nativesdk which is undesired
>> This particular issue will cause wrong sysroot to be
>> used for nativesdk case since PACKAGE_ARCH would have
>> been modified and eventually changing value of
>> STAGING_DIR_TARGET which we use as --sysroot option
>> to cross and cross-canadian built SDK gcc
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Tested-by: Otavio Salvador <otavio@ossystems.com.br>

Can this to be backported to Daisy?

This solve an issue which took a while to figure out in meta-fsl-arm;
this may also affect others and it is hard to debug.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

