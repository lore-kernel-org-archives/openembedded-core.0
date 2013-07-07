Return-Path: <walters@verbum.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id F3B556AD4F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jul 2013 21:55:33 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 5E03D2095D;
	Sun,  7 Jul 2013 17:55:34 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute1.internal (MEProxy); Sun, 07 Jul 2013 17:55:34 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=/CEk0BoYutxwxYG9sUi+pU
	zbAzI=; b=naVacQdMGjJNgy7Suci6GICrToBiLChrD9BfHFZnbbnfnQnxgkNxsC
	kaMWFdeyj6HipyTeBFPO9enKxyGaEQaqQGU6SO4SunTbIk4eB603bqwEuOdrNAKm
	jzscRixn8D1Vm56KynloixiPTcPUCDSZrnijnroa9x2C5+vCNxGBc=
X-Sasl-enc: A7wuVNOSL59+YYQGl+DIZMpzIMI4RSLKd2ccrV1m8fd3 1373234134
Received: from [192.168.1.2] (unknown [66.31.18.51])
	by mail.messagingengine.com (Postfix) with ESMTPA id E7BC8680279;
	Sun,  7 Jul 2013 17:55:33 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Stefan Stanacar <stefanx.stanacar@intel.com>
In-Reply-To: <a29e7a16581e848d017a56de42e4ee751639d529.1373013888.git.stefanx.stanacar@intel.com>
References: <cover.1373013888.git.stefanx.stanacar@intel.com>
	<a29e7a16581e848d017a56de42e4ee751639d529.1373013888.git.stefanx.stanacar@intel.com>
Date: Sun, 07 Jul 2013 17:55:31 -0400
Message-ID: <1373234131.5334.17.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-11.el6) 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH v2 3/8] lib/oeqa/utils/sshcontrol.py: helper module for running remote commands
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
X-List-Received-Date: Sun, 07 Jul 2013 21:55:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-07-05 at 12:27 +0300, Stefan Stanacar wrote:

> +        actualcmd = "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -l root %s '%s'" % (self.host, cmd)

This is going to fail if cmd contains a single quote.  Personally, I
*always* pass around subprocess arguments as an array.  Anything else is
going to lead to quoting problems.




