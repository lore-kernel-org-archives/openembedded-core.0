Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlIvg-0007mE-HK
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 13:39:21 +0100
Received: from mail-ye0-f199.google.com ([209.85.213.199])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 19 Dec 2012 04:24:34 -0800
Received: by mail-ye0-f199.google.com with SMTP id l12so2835495yen.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2012 04:24:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=C2OYrqlNvwB55UMALIsG/PTsyGErJOpVHpt8dOKwPYo=;
	b=poaJ8ZZyibmLgfjS8mKTtoDDQGBPwa+nv405MVIhQ0clTqrpGTU97DsdzYgj+3V0tx
	SmASeTjk3qH8m1hcjCEk7g67fk22dmPpGxr/TAamOCLG+qcKYB/KKBlpluqo4oLC4ao7
	oCvdI3CrPist7ZypvBtyK8lr89FQ0PFOLLEcKog9gUkE2/Ylyx6gDGlrcOr3mNekg/2b
	DLHXzZP8CG01+Hw8NtBjfK7cnxKa3OZQzZAF+DL642ExCm7TQsd73Mvo7deVREUcKdEa
	lrXLTRnVVMrrSyBZXiyNM4McN6uxiJ7agLuLMXZSL3l1GMZasuJkstQRbQ2AOt1wTY76
	bOrw==
X-Received: by 10.220.219.145 with SMTP id hu17mr8283392vcb.52.1355919873294; 
	Wed, 19 Dec 2012 04:24:33 -0800 (PST)
Received: by 10.220.219.145 with SMTP id hu17mr8283377vcb.52.1355919873148;
	Wed, 19 Dec 2012 04:24:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Wed, 19 Dec 2012 04:24:13 -0800 (PST)
In-Reply-To: <50D1B088.3000009@oss.bmw-carit.de>
References: <1355839120-12142-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1355839120-12142-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<CAJTo0LavddUVfHnF2qVGgE9U2Vb7NtbL_B3M5PPtHNV6V6D8qg@mail.gmail.com>
	<50D1B088.3000009@oss.bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Dec 2012 12:24:13 +0000
Message-ID: <CAJTo0La4ou6_1NvgRo0rqHNEDqmAFH29qFbg_N1Wfv8L1uUa=Q@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
X-Gm-Message-State: ALoCoQmRDOJt0nXXNbEDM75JRFP6OtiB3CG1GJJB1BfA5bF4C9YwhmazbCD6gzU3M0PP9KV8zDuZgwKWRfS6zbFHOey0pBYeHMmwkl+Za7qvgxOkCe4SSHmwqdEzmqcMF9GMZyuFqGjQJ/SbQ3vPVq4s24aXWA8XPrl2l3pEuj//uvXlpmL5BIwf140lQflohFWsw56Czbqi
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] easyinstall: class to create and extend the easyinstall.pth file
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
X-List-Received-Date: Wed, 19 Dec 2012 12:39:21 -0000
Content-Type: text/plain; charset=UTF-8

Hi Lukas,

On 19 December 2012 12:18, Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de> wrote:
> From your description I could not find the version of python-mako that uses
> the --s-v-e-m option.
> Where can I find this version of the file? Maybe I was just looking at the
> wrong repository...

The patch isn't in meta-oe yet, it's in the list archives somewhere
but it's also on my branch here:

http://git.openembedded.org/meta-openembedded-contrib/commit/?h=ross/piglit&id=2d6ae0a328c2e3d24e43b2858c70a5f404796d21

Ross


