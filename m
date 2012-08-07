Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SyqNd-0000Dl-Qd
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 22:27:53 +0200
Received: by eaad12 with SMTP id d12so4758eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 13:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=wmUFrV9GYpFKFN2iNg9soAIPG4gGhwmQd8R7HMWN9hw=;
	b=mFe1JvDIOXx7Jm+ZK6x4icivHpaJTFiCnhuUmFj7cXtVO4C27+Yam4p75Fq0UyPdCt
	g1XUR4BDxP5+Ohj3FX4x3iOSF/ToNuWTQr08lhh+/VmTb9upCAQTVzLsDbHKNJ8W9Q4U
	hZYktbgPscwgTqVqMhaZ3mOEMIcu/YvYkx9BIkirpT+dK1NMJ6fMahiMkZ517M8cbgCH
	IgiFkiRjteowLTg1F57ZKvJVNky6HHXY3lajHn+TLN/6OheYoQjCtYuNMCSdkZ4lshA2
	LFqCa4zNv+f282ynSrbmCu2dOZLrUWWHjRU7W1iI74oYYfFTE5iXq8o+z7NKl1JK+FlE
	rljw==
Received: by 10.14.203.69 with SMTP id e45mr9581286eeo.23.1344370567828; Tue,
	07 Aug 2012 13:16:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Tue, 7 Aug 2012 13:15:37 -0700 (PDT)
In-Reply-To: <50213F03.1000004@linux.intel.com>
References: <1343697966-29777-1-git-send-email-Martin.Jansa@gmail.com>
	<1343732826.9526.1.camel@ted> <20120731111002.GR3261@jama.jama.net>
	<5019580E.4070906@linux.intel.com> <1344343119.9756.248.camel@ted>
	<50213F03.1000004@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Aug 2012 13:15:37 -0700
Message-ID: <CAMKF1sosOY9Usa+MkWByQM51urYFUKLAqH-UE7y-J2tHfHSi=w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [RFC] gdb-cross: add pythonnative
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
X-List-Received-Date: Tue, 07 Aug 2012 20:27:53 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 7, 2012 at 9:14 AM, Darren Hart <dvhart@linux.intel.com> wrote:
>
>> I fixed this properly by disabling python in gdb-cross.

I think having python support would be desirable no ?


