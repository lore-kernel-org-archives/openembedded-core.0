Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQ40A-0003ZO-IO
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 23:55:54 +0200
Received: by laai10 with SMTP id i10so906999laa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 14:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=D2yyYdD1m1jG4SqPocenCqdEY1pbwJrs2s1tc6Q4vno=;
	b=dlNpL8vYr/jZ5wlycrMs13UJNGti0dQ66SpnYCWCUeI/VszuPwN5AYdQl1NuFOfHh4
	Mex5RaX7DKbql6b8gQQLMUJGYS4RUuXXqGxhtfzLvAANvQhiwLk793RVSAxnqZkPg+mI
	1zQqKpd3Wl17rxbMo5xHq6cNnL+vXyt2ILc6zn6YIFkJeTFE/V4+6/F148BQStQwANRj
	bV5VWPTuZ/QbsrW5aokc+nIDegesVOjVwmzRvu23/yEliPGQ600gxQGj6RfbZGD3kNcY
	eTghoqKGYXNOzqzwTZ/0k96MMnS+7Jit+ZYTXUFEan1OBeJSlzhOWrI9zgBw1B92TNDe
	5TSA==
Received: by 10.112.103.8 with SMTP id fs8mr1839199lbb.29.1336081568506; Thu,
	03 May 2012 14:46:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 3 May 2012 14:45:38 -0700 (PDT)
In-Reply-To: <4FA2F37C.4030107@linux.intel.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<55e8f3e04ef67a706dfc19ed730ae9612489c4e5.1328510188.git.raj.khem@gmail.com>
	<4FA2F37C.4030107@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 May 2012 14:45:38 -0700
Message-ID: <CAMKF1sqvN5+c5Yw1QJoNWWryP-BzCJw5VZqBkmUVc+GNvb8fuQ@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/20] module-init-tools: Delete
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
X-List-Received-Date: Thu, 03 May 2012 21:55:54 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 3, 2012 at 2:07 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> On 02/05/2012 10:40 PM, Khem Raj wrote:
>> Since its provided by kmod
>
> Perhaps we should wait on deleting this until we've run with kmod as the
> default for a while?

Fine with me.

>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel


