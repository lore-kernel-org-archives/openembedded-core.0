Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id C65D86AF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 11:56:20 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id if17so2788072vcb.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 04:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9FuixAvsFPYm7nEZuxB47ipyWcCOan7kPelDu+vTXUg=;
	b=XxguG+nbwOKvQ/7HMWioGEAPfJs+P+qML4DP6ZCLJLz9fPqTTDM4RCIegZnuWjppYr
	6hrFtpqX/YovZj/sFqu8FN1lQiFUa9l8hRKDSrRASIbb+9SEWFqYveXZROYn3m6x/jk0
	TxwpeLW8VKPdMuFMRJfcK/IC03rpWNeYQtrNoR+S4sAjfS3yQ9FzKXp6FqO6+CAxfx9U
	ZLRmwHeMTjeY9sQ+38xZ519LO2Gju7m5b50oyJKJsudrnvtnIjHK6FCU0NnBa69BuQf+
	cIjG4UitFg8whXjJtZskbNUJSHTkr+IkWFJTSm6DlxFLDIIcmf5XuOWkifazIngvoqJZ
	v75Q==
X-Gm-Message-State: ALoCoQlnnQeVRXVdfB8MqNvz5QKDFDWeBJTFw4C9C/iq3ZmqgKlZUfzDPjdpmpB3HsOLHPo7OPoz
X-Received: by 10.58.208.130 with SMTP id me2mr1631812vec.13.1383306982411;
	Fri, 01 Nov 2013 04:56:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 1 Nov 2013 04:56:02 -0700 (PDT)
In-Reply-To: <526FF0A2.6090900@linux.intel.com>
References: <1382610728-7026-1-git-send-email-valentin.popa@intel.com>
	<526FF0A2.6090900@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Nov 2013 11:56:02 +0000
Message-ID: <CAJTo0LY-ndQhOJDwwySUT13-2dz_K7qZMpMqOpmLymQ55MkApQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Mesa: upgrade to 9.2.2
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
X-List-Received-Date: Fri, 01 Nov 2013 11:56:22 -0000
Content-Type: text/plain; charset=UTF-8

On 29 October 2013 17:30, Saul Wold <sgw@linux.intel.com> wrote:
> Also since a resend is needed, please combine the mesa-9.2.2 and mesa
> patches into a single mesa directory.  I will be sending more email about
> this in the next day or so as a clean across the board cleanup.

In the Mesa case there were previously two directories because some
patches were common and some were version-specific.

Ross

