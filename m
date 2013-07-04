Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id A042F6AF2A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 15:56:45 +0000 (UTC)
Received: from [192.168.0.2] (host86-137-86-109.range86-137.btcentralplus.com
	[86.137.86.109]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 7FD82952D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 16:56:46 +0100 (BST)
Message-ID: <51D59B3D.8070303@r-finger.com>
Date: Thu, 04 Jul 2013 16:56:45 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1372933905.git.laurentiu.palcu@intel.com>
	<11aefd86a570528092c6f4f5de1371204b1f30ec.1372933905.git.laurentiu.palcu@intel.com>
	<CAJTo0LbxsXLXfHZa91nUuWYBWTLUeqBzrfZENV910io98MnMZQ@mail.gmail.com>
	<51D5971D.3020103@intel.com>
In-Reply-To: <51D5971D.3020103@intel.com>
Subject: Re: [PATCH v2 5/5] shutdown-desktop: give entire path in Exec field
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
X-List-Received-Date: Thu, 04 Jul 2013 15:56:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/07/13 16:39, Laurentiu Palcu wrote:
> On 07/04/2013 05:58 PM, Burton, Ross wrote:
>> On 4 July 2013 11:58, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> Even though the change you're proposing is OK, involves changing the
> desktop file to add the @SBIN@ pattern and move the sed line to
> do_install(). Compared to having one single line added in the
> postinstall... I would choose the latter, unless you elaborate on what
> do you actually mean by "nasty".

Post install scripts should be avoided whenever possible and used only
for things that cannot be done at build or install time. This clearly
can be done at install time, so it should.

Tomas

-- 
http://sleepfive.com

