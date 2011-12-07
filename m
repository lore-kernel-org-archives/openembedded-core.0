Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYGnn-0001eR-Lw for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 13:40:47 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7CXx8C012969
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Dec 2011 12:33:59 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11699-03 for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2011 12:33:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7CXpea012963
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Dec 2011 12:33:53 GMT
Message-ID: <1323261242.19363.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 07 Dec 2011 12:34:02 +0000
In-Reply-To: <cover.1323187516.git.otavio@ossystems.com.br>
References: <cover.1323187516.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] Provides a framework and initial modules for initramfs
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
X-List-Received-Date: Wed, 07 Dec 2011 12:40:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-06 at 16:07 +0000, Otavio Salvador wrote:
> This patchset adds a very flexible and powerful initramfs framework
> together with a small set of modules using it. Please refer to each
> commit for the respective documentation.
> 
> The following changes since commit fb642d21111691b9302e16e984aff9d8fb18c431:
> 
>   buildhistory bbclass: avoid absolute paths for files-in-image.txt to avoid diff churn when relocating TMPDIR (2011-12-06 14:40:00 +0000)
> 
> are available in the git repository at:
>   git://github.com/OSSystems/oe-core master
>   https://github.com/OSSystems/oe-core/tree/HEAD
> 
> Otavio Salvador (5):
>   initramfs-base: provides the base for a modular initramfs
>   initramfs-module-debug: add
>   initramfs-module-mdev: add
>   initramfs-module-e2fs: add
>   initramfs-module-udev: add
> 

Rather than add five different recipes for this, could we have one
recipe with five different packages? I'm a little bit sensitive to
parsing speed and whilst its a detail, small details add up :)

Cheers,

Richard




