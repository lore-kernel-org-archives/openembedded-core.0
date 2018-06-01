Return-Path: <nick83ola@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2419474F8A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 09:39:39 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id c128-v6so12729711oig.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 02:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x8+H4BjLMjend6j2axUENoseIPyqtAvAhk9M7x6Lbhc=;
	b=VyK1cwXhRr5fdRLxBOuoqP9NMvQ+4Py7sO8V7/SyLykNVf2+13CGlMG8niC9jPHyD+
	+HOSnUoFg2rn9jytkBEeRWz0JgF4QdiSZkdj2RqTdWCP3dnT6Czm+RN46q2HrBHYZNTy
	RQDHPEBi7sMHzItbZr+zvZaxCoECs/7DqcgFK0jM9PooCJGS9yXI/qOd/km31iKGe4NE
	YRPUeycwHO1p/xKABDWzntxAl7SQOmWasQ9KXsKlmb2ZHGA5bFGWZzXu7HrapA9bqVKE
	bnNtOhospphvBSYY7tEmEGCyOWeRzUJyc5cu7fm1jiOdn188HjdvzhdzAlLq7VTPSd4f
	XfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x8+H4BjLMjend6j2axUENoseIPyqtAvAhk9M7x6Lbhc=;
	b=gvsMS4dTvDCO2eyTLMTf4AhvfNidIYq+ShHbrgZKXwLZebA0EfEe+Y2Oa5AWi8Zs+l
	XpWDuT0M6D9UHZfJhJYcv95cvaeuN0lpuKPQ1UrDyvmct3i8ABCAr8O6pv/xP14uQgDJ
	vWLYqMQXkMp3kY6Ho3NrmcL2PEh0Qci2fuIOqC/UmejqTQ4mPdlI0371muCNQJtWD9DZ
	JrTIxzVECkKxKi4CzZ5kp6SAqMKqbjkreq9egnPEbX1dmfZkTXzFtlR3pwyuw2Wj+Lw+
	Xr1iLlyf1COit+6W3qd5xDTGtJBy7OhIaC5roMvCRqKpNmuRTuqVhR2d65+D56g1QdxR
	3oOw==
X-Gm-Message-State: APt69E3eSIt/iYsZWoN/0GEOrLLcOTt6jlZtzGpfLAqaZr8ITJ/2WiVI
	OwHn785l20/6POR2a1pVSRR5wY5eBLHU3YtrV4s=
X-Google-Smtp-Source: ADUXVKLbbKKkGjEgc+hCB89asF1ahwGfgCKvrH3j3R83yA8OGnaPQ7/BN2F1ej3iI2SayDHT7cJ03zdz+28m0gFgO1A=
X-Received: by 2002:aca:5d0b:: with SMTP id
	r11-v6mr5517810oib.195.1527845980947; 
	Fri, 01 Jun 2018 02:39:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5f8d:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 02:39:20 -0700 (PDT)
In-Reply-To: <cfd18be2-bcfa-b3f5-ad43-323a8c382edd@windriver.com>
References: <CABPh3UPoC9VF-6iTMykf8Ohj5SmTBAD7FYUdbd-abTBrWju_=w@mail.gmail.com>
	<cfd18be2-bcfa-b3f5-ad43-323a8c382edd@windriver.com>
From: nick83ola <nick83ola@gmail.com>
Date: Fri, 1 Jun 2018 10:39:20 +0100
Message-ID: <CABPh3UN7Aq+U9dLZOzu1UZM9-pg3Hfz_Ct2ZYF6H3eqTUOBomw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe][meta-oe][PATCH 1/3] Mosquitto add a mosquitto conf and logging to the default mosquitto recipe
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
X-List-Received-Date: Fri, 01 Jun 2018 09:39:40 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks
Sorry for that I will submit everything to the right mailing list :-)

Nick

On 25 May 2018 at 20:19, Randy MacLeod <randy.macleod@windriver.com> wrote:
> On 05/25/2018 10:14 AM, nick83ola wrote:
>>
>> The openembedded recipe for mosquitto doesn't provide a default
>> configuration file.
>>
>> Also it install a bunch of examples.
>>
>> This series of patches provide a "default" configuration file and setup
>> logging.
>
>
> The mosquitto recipe is part of meta-openembedded:
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb?h=master
>
> so send a patch to:
>   openembedded-devel@lists.openembedded.org
>
> Also, patches in email attachments are not the right format, see:
>    https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>
>
> Thanks for working on the patch and good luck,
>
> ../Randy
>
>>
>>
>> Cheers
>>
>> Nicola Lunghi
>>
>>
>>
>>
>
>
> --
> # Randy MacLeod
> # Wind River Linux

