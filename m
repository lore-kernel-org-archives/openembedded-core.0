Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5fq6-00053X-18
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 18:10:07 +0100
Received: by mail-vc0-f169.google.com with SMTP id n10so918280vcn.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 08:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=mtGMN0tI4oEtpPaOjyLT0SbDPvLmj635T9hHuVGcRDg=;
	b=CJUZEvuzEpEra2Ky8JtyDS6zSiSsJ+JFcZuYILrWo1YnmRMM4MYb/OT40Klb2oyJoR
	j8xe3kGDLX9LWHd4hfyG2CtM/MifKH/85SmuL/wsSzrC7hcesG0jRKoZ6H8d41Z9MODJ
	pmpTYBUk5J/6tGWznSkqOqP2kRKD14vQuMNnMEa3Pzl6uoCbwyGk7KMXvfGrw1vjGisv
	b1muGfDbbwrMViyUeAvUux/zKg/57eejJn9l4XGILQIIW4yQAKaBr1t+2YQvNtnYJ127
	QQkI4o0nIm97BjeLbDfh/k2Rge/02oxWD5OPsPEsdM+arHp5y8ZK0xqT2lHzK8CB117I
	9Lww==
X-Received: by 10.220.108.2 with SMTP id d2mr30463997vcp.60.1360774420450;
	Wed, 13 Feb 2013 08:53:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.221.10.202 with HTTP; Wed, 13 Feb 2013 08:53:20 -0800 (PST)
In-Reply-To: <1360741570-11148-2-git-send-email-raj.khem@gmail.com>
References: <1360741570-11148-1-git-send-email-raj.khem@gmail.com>
	<1360741570-11148-2-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Feb 2013 16:53:20 +0000
Message-ID: <CAJTo0La78u7UYmYgLVmRXww0hBy0AvzqAG5JrUHUjqhOdUWT0g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQlVuhJ52nm6ZeBGDhbg0cVBikA+RnCUzBTX/9EmgUAIks1MPoBknaTiQIycdpl+BQJhonfJ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] systemd.bbclass: Dont use libdir and base_libdir for units
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
X-List-Received-Date: Wed, 13 Feb 2013 17:10:54 -0000
X-List-Received-Date: Wed, 13 Feb 2013 17:10:54 -0000
Content-Type: text/plain; charset=UTF-8

On 13 February 2013 07:46, Khem Raj <raj.khem@gmail.com> wrote:
> +        packages = d.getVar('PACKAGES', True)
> +        if not pkg_systemd in packages:

Should probably do packages.split() here to ensure that we don't match
a substring.

Ross


