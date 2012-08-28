Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6RTS-00058X-L8
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 21:29:18 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 28 Aug 2012 12:16:50 -0700
Received: by obceq6 with SMTP id eq6so9530187obc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 12:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=dj24W6wZhmNWQOf+Bohiks9APGrRbpGhWN2X+eKM+94=;
	b=FY7YQdEH2SORn3gVJRgOMHftkkOwP2pMmbte+GhVkN+8vxOlSg4Tc5Bv0zOvGyUXFN
	vlBvzPWfsvrsD7h2cZTON1Gd1IvP2p7J8jBLPCSBMkbNIFj5iqlf3c7KzFh4pn5TWHWU
	8gMhFTitX5D3E7fXC0khhAogDSMn6CL2P1+oTWPX+07DlvaXbc06s4IO9drhpLbpS0Z3
	+7/d9OyMN102MQVriMZ8/BkffsiNtEieXo/FwmYygNCxnYKuxRZr0FquGMsPJC/EDpcK
	21AmQbGwFjWYTRrjUkoNyT4J5ag/Vxyg6nOJSP84QyJfyYJqOt0LGSgQtVP2l7USnO0p
	TvCA==
Received: by 10.182.154.70 with SMTP id vm6mr10796711obb.50.1346181410229;
	Tue, 28 Aug 2012 12:16:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 28 Aug 2012 12:16:30 -0700 (PDT)
In-Reply-To: <14807078.5pTOjMOMpo@yow-masselst-d1>
References: <1346178028-2036-1-git-send-email-mark.asselstine@windriver.com>
	<1346179084.4396.6.camel@x121e.pbcl.net>
	<14807078.5pTOjMOMpo@yow-masselst-d1>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Aug 2012 20:16:30 +0100
Message-ID: <CAJTo0LaA16HKH7MDJ1b=CA-+qvqmMEY47ZsrKd9d_W0z8LBMRw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
X-Gm-Message-State: ALoCoQki+ztmRk/+TxqHmk4Oj1DC6eoZA6AlpBiyWgpu2qd0iBntfSW7oRALJWoslhzDfe6BJTHU
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] base-files: provide a mechanism to skip creation of the hostname file
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
X-List-Received-Date: Tue, 28 Aug 2012 19:29:18 -0000
Content-Type: text/plain; charset=UTF-8

On 28 August 2012 19:53, Mark Asselstine <mark.asselstine@windriver.com> wrote:
> hostname.sh doesn't leave much room for priority
>
> ---snip---
> if test -f /etc/hostname
> then
>         hostname -F /etc/hostname
> fi
> ---snip---
>
> looking at this you can see my logic, don't create the /etc/hostname file get
> rid of the overwrite.

But surely this should be running very early in the boot, and a
DHCP-assigned name should be running afterwards?

Ross


