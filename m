Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T6Dgm-0001jc-Oj
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 06:46:08 +0200
Received: by iaky10 with SMTP id y10so10071583iak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 21:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=++uICkt6UEc1y4vyUxHJ9HXXtD36aEyACdJ2e7wJZCU=;
	b=dE4dpYzDABBPkuElVrPzqAxh5TXxQptmm+ITV6AAUC+HWryhPd9sCfE0/Iw4AkvTv/
	I93dY3+upwMA9NIt7xIYqxZMIwsq/kHqgEhFnU/hM7mQHSx3fJSAQ4Knc/iExnZR9X8+
	sQUPhvh6HHne5D5AlCdYZb0ftL2nRB1qVt1xk4LoOQtyP/q855N9NgtwP6x7IbX048hK
	3y9/TDq3hfPYcDTtdanj6/WnUEibqIevlRZPDmBgEMZxDqBv49UfoDktgs/Cv0KZhVoH
	2/tbMfEaZ0juvBDfexJw7q4+s2bQiQNenCBAvoeUcKVQDRrkVYluicStBwSO0Hm0fmnt
	KP3A==
MIME-Version: 1.0
Received: by 10.50.209.99 with SMTP id ml3mr12482647igc.31.1346128435767; Mon,
	27 Aug 2012 21:33:55 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Mon, 27 Aug 2012 21:33:55 -0700 (PDT)
Date: Tue, 28 Aug 2012 06:33:55 +0200
Message-ID: <CALbNGRTrP1i2R69pT-rgtGhs+qmeGeGtPnBAxGgpxq5L2SJ3Ag@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: IMAGE_LINGUAS question
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
X-List-Received-Date: Tue, 28 Aug 2012 04:46:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi

another one out of the stupid-question-corner:

The display manager LXDM (and I think others too) check in
configuration files which languages to offer. I would like to add a
postinst for LXDM which fills it's configuration file according to
what was installed by IMAGE_LINGUAS. Now my question (I looked into
image.bbclass but did not find something useful): Is there some file
around in rootfs where I can get the information which languages were
installed by image linguas?

Andreas


