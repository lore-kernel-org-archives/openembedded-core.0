Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0ED0-0000Gv-UO
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 17:38:55 +0100
Received: from mail-ve0-f198.google.com ([209.85.128.198])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 29 Jan 2013 08:22:50 -0800
Received: by mail-ve0-f198.google.com with SMTP id ox1so701949veb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 08:22:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=pC2jWJIEnIU9tdOsATjYjGimog3q4IxAGQb0a+UE/HE=;
	b=bJqtLYuhYJfjAeGHgHZKpM5Ml0ppv2igA/7UnLZFo4w06ldeg7incVLFRZWCRTjfx9
	x9HNSX+Js9lThCFG4F3kjgh6rb8OsCNZ15nGebLKuh15hRBqrLQjzGzLFfYpAkj5O6s+
	NKB9XgVWvFmp75NiwH6dFOA2w4QaQPK4Sx/IOew3weXYrba+Kas3Awq+MNcpWGr2RMSq
	dVmlrQZkqlkh594OK4pro8y0k5yLKm1RMdZ9CEjSpskcVVwzkI8N4KZI2MHdbs9Umz4f
	sXyHwUlAXupagmKsugqpOkInA3kxnxN6rbiqrcVQZk7H6UlKAcInTSiQmeuBBaHU4STk
	QqXA==
X-Received: by 10.220.218.197 with SMTP id hr5mr1630412vcb.8.1359476569593;
	Tue, 29 Jan 2013 08:22:49 -0800 (PST)
X-Received: by 10.220.218.197 with SMTP id hr5mr1630399vcb.8.1359476569524;
	Tue, 29 Jan 2013 08:22:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Tue, 29 Jan 2013 08:22:29 -0800 (PST)
In-Reply-To: <CA+chaQdiGJz0+YkM3omFhCHM1NNzyvM_EZUBX2nHBW2=sDtvrw@mail.gmail.com>
References: <1359473084-592-1-git-send-email-radu.moisan@intel.com>
	<20130129155615.GP16904@jama.palm1.palmone.com>
	<CAJTo0LYSwOTCUJ4kF1LtEDuZyKf7LSs+=51WAWv6Q4rDPN9wCw@mail.gmail.com>
	<CA+chaQdiGJz0+YkM3omFhCHM1NNzyvM_EZUBX2nHBW2=sDtvrw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Jan 2013 16:22:29 +0000
Message-ID: <CAJTo0LbECxpvBjudGSAGDexYo5FYC4UC_WaOqPq58mvmawOe5w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmHzmvkb4YG1hlxXQIQEYPJV0gJ3tUFlLdOdpbXNTQCvTFFZ5bLI7mjFtTl+LCa2kJ7q5jgHaEvmBDLk3qzZArHHWzxopfrlb5MSL2DiMchF0sU3J7E2udUfcJ62NUYXDMcljmeS3okpEgTWOkGoiGYnSH+iaNrDCbESmJtxF3NnzXKycEjepC8UQNYa/ZJ/G8xrK2V
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Remove -systemd postfix
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
X-List-Received-Date: Tue, 29 Jan 2013 16:38:55 -0000
Content-Type: text/plain; charset=UTF-8

On 29 January 2013 16:20, Martin Jansa <martin.jansa@gmail.com> wrote:
> There were in meta-systemd for much longer.

Isn't the upgrade path from meta-systemd already broken?... :/

Ross


