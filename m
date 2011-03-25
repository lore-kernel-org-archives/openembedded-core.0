Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q374Q-0007cu-AJ for openembedded-core@lists.openembedded.org;
	Fri, 25 Mar 2011 14:28:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2PDR2cY018865
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2011 13:27:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17996-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2011 13:26:58 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2PDQrVo018853
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2011 13:26:53 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <cover.1300978024.git.richard.purdie@linuxfoundation.org>
References: <cover.1300978024.git.richard.purdie@linuxfoundation.org>
Date: Fri, 25 Mar 2011 13:26:46 +0000
Message-ID: <1301059606.3018.124.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Split IMAGE* variables into a separate class
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
X-List-Received-Date: Fri, 25 Mar 2011 13:28:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-24 at 14:49 +0000, Richard Purdie wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> These patches split the IMAGE* variables out into a separate class
> to improve readabilty. The patch descriptions themselves have the details.
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: rpurdie/imagetypes
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/imagetypes
> 
> Thanks,
>     Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> 
> 
> Richard Purdie (2):
>   bitbake.conf/image.bbclass: Move image type information into
>     image_types.bbclass
>   image_types.bbclass: Drop IMAGE_EXTRA_OPTION in favour of the more
>     standard EXTRA_IMAGECMD

I've merged these to master.

Cheers,

Richard



