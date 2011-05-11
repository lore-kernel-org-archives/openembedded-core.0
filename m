Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QKCrp-00080J-Rw
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 19:06:33 +0200
Received: by eye27 with SMTP id 27so209927eye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=2Ti8dPTiN1CIbemcMhgTK8k/7r9k/QMD0BaywrHvigU=;
	b=aej4i+ylE3yT7GZKlcDJNRUuuLGCBVBFswGqnaszr/tmXYbxhDU3EwLUFEidb22LhY
	GaT6FLYs00N9T9zlGu5V+5WCAP4a9r5nJv10YCn+igRyDMBCLDPDx97ZAKHQhQfrJsX6
	zDPnni3GHtCwTFe2Rz9Qf9F6VucocYN3HHZQA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=XGAFMTWYz3K7amvJ41alTyYO/b7AOT7r1OmFt8+r9G3rZBIDyJfzc/Q+2YOoH2I9Pr
	DVHtf4bm97YDAbxQ19IOGwlYrv4WG7cnqHz3TPh2661S0yeCrvYv5oRdbqqHd0CSO3p4
	HEm68gbGwdxoWlycGtVhcM8xHe24EYd1d/NYY=
Received: by 10.14.41.193 with SMTP id h41mr4108461eeb.48.1305133424206; Wed,
	11 May 2011 10:03:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Wed, 11 May 2011 10:03:14 -0700 (PDT)
In-Reply-To: <4DCA6C60.6050203@mlbassoc.com>
References: <4DB99F31.4000308@mlbassoc.com>
	<BANLkTikaf3MHYrnbvHDno3dSv_LhsLyFVg@mail.gmail.com>
	<BANLkTi=G-4UfXNdnJSy7qF3gb0-xLr6+4Q@mail.gmail.com>
	<4DBEAA2C.1020601@mlbassoc.com>
	<9DA5872FEF993D41B7173F58FCF6BE94D88F0101@orsmsx504.amr.corp.intel.com>
	<4DCA6C60.6050203@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 May 2011 10:03:14 -0700
Message-ID: <BANLkTinwdM_FJiNq9d8cQUX5vA-Y4kLFXQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Poky Project <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] GCC 4.6.0 on ARM?
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
X-List-Received-Date: Wed, 11 May 2011 17:06:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2011 at 4:00 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 05/10/2011 09:28 PM, Kamble, Nitin A wrote:
>>
>>
>>> -----Original Message-----
>>> From: poky-bounces@yoctoproject.org [mailto:poky-
>>> bounces@yoctoproject.org] On Behalf Of Gary Thomas
>>> Sent: Monday, May 02, 2011 5:57 AM
>>> To: Khem Raj
>>> Cc: Poky Project; Patches and discussions about the oe-core layer
>>> Subject: Re: [poky] GCC 4.6.0 on ARM?
>>>
>>> On 04/30/2011 04:10 PM, Khem Raj wrote:
>>>>
>>>> On Thu, Apr 28, 2011 at 11:23 AM, Khem Raj<raj.khem@gmail.com>
>>>
>>> wrote:
>>>>>
>>>>> On Thu, Apr 28, 2011 at 10:09 AM, Gary Thomas<gary@mlbassoc.com>
>>>
>>> wrote:
>>>>>>
>>>>>> I got my OMAP target to build with GCC-4.6.0 using the latest
>>>>>> Poky tree after a fresh rebuild. =C2=A0Sadly, the Linux kernel
>>>
>>> (2.6.37.3)
>>>>>>
>>>>>> does not run correctly when built with this compiler. =C2=A0It
>>>>>> fails when enumerating the USB bus :-(
>>>>>>
>>>>>> Are there known issues with the Linux kernel on ARM and GCC-4.6?
>>>>>>
>>>>>
>>>>> There has been fixes on top of 4.6.0 the one we have right now is
>>>
>>> vanilla
>>>>>
>>>>> 4.6.0 release. I plan to add second set of patches but you have to
>>>
>>> dig a bit
>>>>>
>>>>> more to identify the problem
>>>>>
>>>>
>>>> I have some updates for gcc 4.6.0
>>>> they are staged in
>>>>
>>>> http://git.openembedded.org/cgit.cgi/openembedded-core-
>>>
>>> contrib/log/?h=3Dkraj/gcc-4.6
>>>>
>>>> (top 3 patches)
>>>>
>>>> Please test them out and if you are lucky
>>>> your problem might be fixed too.
>>>>
>>>> All, please try these patches and provide any feedback
>>>
>>> I was able to build my kernel (ARM OMAP/3530 based) using this, but
>>> the USB still doesn't work, so no improvement, sorry.
>>
>> Gary,
>> =C2=A0Is the USB breakage is due to gcc 4.6.0 ?
>
> Yes, that's the only change. =C2=A0Building the kernel from the same
> source repository with 4.5.2 (using patches from you and Khem Raj)
> works perfectly.
>

Unless we dig down and narrow the issue its hard to say if its a gcc
issue or a latent problem that
gcc 4.6 brings out.


