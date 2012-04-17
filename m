Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>)
	id 1SKAat-0002B9-6Y; Tue, 17 Apr 2012 17:45:27 +0200
Received: by wera1 with SMTP id a1so4139877wer.6
	for <multiple recipients>; Tue, 17 Apr 2012 08:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+LEPq/YHdlnd01W+eqaZOl/dv3f1S8ACJwDilB5P3CI=;
	b=B4aRirWoJnMIrgugWv4BP/2YZDh1da8Iz1gsuaXvMyLdnzaOCuNgEhT+uaZfpi/eGQ
	c/ZmJpV63qtAbcub2Pl6psPo4Q9K6t5JvcMu74WyUA+9dHOXMQ0DolNAF3YTX3/eCYsX
	mKaWmmcHRIa5D8gtLq9qTV8K5WSDe4963lDsnqQ6iXD1ISVYSfEV/YBOq3jIDPuVjEcl
	IQSilCbW3D1klhHK75aO39xUArP2YSSLAKZwfHjQVYX54jnKLIRAa5dbfjlmr19IQfmL
	4df4mb7X8o649KVVSIC6YbkJoU86hVhuH8+08yvDWoXMRpT9Xy8rMPSOAKLOf4Wdvlm1
	9fjw==
MIME-Version: 1.0
Received: by 10.180.100.230 with SMTP id fb6mr8155319wib.3.1334676812361; Tue,
	17 Apr 2012 08:33:32 -0700 (PDT)
Received: by 10.223.14.149 with HTTP; Tue, 17 Apr 2012 08:33:32 -0700 (PDT)
In-Reply-To: <4F8D8AB7.7000002@opendreambox.org>
References: <4F8D8AB7.7000002@opendreambox.org>
Date: Tue, 17 Apr 2012 17:33:32 +0200
Message-ID: <CAGiJk9eXcHu=jTdK8_3oV-X1He+vsD4Rpoj4WTuWyNq0TiWaTg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: waning "it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd"
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
X-List-Received-Date: Tue, 17 Apr 2012 15:45:27 -0000
Content-Type: text/plain; charset=UTF-8

2012/4/17 Andreas Oberritter <obi@opendreambox.org>:
> Hi,
>
> the following warnings keep appearing on every fresh invocation of
> bitbake since a few months, I think:
>
> WARNING: .../meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
> WARNING: .../meta-oe/recipes-connectivity/gateone/gateone_git.bb: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
> WARNING: .../meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
>
> Is anybody working on fixing them? Is anybody else also seeing them,
> or is this likely caused by some missing variable in my distro conf?
> I am not using systemd.

Hi,
these warnings get created at recipe parsing time regardless of
whether you are using Systemd or not,
so this is not a problem of your distro conf.

Don't know if anyone already has patches for them, but I see the warnings too.

>
> Regards,
> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
Regards
Samuel


