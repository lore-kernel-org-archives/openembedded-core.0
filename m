Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qmgg3-0003lh-QW
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 08:36:08 +0200
Received: by pzk1 with SMTP id 1so5881402pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 23:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=UBHmKlwI1Oc+ldvANZpFZ39BQ9X/JTK3idINKPFDyMs=;
	b=OO0cOtLmEYft6aoR34hys3gZx5Au3JXi0/nItYdXavr+HPMI2O9wZNuLApIROTBVg1
	0u6DGcNZ7gAwhtnLoCilk5azEafhPcVRjVjxtbkQxa86uCjU+eM0XReRM2UnY70Sg3Dq
	Vp4wPSWZOwbzK8VYXNiHYrQfs5s+FdfNX6CvI=
Received: by 10.68.46.99 with SMTP id u3mr1783217pbm.78.1311921109987;
	Thu, 28 Jul 2011 23:31:49 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v1sm1810026pbg.63.2011.07.28.23.31.48
	(version=SSLv3 cipher=OTHER); Thu, 28 Jul 2011 23:31:49 -0700 (PDT)
Message-ID: <4E3253CD.1040303@gmail.com>
Date: Thu, 28 Jul 2011 23:31:41 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>	<1311769062.30326.322.camel@phil-desktop>	<1311773637.2344.365.camel@rex>
	<4E302051.1010308@windriver.com>	<CA4DDB0D-23FC-449D-B5CF-66C230471794@dominion.thruhere.net>	<4E30256F.7060503@windriver.com>	<1311778665.30326.359.camel@phil-desktop>	<332008BD-527C-4D2C-9C39-848D4CB3E74A@dominion.thruhere.net>
	<1311779288.30326.363.camel@phil-desktop>
In-Reply-To: <1311779288.30326.363.camel@phil-desktop>
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Fri, 29 Jul 2011 06:36:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2011 08:08 AM, Phil Blundell wrote:
> On Wed, 2011-07-27 at 17:01 +0200, Koen Kooi wrote:
>> the s3c6410 is arm1176 which should support T2. Having said that, I'm not  sure if that actually works since T2 was broken in silicon for early cortex a8 revisions.
>
> What makes you think that ARM1176 has T2?  I haven't actually tried
> executing Thumb-2 on one, but my recollection is definitely that it was
> Thumb-1 only.
>

I recollect it was t1 only too.
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



