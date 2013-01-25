Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tym1N-0005gn-Ms
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 17:20:54 +0100
Received: from mail-ye0-f197.google.com ([209.85.213.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 25 Jan 2013 08:05:14 -0800
Received: by mail-ye0-f197.google.com with SMTP id q9so643990yen.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 08:05:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=oYH0ozD6HET5kYcDm5wFEPs9G/xgXUxV2cGvq2ECtGQ=;
	b=MTKojXsQv0qMMxAT+r7Gmb2ciy/dzA4C4LroZeCRLDeM7u+7bQBaiGv39gzYvJgNPQ
	2xCnLxTXPPHNi0cyxadTEliu5oGGZowwqdiWXwLpYIx5RkE3q+ScE1D4qp1CmIUbSYZ6
	CPTzJB/cmte5gTgVbytxAfvcN+gnST/E2ou9XtP0HAs0WnfsGZJN5uF5q+ti1lf6lCIN
	vQc6CP9TLrRVpNRwFUmGoRwaE47yYodDyreEQPeh2+ouQGxutNEQxvD4/QVItkDeyNvl
	ShJnbSfVRhmdsxVye1XUzMWjd7cKyVdWDtYTK6AT45zVrtwm7G/WSuT3XW1Gg7tDBVA8
	Rt1g==
X-Received: by 10.220.209.74 with SMTP id gf10mr6476292vcb.10.1359129909959;
	Fri, 25 Jan 2013 08:05:09 -0800 (PST)
X-Received: by 10.220.209.74 with SMTP id gf10mr6476281vcb.10.1359129909860;
	Fri, 25 Jan 2013 08:05:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.151.207 with HTTP; Fri, 25 Jan 2013 08:04:49 -0800 (PST)
In-Reply-To: <e684d68286657cc9cfce53b0e5b597f79fae1248.1359061155.git.raj.khem@gmail.com>
References: <cover.1359061155.git.raj.khem@gmail.com>
	<e684d68286657cc9cfce53b0e5b597f79fae1248.1359061155.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jan 2013 16:04:49 +0000
Message-ID: <CAJTo0LaDWt3TArVPU9AVEUbrhK6A9FMN+cNU5muSapL4D5wA0g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQltAfmCsqnchLStrQPA5FX6HJxwuaKa6Yq61GJLkdotO8jdLhFOE9shWcvJ6KxSC23XqukGWZsmSJPND/byjhmLZ2vqwtyNf+pMPUG5+R9xxyrY6+7QTW3rmxd7fzlnQyt2Je0ToWEgQTqHQaYCVgrUTwpAPQgroSAToFJ63hkNmIUb85ZIENGsoDZH8xqT3N/HuBwO
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/11] systemd: Upgrade to 197
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
X-List-Received-Date: Fri, 25 Jan 2013 16:20:54 -0000
Content-Type: text/plain; charset=UTF-8

On 24 January 2013 21:07, Khem Raj <raj.khem@gmail.com> wrote:
> LGPL-2.1 licensce is updated to reflect the new FSF address
> Drop patches to disable argparse and dbus-python
>
> analyser has been implemented in C lets use that patch
> and get rid of the python version
>
> disable hostname detection for uclibc bases systems
> since uclibc lacks NSS
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I see that hddimg is still broken though (broken with 196 too), hangs
at "waiting for removable media".  If anyone has any hints as to why
this could be they'll be much appreciated (udev is actually running).

It also renames my laptop's eth0 to enp0s25.  systemd and a static
interfaces file will be fun!

Ross


