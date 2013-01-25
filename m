Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TykIZ-0006Az-S8 for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 15:30:32 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0PEIHTf030165; Fri, 25 Jan 2013 14:19:01 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fdTIfzBc24+r; Fri, 25 Jan 2013 14:19:01 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0PEIqhQ030185
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 25 Jan 2013 14:18:55 GMT
Message-ID: <1359123271.13917.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jan 2013 14:14:31 +0000
In-Reply-To: <CAJTo0LbOHCMpEFwCX7i5X1xqEe9FkkssvQUk6beDTLYZwc3gWA@mail.gmail.com>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
	<680bfa5f6dd8d3a3e77a18240caab373f03b8006.1359014474.git.Qi.Chen@windriver.com>
	<CAJTo0LbOHCMpEFwCX7i5X1xqEe9FkkssvQUk6beDTLYZwc3gWA@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/12] initscripts: inherit volatiles to support read-only rootfs
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
X-List-Received-Date: Fri, 25 Jan 2013 14:30:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-01-25 at 13:11 +0000, Burton, Ross wrote:
> On 24 January 2013 08:16,  <Qi.Chen@windriver.com> wrote:
> > +VOLATILE_DIR = "/var/volatile/lib/urandom"
> > +VOLATILE_LINK = "/var/lib/urandom"
> 
> A better solution would be to not attempt to save and restore a seed
> value that is intended to persist across reboots when it's on a tmpfs.
>  Putting the urandom seed into tmpfs is just a waste of time.

I have to wonder why we don't put a union mount tmpfs over /var/lib to
be honest...

or if we don't want to depend on unionfs, a tmpfs over /var/lib...

Cheers,

Richard



