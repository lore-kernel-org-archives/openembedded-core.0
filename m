Received: from mail-ve0-f177.google.com ([209.85.128.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAOoR-0001xc-W1
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 18:59:47 +0100
Received: by mail-ve0-f177.google.com with SMTP id m1so3895761ves.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 09:43:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=UudSIg/Y3QMC3Rr9uzv8O/SrJZYHNqlfQLUSAcGp3zc=;
	b=O+S44UA6kUTLMOE6CP5sBhh6u1vxkfiZXMIntVL9STiw9ToznFWqS6Xe6d91c9QoQX
	cq4gcal7j9Z+QvUnT453zdqVtvrRtmLUNcNiTHpIoA8fVY8kWSlCHgt1mVC2HnhGhYGx
	t9qeOjjmPEcatmIvtuxMLjzZ1VEhM+vyAyc/17LKdPI6Gln7qi2tux4gViAdZNaZeqaJ
	xboETSiPKQDtEbNLOFJSe+w37cPQZJPi8vTnzqqUGTSD4t934uAKoxoveQOJap3paekF
	tSuBc0mXdwxKYLpvU53awR0RoK8rCzuL84ffEiYL2IrDm60dvpd8mE4ZRbwIUViWy9aw
	ehnA==
X-Received: by 10.59.4.101 with SMTP id cd5mr3015914ved.14.1361900594300; Tue,
	26 Feb 2013 09:43:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Tue, 26 Feb 2013 09:42:54 -0800 (PST)
In-Reply-To: <CAP9ODKpR_ik-8F3d2-RwXDY=2Odn_uRVEwegZADSd38TCWmJ+w@mail.gmail.com>
References: <1361900109-21869-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKpR_ik-8F3d2-RwXDY=2Odn_uRVEwegZADSd38TCWmJ+w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Feb 2013 17:42:54 +0000
Message-ID: <CAJTo0LY6GsxYVLd24W0ZHZ7=CN9T9zcJjA=JotJb5r+vUrmDBQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQnMfPpjfV6MlwpNrgS71KHFnAFPOEv8WsdUZJu4bH2zgywPZw/T4RMkXNvWAJV1ycZRcMrY
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: set the location of the kill binary
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
X-List-Received-Date: Tue, 26 Feb 2013 17:59:50 -0000
X-List-Received-Date: Tue, 26 Feb 2013 17:59:50 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2013 17:41, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> +export ac_cv_path_KILL="/bin/kill"
>
> This can be given in EXTRA_OECONF IIRC. Did you try it?

That would also work, yes.  Is that the preferred style?

Ross


