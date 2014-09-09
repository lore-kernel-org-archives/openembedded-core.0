Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 22FAA6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 11:42:45 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id w7so17099391qcr.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Sep 2014 04:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0ZLFa5oK5GeC6CjquLpR4TV91+SwSYdFs2XR29ym4Kw=;
	b=WoeFA7qsRtIe3MStqdb+h/Fa/OFKErNSRn+2WfYXPDsDvBgARfKTIAS6RHTPVGeBCO
	T+ow/ELP5wbdIDHiuUsqoTcyW6PzhLSXLyTzOAv8tmG2W1vtXB+RP/FqLUWmTyk+ILoq
	Jyfs6TueRr+Gv/UFErePB5RcyJtbLfJk4cd19kKNaV9q6xQHqHanXW7vsXiSQACRj7yI
	43WiafXoHukgLJ/wI/UuJOrm9J6UVbhjiLwmatuqHNgTE5Ogjl2/KwmBavDyl0oVgvqY
	TLm4YxIMt5V4a6Q1hiCgOmrRztcpfVKvHn6wtVMPiqJm7Kxn3bBp1+Wgp9cbV/0tCdqS
	TkpA==
X-Gm-Message-State: ALoCoQnf6iWzXEIgBp7GW6hXNnO2frKiRuhJuClxjOLO6ViHuxFSHLycpuTEFHLZzQ+TS5xIJ5wc
X-Received: by 10.224.79.139 with SMTP id p11mr17042615qak.93.1410262966824;
	Tue, 09 Sep 2014 04:42:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 9 Sep 2014 04:42:26 -0700 (PDT)
In-Reply-To: <cover.1410205901.git.bruce.ashfield@windriver.com>
References: <cover.1410205901.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Sep 2014 12:42:26 +0100
Message-ID: <CAJTo0LaiFxLSrXDkRFKu=hLF0RE6BsOuzpEVQcdturucN=-s7A@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] linux-yocto*: consolidated pull request
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
X-List-Received-Date: Tue, 09 Sep 2014 11:42:46 -0000
Content-Type: text/plain; charset=UTF-8

On 8 September 2014 20:55, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
> I'm on the road for the next three days, but wanted to get this out for
> a preview before being a bit unresponsive, and to let others apply and build
> these if they want.

Just noticed this.  I'll pull these into my mut and see what the
autobuilder makes of them.  If they pass testing and you're away I'll
fix up the patches myself.

Ross

