Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8F0A077972
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 11:01:48 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6VB0opH005497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 31 Jul 2017 12:00:52 +0100
Message-ID: <1501498850.18633.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	rpjday@crashcourse.ca, openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 12:00:50 +0100
In-Reply-To: <ca8a860d-0894-e604-6108-359ccd094e72@linux.intel.com>
References: <20170731064114.Horde.DvVIF0q0YvJ5HlL1pcjzGe4@crashcourse.ca>
	<ca8a860d-0894-e604-6108-359ccd094e72@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 31 Jul 2017 12:00:52 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: worth adding a "git"-versioned of i2c-tools to oe-core?
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
X-List-Received-Date: Mon, 31 Jul 2017 11:01:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-07-31 at 13:41 +0300, Alexander Kanavin wrote:
> On 07/31/2017 01:41 PM, rpjday@crashcourse.ca wrote:
> > 
> > 
> >    given that some significant changes have been made to i2c-tools
> > since
> > version 3.1.2, is it worth adding a git-versioned recipe of that
> > to 
> > oe-core,
> > and using DEFAULT_PREFERENCE to force people to select it if they
> > want it?
> > in particular, the code base has been restructured, and a new
> > utility,
> > "i2ctransfer", has been added.
> It's better to ask the upstream to make a new release.
> 
> We've had dual git/release recipes in the past, and they were all an 
> utter failure. In the sense, that only one version of the recipe was 
> maintained, and the other was completely neglected.

Going forward we may accept patches using this instead:

http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/classes/devupstream.bbclass

Cheers,

Richard



