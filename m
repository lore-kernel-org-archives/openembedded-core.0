Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 65D3C73E11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 02:21:57 +0000 (UTC)
Received: by igfj19 with SMTP id j19so4053840igf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 19:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NWDrRytenBm59pJKk7ly50ureDDnsMnmY0RVT/bEVTA=;
	b=I0L+cWXaUanMLxOyu5tf5yi2UCHloNpqwfVPFTn9jmnzDe54xbOQs1DVFY0UDdEDxC
	hgbjvrbJWztAVi6M6XoIKmpyjS1914oEFlvbfsG24HdZB20JEoQRJ++YaoPEU59IMw6A
	/DSapAKpoEKG70/ssRWyqgGXMAFMWMz0erh2uFxhhevv/gpOcX7GvQDCcfWNoWZ4+hgJ
	ks32is+iK+VJIEXDH1Nkxz4bw4tnzqFILm6mKlLzmE44JpHZ6IFaYPd/AJGH6vtOPhR9
	JlfKkV8S83EclqtOLuZ6LL6Eu7HQujqra3UiFUZ1xl9LAL9RMg2qRBsWWQkIZDR32NHC
	PbDg==
X-Received: by 10.50.59.148 with SMTP id z20mr5386190igq.77.1440037318064;
	Wed, 19 Aug 2015 19:21:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 19 Aug 2015 19:21:28 -0700 (PDT)
In-Reply-To: <CAJTo0La4nHiHRLzraJdmO1AMSZ9RJGi=WSZAemrcGPFZTsoXrg@mail.gmail.com>
References: <1439787800-21088-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LZRWXQOc+SCbL1PeJ9QXn_9WHKDC3y6t+QpJ8-_689Y6w@mail.gmail.com>
	<5402FBA9-07E4-47CF-983E-E8778B5AE2F6@gmail.com>
	<CAJTo0La4nHiHRLzraJdmO1AMSZ9RJGi=WSZAemrcGPFZTsoXrg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Aug 2015 19:21:28 -0700
Message-ID: <CAMKF1soxndfF7OLyAx-c49WBDdLhbbecQhxSj7ixeo2hFsRcTA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4 V2] systemd: Upgrade 219 -> 224
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
X-List-Received-Date: Thu, 20 Aug 2015 02:22:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 19, 2015 at 12:55 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 August 2015 at 16:41, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> There are many reasons, for me its overlay support for systemd-nspawn,
>> networkd has got many new features that is now usable w.r.t. IP forwarding,
>> vxlan etc.
>> and it has many bug fixed in those 2000 odd commits since 219, no
>> different then any other package upgrades we do in general it keep the
>> upgrade workload lower as we roll the releases.
>> Any specific concerns ?
>
>
> Can we get an updated patch with a clearer commit log?

sent a v2 with more descriptions
>
> My concerns with the systemd upgrade were simply that until now we were
> tracking the systemd-stable repository.

it was only in last release that it was switched to use stable
repository in hope that it will help
backporting to 1.8 release any future updates done on 219 easily. We
never were pinned to stable release
it just was a coincidence that 219 was right in time for 1.8 release.
We want to avoid situations where core recipes
from oe-core are overridden in other layers and staying latest helps that.

  If we want to change that policy to
> the latest release, that's fine by me.
>
> Anyone else have an opinion here?
>
> Ross

