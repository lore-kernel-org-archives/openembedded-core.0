Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id A74F5787DD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 10:32:53 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id l15-v6so2986286oth.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 03:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s1HhugouvTZ/YfEw2rTT8fJeUc0PVVuQuxwMH2/lUzw=;
	b=kNzqrRNhszqmzpazTGpoFxR9SxXL8Y7N6efcaRRSzkJRDuUhD08D5pjt+Ege1MTv6I
	G3dF5TkmmbJm2bv+UiezQOZ++nd63PlzO+Prhg+b3/9xcuHfjaB4E2QmYzSch2IJxMIM
	U3yMPbztOmLQzOt0sL8Yp8Sm+U1ert+RtZ8KNSGpcs/PwHcXfVNCqtnm/AQXRsrFIjv3
	XhE2Bgpe05dP3pYbizx2h9vRT//rrEMJ4O8pK18l7q4+akkK9MSa29SyePvFg5Cafvst
	v6U96nt6O/44uh2TxBJB2LH8AvkVqBdZ0V/lTLpyc/LQV0EqqJ1gZQC8igMTmGqX9oIL
	quIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s1HhugouvTZ/YfEw2rTT8fJeUc0PVVuQuxwMH2/lUzw=;
	b=HgC5uVZ9mqvnankPjc/HxaHbVviKofAsbtVCHc0LdjdL7PwZl//T38oJaLR9n4pAgD
	h6xcl4EtxQ9VfZJzgDLW0zKBhjXVMf/wgDCxdNjN8mNXr+2RtSTglNE/AYKGtafEJOxX
	lgfZYXuJWTJD0D4fAkIhN6B13uWBJgn+UERFe8L+FoN/fntoL3fW6Lgn9wJag5DQ9oHW
	6/9IxW7uURmCphW/zjq0HMdn6O2wXJxl8KCVpFTDABRgd0pQi/Ds00SpcSl+t8X6ajKu
	rwYyUkNodzRvHnOxvdnP8COT5JwFH+byd5GE/wHx9a7FkddOEaPwRIwLYN3xXGL6zLZc
	a7Qg==
X-Gm-Message-State: APt69E2CDdftzkXA2eymRqo5t9iblHWniG8ecDg1KVsXldCFA/6twV6T
	+7Rw1Bjswf4JgZ7JeAHcC04+BAjtzv3wmb1kY9Nsvw==
X-Google-Smtp-Source: ADUXVKJhMeQ35eDjFKsU3ZdPiDztN2+rpBezMKMRia2HH73OhDpybgtcMODhfMIe/wPh9vkHCUkZFxVXzMVztUW8WQw=
X-Received: by 2002:a9d:627:: with SMTP id
	36-v6mr14191486otn.168.1529577174471; 
	Thu, 21 Jun 2018 03:32:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Thu, 21 Jun 2018 03:32:33
	-0700 (PDT)
In-Reply-To: <20180619235320.GN19965@denix.org>
References: <cover.1526944475.git.denys@ti.com>
	<b3a976f9a497296a3cecd524931f1e8ea048489f.1526944475.git.denys@ti.com>
	<CAAQYJAvkUet1eLhbLaAFd=QH=ReBc82CcKituaanwZpEXcZEiw@mail.gmail.com>
	<CAJTo0LaQjo2iUw1BGo18fmH+Mz0j7pnkq7ooX_Q7zNyYa-chVQ@mail.gmail.com>
	<20180619235320.GN19965@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jun 2018 11:32:33 +0100
Message-ID: <CAJTo0LaTOqJ=4qRY+BhktCPj6BgOj2Do1yp9XXtVZcZ4dgBSKQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] mtd-utils: upgrade 2.0.1 -> 2.0.2
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
X-List-Received-Date: Thu, 21 Jun 2018 10:32:53 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry, no it doesn't.  I've just picked this in ross/mut but a
follow-up patch to remove that mystery patch (can't see it being used
in image generation anywhere) would be good.

Ross

On 20 June 2018 at 00:53, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, May 22, 2018 at 01:16:34PM +0100, Burton, Ross wrote:
>> On 22 May 2018 at 08:49, Andrea Adami <andrea.adami@gmail.com> wrote:
>> > I am just wondering about this patch:we carry it since 2009  [1] and
>> > is still marked as pending.
>> > Why was it necessary to ignore part of the filesystem? Can you remember?
>>
>> Make that at least 2004.  This commit in oe-classic touches it:
>>
>> commit c70605ebdca81412a93b4d867de7931543193f26
>> Author: Chris Larson <clarson@kergoth.com>
>> Date:   Thu Dec 23 21:24:57 2004 +0000
>>
>>     Update mtd to a current snapshot, change the mkfs.jffs2 -i cmdline option to
>>     -I, and rename mtd and mtd-native to mtd-utils and mtd-utils-native,
>>     respectively.
>>
>> Prior history is lost to the git/bk migration unless anyone has a
>> BitKeeper clone to mine...
>
> So, does this prevent the version upgrade from being merged?
>
> --
> Denys

