Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Sh1PV-00040V-Cc
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:36:09 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id E745AD2380; Tue, 19 Jun 2012 18:25:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-144.dynamic.chello.pl
	[87.206.60.144])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2605ED232A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 18:25:07 +0200 (CEST)
Message-ID: <4FE0A7DF.7030909@linaro.org>
Date: Tue, 19 Jun 2012 18:25:03 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120611 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FE0684D.2000906@linaro.org> <4FE0714A.1060603@linaro.org>
	<CAMKF1spK-ezqmFr+rh7J5dcbVvPbpDFGHxW02HvX9uaWdqTohQ@mail.gmail.com>
In-Reply-To: <CAMKF1spK-ezqmFr+rh7J5dcbVvPbpDFGHxW02HvX9uaWdqTohQ@mail.gmail.com>
Subject: Re: Is target toolchain supposed to be working?
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
X-List-Received-Date: Tue, 19 Jun 2012 16:36:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 19.06.2012 18:19, Khem Raj pisze:

> includedir already has leading slash so I wonder if you changed 
> includedir in your setup somehow ?

bitbake gcc -e|grep ^includedir shown "/usr/include" value. G++ started
on target as "g++ -v" shown "--with-c++-includes=/usr/include/c++" so I
was surprised when it was not working.

Added extra slash and it works. But please check in your configuration.


