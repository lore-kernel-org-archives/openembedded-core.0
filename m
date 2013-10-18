Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f45.google.com (mail-vb0-f45.google.com
	[209.85.212.45])
	by mail.openembedded.org (Postfix) with ESMTP id 11BEC6CD55
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 11:17:41 +0000 (UTC)
Received: by mail-vb0-f45.google.com with SMTP id e15so1731446vbg.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 04:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tIOwtsZQ7sbwKAcGB298onP1IPJ0kDcL1DVq2bpWStE=;
	b=WQCzdycXEGe33E2eIY3oJbDbXZZGGxpEr3CRoP4KZhQOmLTnPUq5lR34gqWLYVPvGL
	9n/HIauhG1F94i6OuJP6J3mjCVRTV6WGnK9HB/fcdIeX0q3yxe8e1uZN5c/CvcWgzz9K
	JRIrLF2xYEcWZv2RBSbcdN/8n0i120BVfKXnMQWNLGjHThvoBHNJmuVtizLmw6O5cerh
	YfAyXeLo5VSQTvKYhMwW4okBpXa4lYvpK1eyCwXb4SQaCt9CxyuCoBSKzNwzDsLmhHr6
	bb0P8eKdHooPqJcFkY9XHrSnPO6Z3eYyMD1uT42Wnp7gcu/lpqJnh1dl2bN2AoKnT/oh
	p13Q==
X-Gm-Message-State: ALoCoQmvFt6CDa+EZL+JcdCtpOdZt48qSOBIOLUYhAslZhPa6Fuw9M+e3MYeE3q+kOqKd/gVp+W0
X-Received: by 10.58.210.234 with SMTP id mx10mr1632117vec.9.1382095063474;
	Fri, 18 Oct 2013 04:17:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 18 Oct 2013 04:17:22 -0700 (PDT)
In-Reply-To: <1382083973-13444-1-git-send-email-rongqing.li@windriver.com>
References: <1382083973-13444-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Oct 2013 12:17:22 +0100
Message-ID: <CAJTo0LZBVxwoUufz4dbpaCXoV4x3x+S_q3NYowGsjstXHDs=tQ@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Fri, 18 Oct 2013 11:17:43 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Can you explain why connman needs to ignore the device that NFS is
reading the rootfs from?  I ask because the very latest connman
release shouldn't be dropping and re-configuring interfaces if there's
a provisioned configuration for them (see connman-conf, which does
this for all qemu machines) and that configuration matches the current
configuration.  Would this be sufficient for the rootfs-on-NFS
situation?

Ross

