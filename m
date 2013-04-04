Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UNms6-0003m2-W9
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 18:18:47 +0200
Received: by mail-da0-f43.google.com with SMTP id u36so1193760dak.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 09:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=Kf6/m822bRwfD2KnNAfBacsQkUiZ9aQNEgTBZcRgaK4=;
	b=Iqs35Ct5Jrh7egZC0R5BDI0XQkjGmkhVsgdfCoyXpjrqqHhe/UYWbF7MdnG6iHNrvT
	Kmwd06xQt/5Y6yqXLdbZymHPQCrAINRZe2XcsdSY9mdwfRJuRkPfNYsrR93wNr0pVByF
	NXy/EJUyIlNgO7AAV9ymk8QVeOslUMDWkbD8P06VNZTShkOJk27rHjfI5NmOttIJCjhU
	gL7hY/uzoQln6GFmi0GjR/buas4Xtszwrg8If0uLIvSbBjtlq286OTwmQ08W/yGsiTT3
	b73356xAGaLtX+GDDvxjcf1nuo7v8QhY4XYdpjr/uvb6Q4PM5Ggb/uLX4NvycXA31bsF
	YScA==
X-Received: by 10.66.154.33 with SMTP id vl1mr10207707pab.60.1365091289309;
	Thu, 04 Apr 2013 09:01:29 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id gl9sm10026515pbc.44.2013.04.04.09.01.27
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 09:01:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <97BD068FB200C44AA73C2B641F162ECF97E89B@IRSMSX101.ger.corp.intel.com>
Date: Thu, 4 Apr 2013 09:01:26 -0700
Message-Id: <64349FC1-10D1-4105-990B-8439F105FC6A@gmail.com>
References: <1365077355-17673-1-git-send-email-mihai.prica@intel.com>
	<E88E88F5-90AE-4280-AE38-735E593E6DC6@gmail.com>
	<97BD068FB200C44AA73C2B641F162ECF97E89B@IRSMSX101.ger.corp.intel.com>
To: "Prica, Mihai" <mihai.prica@intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] qemu: Enabled SDL when compiling for target architecture
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
X-List-Received-Date: Thu, 04 Apr 2013 16:19:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 4, 2013, at 8:56 AM, "Prica, Mihai" <mihai.prica@intel.com> =
wrote:

> I sent a patch to meta-virtualization that just enabled SDL using a =
bbappend and the
> maintainers said I should to integrate this into poky. I talked with =
Richard and he=20
> said I should use a PACKAGECONFIG and enable sdl by default for the =
target. For=20
> headless images the user can disable it. I sent a V2 with this =
solution. Saul replied=20
> and told me there are some problems with this approach and I should =
stick with the
> SDL variable.

OK so you been diligent. I see this an an image/distro feature. If I =
don't have X in my features
this should not be enabled either. What was problem with PACKAGECONFIG ?=


