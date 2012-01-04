Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RiUkR-0006dO-4N
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 18:35:35 +0100
Received: by iakh37 with SMTP id h37so29002278iak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2012 09:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bTqsLbJ/djcNLKRTqigkdQh6Gy4WDRV2ejw59FlBGqA=;
	b=c5bq+DcG5X11OvI7Yq5CmDdBeS+bpp7aq8yildzrX6Y2PT/RaxTviQAF0W3eNOTxW0
	6HFazmiO7GfIu1d3jAJpqAEH1XE4qY7N5Q5XO0WdT2Jk04IYCp68Q81hduJPOlF/F0Tb
	72qEHkB1vQjgntjgdYSW+f8w+TJ1FDDZpzObg=
Received: by 10.42.151.65 with SMTP id d1mr57590563icw.18.1325698092695;
	Wed, 04 Jan 2012 09:28:12 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id h9sm191421672ibh.11.2012.01.04.09.28.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jan 2012 09:28:10 -0800 (PST)
Date: Wed, 4 Jan 2012 09:28:28 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120104172828.GA32676@sakrah.homelinux.org>
References: <1324044340-21898-1-git-send-email-eric@eukrea.com>
	<4EF19E06.6030004@eukrea.com>
	<C6510F6D410BB64A8C15398EDC6B847C2401D155@ORSMSX102.amr.corp.intel.com>
	<4EF266E0.8040302@eukrea.com>
	<C6510F6D410BB64A8C15398EDC6B847C2401D1A6@ORSMSX102.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <C6510F6D410BB64A8C15398EDC6B847C2401D1A6@ORSMSX102.amr.corp.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] gdb-cross-canadian: build gdb with	python support
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
X-List-Received-Date: Wed, 04 Jan 2012 17:35:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (21/12/11 23:52), Zhang, Jessica wrote:
> Hi Eric,
> 
> Yes, understand the usage and advantage, but still think apply the patch in meta-oe first then if later on there's strong demand for this feature we can pull into oe-core is the right approach.
> 

what are your reasons for it to not be in oe-core/master ?
python support is useful in gdb even on commandline
Or are you aware of any bugs that will destabilize gdb ?


