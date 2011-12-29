Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RgK4g-0007gq-D9
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 18:47:30 +0100
Received: by qcqw6 with SMTP id w6so7592099qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2011 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=tNEiDKU+HrHaq2RxXNVJrF9Y0EYvfKkxhAtdm0z6fbY=;
	b=f0+6sYkBMw8X5mCA0hjbfM/Svd86eeZlPbxl3hurBz4SLO4uED2vZcQzPtK+UwQRKC
	J/5wdWdggSu8oR25gPrIeSfStvHfYLDHgn5ex5U6aZOeu9hD7qEtbbB9gsbhRKrmRkPC
	9oYM7ev/VqY99w74rYOU7xeGe71ZD4n3Y2p3E=
Received: by 10.229.77.69 with SMTP id f5mr13434826qck.107.1325180411255; Thu,
	29 Dec 2011 09:40:11 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.187.141 with HTTP; Thu, 29 Dec 2011 09:39:49 -0800 (PST)
In-Reply-To: <4EFBAC18.3040909@intel.com>
References: <fbed4e9f94ed9bd1bb5a9c8fa37113e325f89371.1325115602.git.dvhart@linux.intel.com>
	<4EFBAC18.3040909@intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 29 Dec 2011 10:39:49 -0700
X-Google-Sender-Auth: ofHZ4aweMjxoLdjMzVHt-hCKrvY
Message-ID: <CABcZANmyyS0UQJ04L3N1Cv4k1M7kfyC_tTOkHu00wpOLOwr64Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Ensure /init exists for cpio rootfs archives
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Dec 2011 17:47:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 28, 2011 at 4:54 PM, Darren Hart <darren.hart@intel.com> wrote:
> <I sent this to the yocto list by mistake, forwarding here for comment>

Seems sane to me.
-- 
Christopher Larson


