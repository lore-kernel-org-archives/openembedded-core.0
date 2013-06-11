Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF326A885
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 04:27:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Jun 2013 21:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,842,1363158000"; d="scan'208";a="351246233"
Received: from unknown (HELO [10.255.12.247]) ([10.255.12.247])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2013 21:27:26 -0700
Message-ID: <51B6A72E.5080008@linux.intel.com>
Date: Mon, 10 Jun 2013 21:27:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1370009480-32681-1-git-send-email-marcin@juszkiewicz.com.pl>
	<E947360C-AE06-42E4-AD51-2DA926D1448D@gmail.com>
In-Reply-To: <E947360C-AE06-42E4-AD51-2DA926D1448D@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] get minimal rootfs to be even smaller
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
X-List-Received-Date: Tue, 11 Jun 2013 04:27:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2013 07:06 PM, Khem Raj wrote:
>
> On May 31, 2013, at 7:11 AM, Marcin Juszkiewicz <marcin@juszkiewicz.com.pl> wrote:
>
>> First hit: pci.ids.gz and usb.ids.gz ~350KB in total.
>
> udev just RRECOMMENDS  usbutils-ids pciutils-ids so how did it get into build time dependencies to begin with ?
>
I looked into this a while back and it's the fact that those packages 
are built, so they are seen and get installed.  If the packages aren't 
available they won't get installed.

Since pciutils and usbutils are both DEPENDS of udev, those get built 
and the packages get deployed and then are available to be installed at 
the behest of the RRECOMMENDS.

We could maybe have added BAD_RECOMMENDATIONS for core-image-minimal so 
that on a larger system udev would still have the -id files available, I 
just thought of this, not tested.

Sau!


>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

