Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 659FA6002A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 10:00:39 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id q8so130813lbi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 02:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bz4L6Zm5drpWVyBtiZGSlxvgXeajCL4H02LNzXeDhnE=;
	b=jimnWl+TH0P9HrxW9FylIzy6RUOwAcVAxhEQgXyuTSwBPEebvvJdyf3locKCoSg9zj
	qZxAnzHrfNTZuaoXBhfxSHfRjVb5tOcf+zKsiQOwJb5zh2k8WzIpiOOv2IgsnLq4yXKL
	H9CMeIkMDRa6RgjyCrZYWYhb1uvYbs533Av3iKoFyBfV1T7OY4vKi3UOE2vnANQJdsbd
	jUtlANlXGqWVMow0yWebPqTfGzD+Xw5RqTbsvSF6ez2dJa+mjmrUe0XcM3XucMioThre
	RuiRPqWwuqa3aW0FycxO2w9PRHvbN8H8PXasp4PlSEyetP4MzXUSd7w7wOFKdA1P2toY
	zJ+Q==
MIME-Version: 1.0
X-Received: by 10.152.19.65 with SMTP id c1mr362871lae.49.1390384839283; Wed,
	22 Jan 2014 02:00:39 -0800 (PST)
Received: by 10.114.68.133 with HTTP; Wed, 22 Jan 2014 02:00:39 -0800 (PST)
In-Reply-To: <52DCDFB6.2070801@windriver.com>
References: <cover.1390184362.git.Qi.Chen@windriver.com>
	<a023434c6cc916907f190acd62af34ea5a6eaca0.1390184362.git.Qi.Chen@windriver.com>
	<143aeafa800.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<52DCDFB6.2070801@windriver.com>
Date: Wed, 22 Jan 2014 11:00:39 +0100
Message-ID: <CAC1BbcQN63w956H2=kYmUbzGs1t5=V81-4_uKWfZtHJjJX9+uQ@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/5] systemd: add 'less' to its RRECOMMENDS
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
X-List-Received-Date: Wed, 22 Jan 2014 10:00:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 20 January 2014 09:35, ChenQi <Qi.Chen@windriver.com> wrote:
> On 01/20/2014 04:06 PM, Bernhard Reutner-Fischer wrote:
>>
>> On 20 January 2014 03:23:02 Chen Qi <Qi.Chen@windriver.com> wrote:
>>
>>> The less command provided by busybox cannot interpret the control
>>> character, resulting in obscure output of the journalctl command
>>> in a systemd based image.
>>
>>
>> Can you send me the input containing this control character, please?
>>
>> Perhaps we can do something sensible about it..
>> TIA,
>
>
> For more details, please refer to
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5723.
> You can also add you comments there.

Can you please try:
http://marc.info/?l=busybox&m=139038437907397&w=2
and let me know if this fixes your issue?

thanks,

