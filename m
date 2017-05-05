Return-Path: <stefan.wiehler@missinglinkelectronics.com>
Received: from smtp.missinglinkelectronics.com
	(smtp.missinglinkelectronics.com [5.9.234.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4139F77E09
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 14:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp.missinglinkelectronics.com (Postfix) with ESMTP id A13FEE015C; 
	Fri,  5 May 2017 16:45:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at missinglinkelectronics.com
Received: from smtp.missinglinkelectronics.com ([127.0.0.1])
	by localhost (mail.missinglinkelectronics.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id HeQiW3HGLSLB; Fri,  5 May 2017 16:45:47 +0200 (CEST)
Received: from [10.89.231.22] (p4FE1E831.dip0.t-ipconnect.de [79.225.232.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	(Authenticated sender: stefan)
	by smtp.missinglinkelectronics.com (Postfix) with ESMTPSA id 1387BE005A;
	Fri,  5 May 2017 16:45:47 +0200 (CEST)
To: Andre McCurdy <armccurdy@gmail.com>
References: <20170503161317.16784-1-stefan.wiehler@missinglinkelectronics.com>
	<CAJ86T=ULob-3w572btu9UuVxDU1TxNc=jYNkfY7kewVCirxx8w@mail.gmail.com>
From: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
Organization: Missing Link Electronics
Message-ID: <0777a834-3055-2f1d-b6b7-1dcb0d4b58f8@missinglinkelectronics.com>
Date: Fri, 5 May 2017 16:45:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=ULob-3w572btu9UuVxDU1TxNc=jYNkfY7kewVCirxx8w@mail.gmail.com>
Cc: ulrich.langenbach@missinglinkelectronics.com,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] module.bbclass: Add devshell support
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
X-List-Received-Date: Fri, 05 May 2017 14:45:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

 >> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
 >> index 802476bc7a..9b019513ae 100644
 >> --- a/meta/classes/module.bbclass
 >> +++ b/meta/classes/module.bbclass
 >> @@ -1,6 +1,7 @@
 >>  inherit module-base kernel-module-split pkgconfig
 >>
 >>  addtask make_scripts after do_prepare_recipe_sysroot before do_compile
 >> +addtask make_scripts after do_prepare_recipe_sysroot before do_devshell
 >
 > For normal recipes, devshell doesn't care about any build dependencies
 > (and so runs very quickly if you just need to refresh a patch etc). If
 > you need a devshell which is able to build something then the normal
 > way would be to manually run the configure or compile task before the
 > devshell task.
 >
 > I'm not sure of kernel modules are a special enough case to do things
 > differently and add build dependencies to the devshell task?

I agree, I couldn't find any other class having devshell task dependencies.

