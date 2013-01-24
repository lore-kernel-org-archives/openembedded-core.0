Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TyLIU-0007RA-7v
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 12:48:48 +0100
Received: from mail-pb0-f72.google.com ([209.85.160.72])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 24 Jan 2013 03:33:12 -0800
Received: by mail-pb0-f72.google.com with SMTP id wz7so10694311pbc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 03:33:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=PhgvWJXmFStJm/RT/kn6LsUsSysXEsDopxq1bsVQRzM=;
	b=ZjFt4x4IDoFVf4YwwJyONZNr1Dkgxu/32HTRKvIDVl5UaHJopxD8AEMV+GExyMQI3R
	ath0ickL8OXfwggu+iiw/SThGBI3zlFccFbdQmFY5dLY7V4oqsAsMMdOR5KujyKNG4M8
	2CfGW9qIyAP+3mcM9cFZOYyD4Gwxx27uvlMjH/zbUKarI/DJERjwKdsViBm3lrqkfKZz
	twWsixWc8Jjtm7OGCpE5Q5fNW3W32Gdbj+aFr/hpOi5nKWYOiR1NL2wZLDch2DRmEkrG
	EvDiLF/c/xugtEZKpof4UDW76noVYVtxSG5SwE5XEtWWPqiRH9ew+HVemEXvSD+dqFQg
	Wf6w==
X-Received: by 10.69.0.199 with SMTP id ba7mr3760321pbd.165.1359027191724;
	Thu, 24 Jan 2013 03:33:11 -0800 (PST)
X-Received: by 10.69.0.199 with SMTP id ba7mr3760307pbd.165.1359027191610;
	Thu, 24 Jan 2013 03:33:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.66.253.233 with HTTP; Thu, 24 Jan 2013 03:32:51 -0800 (PST)
In-Reply-To: <1359026733-1392-1-git-send-email-Xin.Ouyang@windriver.com>
References: <1359026733-1392-1-git-send-email-Xin.Ouyang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 11:32:51 +0000
Message-ID: <CAJTo0LZ6W0V-8hVGbcoytABhi+++cKwDL4UPL27G9M7F-Nv-CA@mail.gmail.com>
To: Xin Ouyang <Xin.Ouyang@windriver.com>
X-Gm-Message-State: ALoCoQnpXH3UOc2J5mTveEmyaBmcY6Se9PWnG/dGFM434AqAp8yYE4C1vImZIULtz4+OLY4S+SlO6SmcU85iU1/lcMXHe9Ev9I3tf8eRS/rFE2P7b7eAeCiDlIO8SiW2ePzkVX3VYBW6rKA+XUcPgs90QATTgyHIalxLCnS3ZuU2YUqVQpJ3THNnxyiWhQ0q+uGUV9uhuWFv
Cc: openembedded-core@www.linuxtogo.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [V2 PATCH] libcgroup: fix the QA issue for pam_cgroup.so*
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
X-List-Received-Date: Thu, 24 Jan 2013 11:48:48 -0000
X-List-Received-Date: Thu, 24 Jan 2013 11:48:48 -0000
Content-Type: text/plain; charset=UTF-8

On 24 January 2013 11:25, Xin Ouyang <Xin.Ouyang@windriver.com> wrote:
> PAM modules in ${base_libdir}/security/ should be binary .so files,
> not symlinks, so fix this. Since pam_cgroup.so is installed into
> ${base_libdir}/security, move libcgroup.so.* to ${base_libdir} to
> avoid "unsafe-references-in-binaries" QA issue.
>
> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>

Acked-by: Ross Burton <ross.burton@intel.com>

(Why doesn't upstream fix their build...)

Ross


