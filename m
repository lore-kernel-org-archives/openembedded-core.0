Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxzFN-0007mB-2g
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 13:16:10 +0100
Received: from mail-qa0-f72.google.com ([209.85.216.72])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 23 Jan 2013 04:00:32 -0800
Received: by mail-qa0-f72.google.com with SMTP id d13so1189367qak.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 04:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=d5tL06HF4BlRvmb4wA0BM67Bp7IMLPMT22ZVMIHK5Hk=;
	b=OWCCSNY/24JYfsZigJ5GtJZKP+DAu25whgOWZG9em1xfT3u9ccJJE7VkjRBJ84E6Yl
	ExynM1isTVBx1rhXdD6068EwtuKkWEik0OTmINqveSKPOk6gxdn1oHBaNdBX9i4Be8FY
	PjY9avyNsCz8rPJh/F2es243CVQTSBjpp7UuznZfrlH2wDHGXaogPtiGKEB24A/QXjI8
	4Io9v9JPuw2M9W/AFOvLqh34XL83O+d3zRjyXVVSFT3mQhWpCKBu4nCFW4Uc9+VY/3h4
	Qb/gaxuD93ITf37m5wggcXm8fYLmHNSU9Q403TrGbyYUZ7K+NUxsEOc8xrBBF2Z6/GVv
	/mSQ==
X-Received: by 10.220.154.201 with SMTP id p9mr918350vcw.35.1358942431076;
	Wed, 23 Jan 2013 04:00:31 -0800 (PST)
X-Received: by 10.220.154.201 with SMTP id p9mr918346vcw.35.1358942430993;
	Wed, 23 Jan 2013 04:00:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Wed, 23 Jan 2013 04:00:10 -0800 (PST)
In-Reply-To: <1358908276-14786-1-git-send-email-Xin.Ouyang@windriver.com>
References: <1358908276-14786-1-git-send-email-Xin.Ouyang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Jan 2013 12:00:10 +0000
Message-ID: <CAJTo0Lbg6OyQ=eWun_fp_01AbX8Ybcf+Cmw+9MKPVk7tLxoZqA@mail.gmail.com>
To: Xin Ouyang <Xin.Ouyang@windriver.com>
X-Gm-Message-State: ALoCoQmhOOfv0uhfhJwqovpuPgFfl3vOtnjjLU0rJv+ydw7NkkPKAhZpdKctpLetsuvVVp2iCxGedwJXGvPhhjdhdf7gowY9rHWocA1hzVnNpVvavxP1Tq8ib2/K0hnmoX64Hejhn1tEoxlFu/b4fUaaPc7NripK3OwJGnLY1/pSx3bjm1g3fClkznECQ0S58h+ERqAYSZhu
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcgroup: fix the QA issue for pam_cgroup.so*
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
X-List-Received-Date: Wed, 23 Jan 2013 12:16:10 -0000
Content-Type: text/plain; charset=UTF-8

On 23 January 2013 02:31, Xin Ouyang <Xin.Ouyang@windriver.com> wrote:
> pam modules in ${base_libdir}/security/ should be binary .so files,
> not symlinks. So fix this QA issue.

The short log should explain the problem more than just "fix QA issue".

The commit log also doesn't say anything about moving libcgroup from
/usr/lib to /lib.  Also isn't just setting --libdir in EXTRA_OEMAKE
cleaner?

Finally, no PR bumps are needed in oe-core.

Ross


