Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tr5Ju-0003nl-Nb
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 12:20:22 +0100
Received: from mail-gh0-f199.google.com ([209.85.160.199])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 04 Jan 2013 03:05:08 -0800
Received: by mail-gh0-f199.google.com with SMTP id r16so21426116ghr.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 03:05:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=3bVpPPv5gst2iiyf2IRpW8CSz5c2ozPjNrhl7ViPz7U=;
	b=LaDkJQqVdnapeETHtjsSgK3R9Ds6Agz1x5HP5a9QKzdNFbAqlWkNAqf2ua8hgL3JGs
	IYURAEm1I1QMvbWl59pqunPPm3bJ7P1zQFO8cFlxFtAsyKZ+74fr8Q83sOuOEC000QTy
	rHMSeH8cLjjdThNGG81gfTXVnm9YuRmbO60JtPIJLllAZCHU/Xabzwsp2LY49ogmW+qK
	M8MnyhUBDfmRh5oWUNVV5BrMeto5k1sro9zDmzdBfkYI3kLpiTupDzVoseikaBr+2OIg
	PH6s2etpCun5BPgMlv57w+iDLGSIBYEc5lCk0BA6zSoTnKA0/iSQd5tAJU9I/yQHci22
	3L5w==
X-Received: by 10.52.66.71 with SMTP id d7mr66686976vdt.121.1357297507287;
	Fri, 04 Jan 2013 03:05:07 -0800 (PST)
Received: by 10.52.66.71 with SMTP id d7mr66686972vdt.121.1357297507169; Fri,
	04 Jan 2013 03:05:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Fri, 4 Jan 2013 03:04:47 -0800 (PST)
In-Reply-To: <b81c825c2737a2042ed7a99796752d12b1576725.1356342794.git.alexandru.damian@intel.com>
References: <cover.1356342794.git.alexandru.damian@intel.com>
	<b81c825c2737a2042ed7a99796752d12b1576725.1356342794.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Jan 2013 11:04:47 +0000
Message-ID: <CAJTo0LYHjwXvQLXvbVkO4Bc5gkr58DCrcbRndairRoLCNNZ-MQ@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQlo6c4Uozcvon43CKasT01O+eCMr5t1Yi8g5FpfMfYP8TvKHzBE4bG9zhXu1X3d558SzgN8lrjNVnOsC70OFHH0KzWXyAcFEmRcgR7vLcusxNg07Y4naczixxj0WHZq/iRZKHAjyn5y3X3zgM6W5JovW91JOpFe6S+rgQxqnnm+6VKFgREWcPqgscjKy/D1TwqNEZOg
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] Initial commit for wayland/weston 1.0.3
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
X-List-Received-Date: Fri, 04 Jan 2013 11:20:23 -0000
Content-Type: text/plain; charset=UTF-8

On 24 December 2012 09:57, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> +PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm libgbm libglapi udev wayland-egl libpam"

"libgbm libglapi wayland-egl" aren't valid source recipes, just use "mesa-dri".

Ross


