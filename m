Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 65E286010B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 11:50:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44LP5d1ldVzBp;
	Fri, 15 Mar 2019 12:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1552650613;
	bh=mXnMifPRjS/6MmUFZ+htxszXsZ5E5bnH5z9V0F8iI7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NQKKTQYHN33xiMPHyG9euZkamqko9ctRGVRypbukmIuRTBtnhVCYgr7971nUBM1e/
	NZJiU6L0rKqHEdetRsidh4c1kX5lIVrgtrsfPixjCDL15J/2+C6nRRo8JcIO1oIOrT
	iTuxCxtaHpR1eDw8NXvTnkl1WgMkIVW9CfVgNdmE8lsYpS9tiqkPchZRJNaHQxGzeb
	Gxa3MZPt67VSJezpAm5OV0pU6rA2lBaErigK5jm0Mw4hpMGS72uQ8b5sS00Fhg12hW
	kpvBavkRdrYzb+/emTwsmgUL/c/qbAXOMvmjjBcN8h6OKCEL0RWCW1ywpD1bi73AUE
	GxEMW2ziN7NSdcd7l3RFtuGFbMj9rBoDbmaQeWKdI4fzd0VYxz76O3RYnAdie1yElp
	s0xBS/HM+5JgLoZ4eXIWkQheFsM3Y0uC2CHTUuJNgFQWOnApM2czGM9/67TsJWF+Zv
	vSlQJQZXjIF9Jn9UWTj7NxREebLzl79Q+RmiVvKrnHewb0skMcjIBzOar36PjPxoq/
	tvug5MVLQ10l5c0/gfb6UrJpZwtXtZ64sxrJDK1KcjwiamjZVFkPm/eXMMKXUcaAgx
	UyfCg8MHATc3F2qEpY5FYiBxyKoMaMXFqYLtE9frJRjWIpY60yr83eDDyRVR6oyMEG
	y7kXme727ODWrVsTgk9/5564=
Date: Fri, 15 Mar 2019 13:50:10 +0200
From: Adrian Bunk <bunk@stusta.de>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190315115010.GA29190@localhost>
References: <20190314191924.44162-1-joe.slater@windriver.com>
	<CAJTo0LafGyAEuh8hbQoXNQCR5bJ9YBmMDJV-idGZ0OPMkTGQoQ@mail.gmail.com>
	<20190315104306.GA14180@localhost>
MIME-Version: 1.0
In-Reply-To: <20190315104306.GA14180@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] puzzles: fix uninitialized variable compiler error
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
X-List-Received-Date: Fri, 15 Mar 2019 11:50:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Mar 15, 2019 at 12:43:06PM +0200, Adrian Bunk wrote:
>...
> but when I try to reproduce the problem on amd64 it happens
> only with -Og (due to puzzles upstream building with -Werror).
>...

For the root cause I filed
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=89723

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


