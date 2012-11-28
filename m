Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TdkE8-0005lS-8M
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 17:11:08 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 28 Nov 2012 07:55:50 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so65446039oag.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 07:56:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=t1seOgsDE4As83746hloCDn6AeERPLUIUoZWYrEuk08=;
	b=Uc/MOD9+yCA4T/bCQCcidKI0jC6gqDwwJDgkORYpLmezBrc6JK0sa6nZ48/jeZb9XW
	F5xH00t2gN5RfudAEDMr5FNHo5ZcVZrNb4UvOB/Kp7tHSWGolYiYyrcC53DD3tQjmJoR
	P7Jg9OZe+pCkwWORNkRyo93f5a8Z5As0pt+zr7eIDSiOeso+OknvwAz+2EteGqwUx5Te
	723WfRZ/NpNovFxCQAhd2yTBiE+vkmBPmRkMKMgsJaeQOclh0Vh+l6ImrsBRJgW7usfj
	eKGz+bdp8vRm8XKCDQVm26SoUAMEPnw/UUh8RmxGIvnn4TtJi5ub2OdWETQd0bES3W/7
	qefA==
Received: by 10.182.64.101 with SMTP id n5mr4064273obs.11.1354118192354;
	Wed, 28 Nov 2012 07:56:32 -0800 (PST)
Received: by 10.182.64.101 with SMTP id n5mr4064259obs.11.1354118192175; Wed,
	28 Nov 2012 07:56:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Wed, 28 Nov 2012 07:56:11 -0800 (PST)
In-Reply-To: <CAP9ODKo4+FnG=c1m88HeG-MxbzQD-+MyLo85G47Qh_uNcxKJEw@mail.gmail.com>
References: <1354116528-21598-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKo4+FnG=c1m88HeG-MxbzQD-+MyLo85G47Qh_uNcxKJEw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Nov 2012 15:56:11 +0000
Message-ID: <CAJTo0LZXgDtv_EsxnCvLv5nyHpf5FBtFYRYtXyCj+7D=uKpWDA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQms3GVq+m1EOC2TnIhUkRb9AyXcD/zzUBonwbEUprJpHumCrkxzApcnMUMaULaxFuARP7vbPtvNXOimGgZLFiUJmLd0yL9CRv3ZFkvPlCjwi2bBdOQlVao2vTgWEjVuM8GGEK8X0fLXySw3JJIGv+uk04hFwDoYTgvMhkyhkCsm10s8OTjCxkBBlrpzl1gGuMWq5+Qs
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: restore packaging for the DRI/DRI2/DBE extensions
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
X-List-Received-Date: Wed, 28 Nov 2012 16:11:09 -0000
Content-Type: text/plain; charset=UTF-8

On 28 November 2012 15:51, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Wed, Nov 28, 2012 at 1:28 PM, Ross Burton <ross.burton@intel.com> wrote:
>> Even though the current xserver in oe-core (1.13) doesn't ship these as
>> standalone extensions, older X servers required by binary drives
>> (e.g. meta-intel's 1.9) still install them separately.  As the packages didn't
>> exist in xserver-xorg.inc the extensions were not packaged, and X didn't work.
>>
>> Revolve this by restoring the package definitions, and moving the upgrade path
>> dependencies to xserver-xorg_1.13.bb.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> Wouldn't be better for this packaging be done in meta-intel in this case?
>
> My concern here is to leave unused meta-data; I am not a big fan of it at first.

That's a valid concern, and I almost did that.  The fact that binary
drivers locked to specific version of X are so common swayed me into
being nice to them, so they don't need to replicate all of the
packaging themselves.

Ross


