Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id A87056E5FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 07:09:58 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id k43so2748387uaf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 00:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Rl/ZXDOKmXJJfVyNbLYJhAkbzzyqIlqjGQw0DUjy4cA=;
	b=N8lQniPJ6TNSwUkqG+rruzMwfumn8+Wqt4mKwNMErNcXlndA8NdE/VDtJoFL4q186I
	eJJmEPOnU99mDCgC4uXoRba+iHnmzjy4MPYG5Stk5TxC9AoVbddOTMxgzOb0oUEubzZ9
	qDRqqbjbxI7duGlDaSKRg57ZssZ6yf8PqD1PppydieSkHQtMW6kK9wfRReKvkwr+SEzQ
	M/bNUWIZER277yDET6DQkxx2PZ1hsZzii4Vg95X1BHSOGEk/bKo7v3M2mSKE3NbePVas
	3V0IYmgY9Jg7cwnLhqgSCVG9W/TgdkpxRX5Hal1jby8Qaz4w9emfdFprSOWC1hO++3bM
	ouWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Rl/ZXDOKmXJJfVyNbLYJhAkbzzyqIlqjGQw0DUjy4cA=;
	b=WuNEZVzOJ7i547Lh9xSTuV2wBHdd8kudZXSEXYKnfuk3f9zd6Og8QysrRbcFYxWFrY
	FMuzoz3cMMafezj1CsJrD6ZpH+3qu6bGSMJzSWE0/mozX++xODJtbtlkR1gdnq6B0q2Z
	EOQ+GIwK3PyTrcSOiFqAaRg5EQblHZHbWXDIuZJewyO81o4lPY/hJP/twWaGqn1Qk9cY
	6vwpHlsPCjqp4LDJaaSR+BGK/XrV1+uyFRCOFNUITZ0fGahLNfE87uSOdHX+NLAbPvwd
	cvZeQW5y71LA/0yQGC9No361EOCpPeHNXKBNYNfBsgkvpcwmdyxy+c5bfiVsNLLZdlHB
	IdcQ==
X-Gm-Message-State: AHYfb5j9ZRTJnMApDx8v9UoYnAI7ICF9KY4OF4T1BAEmTGyBL06PEUpE
	PT+iBnqvI+eWLaPuKEV0zd/3Fi/LUA==
X-Received: by 10.176.66.7 with SMTP id i7mr294857uai.118.1502953799478; Thu,
	17 Aug 2017 00:09:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Thu, 17 Aug 2017 00:09:59 -0700 (PDT)
In-Reply-To: <CAC+thW0AzxtL22OCU_o+Lb_arcHkzvtu-PFSAWYPsxRAanOqUw@mail.gmail.com>
References: <20170810093755.6342-1-schnitzeltony@googlemail.com>
	<CAC+thW0AzxtL22OCU_o+Lb_arcHkzvtu-PFSAWYPsxRAanOqUw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 17 Aug 2017 09:09:59 +0200
Message-ID: <CALbNGRS5iR0j7r8gBp7E5M9MT3tB7_itiZ9UKgZ5YeQ=cbbgYQ@mail.gmail.com>
To: Andrea Galbusera <gizero@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: update to 17.1.6
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
X-List-Received-Date: Thu, 17 Aug 2017 07:09:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2017 at 3:08 PM, Andrea Galbusera <gizero@gmail.com> wrote:
> On Thu, Aug 10, 2017 at 11:37 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>>
>> Optional installation of khrplatform.h was implemented upstream by a
>> slightly
>> different approach ->
>> 0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch
>> can be removed.
>>
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>
>
> LGTM. Being reporting the issue that originated the here removed patch by
> Jussi, I build tested this commit on the original setup with
> meta-raspberrypi and everything still looks good.
>
ping

