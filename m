Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.13970.1610477852562225830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 10:57:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=igemE+OR;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9233022CE3;
	Tue, 12 Jan 2021 18:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610477851;
	bh=3WCDh6XWPAu7AmvrK+CS9vbSXrpeuufpKCn9LlyzJcI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=igemE+OR/foSuJhDj0uEptoHaArwRYcyF9jaorMXE7YgyB5HyKjCwFmPRGK5V6KWR
	 +2QkPk+kxUJeipnytdPF/j8+7KLdalxVCO+ycujRv9kBrdEZ4SS8xabXIZwPwc9/ID
	 QPVOk7FVer/y37+7BLdanmKYValFe3FDLwMskLGH+A3DN5Np6x3RIF03EbCSf292SO
	 HYCA7QJuRN+4Moen0Vr8jbPXKSCrgQ+BhgEqDA7Wwl1+SMR9IUHkOUZdmL/TTO218t
	 63ClMBWHSUD7EFz+xzCY3VRSvBD1hTECehHRvMe59CCyr+5Gx+4oosKmRiqNirURdv
	 9NxZ2Mip8KrIw==
Subject: Re: [OE-core] [meta-oe][PATCH v5] procps: split ps and sysctl into individual packages
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20201216221622.14171-1-okaya@kernel.org>
 <CAAnfSTubexeYPZeexc5xTnx2sz3BiYUj4un=FmtaucDwPNOZXg@mail.gmail.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <5755d813-6ffd-f23e-06a1-584a3222e797@kernel.org>
Date: Tue, 12 Jan 2021 13:57:30 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAAnfSTubexeYPZeexc5xTnx2sz3BiYUj4un=FmtaucDwPNOZXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/12/2021 9:09 AM, Ross Burton wrote:
> On Wed, 16 Dec 2020 at 22:16, Sinan Kaya <okaya@kernel.org> wrote:
>> Move the ps and sysctl tools into its own package. Useful for
>> size constrained systems that only want the ps and/or sysctl tools.
> Both of these are part of busybox.  If you're in massively size
> constrained systems, why not just use busybox?

That's true. I needed more functionality for these two specific tools.
The rest is all busybox as you suggested.

To be fair, ps in busybox really sucks IMO.
