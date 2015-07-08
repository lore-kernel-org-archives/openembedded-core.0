Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A483B73DA7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 20:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68KBxPQ012040; Wed, 8 Jul 2015 21:11:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KH0OGHAbRveY; Wed,  8 Jul 2015 21:11:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68KBkta012029
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Jul 2015 21:11:57 +0100
Message-ID: <1436386306.9778.18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Wed, 08 Jul 2015 21:11:46 +0100
In-Reply-To: <559D593C.4010600@linux.intel.com>
References: <cover.1436343270.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<f81ba427469fb04550efe6431284a0c0b2c1a546.1436343270.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1436373297.9778.9.camel@linuxfoundation.org>
	<1436373958.2639.44.camel@ranerica-desk01>
	<559D593C.4010600@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: "Fleming, Matt" <matt.fleming@intel.com>, "Neri,
	Ricardo" <ricardo.neri@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/2] ovmf: Recipe taken from luv-yocto repository
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
X-List-Received-Date: Wed, 08 Jul 2015 20:12:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-07-08 at 12:09 -0500, Leonardo Sandoval wrote:
> The new set of patches are failing so I will send a V3! The reason is 
> that the ovmf source code has ^M line endings and the .patch I send does 
> not, so when bitbake is trying to patch, there are patch errors.

You probably need to tell git to preserve the line endings, see
something like
http://stackoverflow.com/questions/1967370/git-replacing-lf-with-crlf
and other info you can find on line endings and git with google.

> On 07/08/2015 11:46 AM, Neri, Ricardo wrote:
> > On Wed, 2015-07-08 at 17:34 +0100, Richard Purdie wrote:
> >> Sorry, I didn't spot this before.
> >>
> >> Does OE-Core have iasl?
> >>
> >> Does this recipe not need iasl-native in the target case too?
> >
> > We also have those recipes in our meta-luv layer.
> >
> 
> What does this mean? Do we need to add it also? It is not under OE-Core 
> but I did not face any error when compiling the ovmf recipe under poky.

Try disabling the meta-luv layer, then run a build. OE-Core should not
depend on meta-luv.

Cheers,

Richard


