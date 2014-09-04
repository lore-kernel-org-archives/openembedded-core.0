Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id C4F6171465
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 16:27:10 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id q108so10074827qgd.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 09:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vQKH8w/9+lUXLnqNgKcSwX/nc1JYBFK+elwIMvu2X88=;
	b=W2bCIQK7I81MlHXURakIcfmGrZ8N7m+4Cpn24tGiXfiDHkUyN3sz4WuP/x0TfXqI6Q
	MdeQcFAXUpIjflhKPQ5QBSNJBsLLyhMEJesG95pQ1CIQZhOGt/nEIsVSQquDORC31LNG
	iVsxU/V4zc3k5YxFBBNDzHJ3G14Q/Rd+1rqhgvKZoVI4z67hZbmzryR6Ak50FU2VjsWU
	w+yCvq3mOuNW3IU2+xbgayxBdap3jkxDcVN2Kqw3QszzfDCKxFCLWI6tWOdYczRmCxfo
	0cIsRUQREJ1RrQ1cNVTGMVEdtpcktJu3ZcIGrgJf/EKpkCNGI/90LbAqw7ug8WUkmDaf
	e6OQ==
X-Gm-Message-State: ALoCoQmdhj/bI3TPXHTnEW6ZR+VvcIrDHLBwgjv9bVuv3Vhioojl+FZ8Lh4Bi0RCxA5I8HgtSeYw
X-Received: by 10.140.27.173 with SMTP id 42mr8211238qgx.59.1409848031259;
	Thu, 04 Sep 2014 09:27:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 4 Sep 2014 09:26:51 -0700 (PDT)
In-Reply-To: <5408882C.6020506@gmail.com>
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
	<54087F3F.2040103@windriver.com> <5408882C.6020506@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Sep 2014 17:26:51 +0100
Message-ID: <CAJTo0LZYDn2vZt49Sj40W3GJ7RLiTZjVs8OjbrEU-2NBoTdyOQ@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Style issue for recipes
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
X-List-Received-Date: Thu, 04 Sep 2014 16:27:16 -0000
Content-Type: text/plain; charset=UTF-8

On 4 September 2014 16:41, akuster808 <akuster808@gmail.com> wrote:
> This is the same reason why I have split a bb into two parts when I submit
> upgrades. I feel it makes reviewing easier the next time a package gets
> upgraded. Trying to find the actual changes between a file being deleted and
> the new one being added might lead to missing something.
>
> If there are unintentional consequence by doing this, that is a problem.

This is what git format-patch -M is for: it detects the rename and
shows a "proper" diff.

Ross

