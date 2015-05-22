Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 765736B0CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 11:11:22 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so17326286pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 04:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ongMmMB10c9Fu1Ao51QvFS7p0ZIGXoFxP/4GFAQha00=;
	b=VhkkoDAutMRUDQv7amw2FdLb3TUNPVOz1nafmGo+keg3tVUWeAGCw1IybcYUJQb1M6
	RH6ByozC+2f6V03tk/NYoVMBvxcD9HC1E44ubeuk0AP6MDfRYo+u4/gJfYSaxOPJ0+qQ
	Yrf9psHnxmdRCleUsiVqqfzXyFsfkryI1yeE2dbstAR9v87o2/Is2dhZeyupldiAOWJ3
	aOI0mzwjxP+usyuY7+cX1KQQIYXvqXS7IXjj8gVbQzOr5Dckm58cpL1h330I70YcYhLR
	2nVYECXITyuNmQ8ZGdhAZsOIUTkxhgJ9pXRhF2Kpjx/XmgJI+uXK4mJSYRr2D44N3vkh
	2x0A==
MIME-Version: 1.0
X-Received: by 10.70.96.194 with SMTP id du2mr14763335pdb.108.1432293084037;
	Fri, 22 May 2015 04:11:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Fri, 22 May 2015 04:11:23 -0700 (PDT)
In-Reply-To: <1432289348-5624-1-git-send-email-thomas.perrot@tupi.fr>
References: <1432289348-5624-1-git-send-email-thomas.perrot@tupi.fr>
Date: Fri, 22 May 2015 08:11:23 -0300
X-Google-Sender-Auth: IoqO2FDldLMtIrVGvaB_I_RARjk
Message-ID: <CAP9ODKprXP3_O41a7HAenLXPuJAGTOz0_1bF0xyud+vRvxJcRA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Thomas Perrot <thomas.perrot@tupi.fr>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-serialgetty: Remove SERIAL_CONSOLE definition, because it depends of machine definition. Set it, here, can be make the value is not good.
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
X-List-Received-Date: Fri, 22 May 2015 11:11:25 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 22, 2015 at 7:09 AM, Thomas Perrot <thomas.perrot@tupi.fr> wrote:
> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>

Nack! The setting here is the default if machine does not define it. I
see no benefit in dropping this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

