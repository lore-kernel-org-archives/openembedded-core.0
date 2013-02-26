Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UAQhi-00089s-Om for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 21:00:51 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1QJpU0g031446; Tue, 26 Feb 2013 19:51:30 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XKhiTyXuwj97; Tue, 26 Feb 2013 19:51:29 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1QJpIFO031431
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 26 Feb 2013 19:51:23 GMT
Message-ID: <1361907835.5119.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Feb 2013 11:43:55 -0800
In-Reply-To: <CAJTo0Las-tCaN47Dz8Jn_W-YP6O__0Wqts3EBZDLbqAkv4F7FQ@mail.gmail.com>
References: <1361882216-8152-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKrv9kbMuhMK6OnEGNqNRn0ZHM1R7xZwYAFa=QjivCcigg@mail.gmail.com>
	<CAJTo0LYFL_-YuemRozDYKaGaa1+mKtv8YgHUJdGnnHqPRKzDQA@mail.gmail.com>
	<CAP9ODKrSYh2vxAotVRFmvy+JbP_yexyRqb6hftsR=FOde4AjZQ@mail.gmail.com>
	<CAJTo0Las-tCaN47Dz8Jn_W-YP6O__0Wqts3EBZDLbqAkv4F7FQ@mail.gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Patches, Otavio Salvador <otavio@ossystems.com.br>,
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xkeyboard-config: this is architecture-indepedent, so set PACKAGE_ARCH
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
X-List-Received-Date: Tue, 26 Feb 2013 20:00:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-02-26 at 17:55 +0000, Burton, Ross wrote:
> On 26 February 2013 17:47, Otavio Salvador <otavio@ossystems.com.br> wrote:
> > If it changes the build depending in target and host, in the end it is
> > not architecture independant code.
> 
> I think this is just autotools being nosy and failing when it doesn't
> know what "alllinux" is.  The files don't change as they are literally
> just installed.

Check exactly what is in configure.ac. You should be able to use allarch
and if you can't, it means the configure script is referencing the
compiler, even if it shouldn't be using it. Its designed such that these
accesses fail verbosely. It should be a simple fix if the recipe really
is just configuration.

Using the allarch class is infinitely preferable as it gets the sstate
bits right.

Cheers,

Richard





