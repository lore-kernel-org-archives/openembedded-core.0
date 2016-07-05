Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id E3B9060116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 15:12:43 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id u68so14483688qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2016 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LrFZx/A+e03rmjM9l/jlyPzisp/WsCjjB5MpHtFvH4o=;
	b=iaE12aIm8FXpSbW/zEFXa7MBSVHDxBBDm/UCPmT/LW7r4JZXvMwlhtBdGymq1+1O3K
	Pbq0ZOrznyfADwnLTMGil56M9zYNXNbyq80Mg2Vr2VbZb5vAKfym7A3LIRsg5venIIok
	uKlchRUBkhXfgmjQWrfGVyrUgncl9BOmVPv/HlCXYVvgemTvzyVtWaSntJyg+L7B9Agz
	edx/2jGBon79IBhOds8oL43MgpXpjMLWflNidLbYCi9Sqho0LlLZK7lboVEC39Hd9l4m
	Jx8T5S0vrf7/ieQtXj15GQv327rkgYadqdFh2oi3GEoVAyx9qTVaBkTHTRqqb4k3Vn++
	1YqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LrFZx/A+e03rmjM9l/jlyPzisp/WsCjjB5MpHtFvH4o=;
	b=mYzdiXONqkaqca3wiblDD8c8yhVmJNU/H0CfWjADjoAklCAx+fosook6e+lW3rHDzA
	FoA3Rp3hlvw2yQ7GVH6UV4PT28t9JJnBNx+o/V2DNtLfyHJ07o6LhuTjtuDacF2sNIuZ
	0NITstCXQnIxsnf47GTUf3yNHMTQT5Z9mtJsl9fITpnZJxnN3J5H/1CJhB4zt+lBvGea
	LcjezOHek2ZvD5RfuTSH2XPoupIwNtFdHlyB58Pc8qRQgZ6Q+1UXS9mSiCaysIXK1g99
	iplfZnqmDnsABKGWamZGyWBdLwJbTtQDMGJRGEeKc6VMQmOPHZWWt0in41M/vlsL3Kpp
	Khug==
X-Gm-Message-State: ALyK8tIKyRjWMBpZs07pX2RkPS/km98R8PtphZKzqk1ewWhdAUKURnLHMIgkiN7ZG65uguITO2lOSEvS61HqVA==
X-Received: by 10.55.141.134 with SMTP id p128mr22806345qkd.102.1467731564059; 
	Tue, 05 Jul 2016 08:12:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Tue, 5 Jul 2016 08:12:14 -0700 (PDT)
In-Reply-To: <CAJ86T=UTXq=aPkTRV1U+aN71KO3hCyz+fsT45=Mbm8ALZvPmiA@mail.gmail.com>
References: <CAJ86T=XCwABdHj0rXHFsfK9pLndsKGQYv8R2=jOh4tz_9HmeAQ@mail.gmail.com>
	<CAJTo0LZjsiwdv6QB1SdDmyxtTvByjyiend_uSnXFQ_tRi8HwcA@mail.gmail.com>
	<CAJ86T=UTXq=aPkTRV1U+aN71KO3hCyz+fsT45=Mbm8ALZvPmiA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Jul 2016 08:12:14 -0700
Message-ID: <CAMKF1squ8mH9Aq9k1j9PZ=KDPp02DagQtuf9tWrrSqZ6XEMr4A@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Automatically creating tar files for bin_package.bbclass
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
X-List-Received-Date: Tue, 05 Jul 2016 15:12:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 5, 2016 at 1:21 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Jul 4, 2016 at 8:58 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 4 July 2016 at 16:00, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>
>>> Say I have a proprietary library which only I can build from source
>>> and I have a conventional recipe which builds it within OE. I would
>>> now like to create a tar file of the library and headers etc, plus a
>>> companion recipe based on bin_package.bbclass to allow others to make
>>> use of the library in their OE builds. ie the situation described
>>> here:
>>>
>>> http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.html#packaging-externally-produced-binaries
>>>
>>> Is there a recommended way to create the tar file to support that?
>>> e.g. a class which automatically creates a deployable tar file of a
>>> recipe's ${D} directory?
>>
>> You *may* be able to use package_tar in the recipe in some way to achieve
>> this.
>
> It only seems to support creating tar files after packages have been
> split ( ie individual tar files for each subdirectory under
> ${WORKDIR}/packages-split ). I don't think it's going to be directly
> useful for creating a tar file of ${D}.

package_tar is just another packaging format here so you will get
individual package separately
you might want to add another class to package everything into 1 thats
a separate issue, you have
to either add this via a bbclass or additional function
>
>> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

