Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TGGFd-0001Oy-Ov
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 23:31:37 +0200
Received: by eeit10 with SMTP id t10so1357634eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 14:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=E1cbssimOX3Atb+5Oy/U0Ssxj0meC8n9bN86Fp8VxfU=;
	b=I9791D6S7SurwnrumfyfpsifN9zUcKCQt4CyJ5LRBpoa2M1fE5neAhxWriiUrqpStV
	AmTIHFqnB+Q3KXzWQfADmWtCUgI/gon6cC5Ulb4cMNbsDW6Qe56/zvsgHgwFJfjr0/7J
	ncnUyyDYw1E/Lz9FlJi0CjsQu8qiPS1hhBbjAJYP3i+YIYQsFU7bLv3cEesBSjvh8pwo
	/9LllvaAdaQPRkmCiwA5/0+61HhBMqNoK++UqjXWwzeJIiYgwpJUW6Zok8G7lqYkMemi
	MDRcr4y1BIswfP8kFVRN61W6VogR5sWxGM8d2nN2DsL5MSbm2xzb/r9Ckd0mf1yWKybG
	5eww==
Received: by 10.14.220.134 with SMTP id o6mr16394879eep.35.1348521529783; Mon,
	24 Sep 2012 14:18:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Mon, 24 Sep 2012 14:18:19 -0700 (PDT)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6A3103@039-SN1MPN1-001.039d.mgd.msft.net>
References: <cover.1339740433.git.raj.khem@gmail.com>
	<1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
	<1f0884d8428c923c1b18670877c85cb3dc09cfda.1339740433.git.raj.khem@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A3103@039-SN1MPN1-001.039d.mgd.msft.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Sep 2012 14:18:19 -0700
Message-ID: <CAMKF1sroJWErkLfrrS0+zON1Vce64SJyznoTLuoM0NW+iW-QNQ@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/9] rpm: Use link time check for libssp
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
X-List-Received-Date: Mon, 24 Sep 2012 21:31:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 24, 2012 at 1:36 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
>
> Won't this still break on systems without libssp where sstate-cache
> was built on systems with libssp?

these two systems are not same IMO so native sstate should not be
shared here it will break more than rpm.


