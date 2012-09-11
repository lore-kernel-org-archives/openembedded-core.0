Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBXqR-0002Yd-T4
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 23:18:08 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 14:05:35 -0700
Received: by obblz20 with SMTP id lz20so1537348obb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 14:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=qFhq0YBOpedtYp35xwkgTaNJ/gfGjLBZJVjp7fAXjYE=;
	b=OtLoty6lsqndgu4wD8REPfhcVJVzj7WxNyCOk8HbruElODddUQa5NYdx1K/CkBzwP8
	uVvymBkPk8x6/9dth6iW3kTRCLms/HqFQcRL2x1puasArURuvnOL7+OKU5iouiC6HNjp
	2IO7hFoRDSduxTqojzjNEoSm+rGwBFMPGZ5Atm7ButUaZggB94U0HerWtxV1fH58nz1q
	2fNCYuA+nm5YcxxkHXsMfkSlZuPaA5IOwcjveQ8n3FhT19SB7l+fwVhKLJbMm+5APSnK
	di3TijPmjlN17AF0+E8J1QfMnZvgHXh+Zc/YMdiKk3WPTLI4aCKpXjiPM1gKksq1kTNb
	bbCw==
Received: by 10.60.19.132 with SMTP id f4mr377240oee.17.1347397534535; Tue, 11
	Sep 2012 14:05:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 11 Sep 2012 14:05:14 -0700 (PDT)
In-Reply-To: <1347397258.2122.55.camel@ted>
References: <504F8D62.8010508@intel.com>
	<CAJTo0LYf2C0PmrpMf3-RsUub1pQmN=G3f6Tt8ou6UNJ-8NoJKA@mail.gmail.com>
	<504F8EB5.30503@intel.com>
	<CAJTo0LbTe4462EVa6u30FrYHh96oUXnksKkpWy8hVFbM=dz_9A@mail.gmail.com>
	<504F92B2.6000304@intel.com> <1347397258.2122.55.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Sep 2012 22:05:14 +0100
Message-ID: <CAJTo0LZaR9GVqDFJ7qsFaZxKHBf_zko9CVz73p9YJz6Jii7_dA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQlygb5xo3oxBL/YCeakjCbRO3WaqtEtztimYMBS83/GPaUG3aYCQ+F99/YqnVHLJxbmQ0Bf
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Scott Garman <scott.a.garman@intel.com>
Subject: Re: Sato virtual keyboard - how to close it?
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
X-List-Received-Date: Tue, 11 Sep 2012 21:18:08 -0000
Content-Type: text/plain; charset=UTF-8

On 11 September 2012 22:00, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> There has been a bug open for this for years :(
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=149
>
> Ross appears to have recently closed it as NOTABUG but I think he
> misunderstood the problem.

Yes, the bug said "exit". :/  I've taken the new bug Scott filed, and
will look at it once I've started on the slides I'm presenting next
week...

Ross


