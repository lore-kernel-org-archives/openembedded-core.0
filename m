Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B3C7B6FF3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 13:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4QDeHcS029577; Thu, 26 May 2016 14:41:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OwgmssAO3j0Y; Thu, 26 May 2016 14:41:18 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4QDfGRK029602
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 26 May 2016 14:41:17 +0100
Message-ID: <1464270076.19134.19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Date: Thu, 26 May 2016 14:41:16 +0100
In-Reply-To: <1464036327-4826-1-git-send-email-otavio@ossystems.com.br>
References: <1464036327-4826-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/3] Improve SSL certificate handling
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
X-List-Received-Date: Thu, 26 May 2016 13:41:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-05-23 at 17:45 -0300, Otavio Salvador wrote:
> This patchset leverage the OpenSSL certificate handling so it works
> aligned with Debian and other generic distributions regarding where
> the certificates are stored and how they are installed.
> 
> This all started when debugging why SSL certificates were not working
> properly for a customer which was using QtWebEngine. It turned out to
> be the integration which was not complete so this patch addresses it.
> 
> 
> Otavio Salvador (3):
>   openssl: Add Shell-Script based c_rehash utility
>   ca-certificates: Use c_rehash utility
>   openssl: Ensure SSL certificates are stored on sysconfdir

Initial tests were ok but we've just seen:

https://autobuilder.yoctoproject.org/main/builders/nightly-oecore/build
s/792/steps/BuildImages/logs/stdio

I've not looked into it but it would seem to implicate these patches :/

Cheers,

Richard

