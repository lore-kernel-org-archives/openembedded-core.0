Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A4C466D5A4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 08:19:00 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA88Inr4010028; Fri, 8 Nov 2013 08:18:49 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3MT4MxqxgY0B; Fri,  8 Nov 2013 08:18:49 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA88IhdK010024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 8 Nov 2013 08:18:44 GMT
Message-ID: <1383898719.6271.293.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wenzong fan <wenzong.fan@windriver.com>
Date: Fri, 08 Nov 2013 08:18:39 +0000
In-Reply-To: <527C9C6F.4050509@windriver.com>
References: <cover.1383821844.git.wenzong.fan@windriver.com>
	<CAJTo0LZHwv3jbAP_utqA-RUALdE_R7OtpUQnzaWU67qup47fHQ@mail.gmail.com>
	<527C9C6F.4050509@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] udev: ship source files to related dbg package
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
X-List-Received-Date: Fri, 08 Nov 2013 08:19:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-08 at 16:10 +0800, wenzong fan wrote:
> On 11/07/2013 07:12 PM, Burton, Ross wrote:
> > On 7 November 2013 11:03,  <wenzong.fan@windriver.com> wrote:
> >> From: Wenzong Fan <wenzong.fan@windriver.com>
> >>
> >> Just ship these sources to their own dbg packages instead of udev-dbg:
> >>
> >>      libudev* -> libudev-dbg
> >>      gudev*   -> libgudev-dbg
> >>      others   -> udev-dbg
> >
> > Why do this?  Multiple -dbg packages could make sense in a recipe
> > which builds a multi-gigabyte -dbg package (such as webkit) but what's
> > the rationale for doing this in udev?
> 
> Actually I don't know clear about why it needs three -dbg packages, 
> looks they have been there since very early commits of udev. I suspect 
> that udev/libudev/libgudev are independent each other, so they are 
> shipped into different packages (base/-dev/-dbg). This patch only ships 
> their source code to -dbg packages accordingly.

We don't support multiple -dbg packages and this looks like an error.

Cheers,

Richard


