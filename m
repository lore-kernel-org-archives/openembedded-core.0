Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7ACEE6FFFB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:25:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 13 Mar 2016 12:25:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,332,1455004800"; d="scan'208";a="932902274"
Received: from jschew-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.169.99])
	by orsmga002.jf.intel.com with ESMTP; 13 Mar 2016 12:25:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 14 Mar 2016 08:25:19 +1300
Message-ID: <208273178.A9osnfWkmR@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.3-300.fc23.x86_64; KDE/4.14.17; x86_64; ;
	)
In-Reply-To: <56E498E3.8000106@gmail.com>
References: <1457750954-32065-1-git-send-email-twoerner@gmail.com>
	<CAJTo0Lb23TkQYmVBUpTmOpCgtB-odj9MDZzSrAn4ZzyQKaw6gQ@mail.gmail.com>
	<56E498E3.8000106@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory.bbclass: metadata-revs show repo parent
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
X-List-Received-Date: Sun, 13 Mar 2016 19:25:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Trevor,

On Sat, 12 Mar 2016 17:32:03 Trevor Woerner wrote:
> On 03/12/16 16:54, Burton, Ross wrote:
> > On 12 March 2016 at 04:28, Trevor Woerner <twoerner@gmail.com
> > 
> > <mailto:twoerner@gmail.com>> wrote:
> >     openembedded-core/meta =
> >     master:00d3fd571a8d261d065b43f5cf3076a381843984
> >     
> >         meta-openembedded/meta-oe =
> >     
> >     master:a1e135a499998add7575682bf53db5e02e753580
> >     
> >         meta-openembedded/meta-gnome =
> >     
> >     master:a1e135a499998add7575682bf53db5e02e753580
> >     
> >         meta-rpb          =
> >     
> >     master:203903ca6f4e8df09bef6ea3c6e899d07eca8df9
> >     
> >         meta-96boards     =
> >     
> >     master:2be59f0d381b5ec173d7fc24f3ae14aaf47b8649
> >     
> >         meta-qcom         =
> >     
> >     master:32fcda819acb8ec485d9ab05108d554f807bf75d
> >     
> >         meta-browser      =
> >     
> >     master:a3789a4168fcd42f1cdf5b5febe2c779a9467919
> >     
> >         meta-linaro/meta-linaro-toolchain =
> >     
> >     master:367f784b831938dc508b7d472342d2d0d6ed9769
> >     
> >         meta-poky/meta    =
> >     
> >     master:37b61b059031e3c272a929b834e12fd83f46598c
> >     
> >         meta-poky/meta-poky =
> >     
> >     master:37b61b059031e3c272a929b834e12fd83f46598c
> > 
> > Why are you pulling oe-core/meta and poky/meta into the same build
> > considering they're literally the same layer?  You should either drop
> > oe-core/meta or poky/meta from your bblayers.
> 
> Ok, thanks; good point.
>
> > However the output showing the full remote URLs seems a sensible
> > improvement to me.
> 
> My hesitation is whether we want to replace the existing
> buildhistory/metadata-revs with my "improvements" or whether I should
> just create a second file with the updates. I don't want to break
> anyone's process should they have come to rely on that file being as it is.

metadata-revs was intended to be consumed by scripts rather than humans, so 
I'd rather not change its format unless absolutely necessary.

Besides, if you fix the problem with what you've checked out, do you need to 
make the change at all?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

