Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Stdca-0002Xp-6i
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 13:49:48 +0200
Received: from mail-gg0-f180.google.com ([209.85.161.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 24 Jul 2012 04:38:19 -0700
Received: by ggnf1 with SMTP id f1so5921450ggn.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 04:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=Eex/SqoLPw4er1h8iZsI1GYF/g4N/IbNupol/goQdqo=;
	b=SrsfPtGLnALV3aJi6FqxGEMJjDdOIZMmdqyvBoYsHsqCuOgSC5hcZxZ1zzTYvvOYl3
	Mm+X+Hnvz4USjBcGJgDdZqskNOg8kh6+IRJf72fT6Lxgywez1aDVSrCgNVymPgF33XLZ
	ZgaIzxErJIAlcx2zBAAezn355aMylcH74kiUXrTUzo4EjT0Dc9XHRmhiiB4BlR5676CP
	07k2DVh67ReWD5Pq0Iev4Q1js+qXN0Bt/aMeCMLR0ccJRNc9ExSDHNGxWc+/tjJLRUIY
	+IzwcZSt6VqcElAmW312BVqK2quFwtYhHoLMo6HKoh7PrjDwjoMoxaJ/A8HOq+9s1F9Y
	jYnA==
Received: by 10.60.22.5 with SMTP id z5mr26267468oee.2.1343129898036; Tue, 24
	Jul 2012 04:38:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.33.4 with HTTP; Tue, 24 Jul 2012 04:37:57 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB1617489A@IRSMSX102.ger.corp.intel.com>
References: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
	<1343108218-7108-2-git-send-email-cristian.iorga@intel.com>
	<CAJTo0LbP6AhnPAUjxQ7i8Gjgxjvz-wA2Yv6cFdMb6481xd_wJg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB1617489A@IRSMSX102.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Jul 2012 12:37:57 +0100
Message-ID: <CAJTo0Lbf0wBAa=aBUWY7as2_HHr7OD4tSYCJQG+TtbzAbvimgA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkvXzZOV5fydagaRqmcFaGFpz4J1NflBH3e3geMxKy1Rpq3J2ig9mtaWnlZp0jvoa3KYh5M
Subject: Re: [PATCH 1/5] telepathy-glib: upgrade to ver. 0.19.4
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
X-List-Received-Date: Tue, 24 Jul 2012 11:49:48 -0000
Content-Type: text/plain; charset=UTF-8

Hi Christian,

On 24 July 2012 12:30, Iorga, Cristian <cristian.iorga@intel.com> wrote:
> I am in the process of updating gstreamer, and I have received recommendation to update the entire gstreamer stack to unstable versions, because we are many versions behind while being on the stable branch.
> To be honest, I don't know how to proceed on gstreamer.
> Please advise.

I'd recommend keeping with the stable releases -- 0.10.36 that we
already have.  The 0.11.x series is leading up to a GStreamer 1.0
release which has serious API changes, so isn't a trivial upgrade.

Packaging the 0.11.x releases as gstreamer-1.0 that is parallel
installable with the 0.10 series would be a good idea, but that can
wait until someone asks for it or they make a 1.0 release.

Ross


