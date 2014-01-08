Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 929E06D181
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 15:23:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08FMclR015425; Wed, 8 Jan 2014 15:22:45 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6zuHWVV47GwC; Wed,  8 Jan 2014 15:22:45 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08FMeM6015419
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 8 Jan 2014 15:22:41 GMT
Message-ID: <1389194555.6899.105.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 08 Jan 2014 15:22:35 +0000
In-Reply-To: <CAJTo0LYZ8DG9V+C3_C=uXt+yV2i2OfnSZwQGEhnAHQ7gPsAN=g@mail.gmail.com>
References: <52CD5DCE.5050003@communistcode.co.uk>
	<CAJTo0LYZ8DG9V+C3_C=uXt+yV2i2OfnSZwQGEhnAHQ7gPsAN=g@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: db compile failure
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
X-List-Received-Date: Wed, 08 Jan 2014 15:23:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-08 at 14:21 +0000, Burton, Ross wrote:
> Hi Jack,
> 
> There were some sstate/manifest changes to master before Christmas
> which is why this happens.  You should only get the warning once per
> package as it rebuilds and updates the manifest, or just delete tmp:
> it will be rebuilt from sstate quickly.

The manifest file names changed and cause those spurious warnings. A
clean tmp dir or wiping out the stale (or all) manifest files in
tmp/sstate-control will "fix" that.

Cheers,

Richard




