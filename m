Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7DDA16B20C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 14:34:57 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id gf12so2130034vcb.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 07:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=cWKWmXHgzH1OIZwE+gdFA3ugrOQsCHrg/rIH12pW6qE=;
	b=hKXQjK22GCTowX2w62BVbEISBaQHPX2dXnGS7/JSEn3HNEMgiABDoDlvpO7eRSAKR+
	dfzVSMPbCFhJtBpujb7fNQt09djQIxh6/bFbe78dpk9/r5zde2NAXIyWSz5zsFgFyiov
	oEJ6Dfn/wc8NAK/dPAYSX50/hlGImbD6HMM5n/PdmxFwW+87uPc4qi0lXQJZAabYeC6a
	moPjI0Wuz2CIQ3lK1fSio01uuLSaT7+iMZyQo5k43KmMD2dspGIAiKGNqoGDYiTidX/2
	px3m7qFRqkRVsF1IAuM88cItDzw0qkQ92LSI89SBxfSCKs01M0YbXqd/SJSV1CBHDczK
	6B6w==
X-Received: by 10.58.181.225 with SMTP id dz1mr25873633vec.95.1375108497955;
	Mon, 29 Jul 2013 07:34:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 29 Jul 2013 07:34:37 -0700 (PDT)
In-Reply-To: <1375085392-12339-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1375085392-12339-1-git-send-email-muhammad_shakeel@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jul 2013 15:34:37 +0100
Message-ID: <CAJTo0Lb5Unw3jW_ytf+Q5hDAwN8AosHdGGxmynuHNHJcCyHwtQ@mail.gmail.com>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
X-Gm-Message-State: ALoCoQniNf/Hojv8RAIkG1QcZZUr3LkCiMJiogbboeA1dw4sdgLh5v7eYKWA/gm/VsVuTW/7GQH+
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] [V2] systemd: Remove init.d dir if systemd unit file is present and sysvinit not a distro feature
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
X-List-Received-Date: Mon, 29 Jul 2013 14:34:57 -0000
Content-Type: text/plain; charset=UTF-8

On 29 July 2013 09:09, Shakeel, Muhammad <muhammad_shakeel@mentor.com> wrote:
> +        # If systemd_unitdir contains anything, delete sysv_initddir
> +        if (os.path.exists(systemd_unitdir) and os.listdir(systemd_unitdir)):
> +            shutil.rmtree(sysv_initddir)

Not sure we need the listdir(), why should the function only delete
the directory if it has contents?  If it doesn't have contents you'll
be packaging an empty directory.

Ross

