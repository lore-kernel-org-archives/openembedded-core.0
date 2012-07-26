Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SuUeK-0003bX-3R
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 22:27:08 +0200
Received: by eaaq10 with SMTP id q10so287796eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=AEMcZRakLNStgxxkzWkZmx+hb2BcVxu3uaMH3CUttQg=;
	b=zav2qzkESmsIgC3PnvKfuFdniLdf5qYkQ6ekhp2EZnBImH8A0JkQod0y98Ic7jWAZf
	ZNMwfUwwbFS7vb3t77EQ40VNiPrJkYzBSZWPSLOJHwbvwuhBlSwjAXwheJjwe3/6wa6L
	EfcqVBMpZTSDBpxyrYXl+rOdpjc0zs4DzUU+oBxnalj8mku9CYJ300amOLP8KdtCCACp
	kjY9CkSFpJ4DOAcItYZZfxPvX3WQ/+AmifuhXeaIj0LeY4fmRWIVskeXhDK7AL8uQYWN
	Ktc3G15hiuWVMJwDTVFKNy6s7k5xCpc4+Bppyfzm3Y2/LyX4F0mHQgS3+wJkf5NLquaY
	BUxg==
Received: by 10.14.214.197 with SMTP id c45mr23368eep.37.1343333737003; Thu,
	26 Jul 2012 13:15:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Thu, 26 Jul 2012 13:15:06 -0700 (PDT)
In-Reply-To: <50119750.7080109@linux.intel.com>
References: <cover.1343142062.git.raj.khem@gmail.com>
	<50119750.7080109@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jul 2012 13:15:06 -0700
Message-ID: <CAMKF1sqd-Zuq7iF1Es9Ho2GxKcpGfQGX7=ZQzd9ujcm6EqfFWA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] toolchain bootstrap fixes and kernel.bbclass integration
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
X-List-Received-Date: Thu, 26 Jul 2012 20:27:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 26, 2012 at 12:15 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>> Denis Carikli (1):
>>    kernel.bbclass: fix external module building
>>
> I held back this one as I think there is still some discussion on it.

Discussion is not on review of this patch. Infact discussion was more
about the recently
added feature that casued this issue to start with.


