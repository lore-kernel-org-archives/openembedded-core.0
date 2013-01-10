Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TtDEq-0005Dt-T1
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 09:11:53 +0100
Received: from mail-fa0-f71.google.com ([209.85.161.71])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2013 23:56:34 -0800
Received: by mail-fa0-f71.google.com with SMTP id m1so242965fam.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 23:56:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:date:from:to:cc:message-id:in-reply-to
	:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=LdDnMOzYBHVydfAKY1zRUw7AO2q6yyxJ+Fman8HEtPE=;
	b=NX1IVSnzv1ieDudNAeM+8XPRacsF3lCdfYV4vTbYWofi7lumglW3xrracP9lu9F5LF
	xtL/RLF5y5oeVDNw6S2mWul9xIGlQ7iAbsBOU16TrqglSk17bkOuzsQGHQYf/QXOV6xa
	ZFUqVu2DxhRPJNiKMAxXlj8pbIFtgcbtRMlZFYe0mM8uWcXzLAnygLr/41XWelHCjRjr
	Do2Q2Fjv6ie7Mw7Hn3XKpR7xSsRiae4gKMvaZdaEW35T83DQX6DyQrp+KLYZ9BGr2lqS
	fl2nrnH8e18SGmlG1zvOkXoOYeYWWE19V3C/n7OWrdVATZhCX5kiAroA7PM7Lkefj1cA
	kdCA==
X-Received: by 10.194.19.170 with SMTP id g10mr113017374wje.56.1357804592389; 
	Wed, 09 Jan 2013 23:56:32 -0800 (PST)
X-Received: by 10.194.19.170 with SMTP id g10mr113017369wje.56.1357804592276; 
	Wed, 09 Jan 2013 23:56:32 -0800 (PST)
Received: from [192.168.1.7] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l5sm1056629wia.10.2013.01.09.23.56.30
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 09 Jan 2013 23:56:31 -0800 (PST)
Date: Thu, 10 Jan 2013 07:56:30 +0000
From: Ross Burton <ross.burton@intel.com>
To: =?utf-8?Q?Iorga=2C_Cristian?= <cristian.iorga@intel.com>
Message-ID: <7782F5CBD39246A3A6204E6FE729FD71@intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB161DC46C@IRSMSX102.ger.corp.intel.com>
References: <1357751495-28236-1-git-send-email-cristian.iorga@intel.com>
	<CAJTo0LZwxy0E-ODr61YK4T9Qn+jkqqsPeW06vm8O7pmE-cMAfg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB161DC46C@IRSMSX102.ger.corp.intel.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnII7auCZ9DfSmk2BGBazrcWoevUc/KDZnjIqxpXNRZuxJgtEAJPUDRrK2ifCBPTVJ9QpB0xWlYd3p/34Aut8Uhmv/IXpcvAC/TUUCd2bxpAm4TMc1FNano8zDaFnOiKJQBB2sCOAtcADG/gPpZn57cbp7bihH1M6tQPxExIZ1l4XMEew+2A1mAv4LiChpja2jfRJvL
Cc: "=?utf-8?Q?openembedded-core=40lists.openembedded.org?="
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: upgrade to 1.10
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
X-List-Received-Date: Thu, 10 Jan 2013 08:11:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday, 10 January 2013 at 07:15, Iorga, Cristian wrote:
> Well, I have the prior art stand by me.
> The same technique is applied for netbase.
> 
> And, in this specific case, connman should be machine specific.
> Can you please give me more detail?
> 
> The configuration file will have only the interface blacklist enabled in case of a qemu* machine.
netbase is a lot smaller than connman.  With this change you're rebuilding connman per-machine instead of sharing the package between compatible machines, with the only difference being a configuration file.

Ross 




