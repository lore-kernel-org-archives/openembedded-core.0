Received: from mail-vc0-f172.google.com ([209.85.220.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UNLLu-0003ME-Ml
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 12:55:38 +0200
Received: by mail-vc0-f172.google.com with SMTP id hr11so1338935vcb.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 03:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=coVV2HXqvgeaiKXR0W/kTHLKc9JpTGNJuIFtr9LY1P4=;
	b=Rmw+4n3Qa0ZBZuJDDOFj6yrwHAdab8uT3h+oVnyugRGgzFx7lZClDIQZLqXRCpvuAo
	dLbb0Lj2Aleky3vIKRAJmqBS9yjutmSQQhYpQoQSLl509pZYb7KgRoPtJMokhhRAidCE
	JXDIKAbYvmjJClVIHfdxNfi04P9nTfH00ZcgYibwweaPMIWSQWnntIWPVl6414OSLVAf
	Lhj/PCBov8n1A3/SbYu8eCvgkrj6dpQNSbg0QoOsjV1Z7dGIih9KzXu8hjJCCNORhjey
	+ozOVF//ZRk5B4j/pM9QLMXgSAuJAwH3R7VyNOy918kLhdMs3SSAaIfZgbWX4b18/v+M
	LLWQ==
X-Received: by 10.52.74.102 with SMTP id s6mr640742vdv.28.1364985507277; Wed,
	03 Apr 2013 03:38:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.134.74 with HTTP; Wed, 3 Apr 2013 03:38:07 -0700 (PDT)
In-Reply-To: <be55160b84e74f803f6dce4ba755225538a76651.1364793033.git.Qi.Chen@windriver.com>
References: <cover.1364793033.git.Qi.Chen@windriver.com>
	<be55160b84e74f803f6dce4ba755225538a76651.1364793033.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Apr 2013 11:38:07 +0100
Message-ID: <CAJTo0Lbe4zUsJk5rjoDJYqz3GLGPSA_mhRad5kSPw5qDEnL2gw@mail.gmail.com>
To: Qi.Chen@windriver.com
X-Gm-Message-State: ALoCoQmXs4nQLmXF3WngKFatNQF+eZaye1z9SbfIWg8UN6hfM7Kog8gbtmWsM58YrJnn8qcsYxuw
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] core-image-sato.bb: increase free space size
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
X-List-Received-Date: Wed, 03 Apr 2013 10:55:38 -0000
Content-Type: text/plain; charset=UTF-8

On 2 April 2013 03:30,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Sato images, by default, have about 100M free space. This is not enough
> and it blocks automatic testing.
>
> This patch fixes this problem by overriding the IMAGE_OVERHEAD_FACTOR
> in the sato image recipe.

If a particular build needs more disk space, you can also use
IMAGE_ROOTFS_EXTRA_SPACE in local.conf, i.e.:

IMAGE_ROOTFS_EXTRA_SPACE = "524288"

(that's add 500MB)

Ross


