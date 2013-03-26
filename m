Received: from mail-vb0-f43.google.com ([209.85.212.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXis-0000Gw-Fe
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:31:47 +0100
Received: by mail-vb0-f43.google.com with SMTP id fs19so4723471vbb.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 10:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=dp4x7MXeJ455l4jxX0jRQdcXGRfKyTZjiIKtnIbpdpA=;
	b=BgDOSJ6pWIWWHSnWQwui2dPo4wkZlCcq59i8PFdSudbKF0Q3qDo8Vw+Dym4sTWof7B
	T/gTjUhMhE+fsDXAsWSSrmVc61XxP8oD6UcBxfEB+cnnDFz0qw5tqxcbvBhZjnQ5PNYG
	U/vhO110rxqznuoUtVgtT7wnGP5GHPeP+qwDRf7I3HrVYzg1MrpS3ms/YwoyO8W8oWnx
	9OSlVWD+HOZBYDBKLUUVc5ElX+nbvL+lu3YrwT/EGruLzy/qJYV1iu6gZr2Lnp9FLck/
	Li2XbhM5zxHUmyvx/gXjdYEsNYxCJtLjzd18prWJUfQAEq3AaoV3pqDRf3QF8VJNlsA+
	oeiA==
X-Received: by 10.58.220.229 with SMTP id pz5mr20150513vec.30.1364318084654;
	Tue, 26 Mar 2013 10:14:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.134.74 with HTTP; Tue, 26 Mar 2013 10:14:24 -0700 (PDT)
In-Reply-To: <5151D55D.4050300@windriver.com>
References: <cover.1364316411.git.ross.burton@intel.com>
	<cb33f47af852b62bcb4cc816b10bcbe425bb5f34.1364316411.git.ross.burton@intel.com>
	<5151D55D.4050300@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Mar 2013 17:14:24 +0000
Message-ID: <CAJTo0LbWWSt_tMbOxsR7CKyett3XGV_HNVc5rN2AryDmGru2vQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Gm-Message-State: ALoCoQmXmj68DT8g1g9anGsHEZyk7XbytLPNqK4dNXDaaQTGrcu/l2osyhH8+qdfwMitqJ65iJJ7
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/24] core-image-minimal-initramfs: don't install busybox-syslog
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
X-List-Received-Date: Tue, 26 Mar 2013 17:31:53 -0000
Content-Type: text/plain; charset=UTF-8

On 26 March 2013 17:05, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 3/26/13 11:50 AM, Ross Burton wrote:
>>
>> This uses BAD_RECOMMENDATIONS which isn't supported by all package
>> backends, but
>> it's a start.
>
> Since it's not supported in all backends, can you add a bugzilla to add
> support to the various backends?

I'd previously filed #3916 for rootfs_rpm, but failed to do the same
for rootfs_deb (now done, #4120).

Ross


