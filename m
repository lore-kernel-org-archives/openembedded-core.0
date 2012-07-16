Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sqh96-0005um-CO
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 10:59:12 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 16 Jul 2012 01:47:52 -0700
Received: by qcmv28 with SMTP id v28so2865874qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 01:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=unGoVtrIV33HwEw+lQvXGhHtVRJ69RRUvLukoJqjgY0=;
	b=Z/F8OhnEI4ts6TgHt58wLSpDI0SKSqbgC3KVjTPP3sHSzeWDxxbJroD2ORGwOJJ2LJ
	OIA5JSmXuXtTmVFgzclJidhLFxg+vn/+hWFCa3v8PJoIvXc1I9vHXKJzITXXcOuPcXyd
	WIpLOJyQZfvpuSKRXRKyd1SMpUncZEcHxyh/V1t6+WTT2SSoF/0GMC9/2KWcu/ZKvcLs
	osvY0DyEe/H3eLYMEDVu+B9PRmfFD7yoKVoGpQX78IuEzzOheBrUn3Z3pCs6j3Q40nzF
	+da/PbqeXyx2bV5z4kPoNI5WrOa6I4+qi4WTMtUBSBRDHdQQg4xp9jmZzKVn/DdA/AD0
	+vGA==
Received: by 10.224.196.135 with SMTP id eg7mr19518411qab.24.1342428471817;
	Mon, 16 Jul 2012 01:47:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.218.201 with HTTP; Mon, 16 Jul 2012 01:47:31 -0700 (PDT)
In-Reply-To: <29D9FA58-0AB0-4ADF-B67E-0541BC7DA14C@dominion.thruhere.net>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKpJLfsbmfPnjL2zZMddeDXO9sWV4+-ZhHmzESQMFu=woQ@mail.gmail.com>
	<29D9FA58-0AB0-4ADF-B67E-0541BC7DA14C@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Jul 2012 09:47:31 +0100
Message-ID: <CAJTo0Laa4jNytbBv1ozJWE9kf=-4hSE4_gsZN+VA2N5C1MJVeQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlQkXU/AdsvY2GZx2FJSQUTb/8N5zdBwZAh7oKr9SnZcFOBBeu5wLx78/DXKABY6jzq3hz6
Subject: Re: [PATCH] powertop: update to 2.0+git
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2012 08:59:12 -0000
Content-Type: text/plain; charset=UTF-8

On 16 July 2012 07:11, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Please add proper Upstream-Status for the patches; it is nice to have
>> those to track the pending patches.
>
> Isn't that field only used to put in "pending" and then backslap each other on doing such a good job?

Personally I find it incredibly useful to differentiate between
patches that should be going upstream and patches that are OE-specific
for various reasons.

Ross


