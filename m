Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1T2iuu-0007Qh-L4
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 15:18:16 +0200
Received: by pbcwy7 with SMTP id wy7so5499657pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2012 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ZANEfYIXvtTaWwqxasOkEmLYoZarTXAmqRVAsMpkZ/E=;
	b=E/LI/CmRoOFu3E+a/WwmrTxYVys1t2lCKJniKKRU7HzaEF+d1CZRIjhyPlpDfhjUBs
	2GjldP7hzI/lvRdBDeHYjvzsPsk6GS8HXVldp1V1NRrIocs9u67BAa5E4vIvV0ZVWblr
	1I3XrCnvrWTwEqDnZ9EuVSyUclBqg4FwiatplmS4xSU+S/9r/PsBnNghj/yXjAORo24M
	LB9wrpw4NYUNC8USr5FM4WERG3AS9EwqQ/oKDxQhqV4yXuMYl8AneuOAkYg/Jl3Pc69E
	8ysLTx8F8ih7vCNioD0SKmAacitq+/rm8bWlseUChw52Dm9uiKVrCAvo9gBG9yPFwOmw
	zoJg==
MIME-Version: 1.0
Received: by 10.68.197.70 with SMTP id is6mr19484597pbc.64.1345295175834; Sat,
	18 Aug 2012 06:06:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Sat, 18 Aug 2012 06:06:15 -0700 (PDT)
In-Reply-To: <502F01AF.20605@linux.intel.com>
References: <1345222136-24839-1-git-send-email-trini@ti.com>
	<1345222136-24839-4-git-send-email-trini@ti.com>
	<502F01AF.20605@linux.intel.com>
Date: Sat, 18 Aug 2012 10:06:15 -0300
X-Google-Sender-Auth: Ta3msyRlnHQgoKXrKYqHubMVy6Q
Message-ID: <CAP9ODKpFyp0aCow9xLDwwPz8dZVEgrWGnZeLPoBtpPZt6JQSGw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Tom Rini <trini@ti.com>, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] u-boot-mkimage: Update to v2012.07
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
X-List-Received-Date: Sat, 18 Aug 2012 13:18:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 17, 2012 at 11:45 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> Log data follows:
>> | DEBUG: Executing shell function do_install
>> | install: cannot stat `tools/mkimage': No such file or directory
>> | ERROR: Function failed: do_install (see
>> /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/u-boot-mkimage-2011.06-r1/temp/log.do_install.61586
>> for further information)
>> NOTE: package u-boot-mkimage-2011.06-r1: task do_install: Failed
>> ERROR: Task 3190
>> (/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb,
>> do_install) failed with exit code '1'

This is not the same version; Tom has send 2012.07 and you're building
2011.06 ;-)

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


