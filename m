Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1USHw0-0000fD-Vv
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 04:17:25 +0200
Received: by mail-pa0-f49.google.com with SMTP id kp14so645363pab.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 18:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=PmlLJGhpzsrI4Es+C29oa6O+wbYbCQj4ubuPH+/FUZ8=;
	b=Q7zlWTK3Br+rouXOEVXu5iH0zADephiSHQCisO7TPfTfYk3soop0ko8OZmpuis+Wm6
	nUXVaGLqo1Hq04hKF6SpMZuSEhfrQDQ4jk1hvCH4EZMn+5PFaqvmoPPiE9131BJZTtOc
	txmjA8WLfIZNT+wwsMWOVWQJpDRF0KbctV4742yBeA7Srzh83RVWtc2HienFqf+Ifmmf
	NOhy7jxrVLZ6UDdwXtBZ2TFs1bztxjzbwTE8vKC/ilk3XsRL3FcPKs5tU1wpGuy0rNe5
	R48t1vsAbVKO2YR2jfF/fRz9vHk7/kBa/CwQK9+iJgruopxU9kokqzcu+g23GOpglzGb
	2Rsg==
X-Received: by 10.68.209.193 with SMTP id mo1mr6436879pbc.191.1366163989180;
	Tue, 16 Apr 2013 18:59:49 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([117.89.53.249])
	by mx.google.com with ESMTPS id sa6sm4178207pbb.26.2013.04.16.18.59.45
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 18:59:47 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org, ml@communistcode.co.uk
Date: Wed, 17 Apr 2013 09:56:37 +0800
Message-ID: <6632530.D4BqdoBVLR@yiqingliang-pc>
User-Agent: KMail/4.10.2 (Linux/3.8.7-1-ARCH; KDE/4.10.2; x86_64; ; )
In-Reply-To: <516D0783.8040608@communistcode.co.uk>
References: <4914614.5LoTVAGS7p@yiqingliang-pc>
	<516D0783.8040608@communistcode.co.uk>
MIME-Version: 1.0
Subject: Re: gcc compile error
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
X-List-Received-Date: Wed, 17 Apr 2013 02:17:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, April 16, 2013 09:10:43 AM Jack Mitchell wrote:
> On 16/04/13 05:38, Yi Qingliang wrote:
> > hello, i'm using archlinux, the gcc is 4.8.0.
> > 
> > when compiling gcc 4.7.2 in oe, I got the error:
> > | /mnt/src/arm9plf-build/tmp/work-shared/gcc-4.7.2-
> > 
> > r19/gcc-4.7.2/libgcc/libgcc2.c: In function '__absvdi2':
> > | /mnt/src/arm9plf-build/tmp/work-shared/gcc-4.7.2-
> > 
> > r19/gcc-4.7.2/libgcc/libgcc2.c:273:1: internal compiler error:
> > Segmentation
> > fault
> 
> Hi,
> 
> Many people have run into this problem so far (myself included) and I
> have been told it is the fault of the ArchLinux GCC. Now, I noticed the
> ArchLinux devs pushed a new build of GCC out yesterday, have you tried
> upgrading to that yet and giving it another go?

NO LUCK!

> 
> If not, my solution was to move to GCC 4.8 using the patches posted to
> oe-core/oe-dev.

when the oe will upgrade gcc to 4.8 or 4.7.3?

> 
> Regards,
> Jack.
-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com


