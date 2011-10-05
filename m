Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1RBYD8-0000GE-8s
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 22:37:02 +0200
Received: by bke11 with SMTP id 11so2682125bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 13:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=aUewOcgYEoTYxz7LskWQLisncuLAOhkPMysSiVGuumA=;
	b=TYc5nJ2uR+J2fZegDzNwC4DZBockVViKvufZLPQe1l4U3mlrSihRfS+aMaL2JgmaOY
	6tt9k3pxHQuCk99Ui0Q+HY5T/AW0GfhkXPFyWXygHBTWYN1zgwcOLyDdQw7nKjRFn7na
	gdQm/SBymsKXU+gLGzd3VekXi27v53zW2pRe0=
Received: by 10.204.7.207 with SMTP id e15mr1874807bke.62.1317846687050;
	Wed, 05 Oct 2011 13:31:27 -0700 (PDT)
Received: from [192.168.1.3] (145.79-161-31.customer.lyse.net. [79.161.31.145])
	by mx.google.com with ESMTPS id l15sm3087667bkw.9.2011.10.05.13.31.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Oct 2011 13:31:26 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
In-Reply-To: <1317814733.14671.139.camel@ted>
Date: Wed, 5 Oct 2011 22:31:23 +0200
Message-Id: <7A8ADFF6-FC88-49F4-97DD-AEFD5FBFC434@gmail.com>
References: <4E8C3603.9000803@gmail.com> <1317814733.14671.139.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: Workaround to compile linux-omap_2.6.39.bb?
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
X-List-Received-Date: Wed, 05 Oct 2011 20:37:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> OE-Core uses fetch2 and that is a tarball from fetch1. You'd need to
> convert that tarball into the form that fetch2 expects and rename it,
> then you stand some chance of it working.
>=20
> Also note that your recipes needs to be using a fixed source revision
> and that revision needs to be present in that tarball.
>=20

Thanks for the response, but I managed to find a mirror of linux-omap in =
the end, and I think I read on the linux-omap ML that the tmlind-repos =
will be back at kernel.org soon.

- Tasslehoff



