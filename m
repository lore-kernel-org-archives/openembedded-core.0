Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rj4EZ-0005Xe-7v
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 08:29:03 +0100
Received: by lami14 with SMTP id i14so401719lam.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 23:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=L/bf/AqgT/zlK8cpm0vlkreP9Mj2kMoK1QUnauYDa/E=;
	b=pCwN8X4KkZr5xGCve/XwbtsyqG2iciYNzoR8IDLocGxRg1TFAoy6F7pqNoGami5Mqx
	hfYTWjJ7oHTGzib9jsevld83aXaF26gbMB060JjRwVC0MthojXOLaCGKaN1jD4N48/H+
	4uZG3N1sdUZbFI/JxPZ0nP6Sm7/3h1l2clHKw=
Received: by 10.112.43.41 with SMTP id t9mr975506lbl.93.1325834499446; Thu, 05
	Jan 2012 23:21:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Thu, 5 Jan 2012 23:21:08 -0800 (PST)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C014BC2@ORSMSX106.amr.corp.intel.com>
References: <1325821207-2843-1-git-send-email-raj.khem@gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C014BC2@ORSMSX106.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jan 2012 23:21:08 -0800
Message-ID: <CAMKF1sobkDF3QFoEHXfAjkwB8OoYGQPFGbZJNfb8kJQ3U0meow@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc: Upgrade recipes 2.14 -> 2.15
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
X-List-Received-Date: Fri, 06 Jan 2012 07:29:03 -0000
Content-Type: text/plain; charset=UTF-8

Nitin

On Thu, Jan 5, 2012 at 8:59 PM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
> Can this be done without removing eglibc 2.14 recipe files ?
>
> X32 layer is depending on the eglibc-2.14 recipe.

I have tested it on all qemu architectures and seems to be ok. if x32
does not have hard
dependency on 2.14 give it a try if you see fallouts for x32
I will redo to preserve 2.14


