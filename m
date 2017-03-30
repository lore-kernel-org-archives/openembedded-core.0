Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A81ED77BDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2U8viKS026137; 
	Thu, 30 Mar 2017 09:57:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qjUbaLciQMsE; Thu, 30 Mar 2017 09:57:44 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2U8vds2026133
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Mar 2017 09:57:41 +0100
Message-ID: <1490864259.13980.341.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Christopher Larson
	<kergoth@gmail.com>, Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 30 Mar 2017 09:57:39 +0100
In-Reply-To: <9d94d2771cd34d5fa5f1f3df1ee52ffa@XBOX02.axis.com>
References: <cover.1490717618.git.chris_larson@mentor.com>
	<f619859747304e1ed4ba32488ea416419ede955d.1490717618.git.chris_larson@mentor.com>
	<CAAQYJAvnEY2=jHs6dkjk0aSR74s6+4xYLEQMsp4yVXjngsWQ4g@mail.gmail.com>
	<CABcZAN=vQzdwxd6F=nGBq0TWhOjx8kw0_MZfPpN82V=pbntF5g@mail.gmail.com>
	<9d94d2771cd34d5fa5f1f3df1ee52ffa@XBOX02.axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] update_gio_module_cache: fix host user	contamination
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
X-List-Received-Date: Thu, 30 Mar 2017 08:57:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-29 at 23:54 +0000, Peter Kjellerstedt wrote:
> I have sent a patch to fix this. The interesting part from the log
> was:
>  
> chown: cannot access
> `${WORKDIR}/rootfs/usr/lib/gio/modules/giomodule.cache': No such file
> or directory

Does this fix this or workaround the issue? I think the bigger worry is
why the cache file doesn't exist when the previous command should have
created it?

Cheers,

Richard

