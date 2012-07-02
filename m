Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SljsO-0004Ii-8W
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 18:53:33 +0200
Received: by vcbfl15 with SMTP id fl15so3622748vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2012 09:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=jKehoNyZPwMx1yYvW5NB2O5y6K29EbFrlBQ54H8iFy0=;
	b=l8WaJ6faJzuNLpu22ceDhxPXEUdmuxsuFIR80sjwuKEMnOeC+MFCojP9BFxMHuEYzn
	srmAWZBudFPQ1pCqIcOF3LExdXeTYo2kIcAvz4we9/mlXfHoZOql7VBWe8kPtdbwN6Fu
	VOArfRvtrO5UHCBzGovtNRZbE0ZJrMuct6Rda1HRJ4VLYMgwo5Sxabt70jYAomApuziJ
	1oHUxQgTErNBRyjuUu8C7BUDSx/qEz6z9AKTUqOfMNdeQyHtxuyYcEHNm7C6yTcnd7e2
	F/lZ7FDoshGjqjxSjuWa/d68+gIplBVj6xKUoSwYr+jJ4wIclBu6w0EtJ3Orwsazznt8
	r3SQ==
MIME-Version: 1.0
Received: by 10.220.214.139 with SMTP id ha11mr6526329vcb.16.1341247347052;
	Mon, 02 Jul 2012 09:42:27 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.60.138 with HTTP; Mon, 2 Jul 2012 09:42:26 -0700 (PDT)
In-Reply-To: <CABcZANm5d2gQ8kdEEbcgW-KD7Puy7jZrDu82m6dHq2vVj1uagA@mail.gmail.com>
References: <4FF0C930.4000104@linux.intel.com>
	<1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
	<1341207885-9463-3-git-send-email-paul.gortmaker@windriver.com>
	<CAP9ODKot3PDg5vkz76NwNgSsy+2tn_FB2-tvaYyc1WJzW3zjrQ@mail.gmail.com>
	<CABcZANm5d2gQ8kdEEbcgW-KD7Puy7jZrDu82m6dHq2vVj1uagA@mail.gmail.com>
Date: Mon, 2 Jul 2012 13:42:26 -0300
X-Google-Sender-Auth: u4D6mhOmi9hzeoXt3ZWOnrOXTBw
Message-ID: <CAP9ODKpVfDG31Bh=gy0xgPCcGMbH4g-=CNrrE2TVc+RHnvp7EA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 2/3] u-boot: make FILESDIR a shared setting.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2012 16:53:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 2, 2012 at 10:33 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Mon, Jul 2, 2012 at 4:24 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> On Mon, Jul 2, 2012 at 2:44 AM, Paul Gortmaker
>> <paul.gortmaker@windriver.com> wrote:
>>> The setting is the same in all recipes, so move it to
>>> the shared settings in u-boot.inc
>>>
>>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>>
>> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> It shouldn't be using the old, legacy FILESDIR mechanism at all.

Indeed; grepping for it shows nothing.

This can be removed :-D

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


