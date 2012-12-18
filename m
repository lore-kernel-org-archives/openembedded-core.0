Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tl00U-00051k-Lc
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 17:27:02 +0100
Received: from mail-qa0-f71.google.com ([209.85.216.71])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 18 Dec 2012 08:12:10 -0800
Received: by mail-qa0-f71.google.com with SMTP id i20so1762219qad.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:12:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=3xx4d8XjipgCn9SxWuouDG/75DGOizHUXOI1Nq3sj4Y=;
	b=bjIY4BntZJqv2yOu6k62y/L+mgqDPgd6k4EHDJP64TvzxUKZ09vXraM+OjC3KcZYsw
	cC3uahYqV2cDjhwrD4bKDUa6kiXd4wj2nMRrAGjSULpdaYV/eSXLQeanzGpaC3Vl4VR/
	9Qy6LZYWOCkEcpg9Q73m+fSRL6fEBCNhcWDDxLj+/M70jSXFWbfTepATTG95IcdlimD8
	TEvDEy0br4aVGTXsq/QFTIun9GiIhI5sujMTj9YsLTwEo+1aIm+1yyl3jKb56eF4jK/o
	6TPzRl8+TX6EEsTKAPK+Qpmuc4Mfq0x3q5/tdsQ4KdnbGiDLqql/D74ZEvCmQgTp0Xyx
	Lmug==
X-Received: by 10.52.75.105 with SMTP id b9mr3408399vdw.28.1355847129512;
	Tue, 18 Dec 2012 08:12:09 -0800 (PST)
Received: by 10.52.75.105 with SMTP id b9mr3408388vdw.28.1355847129377; Tue,
	18 Dec 2012 08:12:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Tue, 18 Dec 2012 08:11:49 -0800 (PST)
In-Reply-To: <1355845633-16899-1-git-send-email-sgw@linux.intel.com>
References: <1355845633-16899-1-git-send-email-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Dec 2012 16:11:49 +0000
Message-ID: <CAJTo0LaCj0EtR519zkt-y6GELWA_kuYSV+OynB935ev-uuXc0g@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmEFB4Gh0D+aNIXwKuWqzR+siFKKLIpQMA7HJFcv4TA/MbYCGczUG7U2y4D3Oo2W6ZjgbbZGI2AM/Z9x55o29FEf/JGU/Hgr669hKpOALeu5Ng1FBAVlYsoUvwSvbMn/YR0781MgqMlbrOH6jSGvDXu/0DlA/cl5pt/BjrE52MaNdjbLrdJCUkzHNo4ABHlQHEnaiAO
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup-toolset-native: should not have mesa-dri-glsl-native in this toolset since there are no providers
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
X-List-Received-Date: Tue, 18 Dec 2012 16:27:02 -0000
Content-Type: text/plain; charset=UTF-8

On 18 December 2012 15:47, Saul Wold <sgw@linux.intel.com> wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>

To clarify for everyone else, mesa-dri-glsl-native is only used by
mesa-dri during the build and isn't useful outside of the build.

Upstream fixes have meant we don't need a -native package anymore, so
it's been dropped in MUT.

Ross


