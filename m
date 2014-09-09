Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5DA9E7123A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 13:27:23 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id o8so1186328qcw.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Sep 2014 06:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5ETTt3OzWaMKboSxodnenIRbckV976z0KHZLLeOzSlc=;
	b=Ff+sJJpTjyv5H8cjW/3XM0eH1rvEiAb9QIdSHYkPT+Z7IgxrKm1EhntA2G9G8/hubk
	ahT02feCW0wOezo8vuVWhtejxcAz01RqQvQRyugNEQMqdjgroIbU7nZscCvhRN70s1lI
	Yor3YnR2QDF8+wC06eg39NCigHc6qWVKX/wJzrtNvQ0UNcX02RUF9xodeL6ocU7BVpUF
	R1vAIofzbIfiCwOnWDhOTeUDf3FlV/vvywPhXz9KyzSk2zZHmqqcFqyqTDeVMG8UlkU5
	rZKEMaZSs5NH0DJqXM1G0yhSKVeUR/QovTFmHPbT3dQC9xmEC+YWhklnCGucz1KE4+VO
	62JA==
X-Gm-Message-State: ALoCoQl4QSxK+v6Zn+4S23+EX7BlnSFeXl38F3LYMUPjMWg+lCwNM8gjdc4h66CNh1DPj4w2skxG
X-Received: by 10.229.231.68 with SMTP id jp4mr50672082qcb.4.1410269244330;
	Tue, 09 Sep 2014 06:27:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 9 Sep 2014 06:27:04 -0700 (PDT)
In-Reply-To: <1409830046-28375-1-git-send-email-georgex.l.musat@intel.com>
References: <1409830046-28375-1-git-send-email-georgex.l.musat@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Sep 2014 14:27:04 +0100
Message-ID: <CAJTo0LaKoKTfiL3=S-R2fTRLKZCkPc1=+Jb+Goje-H1byOCvtw@mail.gmail.com>
To: Lucian Musat <georgex.l.musat@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] oeqa: Added package installer to oetest to aid in future automatic install of packages
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
X-List-Received-Date: Tue, 09 Sep 2014 13:27:30 -0000
Content-Type: text/plain; charset=UTF-8

On 4 September 2014 12:27, Lucian Musat <georgex.l.musat@intel.com> wrote:
> +    #TODO: use package_manager.py to install packages on any type of image
> +    def install_packages(self, packagelist):
> +        for package in packagelist:
> +            (status, result) = self.target.run("smart install -y "+package)
> +            if status != 0:
> +                return status
> +

When this function is called on non-rpm images this should cause
explicit errors by throwing exceptions instead of mysterious errors
about smart not found.

Ross

