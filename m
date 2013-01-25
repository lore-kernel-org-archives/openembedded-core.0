Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tyq12-0002VW-Rt
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 21:36:49 +0100
Received: from mail-fa0-f71.google.com ([209.85.161.71])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 25 Jan 2013 12:21:12 -0800
Received: by mail-fa0-f71.google.com with SMTP id m1so877394fam.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 12:21:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:date:from:to:cc:message-id:in-reply-to
	:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=baUBbL7p2Egoyk3BtdK429UsFCXKgd9xkERzCxv3RDI=;
	b=BhDUkH9zImTmEbJhUfs8NwvZf6FisiVNQ9pXJdlQ8bz+xk7qvD1YDJdcT5I5R9351S
	0MIvwoJayO1iOc1ux+b9FlUy79uJeguRR0DzB5UIxTv4Tv3/gcF9r2YUK07CY8JYhuyG
	HpK/IHkYBABWCKN90pwsN90vG87wSVa68R0bdtHDfCr2dzFvhSEg3LvOorJQTH5nE0lj
	PUyDE3EKIDdbdn5ZaVOpJE1rysucbhSMu9s/PYeW+4vct3yJPobhF9Ucc5qQSenl5EKD
	Ze8mA6SKJdx7Z3hS0S201BFVZ8P900D/RbeJ0un31+gct27NmisDiSAKbpZEesRE5v5K
	oV+w==
X-Received: by 10.194.94.37 with SMTP id cz5mr2072799wjb.49.1359145267188;
	Fri, 25 Jan 2013 12:21:07 -0800 (PST)
X-Received: by 10.194.94.37 with SMTP id cz5mr2072789wjb.49.1359145267067;
	Fri, 25 Jan 2013 12:21:07 -0800 (PST)
Received: from [192.168.1.7] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eo10sm3489503wib.9.2013.01.25.12.21.04
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 12:21:05 -0800 (PST)
Date: Fri, 25 Jan 2013 20:21:05 +0000
From: Ross Burton <ross.burton@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <16274FAC3E3E4296A4BB54A6FC9F6300@intel.com>
In-Reply-To: <20130125193456.GE16904@jama.palm1.palmone.com>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<20130125151241.GJ3200@jama>
	<CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
	<CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
	<20130125180634.GC16904@jama.palm1.palmone.com>
	<CALbNGRTUU_jBo4uktmEv+JCKaDnkayRt6oULYX2rUq+ro3aE+g@mail.gmail.com>
	<20130125193456.GE16904@jama.palm1.palmone.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnr1pwlNRAfn/djyn7QHbK8l79vjyHCq5MkpqSBVQh2LLV6lIzHQr7gUqUzVmzIoel2rjfWe7ZtQG2sZ5JGSmPnkhMcDjlehpWWg5+IOBdI3foXM99jssuOok3bj6bJ267lanPt3WygMsAzRmfBNgkAVFLWe1FfC1IfmzFVzi0fmz+GD0hrRQtAP2d17WKK5zFO0IbI
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Fri, 25 Jan 2013 20:36:49 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday, 25 January 2013 at 19:34, Martin Jansa wrote:
> Something like:
> 
> systemd:
> inherit update-alternatives
> ALTERNATIVE_${PN} = "systemd-def-target"
> ALTERNATIVE_TARGET[systemd-def-target] = "${systemd_unitdir}/system/multi-user.target"
> ALTERNATIVE_LINK_NAME[systemd-def-target] = "${systemd_unitdir}/systemd/system/default.target"
> ALTERNATIVE_PRIORITY[systemd-def-target] ?= "1"
> 
> xserver-nodm-init and DMs:
> inherit update-alternatives
> ALTERNATIVE_${PN} = "systemd-def-target"
> ALTERNATIVE_TARGET[systemd-def-target] = "${systemd_unitdir}/system/graphical.target"
> ALTERNATIVE_LINK_NAME[systemd-def-target] = "${systemd_unitdir}/systemd/system/default.target"
> ALTERNATIVE_PRIORITY[systemd-def-target] ?= "10"

Can you make those conditional on the systemd feature so that we don't get complaints from people using something else?

You could use different names and map them to ALTERNATIVE_* inside systemd.bbclass, assuming/enforcing that everyone who wants to set the default target inherits that class I guess.

Ross 




