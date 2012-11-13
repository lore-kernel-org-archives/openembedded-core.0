Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TYHnI-0002l9-S7
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 15:48:53 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 13 Nov 2012 06:34:57 -0800
Received: by mail-ob0-f197.google.com with SMTP id tb18so23241990obb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 06:34:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=bR9ZYdZCxfiT0EhPyunSCKE/pzQNkemor96dvhnYcxA=;
	b=Z5hLOzNQQxawPLf6O9Keed45HpGmfKg+ntS6livHujIwJ3NMc51Wk1ikh8doXqGikz
	BhqU0BmhFPtTWJgMu+le/UVU63s5EjwnRo0C7coA3CuR9iPMWEVCfUcO4RaLZ86zJssQ
	DAq3FQG/jDdT2dJkrefP19Z5GMY0h9XrP2lcsQNVKCw/G7HALf1V99VwI58kjEPDFIAR
	g7uG7peTTn+sY/Gb/aI4jMRrSeWgoxDZAqHEs+Ob0w0jKjnm+ZiVbAOweRJZLovXDK72
	DaiGcJN25n/mUXP/u3ewRGQOMvgU5l1umTvdyDLUX7ew159TOIHHapga64joUjGkJ97g
	Ffjw==
Received: by 10.50.87.199 with SMTP id ba7mr11295906igb.6.1352817292173;
	Tue, 13 Nov 2012 06:34:52 -0800 (PST)
Received: by 10.50.87.199 with SMTP id ba7mr11295894igb.6.1352817292033; Tue,
	13 Nov 2012 06:34:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.58.197 with HTTP; Tue, 13 Nov 2012 06:34:31 -0800 (PST)
In-Reply-To: <20121113131739.GF3928@jama.jama.net>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
	<69a45cc5b2e02a92be884bf0e7c8d0d5f6092985.1352808309.git.laurentiu.palcu@intel.com>
	<20121113123959.GD3928@jama.jama.net> <50A2431E.5050804@intel.com>
	<20121113131739.GF3928@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Nov 2012 14:34:31 +0000
Message-ID: <CAJTo0LaYOf8FbiXbnFe5d6UzSjnWw6C_jsbG9SKQWRC=BHT6QQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQnq7COqxCwykbQsj+X/uKPWk5dEhZSzolnwUkTTg/G7JWdAYlj1mhUtOsS1u6OotHCEMR9twAn61VuK0dAVlL8kZch1Fzh1jgT8KVSIth2AVjuxPcAPxlJkIhA1v432pBXmBUYz6Zw5dOFVIR8XaEscGIS+y10q2aj/MWzbxN1ZAj0ZF3A5+pAFZ6sztg1VkKzVBEIW
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 07/12] libdrm: upgrade to 2.4.40
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
X-List-Received-Date: Tue, 13 Nov 2012 14:48:53 -0000
Content-Type: text/plain; charset=UTF-8

On 13 November 2012 13:17, Martin Jansa <martin.jansa@gmail.com> wrote:
> If someone had libdrm-drivers 2.4.39 installed on target providing e.g.
> nouveau, then he won't get libdrm-nouveau 2.4.40 installed or
> libdrm-drivers upgraded.

A fairly easy solution would be to generate an empty libdrm-drivers
package in the new packaging that depends on all of the driver
sub-packages.

Ross


