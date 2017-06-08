Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7156010B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 06:18:50 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id r63so15705189itc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 23:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=IQ+tTzl8K8NV3DqOhDAfhBvERTaXrH+qFN3ZPM/jIu4=;
	b=mwxQSHvShY3wE8BCFzBxtYpjmMrfyteh4xVDsQyPM3VLmYSuONPQYmDvmaHZO+J35X
	eUrA+jUSFI/45aYjHes4tw48jEHZoC69goWyS8JuzWNVEljhrd2TwT0qtPOkEVJhiZpE
	qf/DoF5FMNeG31AVp3miUVTMpv8biVHjKVJ5FZu2t4ckLOgXWpMVdrzpKj0UzNfpi/S4
	4PoT24MMfjV4MxkNL/Y5gr3eDBQXKib90kgPJsgy9yPrC08hX8dL9rgHFNfZuw32n01g
	gba8L4WYXffFq7mHBFEYvwYPlAIXwIIklZ21+Z1/mRM0HnOWb+j01T1039H+yRJg1NPQ
	WD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=IQ+tTzl8K8NV3DqOhDAfhBvERTaXrH+qFN3ZPM/jIu4=;
	b=WpAxun/FTFflxyWQU6NJsKoNLvT+LR5w/RmKU6Eqb2TX8nFg3+7df1w83bpBgaUOTU
	u2PGTCxS1Oqg+5QaLN8H9vn/Wlm0xXGYC4tO2tj5nmx5PPdDNihpmPQWjOL225Nre+1w
	G8KlnZWV9BOLnVvaTmOqjn7oKeD58WFg4shpMlqEhLdM6p3MgeqKVo0a/TqZQPN4MXvh
	K+9UD7K2oBWYhD5IPUAEKuApZnpNbQahxcFTfluUG2lx/5dBJsEjPisgAlcx6WWGIgmU
	02zmEuoEZT3W0xqpVNpOK8Ig8PPNEuO5MB2S+0vDABAUHSGfVFAsJaxunZ6BYy+CbqDf
	8tKQ==
X-Gm-Message-State: AODbwcBINrb3+ZvDnQjZXgPqcoGZfH6+E52luOUKuee9RHq+hcQAOjY+
	xR1b/BUiu9X6nZPv
X-Received: by 10.36.33.210 with SMTP id e201mr3977893ita.112.1496902731928;
	Wed, 07 Jun 2017 23:18:51 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8CE54.dip0.t-ipconnect.de. [93.232.206.84])
	by smtp.gmail.com with ESMTPSA id
	e72sm2097429itd.29.2017.06.07.23.18.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jun 2017 23:18:50 -0700 (PDT)
Message-ID: <1496902727.30163.125.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Thu, 08 Jun 2017 08:18:47 +0200
In-Reply-To: <2ccad72ffc0b44ad9cf94c67325a2658@XBOX02.axis.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
	<1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
	<1496836331.6630.213.camel@linuxfoundation.org>
	<1496845904.30163.102.camel@intel.com>
	<2ccad72ffc0b44ad9cf94c67325a2658@XBOX02.axis.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 01/25] bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Jun 2017 06:18:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-06-07 at 17:04 +0000, Peter Kjellerstedt wrote:

> I actually suggested an alternative change to bitbake.conf in the GitHub 
> review that changes bitbake.conf to take usrmerge into account:
> 
> https://github.com/avalluri/openembedded-core/commit/1655a93238902a883052a55d88ae14dd02243530
> 
> I will include my suggested solution here since I will refer to it 
> below:
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 0f27e92e96..305eaff583 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -17,11 +17,13 @@ export base_prefix = ""
>  export prefix = "/usr"
>  export exec_prefix = "${prefix}"
>  
> +root_prefix = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${exec_prefix}', '${base_prefix}', d)}"
> +
>  # Base paths
> -export base_bindir = "${base_prefix}/bin"
> -export base_sbindir = "${base_prefix}/sbin"
> -export base_libdir = "${base_prefix}/${baselib}"
> -export nonarch_base_libdir = "${base_prefix}/lib"
> +export base_bindir = "${root_prefix}/bin"
> +export base_sbindir = "${root_prefix}/sbin"
> +export base_libdir = "${root_prefix}/${baselib}"
> +export nonarch_base_libdir = "${root_prefix}/lib"
>  
>  # Architecture independent paths
>  export sysconfdir = "${base_prefix}/etc"
> 
> I think that better maintains the readability of the bitbake.conf file, 
> while making the $root_prefix variable available as it can be useful in 
> its own (e.g., in the systemd recipe).

Looks good to me.

> > One downside is that code using the variables earlier will just see the
> > non-usrmerge version, with no indication in "bitbake -e" that the value
> > might have been different in the middle of parsing. The if check in the
> > proposed patch has the same effect on the actual values, but at least
> > it shows up in "bitbake -e". This is not a particularly strong argument
> > either way, I just wanted to mention it.
> 
> Based on your concerns about when the path variables affected by 
> usrmerge would have what values, maybe my suggested change above 
> should be changed to define root_prefix like this instead:
> 
> root_prefix ?= "${base_prefix}"
> 
> and then we create a usrmerge.inc file with the following contents:
> 
> DISTRO_FEATURES_append = " usrmerge"
> 
> root_prefix = "${exec_prefix}"
> 
> This file should then be required by a layer.conf file so that 
> root_prefix is set before bitbake.conf is read.

That's already a big no-no to me. It would get us back to where merely
adding a layer makes fundamental build configuration changes. Including
it in a distro config would not solve the problem and still be less
flexible than the current approach (user cannot enable or disable the
feature merely via changing DISTRO_FEATURES in local.conf).

So I think we have to and can live with the paths changing during base
configuration parsing.

Perhaps we can move the definitions below the include section? That
would emphasize that they are only final at that point and might flush
out any unwanted evaluation of them during the include phase.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




