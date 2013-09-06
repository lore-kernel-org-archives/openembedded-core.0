Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B3E286186E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 22:11:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r86MO6Ct007033; Fri, 6 Sep 2013 23:24:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id x7ttu2a9Y_G0; Fri,  6 Sep 2013 23:24:06 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r86MNx1m007029
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 6 Sep 2013 23:24:00 +0100
Message-ID: <1378505435.3484.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 06 Sep 2013 23:10:35 +0100
In-Reply-To: <522A2705.2020906@linux.intel.com>
References: <1378398301-15303-1-git-send-email-valentin.popa@intel.com>
	<522A2705.2020906@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "dvhart@linux.intel.com" <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH_V4] image types: split live into iso and hddimg
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
X-List-Received-Date: Fri, 06 Sep 2013 22:11:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-06 at 12:03 -0700, Saul Wold wrote:
> On 09/05/2013 09:25 AM, Valentin Popa wrote:
> > Changes to split live into iso and hddimg without
> > adding a new image type class.
> >
> > [YOCTO #3197]
> > ---
> >   meta/classes/image.bbclass              | 11 ++++++++++-
> >   meta/classes/image_types.bbclass        | 11 +++++++----
> >   meta/conf/machine/include/ia32-base.inc |  2 +-
> This is one place, but I genericx86* use live also, although I am 
> talking with Darren about merging his changes to meta-yocto-bsp with 
> this some how, so I am going to hold this patch until we work that part out.

This is likely what triggered the minnow failures on the autobuilder
too.

Cheers,

Richard


