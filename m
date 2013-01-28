Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TzoKu-0000WK-9m for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 14:01:29 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0SCo3SD029867; Mon, 28 Jan 2013 12:50:04 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id q-lQaKlhD9jx; Mon, 28 Jan 2013 12:50:03 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0SCnwX9029861
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 28 Jan 2013 12:50:02 GMT
Message-ID: <1359377121.22371.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Garman <scott.a.garman@intel.com>
Date: Mon, 28 Jan 2013 12:45:21 +0000
In-Reply-To: <cover.1359329823.git.scott.a.garman@intel.com>
References: <cover.1359329823.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] denzil pull request
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
X-List-Received-Date: Mon, 28 Jan 2013 13:01:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-01-27 at 15:39 -0800, Scott Garman wrote:
> Hello,
> 
> This is a pull request for denzil. It includes a bitbake fix from
> MatthewM (poky-based tree only) and some Fedora 18 build fixes from
> Koen.
> 
> The following changes since commit 0a9e8bf35afd5990c1b586bba5eb68f643458a4b:
> 
>   build-appliance-image: Bump SRCREV (2013-01-04 22:23:34 +0000)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgarman/denzil-next
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/denzil-next
> 
> Martin Jansa (1):
>   bison: move remove-gets.patch to BASE_SRC_URI, it's needed for
>     bison-native too if host has (e)glibc-2.16
> 
> Nitin A Kamble (1):
>   libtasn1: fix build with automake 1.12
> 
> Saul Wold (2):
>   libtasn1: Update to 2.12
>   libtasn1: Upgrade to 2.13

Merged to denzil, thanks.

Richard



