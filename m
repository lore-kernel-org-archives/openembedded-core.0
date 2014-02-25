Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 114C86F18B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 22:11:03 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id l6so1187414oag.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 14:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zCKYywuIUGBZol43nZAJ6lVQYcAHrX9Sg+wlLNsuc1A=;
	b=Kpj0Kqf3yLX4QiWK03E8YtWaONBl0Hh+2Oat8Vt7S5noKnQx+4FzSY1LFFbje8Kk8L
	9ij8qF6kylEnryGh0d5aUQtTHFSlZY0YfiFB/l+HitGN1PgllZczl1g0dVdRCv1zUseR
	4T0AKU/XHCJhKRdTYa/i1I8YcPSnQetcUp3Uy8Vp28n+YtkE43bFzw/Fv+pib2p9wIbT
	HfJnVi+ZU2qd8pMI6qQC2BtZI0AytE4/Shqq3zc0QCwsbDolBlczmuoi7HYG/An3kUFs
	rUaN8r83iHQIapV/hzuRgw2uwhqVNFBWzgiNzWnH18SzU23H/oIv6nc745U+GeDgnsqQ
	/G9Q==
X-Gm-Message-State: ALoCoQnbCgat+PHqXcpt6P+dmXea1zhBhkWqpL4IVJi/0MsUYTsgtVRfsnHwXkaF7gaxft5Jxguj
X-Received: by 10.60.233.198 with SMTP id ty6mr3467512oec.25.1393366264455;
	Tue, 25 Feb 2014 14:11:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Tue, 25 Feb 2014 14:10:44 -0800 (PST)
In-Reply-To: <CAJTo0LY=TinUmQ+=d0_3oc97OwZNpw4yghfvbztyVF3EcJuteQ@mail.gmail.com>
References: <1393253881.31769.6.camel@ted> <20140224152753.GG26981@jama>
	<CAJTo0LYBuZv5NDyM1gsQEL5KQfOvMsRpvOn5kjFaYBi5XL8wCw@mail.gmail.com>
	<20140224160954.GI26981@jama>
	<CAP71Wjxz0e7qzU4tVZ3XEpF1oZtCErqjD4pPnETVJLnoecq3QQ@mail.gmail.com>
	<CAJTo0LY=TinUmQ+=d0_3oc97OwZNpw4yghfvbztyVF3EcJuteQ@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 25 Feb 2014 23:10:44 +0100
Message-ID: <CAP71Wjy0qRY1=xx4L7q-3TgR6f6oNdzVCk1vXm=46rwXPnUXAg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Separate build dir for autotools
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
X-List-Received-Date: Tue, 25 Feb 2014 22:11:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 25, 2014 at 7:43 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 25 February 2014 17:36, Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
>> right. I have recently (on dora) noticed that mesa build is broken
>> when using separate build dir, i have the following extra config:
>>
>> PACKAGECONFIG_append = " gallium gallium-egl gallium-gbm gallium-llvm"
>>
>> since gallium-egl needs the egl.h files generated during mesa build.
>> the generated files stay in $B while gallium-egl is looking for them
>> in $S (or sysroot)
>
> Pretty sure I fixed that:  oe-core fbc7092f0ae07538d4363679b1597ba4e556d1a8
>
> It looks like that's in Dora so we've possibly regressed again, can
> you file a bug (CCing me) with the build log?

oops. you're right. it's fixed in both dora and master. in fact i got
hit by that on dylan... but they i switched to dora anyways... so this
one is fine.

