Return-Path: <ronunes@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4BB266B414
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 22:57:37 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id wc20so4347988obb.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 15:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+09opxq2QJp8/4XuYvRtBySfHxSZeF41G6VRZ7EAMB8=;
	b=jwBKBEJ2cSaK9AClJpe2abDQnVGkbCREItHkNROC3f3HlZWZxzJTLGh8hShporXGAe
	r2RDrrYaS1Pm7FOcwEHIidC2dhj82AZkJ9HP8JD3vvYQMKtSJqVHWTGAW0XwE5BOWTiH
	yZw4n+vLhzm9sso2+T0RloH2bZhBHlVRWnRknVRtC0MZDG3yU4SQGcS0AGPisoQPZqzF
	ckC/OjRa55xnCpg1uVQxeBHHXC8zRS8cIyxm49w9l+sat8H5+gI2kbLhsImTrIjntP+w
	orGRnpJNFDmPPBGyo+js/kyBxgOMUCLOtVWTIe+kOeRtWagwcECwNJS9s7J5gj0lav+2
	LliA==
MIME-Version: 1.0
X-Received: by 10.50.21.99 with SMTP id u3mr394321ige.52.1375138657106; Mon,
	29 Jul 2013 15:57:37 -0700 (PDT)
Received: by 10.64.22.197 with HTTP; Mon, 29 Jul 2013 15:57:37 -0700 (PDT)
In-Reply-To: <CAP9ODKrDrN-Yb6oyk0sed_6B9tsAWG6KpuDG51zVojzjv9oz5A@mail.gmail.com>
References: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKrDrN-Yb6oyk0sed_6B9tsAWG6KpuDG51zVojzjv9oz5A@mail.gmail.com>
Date: Mon, 29 Jul 2013 18:57:37 -0400
Message-ID: <CACb8hfHj1YzrdJFiGdYjz1AtW1zQkD0TyHtd3uYn=Cd3+a1ftA@mail.gmail.com>
From: Rogerio Nunes <ronunes@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Eric Nelson <eric.nelson@boundarydevices.com>,
	Rogerio Nunes <rogerio.nunes@freescale.com>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 29 Jul 2013 22:57:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thank you, Otavio!

On Mon, Jul 29, 2013 at 6:35 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello Eric and Rogerio,
>
> On Mon, Jul 29, 2013 at 7:26 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> This allow the addition and removal of distro features easily. To add
>> a feature, use:
>>
>>  EXTRA_DISTRO_FEATURES += "wayland"
>>
>> and to remove, use '~' prefix, as:
>>
>>  EXTRA_DISTRO_FEATURES += "~x11"
>>
>> This code has been mostly copied from Mentor Graphics public layer but
>> changed the variable name for a more descriptive name. The original
>> code can be seen at user_feature.bbclass at:
>>
>>  http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> I have submitted a patch for OE-Core to address this hardness to
> add/remove distro features. It is based in user_features.bbclass from
> Metro Graphics but I changed it to fit better in base.bbclass. Please
> give it a try and comment if you have a better alternative solution
> for this problem.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

