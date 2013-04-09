Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPcH8-00042F-Ml for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 19:24:12 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39HHSsK004693; Tue, 9 Apr 2013 18:17:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F34fnvORjVQM; Tue,  9 Apr 2013 18:17:35 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39HHRhG004685
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 9 Apr 2013 18:17:30 +0100
Message-ID: <1365527174.12407.89.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 09 Apr 2013 18:06:14 +0100
In-Reply-To: <CAP9ODKq9qBVe2zQrmw_a2nK8ApPDDxZ3BS1y0k+g4GKkvgG90Q@mail.gmail.com>
References: <1365523119-27605-1-git-send-email-alexandru.damian@intel.com>
	<51643CAF.4070407@linux.intel.com>
	<CAP9ODKq9qBVe2zQrmw_a2nK8ApPDDxZ3BS1y0k+g4GKkvgG90Q@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: layer <openembedded-core@lists.openembedded.org>,
	Alex DAMIAN <alexandru.damian@intel.com>, Patches
Subject: Re: [PATCH] udev: changed location of udevd to /sbin/udev/udevd
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
X-List-Received-Date: Tue, 09 Apr 2013 17:24:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-09 at 13:35 -0300, Otavio Salvador wrote:
> On Tue, Apr 9, 2013 at 1:07 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > On 04/09/2013 08:58 AM, Alex DAMIAN wrote:
> >>
> >> From: Alexandru DAMIAN <alexandru.damian@intel.com>
> >>
> >> This ammends the init script after changing the location from
> >> /lib to /sbin.
> >>
> > This only fixes one location and does not make it dynamic, I will have a
> > patch shortly to fix this.
> 
> Your fix does not make it dynamic but staticly set at build time.
> Please iterate over the possible alternatives, as I did in
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-core/initrdscripts?id=1b99640481882d23dc3ded41d9f2aef906f77e67

In the case of udev itself, we don't need to do this since it knows
where it installed the binaries to.

Cheers,

Richard




