Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UV2pp-0004fs-VX for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 18:46:23 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3OGTh3o007982; Wed, 24 Apr 2013 17:29:44 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9QPfg_z6nYbM; Wed, 24 Apr 2013 17:29:43 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3OGTbnB007973
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 24 Apr 2013 17:29:39 +0100
Message-ID: <1366820905.23738.153.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Lewis, Nick" <nick.lewis@usa.g4s.com>
Date: Wed, 24 Apr 2013 17:28:25 +0100
In-Reply-To: <AAE0766F5AF36B46BAB7E0EFB927320630E4A540CC@GBTWK10E001.Technology.local>
References: <AAE0766F5AF36B46BAB7E0EFB927320630E4A540CC@GBTWK10E001.Technology.local>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problems with PACKAGE_CLASSES = "package_tar"
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
X-List-Received-Date: Wed, 24 Apr 2013 16:46:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-04-24 at 16:58 +0100, Lewis, Nick wrote:
> I am seeing problems when using PACKAGE_CLASSES = "package_tar"
>  
> There are many warnings about python indents and there are errors
> regarding missing populate_sdk_tar.bbclass and rootfs_tar.bbclass

With 1.3 (danny)? These should be fixed in 1.4 (dyland) and master...

Cheers,

Richard




