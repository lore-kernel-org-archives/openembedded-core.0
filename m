Received: from mail-ie0-f171.google.com ([209.85.223.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tuppc-0008P1-2g
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 20:36:39 +0100
Received: by mail-ie0-f171.google.com with SMTP id 17so5645779iea.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2013 11:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=MX46aArpErj7ugHFtg7+y1d5dWZixFMkkZQgtYqvpzo=;
	b=aP3ED0fSDT3zOWdbtMzlwz9rtzdajHjqU2b1FlMDTXeFaou4l5KdSnb/1bvjwlthQb
	KBwsH7FvbCnqyvsWOTLyBJvA41tKvVNI2Odzp3QVXZQC97GYJxA0M7R/ZZNv0lXtVBRg
	ybxlJ7J1/ctdp3KJ8fKuH92UC7IdFTdO5pivLrELRQgwmmf1cz+R+rPErEnKWkQuZwoT
	woqc7wJMHCMj72gQ/Q1zE6w6i36qD5ZnpFVKPER77Kg9K6HB56lQOIaERsaqLdylfyXM
	zJJqQfphFZ+msKtljKSgolFxQzXmGDrHBTCM5yq7tytF80wBVX8coQSoT8Y1d3NvWKXN
	ukAA==
X-Received: by 10.50.184.199 with SMTP id ew7mr7851214igc.84.1358191268416;
	Mon, 14 Jan 2013 11:21:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.18.169 with HTTP; Mon, 14 Jan 2013 11:20:38 -0800 (PST)
In-Reply-To: <CAMKF1sp07U3FK3X_VDfr_sOGSObZLMHY6Tta-STatLs64ywnhQ@mail.gmail.com>
References: <a199c2dc372f0c5a524685e30d8417f05b3713f9.1357343832.git.raj.khem@gmail.com>
	<5c96537b0319af960a917a7b9decb317bbfd4daa.1357343832.git.raj.khem@gmail.com>
	<50F449AE.3060101@linux.intel.com>
	<CAMKF1sp07U3FK3X_VDfr_sOGSObZLMHY6Tta-STatLs64ywnhQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Jan 2013 11:20:38 -0800
Message-ID: <CAMKF1sraYccCZRZ-wD862mTXP5qLAz94F5vPj2jrKwmSEM0N3w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] cairo: Adds libxext in X11DEPENDS.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2013 19:36:40 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 14, 2013 at 11:14 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jan 14, 2013 at 10:08 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>> This commit message does not fully state what's going on in the change
>> below, as pointed out by Richard, you do not comment on the uclib change at
>> all and what's the CAIRO_NO_MUTEX setting doing?
>>
>> The DEPENDS part is good, we just need to know about the rest of it.
>
> it botched two different patches into 1 which were not meant to be. I
> will untangle it

The changes in there were uclibc specific. Which I havent yet proposed and need
some more work. I have punted that patch from eglibc-2.17 branch since
the needed
patch has already been applied.


