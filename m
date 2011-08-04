Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1Qp6ml-0007Ls-Ly
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 00:53:03 +0200
Received: by yxi19 with SMTP id 19so1438901yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 15:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=4YaaHdxfMp1V1mgTxGKFj8dFONnBVRWO1LD6juBrLtM=;
	b=F4qRE3SeigwrTM2F2QBwyZdBPEmHK/hr72oz2Hu8RuLyz2BOiD494xiXowLwpAQWb3
	ZkaET6t7wwJ8fGLt2benB/hd7pVPAd6Qi2KduYXPTxrebH0aDR/tXCsDJ+oTdeJ9lnS5
	wojk3WOafW6Qqy3lMRehYYKouEABax8oyFggA=
MIME-Version: 1.0
Received: by 10.42.29.193 with SMTP id s1mr1145171icc.439.1312498119095; Thu,
	04 Aug 2011 15:48:39 -0700 (PDT)
Received: by 10.42.228.73 with HTTP; Thu, 4 Aug 2011 15:48:39 -0700 (PDT)
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE85F4C1@orsmsx504.amr.corp.intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<03d062a7104f31d03893833485ec3836c07e8f90.1312469790.git.nitin.a.kamble@intel.com>
	<1312494646.3169.2.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F4C1@orsmsx504.amr.corp.intel.com>
Date: Thu, 4 Aug 2011 15:48:39 -0700
Message-ID: <CA+M6bX=xN7Ek_rh4Qu=RxbRJQ5CrSK7qRy=Vh=S7L-OdR4SHyw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/10] glibc: bring back the needed support for glibc recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Aug 2011 22:53:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 4, 2011 at 3:04 PM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Phil Blundell
>> Sent: Thursday, August 04, 2011 2:51 PM
>> To: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH 04/10] glibc: bring back the needed
>> support for glibc recipes
>>
>> On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
>> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
>> >
>> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>>
>> This commit message is very terse. =A0Why is this change necessary?
>
> Because meta-x32 layer has glibc, which needs these support files. I will=
 update the commit message in the tree.

Can x32 not use eglibc?

--=20
Tom


