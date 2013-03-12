Received: from mail-ve0-f169.google.com ([209.85.128.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UFW3V-0000ly-Qv
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 21:44:21 +0100
Received: by mail-ve0-f169.google.com with SMTP id 15so230508vea.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 13:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=qVUpWnEpEtN0uQyARYWDmgVB3HZKDgCdRJWKYLZCtHc=;
	b=HefR5LDBAIj7gtDyRN8EZg6sbGR0bkb4bGGHqLaiSlVHN+SIVR5bUgkeDzC8+CCT5x
	qDQUlvwTBanUFGyuXQCs/WQ1ggGnlR/ITrCQ1irsGD2X5bEabC8gzg9uULVNuOvfGz53
	QAMlbiwD1JJnrAxNr6hmh2bXWu4OWyuboD6e+zMUShbFIPWm69qAJCnODB0H/9fam6tD
	gRrw1vr6EWOZm/AhC2rL33d8ePzlpcWJE2mfhKJVEVe/OGZDcYgimVM6ERehhgTbEErs
	wWEVCIVu85KDJYdYdOar9nMB8bLESoxuFbJmT6epmEVgQMR8CoQaSROluwAVWAfRLAkJ
	y0xQ==
X-Received: by 10.52.75.65 with SMTP id a1mr6137320vdw.79.1363120056159; Tue,
	12 Mar 2013 13:27:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.232.226 with HTTP; Tue, 12 Mar 2013 13:27:16 -0700 (PDT)
In-Reply-To: <1363119725-5341-1-git-send-email-denis@denix.org>
References: <1363119725-5341-1-git-send-email-denis@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Mar 2013 13:27:16 -0700
Message-ID: <CAJTo0LZg0a5nCKOTo+=KvCkYiWZiEbrV59rZxVdOP6i405NWqA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Gm-Message-State: ALoCoQnNBPiEmtwKHDJvLr9WjGSNQ8maJjPC5HyUhpgS44ypqOZMIY4G1CFvhJYw6c8VwNwg7Y4u
Cc: Chase Maupin <Chase.Maupin@ti.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][for-danny] soc-family: fix SOC_FAMILY override order
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
X-List-Received-Date: Tue, 12 Mar 2013 20:44:22 -0000
Content-Type: text/plain; charset=UTF-8

On 12 March 2013 13:22, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Chase Maupin <Chase.Maupin@ti.com>
>
> * the current order has SOC_FAMILY settings, which are generic
>   settings for a group of devices, overriding the machine specific
>   settings.  For example:
>
>   KERNEL_DEVICETREE_ti33x = "xxxx"
>   KERNEL_DEVICETREE_beaglebone = "yyyy"
>
>   Should yield "yyyy" when building for the beaglebone because
>   that is a more specific device than ti33x.  However, without this
>   change the result is that the value is set to "xxxx" meaning the
>   more generic setting overrides the more specific setting.

Merged to danny-next locally, will be pushed later.

Ross


