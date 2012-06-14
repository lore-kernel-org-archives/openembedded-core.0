Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SfHkO-0000W4-3G
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 23:38:32 +0200
Received: by eekd49 with SMTP id d49so728456eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 14:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=KhYJUP2nGjZ4JwTisDwejnu8gdoQyYHuSyetyX9HtUc=;
	b=UaygDKrSzpOvtZRSbAAhuO2XrLTsS3Smg5ylgOA/N4CUVLD8DRdRQFjD5yEWpUMd7S
	BgFZiGBU6QVgNMCDQrPj4G4F+YIZVzhWtMWeMGP3jjGmYbIMsQHsGZrf7Ah1rcYB6deP
	9Y2kC2EKZdgUdI/f4f/pQTIC3UDfufnLmKV2TzxPYQcT4ShZTsExydmLFJs4xfv8rvvs
	tVSCBUsyc5P1JCKXmFaJOwjQbPrDtOvRXjdkD9h8zoVLCNbU0jcjHWXDFa235/cpasAd
	iLbj0RKt6krAGDYLDkN1KAw51xG7d9QaPdrek+g3D5pmbs5wznVr/929Zr+mCcUbkjGQ
	nFWg==
Received: by 10.14.97.70 with SMTP id s46mr877478eef.118.1339709274538; Thu,
	14 Jun 2012 14:27:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Thu, 14 Jun 2012 14:27:24 -0700 (PDT)
In-Reply-To: <CAMZjud22RrKU8cEAPwu+K4Ze2hPVHo-5z17uu3Zj1cJvk6pNnQ@mail.gmail.com>
References: <1339487948-30612-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMKF1so7Y_ccRi_RcfjRzzbska1WRbY7N8w=VuN=aFp-U5oYSw@mail.gmail.com>
	<CAMZjud22RrKU8cEAPwu+K4Ze2hPVHo-5z17uu3Zj1cJvk6pNnQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Jun 2012 14:27:24 -0700
Message-ID: <CAMKF1sqDF9-hGz_H34AP1onxOrbJ5tp2Ds0_SuMfA=bOkL9o6g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] strace: update to 4.7
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
X-List-Received-Date: Thu, 14 Jun 2012 21:38:32 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 14, 2012 at 5:42 AM, Marinescu, Bogdan A
<bogdan.a.marinescu@intel.com> wrote:
> I was able to build strace 4.7 with uclibc succesfully, but I'm unable
> to build an uclibc image (even core-image-minimal) to do an actual
> test due to various compilation errors. Should I keep on trying to
> compile an Yocto image to test strace+uclibc or is the succesful
> compilation step enough?

hmmm, it should be ok I guess. Which image were you trying to build.
btw. only core-image-minimal, core-image-core and core-image-sato,
meta-toolchain work with uclibc others are not tried.


