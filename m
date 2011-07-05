Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.parkin@gmail.com>) id 1Qe1Hz-0002z5-UD
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 10:48:48 +0200
Received: by vxa37 with SMTP id 37so4546685vxa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 01:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iphaKOX6K8KY5hygBzKiTq4Z9VtO/Po50YNCBW3gMZM=;
	b=VQ2E+lZSXM+wl41ev0MYHGx2WMKwhoBwhs8ey4xihghNAbMB/s787LdFDRt0RA1Ifv
	j4EQ9B4samAO3LE2IDw/2AYQiLDZ7AdUnGZBTCDO5qOnokL9NGCH2EN8/7BrJfZZjoTT
	wxt7ETFfIeS7zjs/qYdepAqg0ACkOQIXOoneM=
MIME-Version: 1.0
Received: by 10.220.198.198 with SMTP id ep6mr2700450vcb.29.1309855327956;
	Tue, 05 Jul 2011 01:42:07 -0700 (PDT)
Received: by 10.220.186.140 with HTTP; Tue, 5 Jul 2011 01:42:07 -0700 (PDT)
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6A200B1C937@shsmsx502.ccr.corp.intel.com>
References: <1865303E0DED764181A9D882DEF65FB6A167F0C70B@shsmsx502.ccr.corp.intel.com>
	<4E095480.3070001@windriver.com> <1309266943.20015.290.camel@rex>
	<4E09E8B7.1070901@windriver.com>
	<0C757E680E33864AB113392C7E83F910BE518E@GSX300A.mxchg.m.corp>
	<1865303E0DED764181A9D882DEF65FB6A200B1C937@shsmsx502.ccr.corp.intel.com>
Date: Tue, 5 Jul 2011 09:42:07 +0100
Message-ID: <CACzvQmYM-Tn0xWL9Hc3hyn8EEUeZjbkfTDOYskETJrq7=TB77A@mail.gmail.com>
From: Tom Parkin <tom.parkin@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Hauser, Wolfgang \(external\)" <Wolfgang.Hauser.external@cassidian.com>
Subject: Re: [Draft design][RFC] Running postinst at rootfs generation time
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
X-List-Received-Date: Tue, 05 Jul 2011 08:48:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm interested to read about this initiative as we've recently
stumbled over the issue of postinst scripts in trying to port our
build to OE.

So far it seems the primary concern is about the boot-time impact of
postinst on the target.  But for the use-cases I'm interested in, we
need to capture all install processes as a part of the build in order
to output a fully-provisioned read-only rootfs image (e.g. squashfs).
Our boxes don't typically modify their filesystems at runtime, other
than to take full updates (completely new rootfs images).

I think the reduction, or even elimination, of target-run postinst
scripts would help a lot with the read-only rootfs case.

Tom

On 4 July 2011 01:23, Cui, Dexuan <dexuan.cui@intel.com> wrote:
> Hauser, Wolfgang (external) wrote:
>> Beside the discussed changes, the postinst scripts should be executed
>> in the dependency order.
>> At the time, the scripts are executed in alphabetic order, which
>> breaks the image generation if depended packages are not in
>> alphabetic order.
>>
>> e.g. busybox and busybox subpackages (busybox-mdev).
>>
>> Regards
>> Wolfgang Hauser
>>
>
> Thank all for the suggestions!
> I created a wiki page to summarize the mail threads:
> https://wiki.yoctoproject.org/wiki/Run_postinst_during_rootfs_generation
>
> Thanks,
> -- Dexuan
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Tom Parkin
www.thesecretdogproject.com
Morality, like art, means drawing a line someplace /Wilde/


