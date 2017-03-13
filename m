Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.phycard.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id BDD6C6E668
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 16:16:32 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id D4B3CA00422;
	Mon, 13 Mar 2017 17:17:00 +0100 (CET)
Received: from [172.16.25.184] ([172.16.25.184])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017031317163192-345607 ;
	Mon, 13 Mar 2017 17:16:31 +0100 
To: ed.bartosh@linux.intel.com, Gary Thomas <gary@mlbassoc.com>
References: <2791e915-9e22-a01a-ccb5-c629d250edb2@phytec.de>
	<20170308105729.GA22401@linux.intel.com>
	<7d4a770f-25c6-5747-5a5c-370c822f2efb@mlbassoc.com>
	<20170308134349.GA16099@linux.intel.com>
From: Daniel Schultz <d.schultz@phytec.de>
Message-ID: <a0d78645-9670-f3a1-cd9d-d66370e89ef9@phytec.de>
Date: Mon, 13 Mar 2017 17:16:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170308134349.GA16099@linux.intel.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 13.03.2017 17:16:31,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 13.03.2017 17:16:32
X-TNEFEvaluated: 1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Create more than one image with WIC
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
X-List-Received-Date: Mon, 13 Mar 2017 16:16:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable



Am 08.03.2017 um 14:43 schrieb Ed Bartosh:
> On Wed, Mar 08, 2017 at 02:41:10PM +0100, Gary Thomas wrote:
>> On 2017-03-08 11:57, Ed Bartosh wrote:
>>> On Wed, Mar 08, 2017 at 10:44:21AM +0100, Daniel Schultz wrote:
>>>> Hi,
>>>>
>>>> I created two kickstart files (am335x-sdimage.wks, am335x-emmc.wks)
>>>> and added them to the local.conf.
>>>>
>>>> When I build the image only the first wks in WKS=5FFILES will be used
>>>> by WIC and the second will be ignored. Is it possible to build two
>>>> images in one build?
>>>>
>>>
>>> I don't think it's possible to build more than one image for the same
>>> type. wic is not an exception here.
>>>
>>>> Includes of the wks files in local.conf:
>>>> WKS=5FFILES=5Fti33x =3D "am335x-sdimage.wks am335x-emmc.wks "
>>>
>>> WKS=5FFILES variable is to provide possible wks files to use. First one=
 found will
>>> be used to produce an image.
>>
>> Would it work to add/define this variable in the corresponding *image*.b=
b recipe
>> rather than local.conf?
>
> Yes, it would if image recipe is unique, i.e. images of the same type
> can be produced for different recipes.
>
But isn't wic different to other images like e.g. ext? I agree that=20
there are other images that need only build once, but wic images can=20
contain these and therefore act as a wrapper.

Do I have misunderstood the design of wic?

I mean MMC and EMMC are very similar, but different in the bootloader=20
and it would be a overhead to create an extra image for all EMMC images.

--=20
Mit freundlichen Gr=FC=DFen,
With best regards,
   Daniel Schultz

> WKS=5FFILES makes sense to set only if there are multiple wks files that
> can be used to produce an image. The most obvious use case is using
> multiple layers with different wks files in each and specifying all of
> them in WKS=5FFILES.
>
> If this is not the case then setting WKS=5FFILE is enough.
>
> --
> Regards,
> Ed
>



