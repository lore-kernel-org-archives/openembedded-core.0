Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TyUw1-00040W-Go for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 23:06:14 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0OLsgCd025785; Thu, 24 Jan 2013 21:54:42 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RU+2RlD072Yp; Thu, 24 Jan 2013 21:54:42 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0OLsWSi025777
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 24 Jan 2013 21:54:39 GMT
Message-ID: <1359064215.3616.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jan 2013 21:50:15 +0000
In-Reply-To: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
References: <cover.1359061155.git.raj.khem@gmail.com>
	<2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/11] libpcap: Add missing libusb dependency
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
X-List-Received-Date: Thu, 24 Jan 2013 22:06:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-01-24 at 13:07 -0800, Khem Raj wrote:
> libpcap notices libusb in its configure if its sysrooted
> and ignores it if its not. But this causes problems since
> there is no explicit dependency on libusb. Rebuild from shared
> state sometimes fails when libusb has not been yet populated
> in sysroot and libpcap has. And do_configure of consumers of libpcap e.g. tcpdump
> are probing for features on libpcap. All the tests fail since
> none of link steps succeed and it sees as if libpcap does
> not have required features and configure of tcpdump bails out.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-connectivity/libpcap/libpcap.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Do we need libusb support in libpcap? What does this dependency buy us
and couldn't we force it off instead?

Cheers,

Richard



