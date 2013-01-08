Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TsVP0-0004JX-PQ
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 10:23:24 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 04BD0D22E9; Tue,  8 Jan 2013 10:08:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 47C05D22CD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2013 10:07:51 +0100 (CET)
Message-ID: <50EBE1E3.8060408@linaro.org>
Date: Tue, 08 Jan 2013 10:07:47 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1357151830-23755-1-git-send-email-cazfi74@gmail.com>
	<1357151830-23755-2-git-send-email-cazfi74@gmail.com>
	<1357151830-23755-3-git-send-email-cazfi74@gmail.com>
	<1357151830-23755-4-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1357151830-23755-4-git-send-email-cazfi74@gmail.com>
Subject: Re: [PATCH 3/3] gmp: update to upstream version 5.1.0
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
X-List-Received-Date: Tue, 08 Jan 2013 09:23:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

W dniu 02.01.2013 19:37, Marko Lindqvist pisze:
> New version of configure.patch added for gmp-5.1.0. Old patch
> moved to gmp-4.2.1 specific directory.
> gmp_fix_for_automake-1.12.patch part of upst=C5=95eam so removed
> gmp-5 version, gmp-4.2.1 version remains.

This update broke our AArch64 builds. Will have to check why and fix it.



