Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U5yOj-000623-F0
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 13:58:45 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 130C4D22E8; Thu, 14 Feb 2013 13:42:45 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 45752D22B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 13:42:13 +0100 (CET)
Message-ID: <511CDBA1.70906@linaro.org>
Date: Thu, 14 Feb 2013 13:42:09 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <511BB265.8030505@windriver.com> <511CA4B2.1090307@intel.com>
	<511CA9E2.70700@windriver.com>
	<CAJTo0LYLtan2=YkzCN9Xvkj7k695LGba7T1QMHwYQ8EK46YvgQ@mail.gmail.com>
	<511CDA0F.9060002@topic.nl>
In-Reply-To: <511CDA0F.9060002@topic.nl>
Subject: Re: How to "implement" systemd
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
X-List-Received-Date: Thu, 14 Feb 2013 12:58:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 14.02.2013 13:35, Mike Looijmans pisze:
> So far i've been using good old initscripts for my systems. I want to
> try out systemd. Having zero experience with that, I just added
> "systemd" to the DISTRO_FEATURES and started a fresh  build. The build
> ran fine, but it produced something that still seems to be using
> initscripts, albeit that a few things stopped working (the network did
> not start, for example).

DISTRO_FEATURES_INITMAN = "systemd" is what you want.



