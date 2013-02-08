Received: from mail-oa0-f41.google.com ([209.85.219.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U3uGy-00032H-6a
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 21:10:52 +0100
Received: by mail-oa0-f41.google.com with SMTP id i10so4501546oag.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 11:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=FK1C92JPOY/MRarov9wiSm8hBxteFGGNoP1zrWOUSLY=;
	b=x8N55gD/ZkkuODQTXBLrqDNBGxiQu+aKeFiQPeqBgKucXDLxNB/fPHl94xVnckkcSk
	q4uwf2whP7kCqIAQMeKO22pWbEjKFwhQKD04HlzMHMuoQb7B/7g0ccpf8VKxlumOV1Q5
	pirCCF1UBJo7YywaC0DwmBg3p/gSvwX5ShJsIw6iwVJqcaMnHF95BjdQESN6ObeQdkxb
	CXWHJOR1StPoqRQgt5WxKqkcauyeTpUfS13OXEGOALDOuHy9Mm4tQHvDubwsTLjLEsOM
	rP9DByFwrCV0knYUBPShqavuT+EMxQ5zCe01SlYvkiy1hq71VWYMiCsorE6BNFboaMTh
	MxVQ==
MIME-Version: 1.0
X-Received: by 10.60.170.44 with SMTP id aj12mr1699196oec.42.1360353257578;
	Fri, 08 Feb 2013 11:54:17 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Fri, 8 Feb 2013 11:54:17 -0800 (PST)
In-Reply-To: <511556C4.9080108@felipetonello.com>
References: <1360090154-26766-1-git-send-email-ftonello@cercacor.com>
	<51115E97.1080404@linux.intel.com>
	<511182A9.2060702@felipetonello.com>
	<0CB2DDB0E2D34358AAD3481B8F78E9F1@intel.com>
	<5112D7D3.6020304@felipetonello.com>
	<CAP9ODKrBmqnOgRH0FhvuEvS-narJuQA_RLOLfBjjOsSPZa07ig@mail.gmail.com>
	<CAJTo0LYtmvmEXQ9hu_ktj+TC+q4wB_6UgXA1onDxM3P3Wo4UFg@mail.gmail.com>
	<511556C4.9080108@felipetonello.com>
Date: Fri, 8 Feb 2013 17:54:17 -0200
X-Google-Sender-Auth: lHWuQCoNCh1gVYmBtMs9SkjEwZM
Message-ID: <CAP9ODKpjUT+8wLJEbf3xrkUASAXZcsoD5MtaVMfgE5HV3RHwmQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Felipe Ferreri Tonello <eu@felipetonello.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: added recipe libconnman-qt
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 20:10:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 8, 2013 at 5:49 PM, Felipe Ferreri Tonello
<eu@felipetonello.com> wrote:
> On 02/08/2013 03:10 AM, Burton, Ross wrote:
>>
>> On 8 February 2013 11:05, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>>>
>>>> So what was decided? Should I re-send the patch with what path?
>>>
>>>
>>> Until something inside OE-Core uses it I would prefer it in meta-oe.
>>> Ross?
>>
>>
>> If it were connman enabling in Qt directly I'd say oe-core, but as
>> it's a separate library meta-oe is the right place IMHO.
>
>
> But where exactly? meta-oe/recipes-qt/libconnman-qt?

Yes.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


