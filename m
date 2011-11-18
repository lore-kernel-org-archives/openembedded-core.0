Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RRPBx-0001wM-Vu
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 15:13:22 +0100
Received: by ggnh4 with SMTP id h4so2525494ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 06:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=UXrTNqFOU2f2+oRA7gfM4/OU5dRZ4lIOO9FLSQqwYbA=;
	b=HR3hH/w43hb5yNMCPs3NKOUB634Plew4SVhRqKiqfAMxKlu8kYbKoqjG95XUsLvCqa
	eqfPDVqso+0Cgf5KZbi3hLPH9zO+xE8Z6H1oEJ+YJ/7Lm/0yP2P3BQdxEPE0TUZo1N24
	jiTXbvehtuxqVqK+QbSzcIfs6Wy7mf5XSJDUs=
MIME-Version: 1.0
Received: by 10.236.154.166 with SMTP id h26mr4957884yhk.88.1321625215345;
	Fri, 18 Nov 2011 06:06:55 -0800 (PST)
Received: by 10.150.229.21 with HTTP; Fri, 18 Nov 2011 06:06:55 -0800 (PST)
In-Reply-To: <4EC66414.7010708@gmail.com>
References: <cover.1320429060.git.paul.eggleton@linux.intel.com>
	<E2FAFDF6-ABD2-4242-8BAC-8124ED2B1013@dominion.thruhere.net>
	<4EC22317.1090109@gmail.com> <4407672.GTMaySf1kg@helios>
	<4EC66414.7010708@gmail.com>
Date: Fri, 18 Nov 2011 15:06:55 +0100
Message-ID: <CAAQYJAtCPAAwkEdo0kgkZR415aPQWqiXSOY8woMGC3nTHwEncQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] core-image-minimal-initramfs: force IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 18 Nov 2011 14:13:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 18, 2011 at 2:56 PM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> On 11/18/2011 05:55 PM, Paul Eggleton wrote:
>>
>> On Tuesday 15 November 2011 12:30:15 Dmitry Eremin-Solenikov wrote:
>>>
>>> This was merged as IMAGE_FSTYPES =+ "cpio.gz"
>>> Now this brings problems if I have IMAGE_FSTYPES += "live" in my
>>> local.conf / BSP machine.conf.
>>>
>>> 1) OE tries to generate hddimg for this initramfs image, which is
>>> strange idea
>>> 2) If OE is trying to generate bootimg (hddimg) when the kernel is not
>>> yet deployed, building fails (as bootimg can't find a deployed kernel to
>>> put into hddimg).
>>>
>>> Please revert this back to original patch as proposed by Paul.
>>
>> OK, so what are we going to do about this? Do we have to do some filtering
>> of
>> this variable?
>
> I'd propose to just set it via:
>
> IMAGE_FSTYPES = "cpio.gz". It is really no point in generating other types
> of inititramfs images.

In some other initramfs-images "cpio.lzma" is a welcomed option to save size.

Regards

Andrea

>
>>
>> Cheers,
>> Paul
>>
>
>
> --
> With best wishes
> Dmitry
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


