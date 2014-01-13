Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id C03026B5FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 17:01:33 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id i13so1771884qae.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 09:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Iw383yrGBKdzvLwSjj7lHjyznXl2EElvLj3UFo6d4xI=;
	b=jpxqAl4KLY0MsOql2TNWk60VwEUEsHWScA8V0bx6qM3Col3cTU5NkROjWBBqsG+nyT
	kdtjF1NaMwfIl/CS/lk7uMHroQz/UOqDZwtffIH/rWqcja0wQRffNSgH8Xjr22DZZ2xi
	QJUn2pvirj+IWQKgeenxfIWpVpJqPvvj662239BMWiMzdkrdT1UuzTMyEUKWZ/C2fehk
	+LKWAqPIXkCw0jlS5YB4pdVzFlLn6fs5ThJ6ACFSl9A7dwv+X/1KkR3OlGWs9QCf2A1N
	R6pdbqmluED0g2s0xraCFSPCmvdsxNoKK9j699LT6m/ddoBfJlKT09WMvrDpzHq6BGJ4
	K41g==
X-Gm-Message-State: ALoCoQlkwId9WpkBDlTm89MfBNj9fTRfX5qt3DkLb9oBAf+yhhw2w4aIT6frhSZU1aeZrCojFz24
X-Received: by 10.49.98.35 with SMTP id ef3mr41783061qeb.30.1389632494410;
	Mon, 13 Jan 2014 09:01:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Mon, 13 Jan 2014 09:01:14 -0800 (PST)
In-Reply-To: <1d073230c282c6e62cd24b164bc42f383a55544a.1389598673.git.Qi.Chen@windriver.com>
References: <cover.1389598673.git.Qi.Chen@windriver.com>
	<1d073230c282c6e62cd24b164bc42f383a55544a.1389598673.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Jan 2014 17:01:14 +0000
Message-ID: <CAJTo0Lb3ysqtjm-fN5vCqpOONEAUH-N+eeC3a=t+PqG8bOWe1g@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd-compat-units: make run-postinsts.service work correctly on target
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
X-List-Received-Date: Mon, 13 Jan 2014 17:01:34 -0000
Content-Type: text/plain; charset=UTF-8

On 13 January 2014 07:38, Chen Qi <Qi.Chen@windriver.com> wrote:
> +ExecStart=-/etc/rcS.d/S98run-postinsts ; -/etc/rcS.d/S99run-postinsts

Can we just make opkg and run-postinsts write that file using the same number?

Also, that service file needs to move directly into run-postinsts.
There's a start in poky-contrib:ross/postinsts if you want to finish
it off. :)

Ross

