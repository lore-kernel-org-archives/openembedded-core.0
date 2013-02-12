Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U5Oo4-0007RZ-Aa
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 23:58:34 +0100
Received: by mail-ia0-f175.google.com with SMTP id r4so584304iaj.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 14:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=7NRzJvxkmM9+t7i5EK/8DfIyTNrTfYwXoed2Vy8sYFo=;
	b=egz3eOtvF9YZJNQG5uzO1nThnuklMLe9fCUnWTLYR+7PxnSLi8iaYaI0qtkD3soWeX
	tCF3YXFOz2OkmedW0tZCzwkPTkFCe71A+5jh7oTZQhUeAHSW+qGxUPZU3ODYbfx2XPr9
	xAv/9TKA/qkYJpkm9KD3HCo3sV1Q2xSOXL+9XPDFRKtyjuatD7fixWejjQC7+U6Ykof5
	sFIWqNSBqk9K5I8l9Bc1B9p2g8ukGNiqTWxyki1r2AwVXkBkpK5KjIlTrs2JqVPZc99Z
	b9rqsxN03PX5wIaxuzv9miG0fnHV2X37BV+eARPXhOR0nUscAZmBPMmsx2ePVQB3kpf2
	f7pw==
X-Received: by 10.50.161.130 with SMTP id xs2mr6988457igb.34.1360708951653;
	Tue, 12 Feb 2013 14:42:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.13.204 with HTTP; Tue, 12 Feb 2013 14:42:00 -0800 (PST)
In-Reply-To: <CAJTo0LZY8+eo6BHRfh-3536GK5VaEthrtMPYNGV3u03nBgsyJg@mail.gmail.com>
References: <1360657337-7154-1-git-send-email-raj.khem@gmail.com>
	<C7C45274F728429FA76E2C1C47BACCDC@intel.com>
	<CAMKF1srbNA_RLGC06zOC=Y4Av9ZGaL6G+Wk=u05-cCZtuRyMyA@mail.gmail.com>
	<CAJTo0LZY8+eo6BHRfh-3536GK5VaEthrtMPYNGV3u03nBgsyJg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Feb 2013 14:42:00 -0800
Message-ID: <CAMKF1sqDkxTFRKKdWgmnV9k99q2ySsuKyxNJaT6=gogY_hk60Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Add systemd package to PACKAGE var
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
X-List-Received-Date: Tue, 12 Feb 2013 22:58:35 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 12, 2013 at 1:06 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> Yes, throwing an error/warning does make sense, as the alternative
> would be files mysteriously disappearing.  Can you send a patch for
> that?

I have something for test.


