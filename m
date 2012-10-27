Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TS9sn-00064Q-9u
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Oct 2012 19:09:13 +0200
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 27 Oct 2012 09:55:40 -0700
Received: by mail-oa0-f69.google.com with SMTP id j6so11773508oag.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Oct 2012 09:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=3f3KzWjw65IFWdE49MX+Lq2f8NPygPBEcziBoPHCFeM=;
	b=X1IJ41fOCqpnE1P9CxqAPzKvnTagSTrsASAhnE7D7jzURX3OoA215CVRuTynl8BRVJ
	b1TnTB34t6PoCKSFh25apNlWcRXLmg4rPFEV36JII8JYPJEySKD2IamYrpd6ZcU4wZZs
	CXSNJ5iR5UKk39vI7jaqyyVkopClExz5MboqZHtG1zzLAzC9MjAlvUETOtSIIcIiAmkH
	cwNEWTmoDZ4zylsWIUCeEpLAOCf0XUqbRVtowNoNyiArH3ZcHV3XGFdiMCkDSVUp3utO
	lZ//u5X0Cp+L9WDyyTernSxxqkRs4VByl9ENzeVBf8Hf5aU4MVXC+Gn41D+FaJWAgH7k
	uzFQ==
Received: by 10.182.225.5 with SMTP id rg5mr21198138obc.49.1351356938952;
	Sat, 27 Oct 2012 09:55:38 -0700 (PDT)
Received: by 10.182.225.5 with SMTP id rg5mr21198136obc.49.1351356938888; Sat,
	27 Oct 2012 09:55:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Sat, 27 Oct 2012 09:55:18 -0700 (PDT)
In-Reply-To: <508ACC30.30900@linux.intel.com>
References: <1351022257-15219-1-git-send-email-ross.burton@intel.com>
	<508AB9D5.1030902@linux.intel.com>
	<CAJTo0LbDAuE59KdzpYNrjjCwuYMi7Eo8YDCS6FgY=T8KUNkq5w@mail.gmail.com>
	<508ACC30.30900@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 27 Oct 2012 17:55:18 +0100
Message-ID: <CAJTo0Lb9RtOTSUuOxhMqKYqiOCFdhH=F7y22Si7tk2ZE+1Kd1A@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQlP8vOlg5De8ldo9Ar2rdufBIaNf4JccL/+exatAHmutrIsNJP5v4x3aj8rSVNXQl1tcJ3+M7kGi9Udgfsl2xys2P36AfLQDOwJwXkllvtDzl8Ll9SfNIk5ZspEk046TNbfFGQ4cV9ts+Yr9wHkPea6Q7xkA/sJlud9DNgnacKKon1GNNc0DKqb+bRau/UUSK9tXHdP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libxkbcommon: new window system-independent XKB library
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
X-List-Received-Date: Sat, 27 Oct 2012 17:09:13 -0000
Content-Type: text/plain; charset=UTF-8

On 26 October 2012 18:45, Saul Wold <sgw@linux.intel.com> wrote:
> Ok, I am really confused now!  Your right the version'ed one is in master,
> which is this commit, your other commit with the git version is not.
>
> Also, the git version had a change xorg-lib-common.inc also.

Drop the git version, that had a required change to xorg-lib-common
but as the versioned version doesn't use that include the change isn't
required.

Ross


