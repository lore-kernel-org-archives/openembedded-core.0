Received: from mail-ve0-f176.google.com ([209.85.128.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UDdt6-0004HO-7S
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Mar 2013 17:41:49 +0100
Received: by mail-ve0-f176.google.com with SMTP id cz10so512904veb.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2013 08:25:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=YUo6thQmvmES4eNojMkTXrYArXaxDSTAmSrFvvImuEE=;
	b=Tn4Bpo+bJRG/uJBmWKcId0L5HO8kLfS39o4Pkcqj60TE30J9/EPDvMClP12Fmo8AXW
	14CUTmaWwgsT1rVMNtfwWOWOhP2SiQjE/ll/yWct+ykjPhdtmR28wgeIOr2omcxp6mdp
	Lflj/zQDG0+Vn5gelSZ19iGXspzeGnsoKYFoy4PB8nL8TECuzkQvkKndfQHFYPJ5c+NA
	iQzBPf05VQVU0B31qSbBg0MnOLSnNWgIHbBFCkvvszcT8p7Zt9ii2ZU6pTFi6LsWlhCr
	V38YRadVCHLezvUsgCoatKhuKyOloX+CNe0yvehfvyIaDTHOTCbNMCPyGL2s4bcyhRgy
	WyzQ==
X-Received: by 10.52.72.40 with SMTP id a8mr11699260vdv.20.1362673515654; Thu,
	07 Mar 2013 08:25:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Thu, 7 Mar 2013 08:24:54 -0800 (PST)
In-Reply-To: <1362672541-23095-1-git-send-email-olivier.guiter@linux.intel.com>
References: <1362672541-23095-1-git-send-email-olivier.guiter@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Mar 2013 16:24:54 +0000
Message-ID: <CAJTo0LbfS1ghZ3wDcmoAQC-Kvm-J9m2neDa86Ekhj3ckraUZHw@mail.gmail.com>
To: Olivier Guiter <olivier.guiter@linux.intel.com>
X-Gm-Message-State: ALoCoQko4EjLvHCEwn1ak9TABiyTE8eDq+h+fP2PGPlBdNiE9/L9lTTOB9O4eHpG7VnLQe8qhyJw
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] neard: Update reference commit sha1 and script path
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
X-List-Received-Date: Thu, 07 Mar 2013 16:41:49 -0000
Content-Type: text/plain; charset=UTF-8

Hi Olivier,

On 7 March 2013 16:09, Olivier Guiter <olivier.guiter@linux.intel.com> wrote:
> -DAEMON=/usr/sbin/neard
> +DAEMON=/usr/lib/neard/nfc/neard

Instead of doing this, have a neard.in that uses some variable
(@libexecdir@, or whatever path you install to) and replace it with
sed.   A hard-coded path like this will break is someone changes the
file locations in their distro (which plenty of people do).

Ross


