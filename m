Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SS8Y3-0008BI-WF
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 17:11:28 +0200
Received: by werb13 with SMTP id b13so291755wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 08:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=B497ppdzkWlHAptW3xOAYx6qz4+rJcmaNwEG5VRHzHc=;
	b=T8XHo99slEsvRVME3V7Yo30O8VLVaxO0Edk721Ypm76uq6SOQE80PEoM8TnvHRS9EW
	nOVLafR1t2/EBNSQYFkRCSCn01MUwAZyt1gzQJ58vDKRTLB6J/4rY4MpCqFIr7m4f8pN
	hHOqclpx9epKXHuW/FmoBgFJ5B/RRmeyBuFtSiFhLU4d5qowIqcWjfcKptVkX16byqZn
	KomN/PA1Fuk6c5azh/d4FsSCZZncXazBBiJs3bakzzAQIvdOe+I4wftsTf1IgYOQMTS+
	VgmAAttSIxI/IJkf074lvSmefSatr7X146HPIR09odHek2dXC0L1F3wHiNLkiu1rMbkF
	KBdg==
Received: by 10.180.83.72 with SMTP id o8mr1150144wiy.5.1336575695288;
	Wed, 09 May 2012 08:01:35 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k6sm36894541wiy.7.2012.05.09.08.01.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 08:01:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FAA84B3.1080108@windriver.com>
Date: Wed, 9 May 2012 17:01:33 +0200
Message-Id: <6122E5DC-EFF1-4592-AB36-22E9D68DF2BF@dominion.thruhere.net>
References: <cover.1336547713.git.liezhi.yang@windriver.com>
	<03d9cdca29477f34348a0f97138504441c5804fa.1336547713.git.liezhi.yang@windriver.com>
	<23E51582-C3C4-4673-B646-F29E74FEB428@dominion.thruhere.net>
	<4FAA84B3.1080108@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmKqQUhnzKBWCu2oNIhj2jwYB33QBcA0FchaNEOpPIk5YPmby9/hknUMdc3I352ML8lZQZ3
Subject: Re: [PATCH 2/2] rootfs_rpm.bbclass: don't remove rpmlib when INC_RPM_IMAGE_GEN=1
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
X-List-Received-Date: Wed, 09 May 2012 15:11:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 mei 2012, om 16:52 heeft Mark Hatle het volgende geschreven:

> On 5/9/12 3:50 AM, Koen Kooi wrote:
>>=20
>> Op 9 mei 2012, om 10:20 heeft Robert Yang het volgende geschreven:
>>=20
>>> Don't remove rpmlib when INC_RPM_IMAGE_GEN=3D1, otherwise the
>>> list_installed_packages would get nothing in the second build.
>>=20
>> What happens when I do a build, enable INC_RPM_IMAGE_GEN and do =
another build?
>=20
> The intention is that only the packages that have been =
changed/upgraded will be installed.  Instead of the whole image being =
generated from scratch each time.

That's what INC_RPM_IMAGE_GEN does, yes. What I'm asking is how this =
patch addresses the sequence I outlined above.=


